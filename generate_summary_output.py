
from pathlib import Path
from collections import defaultdict
import ast
import re
import time
import shutil
import sys
from typing import Any, Dict, List, Optional

from kit import Repository
from kit.llm_client_factory import create_openai_client
from kit.tree_sitter_symbol_extractor import TreeSitterSymbolExtractor, LANGUAGES


# ── LLM 配置（复用 kit 的 client 工厂） ──────────────────
LLM_API_KEY = "tp-cbs3hu9i4xsldjtuyl82fj2l9uo2py2qe3ulrhc1zzhj8ij5"
LLM_BASE_URL = "https://token-plan-cn.xiaomimimo.com/v1"
LLM_MODEL = "mimo-v2.5-pro"

_client = create_openai_client(api_key=LLM_API_KEY, base_url=LLM_BASE_URL)

_last_call_time = 0.0

# ── 语言配置 ──────────────────────────────────────────────
TREE_SITTER_LANGS = set(LANGUAGES.keys())
CANGJIE_EXTENSIONS = {".cj"}
ALL_CODE_EXTENSIONS = TREE_SITTER_LANGS | CANGJIE_EXTENSIONS

LANG_DISPLAY_NAMES = {
    ".py": "Python", ".js": "JavaScript", ".jsx": "JavaScript (JSX)",
    ".ts": "TypeScript", ".tsx": "TypeScript (TSX)",
    ".c": "C", ".h": "C Header",
    ".cpp": "C++", ".cc": "C++", ".cxx": "C++", ".hpp": "C++ Header", ".hxx": "C++ Header",
    ".java": "Java", ".go": "Go", ".rs": "Rust",
    ".rb": "Ruby", ".kt": "Kotlin", ".kts": "Kotlin",
    ".dart": "Dart", ".cs": "C#", ".hs": "Haskell",
    ".hcl": "HCL", ".tf": "Terraform", ".zig": "Zig",
    ".cj": "Cangjie (仓颉)",
}


def llm_summarize(prompt: str, max_retries: int = 3) -> str:
    """调用大模型生成摘要，带重试和速率控制。"""
    global _last_call_time

    for attempt in range(max_retries):
        elapsed = time.time() - _last_call_time
        if elapsed < 0.5:
            time.sleep(0.5 - elapsed)

        try:
            _last_call_time = time.time()
            resp = _client.chat.completions.create(
                model=LLM_MODEL,
                messages=[
                    {
                        "role": "user",
                        "content": (
                            "你是一个代码分析专家。请用简洁的中文回答，"
                            "只输出内容本身，不要加任何前缀或解释。\n\n"
                            + prompt
                        ),
                    },
                ],
                max_tokens=2000,
                temperature=0.2,
            )
            content = resp.choices[0].message.content
            return content.strip() if content else ""
        except Exception as e:
            if attempt < max_retries - 1:
                wait = 2 * (attempt + 1)
                print(f"    [LLM 重试 {attempt+1}/{max_retries}] {e}, {wait}s 后重试...")
                time.sleep(wait)
            else:
                print(f"    [LLM 失败] {e}")
                return ""
    return ""


# ------------------------------------------------------------
# 基础过滤规则
# ------------------------------------------------------------

SKIP_DIR_PARTS = {
    ".git", ".venv", "venv", "__pycache__", ".pytest_cache",
    ".mypy_cache", ".ruff_cache", "node_modules", "dist", "build", ".eggs",
}


def should_skip_path(path: str) -> bool:
    parts = set(Path(path).parts)
    return bool(parts & SKIP_DIR_PARTS)


def is_code_file(path: str) -> bool:
    p = Path(path)
    return (p.suffix in ALL_CODE_EXTENSIONS) and not should_skip_path(path)


def read_file(repo: Repository, path: str) -> str:
    try:
        content = repo.get_file_content(path)
        if isinstance(content, dict):
            return content.get(path, "")
        return content or ""
    except Exception:
        return ""


def get_lines(source: str, start: int | None, end: int | None, max_lines: int = 18) -> str:
    if not source:
        return ""
    lines = source.splitlines()
    if not start:
        start = 1
    if not end:
        end = min(len(lines), start + max_lines - 1)
    start = max(1, start)
    end = min(len(lines), end)
    end = min(end, start + max_lines - 1)
    return "\n".join(lines[start - 1:end]).strip()


def clean_code_block(text: str) -> str:
    text = text.strip()
    if text.startswith("```"):
        first_newline = text.find("\n")
        if first_newline != -1:
            text = text[first_newline + 1:]
        else:
            text = text[3:]
    if text.endswith("```"):
        text = text[:-3].strip()
    return text


# ------------------------------------------------------------
# 符号提取（tree-sitter）
# ------------------------------------------------------------

def extract_symbols_with_tree_sitter(ext: str, source: str) -> List[Dict[str, Any]]:
    """使用 tree-sitter 提取符号。"""
    try:
        symbols = TreeSitterSymbolExtractor.extract_symbols(ext, source)
        return symbols or []
    except Exception as e:
        print(f"  [WARN] tree-sitter extraction failed for {ext}: {e}")
        return []


def group_symbols(symbols: List[Dict[str, Any]]) -> Dict[str, List[Dict[str, Any]]]:
    """将符号按类型分组。"""
    groups = {
        "class": [], "interface": [], "enum": [], "struct": [],
        "function": [], "method": [], "other": [],
    }
    for sym in symbols:
        sym_type = sym.get("type", "").lower()
        if sym_type in ("class", "class_definition"):
            groups["class"].append(sym)
        elif sym_type in ("interface",):
            groups["interface"].append(sym)
        elif sym_type in ("enum", "enum_declaration"):
            groups["enum"].append(sym)
        elif sym_type in ("struct", "struct_specifier"):
            groups["struct"].append(sym)
        elif sym_type in ("method", "method_definition", "method_declaration", "constructor"):
            groups["method"].append(sym)
        elif sym_type in ("function", "function_definition", "function_declaration", "arrow_function"):
            groups["function"].append(sym)
        else:
            groups["other"].append(sym)
    return {k: v for k, v in groups.items() if v}


# ------------------------------------------------------------
# Markdown 生成
# ------------------------------------------------------------

def generate_md_for_file(path: str, source: str, repo) -> str:
    """为任意代码文件生成 markdown 内容。"""
    ext = Path(path).suffix
    lang_name = LANG_DISPLAY_NAMES.get(ext, ext)
    out = []

    out.append(f"<!-- source: {path} -->\n")
    out.append(f"# `{path}`\n")
    out.append(f"<!-- language: {lang_name} -->\n")
    out.append("---\n")

    # 模块级摘要
    print(f"  [LLM] module: {path}")
    snippet = "\n".join(source.splitlines()[:80])
    module_summary = llm_summarize(
        f"请分析以下 {lang_name} 源码文件 `{path}` 的内容（前 80 行），"
        f"用 2-3 句中文详细说明这个模块的核心职责和主要功能。\n\n"
        f"```\n{snippet}\n```"
    )
    module_usage = clean_code_block(llm_summarize(
        f"请为 {lang_name} 模块 `{path}` 生成一个使用示例。\n"
        f"模块功能参考：\n```\n{snippet}\n```\n"
        f"要求：先写 import/include 语句，再写 5-10 行调用代码，不要定义新的类或函数。"
    ))

    out.append("## module function:\n")
    out.append(module_summary + "\n")
    out.append("## module usage example:\n")
    out.append(f"```{ext.lstrip('.')}\n{module_usage}\n```\n")

    # 使用 tree-sitter 提取符号
    symbols = extract_symbols_with_tree_sitter(ext, source)
    if not symbols:
        out.append("<!-- no symbols extracted (tree-sitter query not available for this language) -->\n")
        return "\n".join(out)

    grouped = group_symbols(symbols)

    # 类
    for sym in grouped.get("class", []):
        name = sym.get("name", "unknown")
        start_line = sym.get("start_line", 1)
        end_line = sym.get("end_line", start_line + 30)
        code = get_lines(source, start_line, end_line, max_lines=50)

        print(f"    [LLM] class: {name}")
        summary = llm_summarize(
            f"请分析以下 {lang_name} 类 `{name}` 的代码。\n"
            f"用 2-3 句中文说明：核心职责、封装的数据或行为、典型使用场景。\n\n"
            f"```\n{code}\n```"
        )
        usage = clean_code_block(llm_summarize(
            f"为类 `{name}` 写使用示例。\n"
            f"参考代码：\n```\n{code[:500]}\n```\n"
            f"要求：先写 import，再实例化，调用 2-3 个方法，8-15 行代码，不要定义类。"
        ))

        out.append(f"# class `{name}`\n")
        out.append("## function:\n")
        out.append(summary + "\n")
        out.append("## usage example:\n")
        out.append(f"```{ext.lstrip('.')}\n{usage}\n```\n")

    # 接口
    for sym in grouped.get("interface", []):
        name = sym.get("name", "unknown")
        start_line = sym.get("start_line", 1)
        end_line = sym.get("end_line", start_line + 20)
        code = get_lines(source, start_line, end_line, max_lines=30)

        print(f"    [LLM] interface: {name}")
        summary = llm_summarize(
            f"请分析以下 {lang_name} 接口 `{name}` 的代码。\n"
            f"用 2-3 句中文说明：接口定义的契约、主要方法、典型实现场景。\n\n"
            f"```\n{code}\n```"
        )
        out.append(f"# interface `{name}`\n")
        out.append("## function:\n")
        out.append(summary + "\n")

    # 枚举
    for sym in grouped.get("enum", []):
        name = sym.get("name", "unknown")
        start_line = sym.get("start_line", 1)
        end_line = sym.get("end_line", start_line + 20)
        code = get_lines(source, start_line, end_line, max_lines=20)

        print(f"    [LLM] enum: {name}")
        summary = llm_summarize(
            f"请分析以下 {lang_name} 枚举 `{name}` 的定义。\n"
            f"用 1-2 句中文说明：枚举的用途和包含的值。\n\n"
            f"```\n{code}\n```"
        )
        out.append(f"# enum `{name}`\n")
        out.append("## function:\n")
        out.append(summary + "\n")

    # 结构体
    for sym in grouped.get("struct", []):
        name = sym.get("name", "unknown")
        start_line = sym.get("start_line", 1)
        end_line = sym.get("end_line", start_line + 30)
        code = get_lines(source, start_line, end_line, max_lines=40)

        print(f"    [LLM] struct: {name}")
        summary = llm_summarize(
            f"请分析以下 {lang_name} 结构体 `{name}` 的代码。\n"
            f"用 2-3 句中文说明：结构体的字段、用途、典型使用场景。\n\n"
            f"```\n{code}\n```"
        )
        usage = clean_code_block(llm_summarize(
            f"为结构体 `{name}` 写使用示例。\n"
            f"参考代码：\n```\n{code[:500]}\n```\n"
            f"要求：先写 import，再创建实例并使用，5-10 行代码，不要定义结构体。"
        ))
        out.append(f"# struct `{name}`\n")
        out.append("## function:\n")
        out.append(summary + "\n")
        out.append("## usage example:\n")
        out.append(f"```{ext.lstrip('.')}\n{usage}\n```\n")

    # 方法（按类分组）
    methods_by_class: Dict[str, List[Dict]] = {}
    for sym in grouped.get("method", []):
        parent = sym.get("parent", "unknown")
        if parent not in methods_by_class:
            methods_by_class[parent] = []
        methods_by_class[parent].append(sym)

    for class_name, methods in methods_by_class.items():
        for sym in methods[:5]:
            name = sym.get("name", "unknown")
            start_line = sym.get("start_line", 1)
            end_line = sym.get("end_line", start_line + 20)
            code = get_lines(source, start_line, end_line, max_lines=25)

            print(f"      [LLM] method: {class_name}.{name}")
            summary = llm_summarize(
                f"请分析以下 {lang_name} 方法 `{name}` 的代码。\n"
                f"用 2-3 句中文说明：核心功能、输入输出、典型使用场景。\n\n"
                f"```\n{code}\n```"
            )
            usage = clean_code_block(llm_summarize(
                f"为方法 `{class_name}.{name}` 写调用示例。\n"
                f"参考代码：\n```\n{code[:400]}\n```\n"
                f"要求：先写 import，再实例化类，调用方法，5-8 行代码，不要定义方法。"
            ))
            out.append(f"# method `{class_name}.{name}`\n")
            out.append("## function:\n")
            out.append(summary + "\n")
            out.append("## usage example:\n")
            out.append(f"```{ext.lstrip('.')}\n{usage}\n```\n")

    # 函数
    for sym in grouped.get("function", [])[:10]:
        name = sym.get("name", "unknown")
        start_line = sym.get("start_line", 1)
        end_line = sym.get("end_line", start_line + 20)
        code = get_lines(source, start_line, end_line, max_lines=25)

        print(f"    [LLM] func: {name}")
        summary = llm_summarize(
            f"请分析以下 {lang_name} 函数 `{name}` 的代码。\n"
            f"用 2-3 句中文说明：核心功能、输入输出、典型使用场景。\n\n"
            f"```\n{code}\n```"
        )
        usage = clean_code_block(llm_summarize(
            f"为函数 `{name}` 写调用示例。\n"
            f"参考代码：\n```\n{code[:400]}\n```\n"
            f"要求：先写 import，再调用函数处理返回值，5-8 行代码，不要定义函数。"
        ))
        out.append(f"# function `{name}`\n")
        out.append("## function:\n")
        out.append(summary + "\n")
        out.append("## usage example:\n")
        out.append(f"```{ext.lstrip('.')}\n{usage}\n```\n")

    return "\n".join(out)


# ------------------------------------------------------------
# 主流程
# ------------------------------------------------------------

def generate_markdown(repo_path: str, output_dir: str):
    """扫描代码库，复制后逐个替换代码文件为 markdown。"""
    repo = Repository(repo_path)
    source_root = Path(repo_path)
    output = Path(output_dir)

    # 1. 复制代码库
    if output.exists():
        shutil.rmtree(output)

    print(f"[COPY] {source_root} -> {output}")
    shutil.copytree(source_root, output, ignore=shutil.ignore_patterns(
        ".git", "__pycache__", ".venv", "node_modules", ".pytest_cache",
        ".mypy_cache", ".ruff_cache", "dist", "build", ".eggs", ".tox",
    ))

    # 2. 扫描所有代码文件
    file_tree = repo.get_file_tree()
    files = []
    for item in file_tree:
        path = item.get("path") or item.get("name") or ""
        is_dir = item.get("is_dir", False)
        if path and not is_dir and not should_skip_path(path):
            files.append(path)

    code_files = [p for p in files if is_code_file(p)]

    print(f"\n[SCAN] Found {len(code_files)} code files")
    lang_counts: Dict[str, int] = {}
    for p in code_files:
        ext = Path(p).suffix
        lang = LANG_DISPLAY_NAMES.get(ext, ext)
        lang_counts[lang] = lang_counts.get(lang, 0) + 1
    for lang, count in sorted(lang_counts.items()):
        print(f"  - {lang}: {count} files")

    # 3. 逐个替换
    replaced = 0
    for path in code_files:
        source = read_file(repo, path)
        if not source.strip():
            continue

        print(f"\n[FILE] {path}")

        # 生成 markdown
        md_content = generate_md_for_file(path, source, repo)

        # 在 copy 目录中找到对应文件
        out_file = output / path
        if not out_file.exists():
            print(f"  [SKIP] not found in copy")
            continue

        # 写入 .md 文件
        md_path = out_file.with_suffix(".md")
        md_path.write_text(md_content, encoding="utf-8")
        print(f"  [WRITE] {md_path.relative_to(output)}")

        # 删除原代码文件
        out_file.unlink()
        print(f"  [DELETE] {path}")

        replaced += 1

    print(f"\nDone! Replaced {replaced} files")
    print(f"Output: {output}")


def main():
    import argparse

    parser = argparse.ArgumentParser(
        description="扫描代码库，复制后逐个替换代码文件为 markdown 文档。",
        epilog="支持的语言: Python, TypeScript, JavaScript, C, C++, Java, Go, Rust, "
               "Ruby, Kotlin, Dart, C#, Haskell, HCL, Terraform, Zig, Cangjie (仓颉)\n\n"
               "示例:\n"
               "  python generate_summary_output.py /path/to/repo\n"
               "  python generate_summary_output.py /path/to/repo -o /path/to/docs\n"
               "  python generate_summary_output.py . -o ./my_docs",
        formatter_class=argparse.RawDescriptionHelpFormatter,
    )
    parser.add_argument(
        "repo_path",
        help="要扫描的代码库路径（支持本地路径或 GitHub URL）",
    )
    parser.add_argument(
        "-o", "--output",
        default=None,
        help="输出目录路径（默认: <repo_name>_docs）",
    )

    args = parser.parse_args()

    repo_path = str(Path(args.repo_path).resolve())
    if args.output:
        output_dir = str(Path(args.output).resolve())
    else:
        output_dir = str(Path(repo_path).parent / (Path(repo_path).name + "_docs"))

    print(f"Repository: {repo_path}")
    print(f"Output:     {output_dir}")
    print("=" * 60)

    generate_markdown(repo_path, output_dir)


if __name__ == "__main__":
    main()
