<!-- source: scripts\test_mcp_tools.py -->

# `scripts\test_mcp_tools.py`

---

## module function:

该模块是项目集成测试脚本，负责验证开发服务器（`LocalDevServerLogic`）的核心功能是否正常工作。它提供仓库管理、代码符号提取、多种搜索模式（文本/正则/AST）和Context7文档研究等关键能力的测试接口，通过实例化服务器对象并依次调用对应方法、输出测试结果的方式进行验证。

## module usage example:

```python
from pathlib import Path
from kit.mcp.dev_server import LocalDevServerLogic

server = LocalDevServerLogic()
repo_path = str(Path.cwd())
repo_id = server.open_repository(repo_path)
print(f"Repository ID: {repo_id}")
file_tree = server.get_file_tree(repo_id)
print("File Tree:", file_tree)
```

# func `test_repository_management(server)`

## function:

该函数的核心功能是通过 `server` 对象打开当前目录作为仓库并获取其文件树结构，用于验证仓库管理接口的基本可用性。它接收一个代表 MCP 服务器实例的参数 `server`，并返回标识所打开仓库的唯一字符串 `repo_id`。在项目中，该函数通常作为集成测试的一部分，用于在测试环境中验证服务器能否正确处理仓库打开和文件遍历请求。

## usage example:

```python
def test_repository_management(server):
    """Test repository opening and file tree."""
    print("\n📁 Testing Repository Management...")

    repo_path = str(Path.cwd())
    repo_id = server.open_repository(repo_path)
    print(f"  ✓ Opened repository: {repo_id}")

    tree = server.get_file_tree(repo_id)
    print(f"  ✓ File tree contains {len(tree)} items")

    return repo_id
```

# func `test_symbol_extraction(server, repo_id)`

## function:

此函数是一个单元测试，用于验证从指定 Python 文件中提取代码符号（如类和函数）的功能。其核心流程是调用 `server.extract_symbols` 方法提取符号，随后统计并打印提取到的符号总数，以及其中类和函数各自的数量。

该函数接受两个输入参数：`server` 是提供 `extract_symbols` 方法的服务对象，`repo_id` 用于标识目标代码仓库。函数自身不返回任何值（返回 `None`），其作用通过控制台打印的测试结果来体现。

在项目中，它通常作为测试套件的一部分，在开发或集成测试阶段运行，用于定期检查代码分析工具链中符号提取功能的正确性和稳定性。

## usage example:

```python
from your_module import test_symbol_extraction
from unittest.mock import MagicMock

server = MagicMock()
server.extract_symbols.return_value = [{"type": "class", "name": "Test"}, {"type": "function", "name": "main"}]
repo_id = "example-repo"
result = test_symbol_extraction(server, repo_id)
print(f"符号提取完成，返回结果: {result}")
```

# func `test_code_search(server, repo_id)`

## function:

`test_code_search` 函数的核心功能是通过指定的代码搜索服务（`server`）对目标仓库（`repo_id`）执行两种搜索测试：普通文本搜索和基于正则表达式的模式搜索，并打印匹配结果的数量，以验证搜索能力。  
输入参数 `server` 是一个提供 `search_code` 和 `grep_code` 方法的服务对象，`repo_id` 用于标识待搜索的代码仓库；该函数没有显式返回值，其输出是控制台打印的测试结果。  
它通常在项目集成测试或调试阶段使用，用于验证代码搜索服务的功能是否正常工作，例如确保文本检索和正则匹配能按预期返回结果。

## usage example:

```python
from code_search_server import CodeSearchServer

server = CodeSearchServer(base_url="https://example.com/api", token="your_token")
repo_id = "github/user/repo"
test_code_search(server, repo_id)
```

# func `test_ast_search(server, repo_id)`

## function:

该函数是一个测试函数，通过调用 `server.grep_ast` 方法，使用简单模式和模式模式分别搜索代码库中的异步函数、try 块和类定义，并打印搜索结果数量以验证 AST 模式匹配功能。输入参数 `server` 是提供 AST 搜索功能的服务器对象，`repo_id` 是目标仓库标识；函数无返回值，主要输出为打印的测试信息。在项目的测试流程中，用于自动化测试 AST 搜索工具的准确性和功能完整性。

## usage example:

```python
def test_ast_search(server, repo_id):
    """Test AST-based pattern matching."""
    print("\n🌳 Testing AST Search...")

    # Find async functions
    async_funcs = server.grep_ast(repo_id, "async def", mode="simple")
    print(f"  ✓ Found {len(async_funcs)} async functions")

    # Find try blocks
    try_blocks = server.grep_ast(repo_id, '{"type": "try_statement"}', mode="pattern")
    print(f"  ✓ Found {len(try_blocks)} try blocks")

    # Find class definitions
    classes = server.grep_ast(repo_id, "class", mode="simple")
    print(f"  ✓ Found {len(classes)} class definitions")
```

# func `test_context7_research(server)`

## function:

该函数的核心功能是调用 `server.deep_research_package` 方法，针对“requests”包执行“authentication”主题的深度文档研究，并打印研究状态、执行时间、文档来源数量和置信度等结果。输入参数为 `server`（通常代表一个提供MCP工具的服务对象），函数无显式返回值，主要通过打印输出测试结果。它在项目中典型用于验证Context7文档研究工具集成功能是否正常工作，确保文档聚合与查询流程符合预期。

## usage example:

```python
def test_context7_research(server):
    """Test Context7 documentation research."""
    print("\n📚 Testing Context7 Documentation Research...")

    # Test with a popular package
    result = server.deep_research_package("requests", query="authentication")

    print(f"  ✓ Researched package: {result['package']}")
    print(f"  ✓ Execution time: {result['execution_time']:.2f}s")

    if isinstance(result["documentation"], dict):
        if "context7_status" in result["documentation"]:
            status = result["documentation"]["context7_status"]
            print(f"  ✓ Context7 status: {status}")

            if status == "success":
```

# func `main()`

## function:

该函数是一个测试运行器，核心逻辑是初始化一个本地开发服务器，然后依次执行仓库管理、符号提取、代码搜索、AST搜索和上下文研究等多个测试用例，并根据执行结果输出成功或失败信息。它无输入参数，返回整数0表示所有测试通过，返回1或遇到异常则表示测试失败。典型使用场景是在项目开发过程中作为手动测试脚本，用于验证 `Kit-Dev-MCP` 工具集的各项功能是否正常。

## usage example:

```python
def main():
    """Run all tests."""
    print("=" * 60)
    print("🚀 Kit-Dev-MCP Manual Test Suite")
    print("=" * 60)

    # Initialize server
    server = LocalDevServerLogic()

    try:
        # Run tests
        repo_id = test_repository_management(server)
        test_symbol_extraction(server, repo_id)
        test_code_search(server, repo_id)
        test_ast_search(server, repo_id)
        test_context7_research(server)
```
