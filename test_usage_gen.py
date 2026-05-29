"""测试 usage example 生成。"""
from kit.llm_client_factory import create_openai_client

client = create_openai_client(
    api_key="tp-cbs3hu9i4xsldjtuyl82fj2l9uo2py2qe3ulrhc1zzhj8ij5",
    base_url="https://token-plan-cn.xiaomimimo.com/v1"
)

prompt = (
    "请为 Python 方法 CodeSearcher.search_text 生成一个简洁的使用示例代码。\n"
    "方法签名：search_text(self, query, file_pattern='*', options=None)\n"
    "要求：\n"
    "1. 先实例化 CodeSearcher 对象\n"
    "2. 展示如何调用该方法\n"
    "3. 只输出代码，不要解释"
)

resp = client.chat.completions.create(
    model="mimo-v2.5-pro",
    messages=[{"role": "user", "content": "你是一个代码分析专家。\n\n" + prompt}],
    max_tokens=800,
    temperature=0.2,
)
print("Response:", repr(resp.choices[0].message.content))
print("Finish reason:", resp.choices[0].finish_reason)
print("Usage:", resp.usage)
