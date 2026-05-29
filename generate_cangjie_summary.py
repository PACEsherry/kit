#!/usr/bin/env python3
"""
generate_cangjie_summary.py

用于提取仓颉(.cj)代码仓的摘要信息，生成面向 AI 的全代码库 API 参考文档。
支持 Python 和仓颉语言的源码解析。

Usage:
    python generate_cangjie_summary.py <repo_path> [output_file]

Example:
    python generate_cangjie_summary.py ./CangjieSkills/.agents/skills cangjie_skills_summary.md
    python generate_cangjie_summary.py ./CangjieSkills cangjie_full_summary.md
"""

from pathlib import Path
from collections import defaultdict
import ast
import re
import sys
import os


# 默认配置
DEFAULT_OUTPUT = "cangjie_summary.md"


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
    "target",
}

SOURCE_SUFFIXES = {
    ".py",
    ".cj",  # 仓颉语言
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
    "cjpm.toml",  # 仓颉项目配置
    "Cargo.toml",
}


# ------------------------------------------------------------
# 仓颉语言解析相关
# ------------------------------------------------------------

# 仓颉访问修饰符
CJ_ACCESS_MODIFIERS = ["public", "private", "protected", "internal"]

# 仓颉类型关键字
CJ_TYPE_KEYWORDS = ["class", "interface", "struct", "enum", "type"]


def parse_cangjie_details(path: str, source: str) -> dict:
    """
    解析仓颉(.cj)文件的详细信息。

    返回：
    {
        "package": "package_name",
        "imports": ["import1", "import2"],
        "classes": {
            "ClassName": {
                "kind": "class" | "interface" | "struct" | "enum",
                "access": "public" | "private" | "protected" | "internal",
                "extends": "BaseClass" | "none",
                "implements": ["Interface1", "Interface2"],
                "properties": {
                    "propName": {
                        "type": "TypeName",
                        "access": "public",
                        "is_let": False,
                        "lineno": 1
                    }
                },
                "methods": {
                    "methodName": {
                        "signature": "func methodName(args): ReturnType",
                        "access": "public",
                        "is_static": False,
                        "lineno": 10,
                        "doc": "方法说明"
                    }
                },
                "lineno": 1,
                "end_lineno": 50,
                "doc": "类说明"
            }
        },
        "functions": {
            "funcName": {
                "signature": "func funcName(args): ReturnType",
                "access": "public",
                "is_static": False,
                "lineno": 1,
                "doc": "函数说明"
            }
        },
        "variables": {
            "varName": {
                "type": "TypeName",
                "access": "public",
                "is_let": False,
                "lineno": 1
            }
        }
    }
    """

    details = {
        "package": None,
        "imports": [],
        "classes": {},
        "functions": {},
        "variables": {},
    }

    lines = source.splitlines()

    # 解析 package 声明
    package_match = re.match(r'^\s*package\s+([\w.]+)', source)
    if package_match:
        details["package"] = package_match.group(1)

    # 解析 import 语句
    for line in lines:
        import_match = re.match(r'^\s*import\s+([\w.*]+)', line)
        if import_match:
            details["imports"].append(import_match.group(1))

    # 使用状态机解析类、函数、变量
    current_class = None
    current_class_info = None
    brace_depth = 0
    in_comment = False
    doc_buffer = []

    i = 0
    while i < len(lines):
        line = lines[i]
        stripped = line.strip()

        # 处理多行注释
        if in_comment:
            if "*/" in stripped:
                in_comment = False
                doc_end = stripped.index("*/")
                doc_buffer.append(stripped[:doc_end].strip())
            else:
                doc_buffer.append(stripped)
            i += 1
            continue

        # 检测单行注释作为文档
        if stripped.startswith("//"):
            doc_buffer.append(stripped[2:].strip())
            i += 1
            continue

        # 检测多行注释开始
        if "/*" in stripped:
            comment_start = stripped.index("/*")
            before_comment = stripped[:comment_start].strip()
            if "*/" in stripped[comment_start:]:
                # 单行 /* ... */ 注释
                comment_end = stripped.index("*/", comment_start)
                doc_buffer.append(stripped[comment_start+2:comment_end].strip())
            else:
                in_comment = True
                doc_buffer.append(stripped[comment_start+2:].strip())

        # 统计大括号深度
        brace_depth += stripped.count("{") - stripped.count("}")

        # 解析类/接口/结构体/枚举声明
        class_match = re.match(
            r'^\s*(?:(public|private|protected|internal)\s+)?'
            r'(class|interface|struct|enum)\s+'
            r'(\w+)'
            r'(?:\s*<[^>]*>)?'  # 泛型参数
            r'(?:\s*:\s*([^{]+))?'  # 继承和实现
            r'\s*\{?',
            line
        )

        if class_match:
            access = class_match.group(1) or "internal"
            kind = class_match.group(2)
            class_name = class_match.group(3)
            inheritance_str = class_match.group(4)

            extends = "none"
            implements = []

            if inheritance_str:
                # 解析继承和实现
                inheritance_parts = [p.strip() for p in inheritance_str.split(",")]
                if inheritance_parts:
                    # 第一个可能是父类（如果有括号则是构造函数调用）
                    first = inheritance_parts[0]
                    if "(" in first:
                        extends = first.split("(")[0].strip()
                    else:
                        extends = first
                    # 其余是接口
                    for part in inheritance_parts[1:]:
                        implements.append(part.strip())

            current_class_info = {
                "kind": kind,
                "access": access,
                "extends": extends,
                "implements": implements,
                "properties": {},
                "methods": {},
                "lineno": i + 1,
                "end_lineno": None,
                "doc": " ".join(doc_buffer).strip() if doc_buffer else None,
            }
            current_class = class_name
            doc_buffer = []
            i += 1
            continue

        # 解析函数/方法声明
        func_match = re.match(
            r'^\s*(?:(public|private|protected|internal)\s+)?'
            r'(?:(static)\s+)?'
            r'(?:(open)\s+)?'
            r'(?:func|init)\s+'
            r'(\w+|init)'
            r'\s*\(([^)]*)\)'
            r'(?:\s*:\s*(\S+))?',
            line
        )

        if func_match:
            access = func_match.group(1) or "internal"
            is_static = func_match.group(2) is not None
            func_name = func_match.group(4)
            params = func_match.group(5) or ""
            return_type = func_match.group(6)

            if func_name == "init":
                func_name = "init"

            signature = f"func {func_name}({params})"
            if return_type:
                signature += f": {return_type}"

            func_info = {
                "signature": signature,
                "access": access,
                "is_static": is_static,
                "lineno": i + 1,
                "doc": " ".join(doc_buffer).strip() if doc_buffer else None,
            }

            if current_class and current_class_info:
                current_class_info["methods"][func_name] = func_info
            else:
                details["functions"][func_name] = func_info

            doc_buffer = []
            i += 1
            continue

        # 解析属性声明 (var/let)
        prop_match = re.match(
            r'^\s*(?:(public|private|protected|internal)\s+)?'
            r'(?:(static)\s+)?'
            r'(var|let)\s+'
            r'(\w+)'
            r'(?:\s*:\s*(\S+))?',
            line
        )

        if prop_match:
            access = prop_match.group(1) or "internal"
            is_static = prop_match.group(2) is not None
            is_let = prop_match.group(3) == "let"
            prop_name = prop_match.group(4)
            prop_type = prop_match.group(5)

            prop_info = {
                "type": prop_type,
                "access": access,
                "is_let": is_let,
                "lineno": i + 1,
            }

            if current_class and current_class_info:
                current_class_info["properties"][prop_name] = prop_info
            else:
                details["variables"][prop_name] = prop_info

            doc_buffer = []
            i += 1
            continue

        # 检测类结束
        if current_class and brace_depth <= 0 and "}" in stripped:
            current_class_info["end_lineno"] = i + 1
            details["classes"][current_class] = current_class_info
            current_class = None
            current_class_info = None
            brace_depth = 0

        # 如果没有匹配到任何模式，清空文档缓冲
        if stripped and not stripped.startswith("//") and not stripped.startswith("/*"):
            if not any([
                class_match,
                func_match,
                prop_match,
                stripped == "{",
                stripped == "}",
                stripped == "",
            ]):
                doc_buffer = []

        i += 1

    # 处理未关闭的类
    if current_class and current_class_info:
        current_class_info["end_lineno"] = len(lines)
        details["classes"][current_class] = current_class_info

    return details


# ------------------------------------------------------------
# Python 解析（复用原脚本逻辑）
# ------------------------------------------------------------

def parse_python_details(path: str, source: str) -> dict:
    """解析 Python 文件的详细信息。"""
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
                "doc": ast.get_docstring(node),
            }

            for item in node.body:
                if isinstance(item, (ast.FunctionDef, ast.AsyncFunctionDef)):
                    class_info["methods"][item.name] = {
                        "signature": py_signature_from_node(item),
                        "lineno": getattr(item, "lineno", None),
                        "end_lineno": getattr(item, "end_lineno", None),
                        "doc": ast.get_docstring(item),
                    }

            details["classes"][node.name] = class_info

        elif isinstance(node, (ast.FunctionDef, ast.AsyncFunctionDef)):
            details["functions"][node.name] = {
                "signature": py_signature_from_node(node),
                "lineno": getattr(node, "lineno", None),
                "end_lineno": getattr(node, "end_lineno", None),
                "doc": ast.get_docstring(node),
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


def py_signature_from_node(node: ast.AST) -> str:
    """生成 Python 函数签名。"""
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


# ------------------------------------------------------------
# 工具函数
# ------------------------------------------------------------

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
    if suffix == ".cj":
        return "cangjie"
    if suffix in {".ts", ".tsx"}:
        return "ts"
    if suffix in {".js", ".jsx"}:
        return "js"
    if suffix == ".json":
        return "json"
    if suffix == ".toml":
        return "toml"
    return "text"


def read_file(repo_path: str, path: str) -> str:
    """读取文件内容。"""
    try:
        full_path = os.path.join(repo_path, path)
        with open(full_path, 'r', encoding='utf-8') as f:
            return f.read()
    except Exception:
        return ""


def get_file_tree(repo_path: str) -> list:
    """获取文件树。"""
    files = []
    repo_path = Path(repo_path)

    for root, dirs, filenames in os.walk(repo_path):
        # 跳过隐藏目录和特定目录
        dirs[:] = [d for d in dirs if not d.startswith('.') and d not in SKIP_DIR_PARTS]

        for filename in filenames:
            full_path = Path(root) / filename
            rel_path = full_path.relative_to(repo_path)
            files.append({
                "path": str(rel_path),
                "is_dir": False,
                "name": filename,
            })

    return files


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


def make_module_summary(path: str) -> str:
    """生成模块摘要。"""
    name = Path(path).stem
    lower_path = path.lower()

    if "test" in lower_path:
        return f"负责测试 `{name}` 相关功能是否符合预期。"
    if "example" in lower_path:
        return f"提供 `{name}` 的使用示例和演示代码。"
    if "util" in lower_path or "helper" in lower_path:
        return f"提供 `{name}` 相关的工具函数和辅助功能。"
    if "config" in lower_path:
        return f"负责 `{name}` 相关的配置管理。"
    if "main" in lower_path:
        return f"程序入口，负责初始化和启动应用。"

    return f"负责 `{name}` 相关功能的实现，是项目中的源码模块。"


def make_class_summary(name: str, path: str, doc: str | None = None) -> str:
    """生成类摘要。"""
    if doc:
        return f"{doc}。"

    lower = name.lower()

    if "service" in lower:
        return f"封装业务逻辑，提供 `{name}` 相关的服务功能。"
    if "controller" in lower:
        return f"处理请求路由和响应，控制 `{name}` 相关的业务流程。"
    if "model" in lower or "entity" in lower:
        return f"定义数据模型，封装 `{name}` 相关的数据结构。"
    if "repository" in lower or "dao" in lower:
        return f"负责数据访问，提供 `{name}` 相关的持久化操作。"
    if "handler" in lower:
        return f"处理事件或请求，负责 `{name}` 相关的事件响应。"
    if "manager" in lower:
        return f"管理资源或状态，协调 `{name}` 相关的操作。"
    if "builder" in lower:
        return f"构建复杂对象，提供 `{name}` 的创建功能。"
    if "factory" in lower:
        return f"创建对象实例，提供 `{name}` 相关的工厂方法。"
    if "router" in lower:
        return f"路由请求，管理 `{name}` 相关的路径映射。"
    if "note" in lower:
        return f"封装笔记数据和操作，提供 `{name}` 相关的功能。"

    return f"封装 `{path}` 中与 `{name}` 相关的数据和行为，是项目中的类级实现单元。"


def make_function_summary(name: str, path: str, doc: str | None = None) -> str:
    """生成函数摘要。"""
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
    if lower.startswith("init"):
        return f"初始化 `{name}` 相关的对象或资源。"
    if lower.startswith("delete_") or lower.startswith("remove_"):
        return f"删除或移除与 `{name}` 相关的数据或资源。"
    if lower.startswith("update_") or lower.startswith("modify_"):
        return f"更新或修改与 `{name}` 相关的数据或状态。"

    return f"实现 `{path}` 中的 `{name}` 逻辑，是该模块中的可调用函数单元。"


# ------------------------------------------------------------
# 输出生成
# ------------------------------------------------------------

def write_header(out: list, repo_name: str = "CangjieSkills"):
    """写入文档头部。"""
    out.append(f"# Summary Output - {repo_name}\n")
    out.append(f"> 本文档根据 {repo_name} 项目源码自动生成，用于记录代码仓库中的库、模块、类、方法、函数、配置、变量和常量等广义接口摘要。\n")
    out.append("> 每个条目尽量保持统一结构，方便后续被 AI 检索、理解和定位源码。\n")
    out.append("\n---\n")


def add_library_section(out: list, repo_name: str = "CangjieSkills"):
    """添加库概览部分。"""
    out.append(f"# library {repo_name}\n")
    out.append("## function:\n")
    out.append(f"{repo_name} 是一个仓颉语言技能库，提供 HarmonyOS 应用开发的示例代码、最佳实践和常用组件。\n")
    out.append("## usage example:\n")
    out.append("```cangjie")
    out.append("// 导入技能库中的模块")
    out.append("import skills.notebook.*")
    out.append("```\n")


def add_config_section(out: list, path: str, source: str):
    """添加配置文件摘要。"""
    lang = safe_code_block_lang(path)
    snippet = "\n".join(source.splitlines()[:20]).strip()

    out.append(f"# config {path}\n")
    out.append("## function:\n")
    out.append(f"该配置文件用于控制项目的依赖、构建、测试或运行参数。\n")
    out.append("## declaration:\n")
    out.append(f"```{lang}")
    out.append(snippet)
    out.append("```\n")


def add_cangjie_class_section(out: list, class_name: str, class_info: dict, source: str):
    """添加仓颉类摘要。"""
    out.append(f"# class {class_name}\n")
    out.append("## function:\n")
    out.append(make_class_summary(class_name, "", class_info.get("doc")) + "\n")
    out.append("## kind:\n")
    out.append(f"{class_info.get('kind', 'class')}\n")
    out.append("## access:\n")
    out.append(f"{class_info.get('access', 'internal')}\n")
    out.append("## extends:\n")
    out.append(f"{class_info.get('extends', 'none')}\n")
    out.append("## implements:\n")
    implements = class_info.get("implements", [])
    out.append(f"{', '.join(implements) if implements else 'none'}\n")

    # 属性
    properties = class_info.get("properties", {})
    if properties:
        out.append("## properties:\n")
        for prop_name, prop_info in properties.items():
            access = prop_info.get("access", "internal")
            prop_type = prop_info.get("type", "Any")
            is_let = prop_info.get("is_let", False)
            keyword = "let" if is_let else "var"
            out.append(f"- `{access} {keyword} {prop_name}: {prop_type}`\n")

    # 使用示例
    out.append("## usage example:\n")
    snippet = get_lines(source, class_info.get("lineno"), class_info.get("end_lineno"), max_lines=20)
    out.append("```cangjie")
    out.append(snippet)
    out.append("```\n")


def add_cangjie_method_section(out: list, class_name: str, method_name: str, method_info: dict, source: str):
    """添加仓颉方法摘要。"""
    signature = method_info.get("signature", f"func {method_name}(...)")
    out.append(f"# method {class_name}.{signature}\n")
    out.append("## function:\n")
    out.append(make_function_summary(method_name, "", method_info.get("doc")) + "\n")
    out.append("## access:\n")
    out.append(f"{method_info.get('access', 'internal')}\n")
    out.append("## is_static:\n")
    out.append(f"{method_info.get('is_static', False)}\n")
    out.append("## usage example:\n")
    snippet = get_lines(source, method_info.get("lineno"), method_info.get("lineno") + 10, max_lines=12)
    out.append("```cangjie")
    out.append(snippet)
    out.append("```\n")


def add_cangjie_function_section(out: list, func_name: str, func_info: dict, source: str):
    """添加仓颉函数摘要。"""
    signature = func_info.get("signature", f"func {func_name}(...)")
    out.append(f"# func {signature}\n")
    out.append("## function:\n")
    out.append(make_function_summary(func_name, "", func_info.get("doc")) + "\n")
    out.append("## access:\n")
    out.append(f"{func_info.get('access', 'internal')}\n")
    out.append("## usage example:\n")
    snippet = get_lines(source, func_info.get("lineno"), func_info.get("lineno") + 10, max_lines=12)
    out.append("```cangjie")
    out.append(snippet)
    out.append("```\n")


def add_cangjie_variable_section(out: list, var_name: str, var_info: dict, source: str):
    """添加仓颉变量摘要。"""
    is_let = var_info.get("is_let", False)
    keyword = "let" if is_let else "var"
    var_type = var_info.get("type", "Any")
    out.append(f"# {keyword} {var_name}\n")
    out.append("## function:\n")
    if is_let:
        out.append(f"`{var_name}` 是不可变变量，类型为 `{var_type}`，用于保存常量值或不可变引用。\n")
    else:
        out.append(f"`{var_name}` 是可变变量，类型为 `{var_type}`，用于保存运行时状态或可变数据。\n")
    out.append("## access:\n")
    out.append(f"{var_info.get('access', 'internal')}\n")
    out.append("## usage example:\n")
    snippet = get_lines(source, var_info.get("lineno"), var_info.get("lineno"), max_lines=3)
    out.append("```cangjie")
    out.append(snippet)
    out.append("```\n")


# ------------------------------------------------------------
# 主生成函数
# ------------------------------------------------------------

def generate_summary(repo_path: str, output_file: str):
    """生成代码库摘要文档。"""
    print(f"正在加载仓库: {repo_path}")

    if not os.path.exists(repo_path):
        print(f"错误: 仓库路径不存在: {repo_path}")
        sys.exit(1)

    file_tree = get_file_tree(repo_path)
    files = []

    for item in file_tree:
        path = item.get("path") or item.get("name") or ""
        is_dir = item.get("is_dir", False)
        if path and not is_dir and not should_skip_path(path):
            files.append(path)

    source_files = [p for p in files if is_source_file(p)]
    config_files = [p for p in files if is_config_file(p)]

    print(f"找到 {len(source_files)} 个源码文件，{len(config_files)} 个配置文件")

    # 提取仓库名称
    repo_name = Path(repo_path).name or "CangjieSkills"

    out = []
    write_header(out, repo_name)
    add_library_section(out, repo_name)

    # 配置文件摘要
    print("正在处理配置文件...")
    for path in sorted(config_files):
        source = read_file(repo_path, path)
        if source.strip():
            add_config_section(out, path, source)

    # 源码模块摘要
    print("正在处理源码文件...")
    for path in sorted(source_files):
        source = read_file(repo_path, path)
        if not source.strip():
            continue

        lang = safe_code_block_lang(path)

        # 模块级摘要
        out.append(f"# module {path}\n")
        out.append("## function:\n")
        out.append(make_module_summary(path) + "\n")
        out.append("## usage example:\n")
        out.append(f"```{lang}")
        out.append(f"# source: {path}")
        out.append("```\n")

        # 根据文件类型解析细节
        if path.endswith(".cj"):
            # 仓颉文件解析
            details = parse_cangjie_details(path, source)

            # 包信息
            if details["package"]:
                out.append(f"## package:\n{details['package']}\n")

            # 导入信息
            if details["imports"]:
                out.append("## imports:\n")
                for imp in details["imports"]:
                    out.append(f"- `{imp}`\n")

            # 类摘要
            for class_name, class_info in details["classes"].items():
                add_cangjie_class_section(out, class_name, class_info, source)

                # 方法摘要
                for method_name, method_info in class_info.get("methods", {}).items():
                    add_cangjie_method_section(out, class_name, method_name, method_info, source)

            # 函数摘要
            for func_name, func_info in details["functions"].items():
                add_cangjie_function_section(out, func_name, func_info, source)

            # 变量摘要
            for var_name, var_info in details["variables"].items():
                add_cangjie_variable_section(out, var_name, var_info, source)

        elif path.endswith(".py"):
            # Python 文件解析
            details = parse_python_details(path, source)

            for class_name, info in details["classes"].items():
                out.append(f"# class {class_name}\n")
                out.append("## function:\n")
                out.append(make_class_summary(class_name, path, info.get("doc")) + "\n")
                out.append("## extends:\n")
                out.append(f"{info.get('extends', 'none')}\n")
                out.append("## implements:\n")
                out.append("none\n")
                out.append("## usage example:\n")
                snippet = get_lines(source, info.get("lineno"), info.get("end_lineno"), max_lines=18)
                out.append("```python")
                out.append(snippet)
                out.append("```\n")

                for method_name, method_info in info.get("methods", {}).items():
                    signature = method_info.get("signature") or f"{method_name}(...)"
                    out.append(f"# method {class_name}.{signature}\n")
                    out.append("## function:\n")
                    out.append(make_function_summary(method_name, path, method_info.get("doc")) + "\n")
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

    # 写入文件
    output_path = Path(output_file)
    output_path.write_text("\n".join(out), encoding="utf-8")

    print(f"\n摘要文档已生成: {output_file}")
    print(f"源码文件扫描: {len(source_files)}")
    print(f"配置文件扫描: {len(config_files)}")


# ------------------------------------------------------------
# 入口
# ------------------------------------------------------------

def main():
    if len(sys.argv) < 2:
        print("用法: python generate_cangjie_summary.py <repo_path> [output_file]")
        print("示例: python generate_cangjie_summary.py ./CangjieSkills cangjie_summary.md")
        sys.exit(1)

    repo_path = sys.argv[1]
    output_file = sys.argv[2] if len(sys.argv) > 2 else DEFAULT_OUTPUT

    generate_summary(repo_path, output_file)


if __name__ == "__main__":
    main()
