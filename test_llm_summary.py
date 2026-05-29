"""测试版：只处理前 3 个源码文件，验证 LLM 摘要流程。"""
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
                {"role": "user", "content": "你是一个代码分析专家。请用清晰明了的中文回答，只输出摘要内容本身，描述清楚代码段到底在干什么，是什么意思，不要加任何前缀、解释或 markdown 格式。\n\n" + prompt},
            ],
            max_tokens=800,
            temperature=0.2,
        )
        content = resp.choices[0].message.content
        return content.strip() if content else ""
    except Exception as e:
        print(f"  Error: {e}")
        return ""

def main():
    repo = Repository(str(REPO_ROOT))
    file_tree = repo.get_file_tree()

    py_files = []
    for item in file_tree:
        path = item.get("path") or ""
        if path.endswith(".py") and "test" not in path.lower() and "__pycache__" not in path:
            py_files.append(path)

    print(f"Found {len(py_files)} Python files, testing first 3...\n")

    for path in py_files[:3]:
        source = repo.get_file_content(path)
        if not source.strip():
            continue

        snippet = "\n".join(source.splitlines()[:40])
        prompt = f"以下是文件 `{path}` 的前 40 行代码。请用一句简洁的中文说明这个模块的核心职责（不超过 30 字）。\n\n```\n{snippet}\n```"

        print(f"[LLM] {path}...")
        summary = llm_summarize(prompt)
        print(f"  -> {summary}\n")
        time.sleep(0.5)

if __name__ == "__main__":
    main()
