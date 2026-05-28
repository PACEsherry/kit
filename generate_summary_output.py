
from pathlib import Path
from collections import defaultdict
import ast
import re

from kit import Repository


REPO_ROOT = Path(__file__).resolve().parent
OUTPUT_PATH = REPO_ROOT.parent / "summary_output.md"


# ------------------------------------------------------------
# 基础过滤规则：
# 只分析常见源码和配置文件，跳过虚拟环境、git、缓存、构建产物等目录。
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
    if not isinstance(node, (ast.FunctionDef, ast.AsyncFunctionDef)):
        return ""

    args = []

    for arg in node.args.posonlyargs + node.args.args:
        args.append(arg.arg)

    if node.args.vararg:
        args.append("*" + node.args.vararg.arg)

    for arg in node.args.kwonlyargs:
        args.append(arg.arg)

    if node.args.kwarg:
        args.append("**" + node.args.kwarg.arg)

    prefix = "async " if isinstance(node, ast.AsyncFunctionDef) else ""
    return f"{prefix}{node.name}({', '.join(args)})"


def parse_python_details(path: str, source: str):
    """
    返回：
    {
      "classes": {
        "ClassName": {
          "extends": "...",
          "methods": {
            "methodName": {
              "signature": "...",
              "lineno": 1,
              "end_lineno": 10,
              "doc": "..."
            }
          },
          "lineno": 1,
          "end_lineno": 20,
          "doc": "..."
        }
      },
      "functions": {
        "funcName": {...}
      },
      "assignments": [
        {"name": "...", "type": "const" / "var", "lineno": 1}
      ]
    }
    """

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


def make_function_summary(name: str, path: str, doc: str | None = None) -> str:
    if doc:
        return f"{doc}。"

    lower = name.lower()

    if lower.startswith("get_") or lower.startswith("get"):
        return f"获取与 `{name}` 相关的数据或对象，供项目内部逻辑调用。"
    if lower.startswith("set_") or lower.startswith("set"):
        return f"设置与 `{name}` 相关的状态、配置或对象属性。"
    if lower.startswith("load_") or lower.startswith("load"):
        return f"加载与 `{name}` 相关的文件、配置或运行时数据。"
    if lower.startswith("create_") or lower.startswith("build_"):
        return f"创建或构建与 `{name}` 相关的对象、索引或中间结果。"
    if lower.startswith("extract_"):
        return f"从源码或输入数据中抽取与 `{name}` 相关的结构化信息。"
    if lower.startswith("search_") or lower.startswith("find_"):
        return f"搜索或定位与 `{name}` 相关的代码、符号或文本结果。"
    if lower.startswith("summarize"):
        return f"对输入内容生成摘要信息，服务于代码理解或检索流程。"

    return f"实现 `{path}` 中的 `{name}` 逻辑，是该模块中的可调用函数单元。"


def make_class_summary(name: str, path: str, doc: str | None = None) -> str:
    if doc:
        return f"{doc}。"

    lower = name.lower()

    if "repository" in lower:
        return f"封装代码仓库读取、源码访问、符号抽取或搜索相关能力。"
    if "summarizer" in lower:
        return f"封装摘要生成逻辑，用于为文件、函数或类生成自然语言说明。"
    if "indexer" in lower:
        return f"封装索引构建逻辑，用于将摘要或代码信息写入可检索索引。"
    if "searcher" in lower:
        return f"封装搜索逻辑，用于根据查询返回相关代码或摘要结果。"
    if "analyzer" in lower:
        return f"封装分析逻辑，用于理解代码依赖、结构或上下文关系。"

    return f"封装 `{path}` 中与 `{name}` 相关的数据和行为，是项目中的类级实现单元。"


def make_module_summary(path: str) -> str:
    name = Path(path).stem
    lower_path = path.lower()

    if "summary" in lower_path or "summar" in lower_path:
        return "负责代码摘要生成、摘要索引或摘要检索相关逻辑。"
    if "repo" in lower_path or "repository" in lower_path:
        return "负责代码仓库抽象、文件读取、符号抽取或源码搜索相关逻辑。"
    if "search" in lower_path:
        return "负责代码搜索、文本匹配或检索结果组织相关逻辑。"
    if "cli" in lower_path:
        return "负责命令行入口、参数解析和命令调度相关逻辑。"
    if "mcp" in lower_path:
        return "负责 MCP 工具暴露、模型上下文协议服务或外部工具调用相关逻辑。"
    if "test" in lower_path:
        return "负责测试项目中相关功能是否符合预期。"

    return f"负责 `{name}` 相关功能的实现，是 kit 项目中的源码模块。"


def write_header(out):
    out.append("# Summary Output\n")
    out.append("> 本文档根据 kit 项目源码自动生成，用于记录代码仓库中的库、模块、类、方法、函数、配置、变量和常量等广义接口摘要。\n")
    out.append("> 每个条目尽量保持统一结构，方便后续被 AI 检索、理解和定位源码。\n")
    out.append("\n---\n")


def add_library_section(out):
    out.append("# library kit\n")
    out.append("## function:\n")
    out.append("kit 是一个代码智能工具包，用于代码库映射、文件读取、符号抽取、代码搜索、摘要生成、摘要索引和面向 AI agent 的代码上下文构建。\n")
    out.append("## usage example:\n")
    out.append("```python")
    out.append("from kit import Repository\n")
    out.append('repo = Repository("https://github.com/cased/kit")')
    out.append("symbols = repo.extract_symbols()")
    out.append("print(symbols[:3])")
    out.append("```\n")


def add_config_section(out, path: str, source: str):
    lang = safe_code_block_lang(path)
    snippet = "\n".join(source.splitlines()[:20]).strip()

    out.append(f"# config {path}\n")
    out.append("## function:\n")
    out.append(f"该配置文件用于控制 kit 项目的依赖、构建、测试、文档或运行参数。\n")
    out.append("## declaration:\n")
    out.append(f"```{lang}")
    out.append(snippet)
    out.append("```\n")
    out.append("## usage example:\n")
    out.append("```powershell")
    out.append(f"# 查看配置文件")
    out.append(f"Get-Content {path} -TotalCount 40")
    out.append("```\n")


def generate_markdown():
    repo = Repository(str(REPO_ROOT))

    file_tree = repo.get_file_tree()
    files = []

    for item in file_tree:
        path = item.get("path") or item.get("name") or ""
        is_dir = item.get("is_dir", False)
        if path and not is_dir and not should_skip_path(path):
            files.append(path)

    source_files = [p for p in files if is_source_file(p)]
    config_files = [p for p in files if is_config_file(p)]

    out = []
    write_header(out)
    add_library_section(out)

    # 配置文件摘要
    for path in sorted(config_files):
        source = read_file(repo, path)
        if source.strip():
            add_config_section(out, path, source)

    # 源码模块、类、方法、函数、变量、常量摘要
    for path in sorted(source_files):
        source = read_file(repo, path)
        if not source.strip():
            continue

        lang = safe_code_block_lang(path)

        out.append(f"# module {path}\n")
        out.append("## function:\n")
        out.append(make_module_summary(path) + "\n")
        out.append("## usage example:\n")
        out.append(f"```{lang}")
        out.append(f"# source: {path}")
        out.append("```\n")

        if Path(path).suffix == ".py":
            details = parse_python_details(path, source)

            for class_name, info in details["classes"].items():
                out.append(f"# class {class_name}\n")
                out.append("## function:\n")
                out.append(make_class_summary(class_name, path, info.get("doc")) + "\n")
                out.append("## extends:\n")
                out.append(f"{info.get('extends') or 'none'}\n")
                out.append("## implements:\n")
                out.append("unknown\n")
                out.append("## usage example:\n")
                snippet = get_lines(source, info.get("lineno"), info.get("end_lineno"), max_lines=18)
                out.append("```python")
                out.append(snippet)
                out.append("```\n")

                for method_name, method_info in info["methods"].items():
                    signature = method_info.get("signature") or f"{method_name}(...)"
                    out.append(f"# method {class_name}.{signature}\n")
                    out.append("## function:\n")
                    out.append(make_function_summary(method_name, path, method_info.get("doc")) + "\n")
                    out.append("## extends:\n")
                    out.append("none\n")
                    out.append("## implements:\n")
                    out.append("none\n")
                    out.append("## usage example:\n")
                    snippet = get_lines(source, method_info.get("lineno"), method_info.get("end_lineno"), max_lines=16)
                    out.append("```python")
                    out.append(snippet)
                    out.append("```\n")

            for func_name, info in details["functions"].items():
                signature = info.get("signature") or f"{func_name}(...)"
                out.append(f"# func {signature}\n")
                out.append("## function:\n")
                out.append(make_function_summary(func_name, path, info.get("doc")) + "\n")
                out.append("## usage example:\n")
                snippet = get_lines(source, info.get("lineno"), info.get("end_lineno"), max_lines=16)
                out.append("```python")
                out.append(snippet)
                out.append("```\n")

            for item in details["assignments"]:
                name = item["name"]
                item_type = item["type"]
                out.append(f"# {item_type} {name}\n")
                out.append("## function:\n")
                if item_type == "const":
                    out.append(f"`{name}` 是模块级常量，通常用于保存固定配置、默认值、映射规则或路径信息。\n")
                else:
                    out.append(f"`{name}` 是模块级变量，通常用于保存运行时状态、配置对象或中间结果。\n")
                out.append("## usage example:\n")
                snippet = get_lines(source, item.get("lineno"), item.get("lineno"), max_lines=3)
                out.append("```python")
                out.append(snippet)
                out.append("```\n")

        else:
            # 对非 Python 文件，先保留模块级摘要，后续可补充 TS/JS AST 解析。
            pass

    OUTPUT_PATH.write_text("\n".join(out), encoding="utf-8")
    print(f"summary_output.md generated: {OUTPUT_PATH}")
    print(f"source files scanned: {len(source_files)}")
    print(f"config files scanned: {len(config_files)}")


if __name__ == "__main__":
    generate_markdown()
