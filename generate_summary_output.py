
from pathlib import Path
from collections import defaultdict
import ast
import re
import time
import shutil
import sys

from kit import Repository
from kit.llm_client_factory import create_openai_client


# ── LLM 配置（复用 kit 的 client 工厂） ──────────────────
LLM_API_KEY = "tp-cbs3hu9i4xsldjtuyl82fj2l9uo2py2qe3ulrhc1zzhj8ij5"
LLM_BASE_URL = "https://token-plan-cn.xiaomimimo.com/v1"
LLM_MODEL = "mimo-v2.5-pro"

_client = create_openai_client(api_key=LLM_API_KEY, base_url=LLM_BASE_URL)

_last_call_time = 0.0


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
    return ""


# ------------------------------------------------------------
# 基础过滤规则
# ------------------------------------------------------------

SKIP_DIR_PARTS = {
    ".git",
    ".venv",
    "venv",
    "__pycache__",
    ".pytest_cache",
    ".mypy_cache",
    ".ruff_cache",
    "node_modules",
    "dist",
    "build",
    ".eggs",
}

SOURCE_SUFFIXES = {
    ".py",
    ".ts",
    ".tsx",
    ".js",
    ".jsx",
}

CONFIG_NAMES = {
    "pyproject.toml",
    "setup.py",
    "setup.cfg",
    "requirements.txt",
    "requirements-dev.txt",
    "package.json",
    "tsconfig.json",
    "README.md",
}


def should_skip_path(path: str) -> bool:
    parts = set(Path(path).parts)
    return bool(parts & SKIP_DIR_PARTS)


def is_source_file(path: str) -> bool:
    p = Path(path)
    return (p.suffix in SOURCE_SUFFIXES) and not should_skip_path(path)


def is_config_file(path: str) -> bool:
    p = Path(path)
    return p.name in CONFIG_NAMES and not should_skip_path(path)


def safe_code_block_lang(path: str) -> str:
    suffix = Path(path).suffix
    if suffix == ".py":
        return "python"
    if suffix in {".ts", ".tsx"}:
        return "ts"
    if suffix in {".js", ".jsx"}:
        return "js"
    if suffix == ".json":
        return "json"
    if suffix == ".toml":
        return "toml"
    return "text"


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


def first_sentence_from_docstring(node: ast.AST) -> str | None:
    doc = ast.get_docstring(node)
    if not doc:
        return None
    doc = " ".join(doc.strip().split())
    return doc.split(". ")[0].strip()


def py_signature_from_node(node: ast.AST) -> str:
    """从 AST 节点提取完整的函数/方法签名，包含参数名、类型注解和返回值类型。"""
    if not isinstance(node, (ast.FunctionDef, ast.AsyncFunctionDef)):
        return ""

    parts = []
    args = node.args
    defaults = args.defaults
    num_no_default = len(args.args) - len(defaults)

    for i, arg in enumerate(args.args):
        if arg.arg == "self":
            continue
        param = arg.arg
        if arg.annotation:
            try:
                param += f": {ast.unparse(arg.annotation)}"
            except Exception:
                pass
        default_idx = i - num_no_default
        if default_idx >= 0:
            try:
                param += f" = {ast.unparse(defaults[default_idx])}"
            except Exception:
                pass
        parts.append(param)

    if args.vararg:
        param = f"*{args.vararg.arg}"
        if args.vararg.annotation:
            try:
                param += f": {ast.unparse(args.vararg.annotation)}"
            except Exception:
                pass
        parts.append(param)

    for i, arg in enumerate(args.kwonlyargs):
        param = arg.arg
        if arg.annotation:
            try:
                param += f": {ast.unparse(arg.annotation)}"
            except Exception:
                pass
        if args.kw_defaults[i] is not None:
            try:
                param += f" = {ast.unparse(args.kw_defaults[i])}"
            except Exception:
                pass
        parts.append(param)

    if args.kwarg:
        param = f"**{args.kwarg.arg}"
        if args.kwarg.annotation:
            try:
                param += f": {ast.unparse(args.kwarg.annotation)}"
            except Exception:
                pass
        parts.append(param)

    ret_annotation = ""
    if node.returns:
        try:
            ret_annotation = f" -> {ast.unparse(node.returns)}"
        except Exception:
            pass

    prefix = "async " if isinstance(node, ast.AsyncFunctionDef) else ""
    return f"{prefix}{node.name}({', '.join(parts)}){ret_annotation}"


def parse_python_details(path: str, source: str):
    details = {
        "classes": {},
        "functions": {},
        "assignments": [],
    }

    try:
        tree = ast.parse(source)
    except SyntaxError:
        return details

    for node in tree.body:
        if isinstance(node, ast.ClassDef):
            bases = []
            for base in node.bases:
                try:
                    bases.append(ast.unparse(base))
                except Exception:
                    pass

            class_info = {
                "extends": ", ".join(bases) if bases else "none",
                "methods": {},
                "lineno": getattr(node, "lineno", None),
                "end_lineno": getattr(node, "end_lineno", None),
                "doc": first_sentence_from_docstring(node),
            }

            for item in node.body:
                if isinstance(item, (ast.FunctionDef, ast.AsyncFunctionDef)):
                    class_info["methods"][item.name] = {
                        "signature": py_signature_from_node(item),
                        "lineno": getattr(item, "lineno", None),
                        "end_lineno": getattr(item, "end_lineno", None),
                        "doc": first_sentence_from_docstring(item),
                    }

            details["classes"][node.name] = class_info

        elif isinstance(node, (ast.FunctionDef, ast.AsyncFunctionDef)):
            details["functions"][node.name] = {
                "signature": py_signature_from_node(node),
                "lineno": getattr(node, "lineno", None),
                "end_lineno": getattr(node, "end_lineno", None),
                "doc": first_sentence_from_docstring(node),
            }

        elif isinstance(node, (ast.Assign, ast.AnnAssign)):
            targets = []

            if isinstance(node, ast.Assign):
                for t in node.targets:
                    if isinstance(t, ast.Name):
                        targets.append(t.id)
            elif isinstance(node, ast.AnnAssign):
                if isinstance(node.target, ast.Name):
                    targets.append(node.target.id)

            for name in targets:
                if name.startswith("_"):
                    continue

                item_type = "const" if name.isupper() else "var"
                details["assignments"].append({
                    "name": name,
                    "type": item_type,
                    "lineno": getattr(node, "lineno", None),
                })

    return details


# ── LLM 摘要生成（替代原规则逻辑） ─────────────────────────


def make_module_summary(path: str, source: str) -> str:
    """用 LLM 生成模块级摘要，取前 100 行作为上下文。"""
    snippet = "\n".join(source.splitlines()[:100])
    prompt = (
        f"请分析以下 Python 源码文件 `{path}` 的内容（前 100 行），"
        f"用 2-3 句中文详细说明这个模块的核心职责和主要功能。\n"
        f"要求：\n"
        f"1. 说明这个模块在项目中扮演的角色\n"
        f"2. 列出它提供的主要能力或接口\n"
        f"3. 描述它的关键实现方式\n\n"
        f"```\n{snippet}\n```"
    )
    result = llm_summarize(prompt)
    return result or f"负责 `{Path(path).stem}` 相关功能的实现。"


def make_class_summary(name: str, path: str, source: str, doc: str | None = None) -> str:
    """用 LLM 生成类级摘要。"""
    doc_hint = f"\n\n该类已有 docstring：{doc}" if doc else ""
    prompt = (
        f"请分析以下 Python 类 `{name}` 的代码（来自文件 `{path}`）{doc_hint}。\n"
        f"用 2-3 句中文详细说明：\n"
        f"1. 这个类的核心职责和设计目的\n"
        f"2. 它封装了哪些主要数据或行为\n"
        f"3. 它在项目架构中的典型使用场景\n\n"
        f"```\n{source}\n```"
    )
    result = llm_summarize(prompt)
    return result or f"封装 `{path}` 中与 `{name}` 相关的数据和行为。"


def make_function_summary(name: str, path: str, source: str, doc: str | None = None) -> str:
    """用 LLM 生成函数/方法级摘要。"""
    doc_hint = f"\n\n该函数已有 docstring：{doc}" if doc else ""
    prompt = (
        f"请分析以下 Python 函数/方法 `{name}` 的代码（来自文件 `{path}`）{doc_hint}。\n"
        f"用 2-3 句中文详细说明：\n"
        f"1. 这个函数的核心功能和处理逻辑\n"
        f"2. 它的输入参数和返回值的含义\n"
        f"3. 它在项目中的典型使用场景\n\n"
        f"```\n{source}\n```"
    )
    result = llm_summarize(prompt)
    return result or f"实现 `{path}` 中的 `{name}` 逻辑。"


def make_config_summary(path: str, source: str) -> str:
    """用 LLM 生成配置文件摘要。"""
    snippet = "\n".join(source.splitlines()[:40])
    prompt = (
        f"请分析以下配置文件 `{path}` 的内容。\n"
        f"用 2-3 句中文详细说明：\n"
        f"1. 这个配置文件控制的功能范围\n"
        f"2. 它包含的关键配置项和作用\n"
        f"3. 对项目构建或运行的影响\n\n"
        f"```\n{snippet}\n```"
    )
    result = llm_summarize(prompt)
    return result or f"该配置文件用于控制 kit 项目的依赖、构建、测试或运行参数。"


def make_usage_example(name: str, kind: str, path: str, source: str, signature: str = "") -> str:
    """用 LLM 生成使用示例。

    kind: "module" | "class" | "function" | "method" | "config"
    """
    # 只取前 20 行代码作为参考，避免 prompt 过长
    code_hint = "\n".join(source.splitlines()[:20])

    if kind == "module":
        prompt = (
            f"请为 Python 模块 `{path}` 生成一个使用示例。\n"
            f"模块功能参考：\n```\n{code_hint}\n```\n"
            f"要求：\n"
            f"1. 第一行开始写 import 语句，必须包含所有依赖\n"
            f"2. 然后写调用代码，5-10 行\n"
            f"3. 不要定义新的类或函数\n"
            f"4. 只输出代码，不要解释\n\n"
            f"示例格式：\n"
            f"```python\n"
            f"from pathlib import Path\n"
            f"import pathspec\n\n"
            f"repo = Path('/path/to/repo')\n"
            f"result = some_function(repo)\n"
            f"print(result)\n"
            f"```"
        )
    elif kind == "class":
        prompt = (
            f"请为 Python 类 `{name}` 生成一个使用示例。\n"
            f"类定义参考：\n```\n{code_hint}\n```\n"
            f"要求：\n"
            f"1. 第一行开始写 import 语句，必须包含所有依赖\n"
            f"2. 然后实例化类，传入合理参数\n"
            f"3. 调用 2-3 个主要方法，展示参数和返回值\n"
            f"4. 总共 8-15 行代码\n"
            f"5. 不要重新定义类\n"
            f"6. 只输出代码，不要解释\n\n"
            f"示例格式：\n"
            f"```python\n"
            f"from pathlib import Path\n"
            f"from kit.code_searcher import CodeSearcher, SearchOptions\n\n"
            f"searcher = CodeSearcher('/path/to/repo')\n"
            f"options = SearchOptions(case_sensitive=False)\n"
            f"results = searcher.search_text('def main', '*.py', options)\n"
            f"for r in results:\n"
            f"    print(r['file'], r['line_number'])\n"
            f"```"
        )
    elif kind in ("function", "method"):
        prompt = (
            f"为方法 `{name}` 写调用示例。\n"
            f"签名：`{signature}`\n"
            f"参考代码：\n```\n{code_hint}\n```\n"
            f"要求：先写 import，再实例化类（如果是方法），调用函数处理返回值，5-8 行代码，不要定义函数。"
        )
    else:
        return ""

    result = llm_summarize(prompt)
    if not result:
        return ""
    # 清理可能的 markdown 包裹
    result = result.strip()
    if result.startswith("```python"):
        result = result[len("```python"):].strip()
    if result.startswith("```"):
        result = result[3:].strip()
    if result.endswith("```"):
        result = result[:-3].strip()
    return result


# ── 文档生成 ────────────────────────────────────────────


def generate_md_for_file(path, source, repo):
    """为一个源码文件生成 markdown 内容，返回字符串。"""
    lang = safe_code_block_lang(path)
    out = []

    # 文件来源头部
    out.append(f"<!-- source: {path} -->\n")
    out.append(f"# `{path}`\n")
    out.append("---\n")

    if Path(path).suffix == ".py":
        # Python 文件：模块 + 类 + 方法 + 函数
        print(f"  [LLM] module: {path}")
        module_summary = make_module_summary(path, source)
        module_usage = make_usage_example("", "module", path, source)

        out.append("## module function:\n")
        out.append(module_summary + "\n")
        out.append("## module usage example:\n")
        if module_usage:
            out.append(f"```{lang}\n{module_usage}\n```\n")
        else:
            out.append(f"```{lang}\n# source: {path}\n```\n")

        details = parse_python_details(path, source)

        for class_name, info in details["classes"].items():
            class_code = get_lines(source, info.get("lineno"), info.get("end_lineno"), max_lines=50)
            print(f"    [LLM] class: {class_name}")
            class_summary = make_class_summary(class_name, path, class_code, info.get("doc"))
            class_usage = make_usage_example(class_name, "class", path, class_code)

            out.append(f"# class `{class_name}`\n")
            out.append("## function:\n")
            out.append(class_summary + "\n")
            out.append("## extends:\n")
            out.append(f"{info.get('extends') or 'none'}\n")
            out.append("## usage example:\n")
            if class_usage:
                out.append(f"```python\n{class_usage}\n```\n")
            else:
                snippet = get_lines(source, info.get("lineno"), info.get("end_lineno"), max_lines=18)
                out.append(f"```python\n{snippet}\n```\n")

            for method_name, method_info in info["methods"].items():
                signature = method_info.get("signature") or f"{method_name}(...)"
                method_code = get_lines(source, method_info.get("lineno"), method_info.get("end_lineno"), max_lines=30)
                print(f"      [LLM] method: {class_name}.{method_name}")
                method_summary = make_function_summary(method_name, path, method_code, method_info.get("doc"))
                method_usage = make_usage_example(method_name, "method", path, method_code, signature)

                out.append(f"# method `{class_name}.{signature}`\n")
                out.append("## function:\n")
                out.append(method_summary + "\n")
                out.append("## usage example:\n")
                if method_usage:
                    out.append(f"```python\n{method_usage}\n```\n")
                else:
                    snippet = get_lines(source, method_info.get("lineno"), method_info.get("end_lineno"), max_lines=16)
                    out.append(f"```python\n{snippet}\n```\n")

        for func_name, info in details["functions"].items():
            signature = info.get("signature") or f"{func_name}(...)"
            func_code = get_lines(source, info.get("lineno"), info.get("end_lineno"), max_lines=30)
            print(f"    [LLM] func: {func_name}")
            func_summary = make_function_summary(func_name, path, func_code, info.get("doc"))
            func_usage = make_usage_example(func_name, "function", path, func_code, signature)

            out.append(f"# func `{signature}`\n")
            out.append("## function:\n")
            out.append(func_summary + "\n")
            out.append("## usage example:\n")
            if func_usage:
                out.append(f"```python\n{func_usage}\n```\n")
            else:
                snippet = get_lines(source, info.get("lineno"), info.get("end_lineno"), max_lines=16)
                out.append(f"```python\n{snippet}\n```\n")

    else:
        # 非 Python 文件（配置文件等）
        print(f"  [LLM] config: {path}")
        summary = make_config_summary(path, source)
        snippet = "\n".join(source.splitlines()[:30]).strip()

        out.append("## function:\n")
        out.append(summary + "\n")
        out.append("## declaration:\n")
        out.append(f"```{lang}\n{snippet}\n```\n")

    return "\n".join(out)


def generate_markdown(repo_path: str, output_dir: str):
    """扫描代码库，复制后逐个替换代码文件为 markdown。

    Args:
        repo_path: 要扫描的代码库路径
        output_dir: 输出目录路径（会先复制整个代码库到这里）
    """
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

    # 2. 扫描所有源码文件
    file_tree = repo.get_file_tree()
    files = []
    for item in file_tree:
        path = item.get("path") or item.get("name") or ""
        is_dir = item.get("is_dir", False)
        if path and not is_dir and not should_skip_path(path):
            files.append(path)

    source_files = [p for p in files if is_source_file(p)]
    config_files = [p for p in files if is_config_file(p)]
    all_files = sorted(source_files) + sorted(config_files)

    print(f"\n[SCAN] Found {len(all_files)} files to process")

    # 3. 逐个替换
    replaced = 0
    for path in all_files:
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

        # 写入 .md 文件（与原文件同目录同名）
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
        epilog="示例:\n"
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
        help="输出目录路径（默认: <repo_path>_docs）",
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
