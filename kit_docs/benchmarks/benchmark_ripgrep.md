<!-- source: benchmarks\benchmark_ripgrep.py -->

# `benchmarks\benchmark_ripgrep.py`

---

## module function:

该模块是项目中用于性能基准测试的工具，专门对比 ripgrep 和 Python 原生实现的代码搜索性能。它通过封装可配置的测试用例（如简单搜索、正则匹配、上下文搜索等），动态切换搜索后端并精确计时，为评估 `CodeSearcher` 类的搜索效率提供标准化测试框架。核心实现依赖运行时修改对象方法以模拟不同搜索路径，并采用多次迭代取平均值的基准测试方法。

## module usage example:

```python
# source: benchmarks\benchmark_ripgrep.py
```

# func `benchmark_search(searcher, query, file_pattern, options, method = 'auto')`

## function:

该函数用于基准测试单个搜索操作，通过调整搜索器的内部方法来强制使用指定搜索后端（ripgrep 或 Python），然后执行搜索并测量耗时和结果数量。输入参数包括搜索器实例、查询字符串、文件模式、搜索选项和搜索方法（默认为自动），返回一个元组包含搜索耗时（秒）和结果数量。典型使用场景是在项目中通过切换搜索后端来比较不同方法的性能，以优化搜索效率。

## usage example:

```python
import time
from search_module import CodeSearcher, benchmark_search

searcher = CodeSearcher()
elapsed = benchmark_search(searcher, "示例查询", "*.py", options={"case_sensitive": False}, method='auto')
print(f"基准测试完成，耗时: {elapsed:.2f} 秒")
```

# func `main()`

## function:

这个函数是一个用于运行ripgrep代码搜索工具性能基准测试的脚本，它会依次执行不同查询条件（如简单关键词、正则表达式）和文件类型的搜索测试，以评估搜索效率。函数无输入参数，也不返回值，而是通过打印语句输出测试配置和执行结果。该函数适用于项目开发中验证或对比代码搜索功能（如查找函数定义、特定关键词）在不同场景下的性能表现。

## usage example:

```python
def main():
    repo_path = "/Users/tnm/kit"
    searcher = CodeSearcher(repo_path)

    # Check availability
    has_rg = searcher._has_ripgrep()
    print(f"Ripgrep available: {has_rg}")
    print(f"Repository: {repo_path}")
    print("=" * 80)

    benchmarks = [
        {
            "name": "Simple search (common term)",
            "query": "def ",
            "pattern": "*.py",
            "options": SearchOptions(),
```
