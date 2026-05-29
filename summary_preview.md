# Summary Preview

> 由大模型 mimo-v2.5-pro 自动生成，展示摘要 + 使用示例效果。


---

# module `src/kit/code_searcher.py`

## function:

该模块是一个代码搜索器，核心职责是在代码仓库中执行文本和正则表达式搜索。主要能力包括支持多语言、文件模式过滤以及返回匹配的详细信息。关键实现方式是通过集成ripgrep工具进行高效搜索，结合.gitignore规则忽略无关文件，并解析JSON输出以提取匹配上下文。

## usage example:

```python

```

# class `SearchOptions`

## function:

SearchOptions类的核心职责是封装文本搜索的配置选项，用于控制搜索行为。它封装了四个属性：case_sensitive（是否区分大小写）、context_lines_before和context_lines_after（显示匹配行的上下文行数）、use_gitignore（是否忽略.gitignore规则）。典型使用场景包括在代码编辑器、IDE或命令行搜索工具中自定义搜索设置，如调整大小写敏感度或显示上下文内容。

## extends:

none

## usage example:

```python
# 实例化SearchOptions
options = SearchOptions()

# 使用默认配置
print(f"大小写敏感: {options.case_sensitive}")
print(f"上下文行数: {options.context_lines_before}行, {options.context_lines_after}行")

# 自定义配置
options = SearchOptions(
    case_sensitive=False,
    context_lines_before=3,
    context_lines_after=3,
    use_gitignore=False
)

# 访问自定义配置
print(f"忽略大小写: {not options.case_sensitive}")
print(f"上下文窗口: 前{options.context_lines_before}行，后{options.context_lines_after}行")
print(f"遵循.gitignore: {options.use_gitignore}")
```

# class `CodeSearcher`

## function:

核心职责是提供跨代码仓库的文本和正则表达式搜索，支持多语言、文件模式并返回匹配详情。封装了仓库路径、.gitignore规则以及相关的加载和检查方法，以确保搜索时自动忽略指定文件。典型使用场景是在代码库中快速查找特定代码片段或模式，同时遵守版本控制规则。

## extends:

none

## usage example:

```python

```

# method `CodeSearcher.search_text(query: str, file_pattern: str = '*.py', options: Optional[SearchOptions] = None) -> List[Dict[str, Any]]`

## function:

该方法的核心功能是在符合指定文件模式（如“*.py”）的文件中搜索正则表达式模式，并优先使用 ripgrep 以获得极高性能，否则回退到纯 Python 实现。输入包括搜索模式、文件模式（默认Python文件）及可选配置，输出为一个包含匹配结果（文件路径、行号、匹配行及其上下文）的列表。典型使用场景是在代码库中快速查找特定代码片段或错误信息，特别适用于大型项目。

## usage example:

```python
from typing import List, Dict, Any

# 假设已有一个 Searcher 类的实例
searcher = Searcher()

# 基础使用：在 Python 文件中搜索函数定义
results: List[Dict[str, Any]] = searcher.search_text(query=r"def \w+\(")

# 带文件模式：在所有 .txt 文件中搜索文本
txt_results = searcher.search_text(query="error", file_pattern="*.txt")

# 使用选项
from search_options import SearchOptions
options = SearchOptions(max_results=10, context_lines=2)
options_results = searcher.search_text(query="import", options=options)

# 处理结果
for match in results:
    print(f"文件: {match['file']}, 行 {match['line_number']}: {match['line'].strip()}")
```


---

# module `src/kit/repo_mapper.py`

## function:

该模块是代码仓库映射器，负责扫描仓库结构并提取代码符号。它支持增量扫描和多语言符号提取，通过tree-sitter查询实现跨语言解析。关键实现使用Rust加速的文件遍历器处理.gitignore规则，并结合tree-sitter进行高效符号提取。

## usage example:

```python
from src.kit.repo_mapper import RepoMapper

# 示例：扫描仓库并获取文件树
repo_path = "/path/to/your/repository"
mapper = RepoMapper(repo_path)

# 获取文件树（假设公共方法存在，如 get_file_tree 或 file_tree 属性）
file_tree = mapper.get_file_tree()

# 输出文件树信息
for entry in file_tree:
    print(f"File: {entry['path']}, Modified: {entry.get('mtime', 'N/A')}")
```

# class `RepoMapper`

## function:

`RepoMapper` 的核心职责是扫描代码仓库，构建文件树并提取各文件中的代码符号（如函数、类）。它封装了仓库路径、符号映射（记录文件修改时间和符号）、文件树结构以及 `.gitignore` 规则，并通过缓存路径字符串和增量扫描机制提升性能。典型使用场景包括代码搜索、代码导航或静态分析工具中，用于快速获取项目结构及符号定义位置。

## extends:

none

## usage example:

```python
from pathlib import Path
import os

# 假设 RepoMapper 类已定义
# 实例化 RepoMapper
mapper = RepoMapper("/path/to/your/repo")

# 调用主要方法：获取给定相对路径的子路径列表
relative_path = "src/utils"
subpaths = mapper._subpaths_for_path(relative_path)

# 输出子路径
print(subpaths)

# 另一个示例：检查文件是否应忽略
test_file = Path("/path/to/your/repo/.git/config")
should_ignore = mapper._should_ignore(test_file)
print(f"Ignore {test_file}: {should_ignore}")
```

# method `RepoMapper.get_file_tree(subpath: Optional[str] = None) -> List[Dict[str, Any]]`

## function:

该方法用于检索代码仓库或指定子目录的文件树结构，返回包含文件路径、大小、修改时间和是否为文件等信息的字典列表。输入参数为可选的子目录路径，输出为文件树数据结构。典型使用场景包括代码仓库浏览、文件搜索或项目分析工具中展示目录结构。

## usage example:

```python
# 假设 repo 是类实例
file_tree = repo.get_file_tree()  # 获取整个仓库的文件树
sub_tree = repo.get_file_tree(subpath="src")  # 获取 "src" 子目录的文件树

# 示例：遍历并打印结果
for item in file_tree:
    print(f"路径: {item['path']}, 大小: {item['size']}, 是否为文件: {item['is_file']}")
```

# method `RepoMapper.scan_repo() -> None`

## function:

该方法递归扫描仓库路径下的所有文件，根据文件后缀（如 `.py` 及 TreeSitter 支持的语言扩展名）筛选目标文件，并调用 `_scan_file` 方法解析文件内容以增量更新符号映射。它通过文件修改时间（mtime）避免重复解析，提升效率。核心功能是自动化地从代码文件中提取函数、类等符号信息，输入为仓库路径，无直接输出但会更新内部符号映射结构。典型使用场景包括代码索引、IDE 智能提示、静态分析工具或代码搜索引擎的构建过程。

## usage example:

```python
from pathlib import Path

class TreeSitterSymbolExtractor:
    LANGUAGES = {".py", ".js", ".java"}

    def __init__(self, repo
```


---

# module `src/kit/utils.py`

## function:

该模块是提供共享工具函数的实用程序库，主要负责格式化输出、路径安全验证和URL解析等通用功能。它具备将时间、文件大小转换为人类可读格式的能力，能安全验证相对路径防止目录遍历攻击，并支持解析GitHub URL提取仓库信息。关键实现方式包括基于条件分支的格式转换、通过路径组件检查防止越界访问，以及利用字符串分割和模式匹配处理多种URL格式。

## usage example:

```python
from src.kit.utils import (
    format_duration,
    format_size,
    validate_relative_path,
    parse_git_url,
    truncate_text,
)
from pathlib import Path

# format_duration examples
print(format_duration(0.5))    # 500.0ms
print(format_duration(30.5))   # 30.50s
print(format_duration(120.25)) # 2m 0.3s

# format_size examples
print(format_size(1023))       # 1023.0B
print(format_size(1024))       # 1.0KB
print(format_size(1048576))    # 1.0MB

# validate_relative_path examples
base_path = Path("/home/user/project")
try:
    valid_path = validate_relative_path(base_path, "src/file.txt")
    print(f"Valid: {valid_path}")
except ValueError as e:
    print(f"Error: {e}")

# parse_git_url examples
url_https = "https://github.com/owner/repo.git"
url_ssh = "git@github.com:owner/repo.git"
print(parse_git_url(url_https))  # ('owner', 'repo')
print(parse_git_url(url_ssh))    # ('owner', 'repo')
print(parse_git_url("https://gitlab.com/owner/repo"))  # None

# truncate_text examples
text = "This is a long text that needs truncation."
print(truncate_text(text, 15))  # "This is a lon..."
```

# func `format_duration(seconds: float) -> str`

## function:

核心功能：将秒数自动转换为毫秒、秒或“分秒”的人类可读格式。
输入：浮点数 `seconds`（单位：秒）；输出：格式化字符串（如 "150ms"、"5.23s" 或 "2m 30.5s"）。
典型使用场景：展示程序运行耗时、计时器结果或任何需要直观显示时间长度的场合。

## usage example:

```python
print(format_duration(0.5))
print(format_duration(45.67))
print(format_duration(125.3))
```

# func `format_size(bytes_size: int) -> str`

## function:

该函数将字节数转换为易读的字符串格式（如KB、MB等）。输入为整数类型的字节数，输出为带一位小数和相应单位的字符串（如`"1.5GB"`）。典型使用场景包括文件大小显示或存储容量展示。

## usage example:

```python
print(format_size(0))          # 0.0B
print(format_size(1023))       # 1023.0B
print(format_size(1024))       # 1.0KB
print(format_size(123456789))  # 117.7MB
```


---
