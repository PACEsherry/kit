"""测试版：选 2 个小文件，验证 LLM 摘要 + usage example 效果。"""
import sys
import time
from pathlib import Path

from kit import Repository
from kit.llm_client_factory import create_openai_client

REPO_ROOT = Path(__file__).resolve().parent / "kit"

LLM_API_KEY = "tp-cbs3hu9i4xsldjtuyl82fj2l9uo2py2qe3ulrhc1zzhj8ij5"
LLM_BASE_URL = "https://token-plan-cn.xiaomimimo.com/v1"
LLM_MODEL = "mimo-v2.5-pro"

_client = create_openai_client(api_key=LLM_API_KEY, base_url=LLM_BASE_URL)


def llm_summarize(prompt: str) -> str:
    try:
        resp = _client.chat.completions.create(
            model=LLM_MODEL,
            messages=[
                {"role": "user", "content": (
                    "你是一个代码分析专家。请用简洁的中文回答，"
                    "只输出内容本身，不要加任何前缀或解释。\n\n" + prompt
                )},
            ],
            max_tokens=800,
            temperature=0.2,
        )
        content = resp.choices[0].message.content
        return content.strip() if content else ""
    except Exception as e:
        print(f"  Error: {e}")
        return ""


def make_module_summary(path: str, source: str) -> str:
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
    return llm_summarize(prompt)


def make_function_summary(name: str, path: str, source: str, doc: str | None = None) -> str:
    doc_hint = f"\n\n该函数已有 docstring：{doc}" if doc else ""
    prompt = (
        f"请分析以下 Python 函数/方法 `{name}` 的代码（来自文件 `{path}`）{doc_hint}。\n"
        f"用 2-3 句中文详细说明：\n"
        f"1. 这个函数的核心功能和处理逻辑\n"
        f"2. 它的输入参数和返回值的含义\n"
        f"3. 它在项目中的典型使用场景\n\n"
        f"```\n{source}\n```"
    )
    return llm_summarize(prompt)


def make_usage_example(name: str, kind: str, path: str, source: str, signature: str = "") -> str:
    if kind == "module":
        prompt = (
            f"请为 Python 模块 `{path}` 生成一个简洁的使用示例代码。\n"
            f"要求：\n"
            f"1. 展示如何导入和使用该模块的主要功能\n"
            f"2. 代码要可以直接运行\n"
            f"3. 只输出代码，不要解释\n\n"
            f"模块内容（前 80 行）：\n```\n{source}\n```"
        )
    elif kind == "function":
        prompt = (
            f"请为 Python 函数 `{name}` （来自 `{path}`）生成一个简洁的使用示例代码。\n"
            f"{f'函数签名：`{signature}`' if signature else ''}\n"
            f"要求：\n"
            f"1. 展示如何调用该函数，包括参数传入和返回值处理\n"
            f"2. 代码要可以直接运行\n"
            f"3. 只输出代码，不要解释\n\n"
            f"函数定义：\n```\n{source}\n```"
        )
    else:
        return ""

    result = llm_summarize(prompt)
    if not result:
        return ""
    result = result.strip()
    if result.startswith("```python"):
        result = result[len("```python"):].strip()
    if result.startswith("```"):
        result = result[3:].strip()
    if result.endswith("```"):
        result = result[:-3].strip()
    return result


def main():
    repo = Repository(str(REPO_ROOT))
    file_tree = repo.get_file_tree()

    # 选 2 个有代表性的小文件
    targets = [
        "src\\kit\\code_searcher.py",
        "src\\kit\\context_extractor.py",
    ]

    for path in targets:
        source = repo.get_file_content(path)
        if not source.strip():
            print(f"[SKIP] {path} - empty")
            continue

        print(f"\n{'='*60}")
        print(f"[FILE] {path}")
        print(f"{'='*60}")

        # 模块摘要
        print(f"\n[LLM] 生成模块摘要...")
        summary = make_module_summary(path, source)
        print(f"\n## function:\n{summary}")

        # 模块 usage example
        print(f"\n[LLM] 生成模块使用示例...")
        usage = make_usage_example("", "module", path, source)
        print(f"\n## usage example:\n```python\n{usage}\n```")

        # 找第一个函数
        import ast
        try:
            tree = ast.parse(source)
            for node in tree.body:
                if isinstance(node, (ast.FunctionDef, ast.AsyncFunctionDef)):
                    func_name = node.name
                    if func_name.startswith("_"):
                        continue
                    lineno = node.lineno
                    end_lineno = getattr(node, "end_lineno", lineno + 20)
                    func_code = "\n".join(source.splitlines()[lineno-1:end_lineno])
                    doc = ast.get_docstring(node)

                    print(f"\n{'-'*40}")
                    print(f"[FUNC] {func_name}")
                    print(f"{'-'*40}")

                    print(f"\n[LLM] 生成函数摘要...")
                    func_summary = make_function_summary(func_name, path, func_code, doc)
                    print(f"\n## function:\n{func_summary}")

                    print(f"\n[LLM] 生成函数使用示例...")
                    sig = f"{func_name}(...)"
                    func_usage = make_usage_example(func_name, "function", path, func_code, sig)
                    print(f"\n## usage example:\n```python\n{func_usage}\n```")

                    break  # 只测试第一个函数
        except SyntaxError:
            pass

        time.sleep(1)


if __name__ == "__main__":
    main()
