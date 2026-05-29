"""测试精简 prompt 的 usage example 生成。"""
from kit.llm_client_factory import create_openai_client

client = create_openai_client(
    api_key="tp-cbs3hu9i4xsldjtuyl82fj2l9uo2py2qe3ulrhc1zzhj8ij5",
    base_url="https://token-plan-cn.xiaomimimo.com/v1"
)

# 模拟 make_usage_example 的 prompt
code_hint = """    def search_text(
        self, query: str, file_pattern: str = "*.py", options: Optional[SearchOptions] = None
    ) -> List[Dict[str, Any]]:"""

prompt = (
    "请为 Python 方法 search_text 生成一个简洁的使用示例代码。\n"
    "签名：`search_text(self, query, file_pattern='*', options=None)`\n"
    "函数定义参考：\n```\n" + code_hint + "\n```\n"
    "要求：展示如何调用该函数，只输出代码，不要解释。"
)

print("Prompt:")
print(prompt)
print()

resp = client.chat.completions.create(
    model="mimo-v2.5-pro",
    messages=[{"role": "user", "content": "你是一个代码分析专家。\n\n" + prompt}],
    max_tokens=800,
    temperature=0.2,
)
print("Response:", repr(resp.choices[0].message.content))
print("Finish reason:", resp.choices[0].finish_reason)
