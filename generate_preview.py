"""测试版：扫描 kit/benchmarks/ 目录，验证复制+替换模式。"""
import ast
import shutil
import time
from pathlib import Path

from kit import Repository
from kit.llm_client_factory import create_openai_client

REPO_ROOT = Path(__file__).resolve().parent / "kit"
OUTPUT_DIR = Path(__file__).resolve().parent / "kit_docs"
TARGET_DIR = "benchmarks"  # 只处理这个子目录

LLM_API_KEY = "tp-cbs3hu9i4xsldjtuyl82fj2l9uo2py2qe3ulrhc1zzhj8ij5"
LLM_BASE_URL = "https://token-plan-cn.xiaomimimo.com/v1"
LLM_MODEL = "mimo-v2.5-pro"

_client = create_openai_client(api_key=LLM_API_KEY, base_url=LLM_BASE_URL)
_last_call_time = 0.0


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
    if text.startswith("```python"):
        text = text[len("```python"):].strip()
    if text.startswith("```"):
        text = text[3:].strip()
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


def get_full_signature(node):
    """从 AST 节点提取完整签名（参数名+类型+默认值+返回值）。"""
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


def parse_python_details(path, source):
    details = {"classes": {}, "functions": {}, "assignments": []}
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
                "doc": ast.get_docstring(node),
            }
            for item in node.body:
                if isinstance(item, (ast.FunctionDef, ast.AsyncFunctionDef)):
                    class_info["methods"][item.name] = {
                        "signature": get_full_signature(item),
                        "lineno": getattr(item, "lineno", None),
                        "end_lineno": getattr(item, "end_lineno", None),
                        "doc": ast.get_docstring(item),
                    }
            details["classes"][node.name] = class_info
        elif isinstance(node, (ast.FunctionDef, ast.AsyncFunctionDef)):
            details["functions"][node.name] = {
                "signature": get_full_signature(node),
                "lineno": getattr(node, "lineno", None),
                "end_lineno": getattr(node, "end_lineno", None),
                "doc": ast.get_docstring(node),
            }
    return details


def generate_md_for_file(path, source):
    """为一个 Python 文件生成 markdown 内容。"""
    out = []
    out.append(f"<!-- source: {path} -->\n")
    out.append(f"# `{path}`\n")
    out.append("---\n")

    # 模块摘要
    print(f"  [LLM] module: {path}")
    snippet = "\n".join(source.splitlines()[:100])
    module_summary = llm_summarize(
        f"请分析以下 Python 源码文件 `{path}` 的内容（前 100 行），"
        f"用 2-3 句中文详细说明这个模块的核心职责和主要功能。\n"
        f"要求：说明角色、主要能力、关键实现方式。\n\n"
        f"```\n{snippet}\n```"
    )
    module_usage = clean_code_block(llm_summarize(
        f"请为 Python 模块 `{path}` 生成一个使用示例。\n"
        f"模块功能参考：\n```\n{snippet}\n```\n"
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
    ))

    out.append("## module function:\n")
    out.append(module_summary + "\n")
    out.append("## module usage example:\n")
    out.append(f"```python\n{module_usage}\n```\n")

    # 类和函数
    details = parse_python_details(path, source)

    for class_name, info in details["classes"].items():
        class_code = get_lines(source, info.get("lineno"), info.get("end_lineno"), max_lines=50)
        print(f"    [LLM] class: {class_name}")
        class_summary = llm_summarize(
            f"请分析以下 Python 类 `{class_name}` 的代码。\n"
            f"用 2-3 句中文详细说明：核心职责、封装的数据或行为、典型使用场景。\n\n"
            f"```\n{class_code}\n```"
        )
        class_usage = clean_code_block(llm_summarize(
            f"请为 Python 类 `{class_name}` 生成一个使用示例。\n"
            f"类定义参考：\n```\n{class_code}\n```\n"
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
        ))

        out.append(f"# class `{class_name}`\n")
        out.append("## function:\n")
        out.append(class_summary + "\n")
        out.append("## extends:\n")
        out.append(f"{info.get('extends') or 'none'}\n")
        out.append("## usage example:\n")
        out.append(f"```python\n{class_usage}\n```\n")

        for method_name, method_info in info["methods"].items():
            signature = method_info.get("signature") or f"{method_name}(...)"
            method_code = get_lines(source, method_info.get("lineno"), method_info.get("end_lineno"), max_lines=30)
            print(f"      [LLM] method: {class_name}.{method_name}")
            method_summary = llm_summarize(
                f"请分析以下 Python 方法 `{method_name}` 的代码。\n"
                f"用 2-3 句中文详细说明：核心功能、输入输出、典型使用场景。\n\n"
                f"```\n{method_code}\n```"
            )
            method_usage = clean_code_block(llm_summarize(
                f"为方法 `{class_name}.{method_name}` 写调用示例。\n"
                f"签名：`{signature}`\n"
                f"参考代码：\n```\n{method_code[:500]}\n```\n"
                f"要求：先写 import，再实例化类，调用方法，5-8 行代码，不要定义方法。"
            ))

            out.append(f"# method `{class_name}.{signature}`\n")
            out.append("## function:\n")
            out.append(method_summary + "\n")
            out.append("## usage example:\n")
            out.append(f"```python\n{method_usage}\n```\n")

    for func_name, info in details["functions"].items():
        signature = info.get("signature") or f"{func_name}(...)"
        func_code = get_lines(source, info.get("lineno"), info.get("end_lineno"), max_lines=30)
        print(f"    [LLM] func: {func_name}")
        func_summary = llm_summarize(
            f"请分析以下 Python 函数 `{func_name}` 的代码。\n"
            f"用 2-3 句中文详细说明：核心功能、输入输出、典型使用场景。\n\n"
            f"```\n{func_code}\n```"
        )
        func_usage = clean_code_block(llm_summarize(
            f"为函数 `{func_name}` 写调用示例。\n"
            f"签名：`{signature}`\n"
            f"参考代码：\n```\n{func_code[:500]}\n```\n"
            f"要求：先写 import，再调用函数处理返回值，5-8 行代码，不要定义函数。"
        ))

        out.append(f"# func `{signature}`\n")
        out.append("## function:\n")
        out.append(func_summary + "\n")
        out.append("## usage example:\n")
        out.append(f"```python\n{func_usage}\n```\n")

    return "\n".join(out)


def main():
    # 1. 复制代码库
    if OUTPUT_DIR.exists():
        shutil.rmtree(OUTPUT_DIR)

    print(f"[COPY] {REPO_ROOT} -> {OUTPUT_DIR}")
    shutil.copytree(REPO_ROOT, OUTPUT_DIR, ignore=shutil.ignore_patterns(
        ".git", "__pycache__", ".venv", "node_modules", ".pytest_cache"
    ))

    # 2. 扫描目标目录中的 Python 文件
    target_path = OUTPUT_DIR / TARGET_DIR
    py_files = sorted(target_path.rglob("*.py"))

    print(f"\n[SCAN] Found {len(py_files)} Python files in {TARGET_DIR}/")

    # 3. 逐个替换
    for py_file in py_files:
        rel_path = py_file.relative_to(OUTPUT_DIR)
        print(f"\n[FILE] {rel_path}")

        source = py_file.read_text(encoding="utf-8")
        if not source.strip():
            print(f"  [SKIP] empty file")
            continue

        # 生成 markdown
        md_content = generate_md_for_file(str(rel_path), source)

        # 写入 .md 文件（与 .py 同目录同名）
        md_file = py_file.with_suffix(".md")
        md_file.write_text(md_content, encoding="utf-8")
        print(f"  [WRITE] {md_file.relative_to(OUTPUT_DIR)}")

        # 删除原 .py 文件
        py_file.unlink()
        print(f"  [DELETE] {rel_path}")

    print(f"\nDone! Replaced {len(py_files)} files in {OUTPUT_DIR / TARGET_DIR}")


if __name__ == "__main__":
    main()
