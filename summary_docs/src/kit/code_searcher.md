<!-- source: src/kit/code_searcher.py -->

# `src/kit/code_searcher.py`

---

## module function:

该模块是一个代码搜索工具，核心职责是在代码仓库中执行文本和正则表达式搜索。主要能力包括支持多语言搜索、文件模式匹配、返回匹配详情，并集成.gitignore规则和ripgrep工具进行高效过滤和搜索。关键实现方式是通过加载.gitignore配置、检查ripgrep可用性、解析JSON输出来提取匹配结果和上下文。

## module usage example:

```python
from src.kit.code_searcher import CodeSearcher, SearchOptions

searcher = CodeSearcher('/path/to/your/repo')
options = SearchOptions(case_sensitive=False, context_lines_before=2, context_lines_after=2)
results = searcher.search_text('function_name', '*.py', options)
for result in results:
    print(f"File: {result['file']}, Line: {result['line_number']}, Content: {result['line']}")
```

# class `SearchOptions`

## function:

`SearchOptions` 类的核心职责是封装文本搜索的配置选项。它封装了搜索行为的四个关键参数：是否区分大小写、匹配结果前后的上下文行数，以及是否遵循 `.gitignore` 规则。典型使用场景是在代码编辑器、文本搜索工具或文件检索函数中，实例化该类以定制化搜索策略。

## extends:

none

## usage example:

```python

```

# class `CodeSearcher`

## function:

`CodeSearcher`类的核心职责是基于指定的代码仓库路径，执行文本或正则表达式的代码搜索，并遵循.gitignore规则。它封装了仓库路径初始化、.gitignore规则加载与文件过滤逻辑，以及检查外部工具ripgrep是否可用的行为。该类典型使用场景是作为代码分析或检索工具的核心模块，用于在软件开发、代码审查或静态分析中快速定位特定代码片段。

## extends:

none

## usage example:

```python
from pathlib import Path
from kit.code_searcher import CodeSearcher, SearchOptions

searcher = CodeSearcher('/path/to/your/repo')
text_results = searcher.search_text('def main', '*.py', SearchOptions())
print(f"Found {len(text_results)} text matches.")

regex_results = searcher.search_regex(r'class\s+\w+', '*.{py,js}')
for match in regex_results[:3]:
    print(f"File: {match['file']}, Line: {match['line']}, Match: {match['match']}")

# Check if a specific file is ignored by .gitignore
file_path = Path('some_file.py')
print(f"Ignore '{file_path}': {searcher._should_ignore(file_path)}")
```

# method `CodeSearcher.__init__(repo_path: str) -> None`

## function:

该方法用于初始化 `CodeSearcher` 对象，核心功能是设置目标代码仓库的路径并加载 `.gitignore` 配置文件以确保后续操作能遵循忽略规则。输入为一个表示仓库路径的字符串，输出为一个已完成配置的 `CodeSearcher` 实例。典型使用场景是在对 Git 管理的代码仓库进行结构化搜索或分析之前，通过此构造函数创建必要的搜索上下文。

## usage example:

```python
from pathlib import Path
from code_searcher import CodeSearcher

repo_path = "/home/user/projects/my_repository"
searcher = CodeSearcher(repo_path)
print(f"CodeSearcher initialized with path: {searcher.repo_path}")
```

# method `CodeSearcher._load_gitignore()`

## function:

该方法从仓库根目录加载 `.gitignore` 文件，解析其规则为 `PathSpec` 对象；输入依赖 `self.repo_path`，输出为 `PathSpec` 对象或 `None`。典型使用场景是代码分析工具中基于规则匹配并排除忽略文件路径。

## usage example:

```python
import pathspec
from code_searcher import CodeSearcher

searcher = CodeSearcher("/path/to/repository")
gitignore_spec = searcher._load_gitignore()
print(gitignore_spec)
```

# method `CodeSearcher._should_ignore(file: Path) -> bool`

## function:

该方法根据.gitignore规则判断文件是否应该被忽略，输入是文件路径（Path对象），输出是布尔值，典型使用场景是在代码仓库管理中自动过滤被忽略的文件。

## usage example:

```python
from pathlib import Path

# 假设 CodeSearcher 类已导入或定义
searcher = CodeSearcher("/path/to/repo")  # 实例化，传入仓库路径
file_to_check = Path("/path/to/repo/.gitignore")  # 定义要检查的文件路径
result = searcher._should_ignore(file_to_check)  # 调用方法
print(result)  # 输出布尔值结果
```

# method `CodeSearcher._has_ripgrep() -> bool`

## function:

该方法用于检查系统中是否安装了 ripgrep 命令行工具。它通过尝试执行 `rg --version` 命令来判断，成功则返回 `True`，若命令不存在、执行失败或超时则返回 `False`。典型场景是在使用依赖 ripgrep 功能的代码（如高效文件搜索）前进行环境检测。

## usage example:

```python

```

# method `CodeSearcher._is_git_repository() -> bool`

## function:

该方法通过检查 `repo_path` 路径下是否存在 `.git` 目录来判断是否为 Git 仓库；它依赖 `self.repo_path` 作为输入路径，返回布尔值表示结果；典型场景是在版本控制操作前验证仓库路径的有效性，避免误操作。

## usage example:

```python
import pathlib
from code_searcher import CodeSearcher

repo_path = pathlib.Path("/path/to/repository")
searcher = CodeSearcher(repo_path)
is_git_repo = searcher._is_git_repository()
print(is_git_repo)
```

# method `CodeSearcher._parse_ripgrep_json_messages(stdout: str) -> List[Dict[str, Any]]`

## function:

该方法用于解析ripgrep工具以JSON格式输出的搜索结果，将每行JSON数据转换为字典并汇总成列表。输入为包含多行JSON字符串的stdout文本，输出为由字典组成的列表，每个字典代表一条匹配记录。典型使用场景是在集成ripgrep的代码搜索工具中，处理结构化搜索结果以便后续分析或展示。

## usage example:

```python
from code_searcher import CodeSearcher
import json

searcher = CodeSearcher()
stdout_sample = '{"type":"match","data":{"path":{"text":"file1.txt"},"lines":{"text":"content1"}}}\n{"type":"match","data":{"path":{"text":"file2.txt"}}}'
messages = searcher._parse_ripgrep_json_messages(stdout_sample)
print(messages)
```

# method `CodeSearcher._extract_context_for_match(messages: List[Dict[str, Any]], match_index: int, file_path: str, match_line_number: int, options: SearchOptions) -> tuple[List[str], List[str]]`

## function:

核心功能是从 ripgrep 消息列表中提取指定匹配项前后的上下文行，通过遍历消息序列并检查类型、文件路径和行号来收集相关文本。输入包括消息列表、匹配索引、文件路径、匹配行号和搜索选项（指定上下文行数），输出为包含前上下文和后上下文行列表的元组。典型使用场景是在文本搜索工具中，为搜索结果（如代码匹配）显示周围的上下文内容，帮助用户更好地理解匹配的上下文环境。

## usage example:

```python
from typing import List, Dict, Any, Tuple

from code_searcher import CodeSearcher, SearchOptions

searcher = CodeSearcher()
messages = [{"type": "match", "data": "example"}]
match_index = 0
file_path = "example.py"
match_line_number = 10
options = SearchOptions(context_lines_before=3, context_lines_after=2)

context_before, context_after = searcher._extract_context_for_match(messages, match_index, file_path, match_line_number, options)
```

# method `CodeSearcher._search_with_ripgrep(query: str, file_pattern: str, options: SearchOptions) -> Optional[List[Dict[str, Any]]]`

## function:



## usage example:

```python
from code_searcher import CodeSearcher, SearchOptions

searcher = CodeSearcher()
options = SearchOptions(use_gitignore=True, case_sensitive=False)
result = searcher._search_with_ripgrep("search term", "*.txt", options)
print(result)
```

# method `CodeSearcher.search_text(query: str, file_pattern: str = '*.py', options: Optional[SearchOptions] = None) -> List[Dict[str, Any]]`

## function:

该方法基于正则表达式在文件中进行文本搜索，优先使用 ripgrep 以实现高性能，不可用时回退到 Python 实现。输入为查询模式、文件匹配模式（默认为 Python 文件）和可选配置；输出为结构化列表，包含匹配文件的路径、行号、匹配行及上下文。典型场景包括代码库中的模式搜索、日志分析或批量文件内容检索。

## usage example:

```python
from code_searcher import CodeSearcher

searcher = CodeSearcher
```
