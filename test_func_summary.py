"""测试函数级摘要和 usage example。"""
from kit import Repository
from kit.llm_client_factory import create_openai_client
from pathlib import Path
import ast

REPO_ROOT = Path("D:/project/kit/kit")
LLM_API_KEY = "tp-cbs3hu9i4xsldjtuyl82fj2l9uo2py2qe3ulrhc1zzhj8ij5"
LLM_BASE_URL = "https://token-plan-cn.xiaomimimo.com/v1"
LLM_MODEL = "mimo-v2.5-pro"
_client = create_openai_client(api_key=LLM_API_KEY, base_url=LLM_BASE_URL)


def llm_summarize(prompt):
    try:
        resp = _client.chat.completions.create(
            model=LLM_MODEL,
            messages=[{"role": "user", "content": "你是一个代码分析专家。请用简洁的中文回答，只输出内容本身，不要加任何前缀或解释。\n\n" + prompt}],
            max_tokens=800,
            temperature=0.2,
        )
        content = resp.choices[0].message.content
        return content.strip() if content else ""
    except Exception as e:
        return f"Error: {e}"


def clean_code_block(text):
    text = text.strip()
    if text.startswith("```python"):
        text = text[len("```python"):].strip()
    if text.startswith("```"):
        text = text[3:].strip()
    if text.endswith("```"):
        text = text[:-3].strip()
    return text


repo = Repository(str(REPO_ROOT))
print("Repository loaded")
source = repo.get_file_content("src/kit/code_searcher.py")
print(f"File loaded, length: {len(source)}")

tree = ast.parse(source)
print("AST parsed")
found = False
for node in tree.body:
    if isinstance(node, ast.ClassDef) and node.name == "CodeSearcher":
        print(f"Found class CodeSearcher at line {node.lineno}")
        for item in node.body:
            if isinstance(item, (ast.FunctionDef, ast.AsyncFunctionDef)) and item.name == "search_text":
                lineno = item.lineno
                end_lineno = getattr(item, "end_lineno", lineno + 30)
                func_code = "\n".join(source.splitlines()[lineno-1:end_lineno])
                doc = ast.get_docstring(item)
                print(f"Found search_text at line {lineno}-{end_lineno}")
                found = True

                print("=" * 60)
                print("search_text 方法代码预览：")
                print("=" * 60)
                print(func_code[:600])
                print()

                print("=" * 60)
                print("[LLM] 方法摘要...")
                print("=" * 60)
                doc_hint = f"\n\n该方法已有 docstring：{doc}" if doc else ""
                prompt1 = (
                    f"请分析以下 Python 方法 search_text 的代码{doc_hint}。\n"
                    f"用 2-3 句中文详细说明：\n"
                    f"1. 这个方法的核心功能和处理逻辑\n"
                    f"2. 它的输入参数和返回值的含义\n"
                    f"3. 它在项目中的典型使用场景\n\n"
                    f"```\n{func_code}\n```"
                )
                result1 = llm_summarize(prompt1)
                print(result1)
                print()

                print("=" * 60)
                print("[LLM] 使用示例...")
                print("=" * 60)
                prompt2 = (
                    f"请为 Python 方法 CodeSearcher.search_text 生成一个简洁的使用示例代码。\n"
                    f"方法签名：search_text(self, query, file_pattern='*', options=None)\n"
                    f"要求：\n"
                    f"1. 先实例化 CodeSearcher 对象\n"
                    f"2. 展示如何调用该方法，包括参数传入和返回值处理\n"
                    f"3. 代码要可以直接运行\n"
                    f"4. 只输出代码，不要解释\n\n"
                    f"方法定义：\n```\n{func_code}\n```"
                )
                raw_usage = llm_summarize(prompt2)
                print(f"[DEBUG] raw response length: {len(raw_usage)}")
                print(f"[DEBUG] raw response repr: {repr(raw_usage[:200])}")
                usage = clean_code_block(raw_usage)
                print(usage)
                break
    if found:
        break
