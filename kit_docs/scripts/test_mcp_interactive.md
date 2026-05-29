<!-- source: scripts\test_mcp_interactive.py -->

# `scripts\test_mcp_interactive.py`

---

## module function:

该模块是 `kit-dev-mcp` 功能的交互式集成测试脚本，在项目中扮演验证开发服务器核心接口的角色。它提供的主要能力包括测试基于包的深度研究、AST 模式搜索以及代码文本搜索功能。关键实现方式是实例化 `LocalDevServerLogic` 服务器逻辑类，分别调用其 `deep_research_package`、`grep_ast` 和 `search_code` 方法，并通过打印执行时间与结果摘要来验证功能的正确性与性能。

## module usage example:

```python
import asyncio
from pathlib import Path
from kit.mcp.dev_server import LocalDevServerLogic

server = LocalDevServerLogic()
repo_path = Path('/path/to/your/project')
packages = ['requests', 'flask']
result = asyncio.run(server.deep_research(repo_path, packages))
print(result)
summary = server.get_research_summary()
print(summary)
```

# func `test_deep_research()`

## function:

这个函数用于测试深度研究功能，通过调用 LocalDevServerLogic 的 deep_research_package 方法，对指定包（如 requests）和查询（如 authentication）进行深度研究，并输出结果类型、耗时等关键信息以验证功能。该函数没有输入参数，返回值为 None，主要通过打印输出展示测试结果，用于确认深度研究功能是否正常工作。在项目中，它常用于开发和测试阶段，以确保对真实 Python 包的深度研究能力正确无误。

## usage example:

```python
def test_deep_research():
    """Test deep research with real packages."""
    print("\n📚 Testing Deep Research...")

    server = LocalDevServerLogic()

    # Test with just one package to be faster
    package = "requests"
    query = "authentication"

    print(f"\n  Testing {package}...")
    start = time.time()

    try:
        result = server.deep_research_package(package, query)
        elapsed = time.time() - start
```

# func `test_ast_patterns()`

## function:

该函数用于测试不同的AST搜索模式，通过创建本地开发服务器逻辑实例并打开当前目录的代码仓库，然后使用预定义的模式列表（如查找异步函数、类定义、try块和TODO注释）调用grep_ast方法进行搜索，并打印结果数量和预览。函数没有输入参数，直接运行测试并返回布尔值True，表示测试执行成功。在项目中，它通常作为单元测试或集成测试的一部分，用于验证代码分析工具中的AST模式搜索功能是否正确工作。

## usage example:

```python
def test_ast_patterns():
    """Test various AST search patterns."""
    print("\n🌳 Testing AST Pattern Search...")

    server = LocalDevServerLogic()
    repo_id = server.open_repository(str(Path.cwd()))

    patterns = [
        ("async def", "simple", "Find async functions"),
        ('{"type": "class_definition"}', "pattern", "Find all classes"),
        ('{"type": "try_statement"}', "pattern", "Find try blocks"),
        ("TODO", "simple", "Find TODO comments"),
    ]

    for pattern, mode, description in patterns:
        print(f"\n  {description}:")
```

# func `test_code_search()`

## function:

该函数通过实例化 LocalDevServerLogic 并打开当前代码仓库，执行文本搜索和正则表达式搜索（如模式匹配），打印查询结果以验证代码搜索功能的正确性。它没有输入参数且无返回值，主要执行测试操作并输出结果。典型使用场景是在项目测试或调试过程中，用于确保本地开发服务器的代码搜索能力正常工作。

## usage example:

```python
def test_code_search():
    """Test various code search capabilities."""
    print("\n🔎 Testing Code Search...")

    server = LocalDevServerLogic()
    repo_id = server.open_repository(str(Path.cwd()))

    # Text search
    queries = ["ThreadPoolExecutor", "async def", "import json", "Context7"]

    for query in queries:
        results = server.search_code(repo_id, query)
        print(f"  ✓ '{query}': {len(results)} matches")

        # Show first result
        if results:
```

# func `async main()`

## function:

该函数的核心功能是运行所有交互式测试，处理逻辑是依次调用 `test_code_search`、`test_ast_patterns` 和 `test_deep_research` 三个测试函数，并根据执行情况返回状态码。函数没有输入参数，返回值是一个整数，0 表示测试全部成功，1 表示测试过程中出现异常。在项目中，它通常作为交互式测试套件的入口点，用于自动化测试或开发过程中验证代码的交互功能。

## usage example:

```python
import asyncio

async def run():
    try:
        await main()
    except Exception as e:
        print(f"调用失败: {e}")

asyncio.run(run())
```
