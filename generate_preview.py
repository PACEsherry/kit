"""测试版：扫描 kit/benchmarks/ 目录，支持多语言代码文件替换。"""
import ast
import shutil
import time
from pathlib import Path
from typing import Any, Dict, List, Optional

from kit import Repository
from kit.llm_client_factory import create_openai_client
from kit.tree_sitter_symbol_extractor import TreeSitterSymbolExtractor, LANGUAGES

REPO_ROOT = Path(__file__).resolve().parent / "kit"
OUTPUT_DIR = Path(__file__).resolve().parent / "kit_docs"
TARGET_DIR = "benchmarks"

LLM_API_KEY = "tp-cbs3hu9i4xsldjtuyl82fj2l9uo2py2qe3ulrhc1zzhj8ij5"
LLM_BASE_URL = "https://token-plan-cn.xiaomimimo.com/v1"
LLM_MODEL = "mimo-v2.5-pro"

_client = create_openai_client(api_key=LLM_API_KEY, base_url=LLM_BASE_URL)
_last_call_time = 0.0

# ── 语言配置 ──────────────────────────────────────────────
# tree-sitter 支持的语言（可提取符号）
TREE_SITTER_LANGS = set(LANGUAGES.keys())

# 仓颉语言（tree-sitter 暂不支持，只做文件级摘要）
CANGJIE_EXTENSIONS = {".cj"}

# 所有支持的代码文件扩展名
ALL_CODE_EXTENSIONS = TREE_SITTER_LANGS | CANGJIE_EXTENSIONS

# 文件扩展名到语言显示名的映射
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


def llm_summarize(prompt: str) -> str:
    global _last_call_time
    elapsed = time.time() - _last_call_time
    if elapsed < 0.5:
        time.sleep(0.5 - elapsed)
    try:
        _last_call_time = time.time()
        resp = _client.chat.completions.create(
            model=LLM_MODEL,
            messages=[{"role": "user", "content": (
                "你是一个代码分析专家。请用简洁的中文回答，只输出内容本身，不要加任何前缀或解释。\n\n"
                + prompt
            )}],
            max_tokens=2000,
            temperature=0.2,
        )
        content = resp.choices[0].message.content
        return content.strip() if content else ""
    except Exception as e:
        print(f"  [ERROR] {e}")
        return ""


def clean_code_block(text):
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


def get_lines(source, start, end, max_lines=18):
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


def extract_symbols_with_tree_sitter(ext: str, source: str) -> List[Dict[str, Any]]:
    """使用 tree-sitter 提取符号（支持所有 tree-sitter 支持的语言）。"""
    try:
        symbols = TreeSitterSymbolExtractor.extract_symbols(ext, source)
        return symbols or []
    except Exception as e:
        print(f"  [WARN] tree-sitter extraction failed for {ext}: {e}")
        return []


def group_symbols(symbols: List[Dict[str, Any]]) -> Dict[str, List[Dict[str, Any]]]:
    """将符号按类型分组：class, method, function, interface, enum, struct, other。"""
    groups = {
        "class": [],
        "interface": [],
        "enum": [],
        "struct": [],
        "function": [],
        "method": [],
        "other": [],
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


def generate_md_for_file(path: str, source: str) -> str:
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
        out.append("<!-- no symbols extracted -->\n")
        return "\n".join(out)

    grouped = group_symbols(symbols)

    # 处理类
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

    # 处理接口
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

    # 处理枚举
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

    # 处理结构体
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

    # 处理方法（按类分组）
    methods_by_class: Dict[str, List[Dict]] = {}
    for sym in grouped.get("method", []):
        # 尝试从 symbol 中获取所属类名
        parent = sym.get("parent", "unknown")
        if parent not in methods_by_class:
            methods_by_class[parent] = []
        methods_by_class[parent].append(sym)

    for class_name, methods in methods_by_class.items():
        for sym in methods[:5]:  # 每个类最多处理 5 个方法
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

    # 处理函数
    for sym in grouped.get("function", [])[:10]:  # 最多处理 10 个函数
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


def main():
    # 1. 复制代码库
    if OUTPUT_DIR.exists():
        shutil.rmtree(OUTPUT_DIR)

    print(f"[COPY] {REPO_ROOT} -> {OUTPUT_DIR}")
    shutil.copytree(REPO_ROOT, OUTPUT_DIR, ignore=shutil.ignore_patterns(
        ".git", "__pycache__", ".venv", "node_modules", ".pytest_cache"
    ))

    # 2. 扫描目标目录中的所有代码文件
    target_path = OUTPUT_DIR / TARGET_DIR
    code_files = []
    for f in sorted(target_path.rglob("*")):
        if f.is_file() and f.suffix in ALL_CODE_EXTENSIONS:
            code_files.append(f)

    print(f"\n[SCAN] Found {len(code_files)} code files in {TARGET_DIR}/")
    for f in code_files:
        lang = LANG_DISPLAY_NAMES.get(f.suffix, f.suffix)
        print(f"  - {f.relative_to(OUTPUT_DIR)} ({lang})")

    # 3. 逐个替换
    for code_file in code_files:
        rel_path = code_file.relative_to(OUTPUT_DIR)
        print(f"\n[FILE] {rel_path}")

        source = code_file.read_text(encoding="utf-8")
        if not source.strip():
            print(f"  [SKIP] empty file")
            continue

        # 生成 markdown
        md_content = generate_md_for_file(str(rel_path), source)

        # 写入 .md 文件
        md_file = code_file.with_suffix(".md")
        md_file.write_text(md_content, encoding="utf-8")
        print(f"  [WRITE] {md_file.relative_to(OUTPUT_DIR)}")

        # 删除原代码文件
        code_file.unlink()
        print(f"  [DELETE] {rel_path}")

    print(f"\nDone! Replaced {len(code_files)} files in {OUTPUT_DIR / TARGET_DIR}")


if __name__ == "__main__":
    main()
