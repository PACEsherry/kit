# Summary Output - CangjieSkills

> 本文档根据 CangjieSkills 项目源码自动生成，用于记录代码仓库中的库、模块、类、方法、函数、配置、变量和常量等广义接口摘要。

> 每个条目尽量保持统一结构，方便后续被 AI 检索、理解和定位源码。


---

# library CangjieSkills

## function:

CangjieSkills 是一个仓颉语言技能库，提供 HarmonyOS 应用开发的示例代码、最佳实践和常用组件。

## usage example:

```cangjie
// 导入技能库中的模块
import skills.notebook.*
```

# config README.md

## function:

该配置文件用于控制项目的依赖、构建、测试或运行参数。

## declaration:

```text
# 仓颉通用程序开发 Skills

这套 Skills 可支撑 AI 开发工具从零创建开发仓颉项目，包括项目配置、开发、构建、运行、单元测试等，包括 stdx、macro、CFFI 等场景的自动处理。

> 仓颉鸿蒙应用开发 Skills 请切换 harmonyos 分支

## 快速安装

以使用 OpenCode 为例，在仓颉项目目录下执行如下命令：

```shell
npx skills add https://gitcode.com/Cangjie-SIG/CangjieSkills.git -a opencode -y
```

> 根据您使用的 AI 开发工具，`-a` 选项后可以接 `claude-code`，`cursor`，`antigravity`，`trae` 等，其他详见 https://www.npmjs.com/package/skills

如果没有 node 环境，您也可以手动下载本仓库，把 `.agents/skills` 部署到所用 AI 工具的 Skills 搜索路径中。

**注意事项**
```

# config tests/json_parser/project/cjpm.toml

## function:

该配置文件用于控制项目的依赖、构建、测试或运行参数。

## declaration:

```toml
[package]
  cjc-version = "1.0.5"
  name = "json_parser"
  description = "nothing here"
  version = "1.0.0"
  target-dir = ""
  output-type = "executable"
  compile-option = ""
  override-compile-option = ""
  link-option = ""
  package-configuration = {}

[dependencies]
```

# config tests/kalman_filter/project/cjpm.toml

## function:

该配置文件用于控制项目的依赖、构建、测试或运行参数。

## declaration:

```toml
[package]
  cjc-version = "1.0.5"
  name = "kalman"
  version = "1.0.0"
  output-type = "executable"
  link-option = "-lm"

[dependencies]

[ffi.c]
kalman_filter = { path = "./libs/" }
```

# config tests/linq_dsl/project/cjpm.toml

## function:

该配置文件用于控制项目的依赖、构建、测试或运行参数。

## declaration:

```toml
[package]
  cjc-version = "1.0.5"
  name = "macro_dsl"
  description = "LINQ-like Query DSL using Cangjie macros"
  version = "1.0.0"
  output-type = "executable"

[dependencies]
  macros = { path = "./macros" }
```

# config tests/linq_dsl/project/macros/cjpm.toml

## function:

该配置文件用于控制项目的依赖、构建、测试或运行参数。

## declaration:

```toml
[package]
  cjc-version = "1.0.5"
  name = "macros"
  description = "Query DSL macro package"
  version = "1.0.0"
  output-type = "static"
  compile-option = "--compile-macro"
```

# config tests/mustache/project/cjpm.toml

## function:

该配置文件用于控制项目的依赖、构建、测试或运行参数。

## declaration:

```toml
[package]
  cjc-version = "1.0.5"
  name = "mustache"
  description = "nothing here"
  version = "1.0.0"
  target-dir = ""
  output-type = "executable"
  compile-option = ""
  override-compile-option = ""
  link-option = ""
  package-configuration = {}

[dependencies]
```

# config tests/notebook/project/cjpm.toml

## function:

该配置文件用于控制项目的依赖、构建、测试或运行参数。

## declaration:

```toml
[package]
  cjc-version = "1.0.5"
  name = "notebook"
  version = "1.0.0"
  output-type = "executable"

[dependencies]

# 注意：path-option 需替换为实际的 stdx 动态库路径
[target.x86_64-unknown-linux-gnu]
  [target.x86_64-unknown-linux-gnu.bin-dependencies]
    path-option = ["../.stdx/linux_x86_64_cjnative/dynamic/stdx"]

[target.x86_64-w64-mingw32]
  [target.x86_64-w64-mingw32.bin-dependencies]
    path-option = ["../.stdx/windows_x86_64_cjnative/dynamic/stdx"]
```

# config tests/web_framework/project/cjpm.toml

## function:

该配置文件用于控制项目的依赖、构建、测试或运行参数。

## declaration:

```toml
[package]
  cjc-version = "1.0.5"
  name = "web"
  description = "Basic Web Server Framework"
  version = "1.0.0"
  target-dir = ""
  output-type = "executable"
  compile-option = ""
  override-compile-option = ""
  link-option = ""
  package-configuration = {}

[dependencies]
```

# module tests/json_parser/json_parser_test.cj

## function:

负责测试 `json_parser_test` 相关功能是否符合预期。

## usage example:

```cangjie
# source: tests/json_parser/json_parser_test.cj
```

## package:
json_parser

## imports:

- `std.collection.*`

- `std.math.*`

# class TestParseSimpleValues

## function:

封装 `` 中与 `TestParseSimpleValues` 相关的数据和行为，是项目中的类级实现单元。

## kind:

class

## access:

internal

## extends:

none

## implements:

none

## properties:

- `internal let v: None`

## usage example:

```cangjie
class TestParseSimpleValues {
    @TestCase
    func testParseNull() {
        let v = JsonValue.fromString("null")
        @Assert(v.isNull())
    }

    @TestCase
    func testParseTrue() {
        let v = JsonValue.fromString("true")
        @Assert(v.isBool())
        @Assert(v.asBool(), true)
    }

    @TestCase
    func testParseFalse() {
        let v = JsonValue.fromString("false")
        @Assert(v.isBool())
        @Assert(v.asBool(), false)
    }
```

# method TestParseSimpleValues.func testParseNull()

## function:

实现 `` 中的 `testParseNull` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testParseNull() {
        let v = JsonValue.fromString("null")
        @Assert(v.isNull())
    }

    @TestCase
    func testParseTrue() {
        let v = JsonValue.fromString("true")
        @Assert(v.isBool())
        @Assert(v.asBool(), true)
    }
```

# method TestParseSimpleValues.func testParseTrue()

## function:

实现 `` 中的 `testParseTrue` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testParseTrue() {
        let v = JsonValue.fromString("true")
        @Assert(v.isBool())
        @Assert(v.asBool(), true)
    }

    @TestCase
    func testParseFalse() {
        let v = JsonValue.fromString("false")
        @Assert(v.isBool())
        @Assert(v.asBool(), false)
```

# method TestParseSimpleValues.func testParseFalse()

## function:

实现 `` 中的 `testParseFalse` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testParseFalse() {
        let v = JsonValue.fromString("false")
        @Assert(v.isBool())
        @Assert(v.asBool(), false)
    }

    @TestCase
    func testParseInteger() {
        let v = JsonValue.fromString("42")
        @Assert(v.isNumber())
        @Assert(abs(v.asNumber() - 42.0) < 0.001)
```

# method TestParseSimpleValues.func testParseInteger()

## function:

实现 `` 中的 `testParseInteger` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testParseInteger() {
        let v = JsonValue.fromString("42")
        @Assert(v.isNumber())
        @Assert(abs(v.asNumber() - 42.0) < 0.001)
    }

    @TestCase
    func testParseNegativeInteger() {
        let v = JsonValue.fromString("-7")
        @Assert(v.isNumber())
        @Assert(abs(v.asNumber() - (-7.0)) < 0.001)
```

# method TestParseSimpleValues.func testParseNegativeInteger()

## function:

实现 `` 中的 `testParseNegativeInteger` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testParseNegativeInteger() {
        let v = JsonValue.fromString("-7")
        @Assert(v.isNumber())
        @Assert(abs(v.asNumber() - (-7.0)) < 0.001)
    }

    @TestCase
    func testParseZero() {
        let v = JsonValue.fromString("0")
        @Assert(v.isNumber())
        @Assert(abs(v.asNumber()) < 0.001)
```

# method TestParseSimpleValues.func testParseZero()

## function:

实现 `` 中的 `testParseZero` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testParseZero() {
        let v = JsonValue.fromString("0")
        @Assert(v.isNumber())
        @Assert(abs(v.asNumber()) < 0.001)
    }

    @TestCase
    func testParseFloat() {
        let v = JsonValue.fromString("3.14")
        @Assert(v.isNumber())
        @Assert(abs(v.asNumber() - 3.14) < 0.001)
```

# method TestParseSimpleValues.func testParseFloat()

## function:

实现 `` 中的 `testParseFloat` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testParseFloat() {
        let v = JsonValue.fromString("3.14")
        @Assert(v.isNumber())
        @Assert(abs(v.asNumber() - 3.14) < 0.001)
    }

    @TestCase
    func testParseNegativeFloat() {
        let v = JsonValue.fromString("-0.5")
        @Assert(v.isNumber())
        @Assert(abs(v.asNumber() - (-0.5)) < 0.001)
```

# method TestParseSimpleValues.func testParseNegativeFloat()

## function:

实现 `` 中的 `testParseNegativeFloat` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testParseNegativeFloat() {
        let v = JsonValue.fromString("-0.5")
        @Assert(v.isNumber())
        @Assert(abs(v.asNumber() - (-0.5)) < 0.001)
    }

    @TestCase
    func testParseScientificNotation() {
        let v = JsonValue.fromString("1e3")
        @Assert(v.isNumber())
        @Assert(abs(v.asNumber() - 1000.0) < 0.001)
```

# method TestParseSimpleValues.func testParseScientificNotation()

## function:

实现 `` 中的 `testParseScientificNotation` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testParseScientificNotation() {
        let v = JsonValue.fromString("1e3")
        @Assert(v.isNumber())
        @Assert(abs(v.asNumber() - 1000.0) < 0.001)
    }

    @TestCase
    func testParseScientificNotationWithSign() {
        let v = JsonValue.fromString("1.5e-2")
        @Assert(v.isNumber())
        @Assert(abs(v.asNumber() - 0.015) < 0.0001)
```

# method TestParseSimpleValues.func testParseScientificNotationWithSign()

## function:

实现 `` 中的 `testParseScientificNotationWithSign` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testParseScientificNotationWithSign() {
        let v = JsonValue.fromString("1.5e-2")
        @Assert(v.isNumber())
        @Assert(abs(v.asNumber() - 0.015) < 0.0001)
    }

    @TestCase
    func testParseSimpleString() {
        let v = JsonValue.fromString("\"hello\"")
        @Assert(v.isString())
        @Assert(v.asString(), "hello")
```

# method TestParseSimpleValues.func testParseSimpleString()

## function:

实现 `` 中的 `testParseSimpleString` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testParseSimpleString() {
        let v = JsonValue.fromString("\"hello\"")
        @Assert(v.isString())
        @Assert(v.asString(), "hello")
    }

    @TestCase
    func testParseEmptyString() {
        let v = JsonValue.fromString("\"\"")
        @Assert(v.isString())
        @Assert(v.asString(), "")
```

# method TestParseSimpleValues.func testParseEmptyString()

## function:

实现 `` 中的 `testParseEmptyString` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testParseEmptyString() {
        let v = JsonValue.fromString("\"\"")
        @Assert(v.isString())
        @Assert(v.asString(), "")
    }

    @TestCase
    func testParseStringWithEscapes() {
        let v = JsonValue.fromString("\"hello\\nworld\"")
        @Assert(v.isString())
        @Assert(v.asString(), "hello\nworld")
```

# method TestParseSimpleValues.func testParseStringWithEscapes()

## function:

实现 `` 中的 `testParseStringWithEscapes` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testParseStringWithEscapes() {
        let v = JsonValue.fromString("\"hello\\nworld\"")
        @Assert(v.isString())
        @Assert(v.asString(), "hello\nworld")
    }

    @TestCase
    func testParseStringWithTab() {
        let v = JsonValue.fromString("\"a\\tb\"")
        @Assert(v.isString())
        @Assert(v.asString(), "a\tb")
```

# method TestParseSimpleValues.func testParseStringWithTab()

## function:

实现 `` 中的 `testParseStringWithTab` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testParseStringWithTab() {
        let v = JsonValue.fromString("\"a\\tb\"")
        @Assert(v.isString())
        @Assert(v.asString(), "a\tb")
    }

    @TestCase
    func testParseStringWithEscapedQuote() {
        let v = JsonValue.fromString("\"say \\\"hi\\\"\"")
        @Assert(v.isString())
        @Assert(v.asString(), "say \"hi\"")
```

# method TestParseSimpleValues.func testParseStringWithEscapedQuote()

## function:

实现 `` 中的 `testParseStringWithEscapedQuote` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testParseStringWithEscapedQuote() {
        let v = JsonValue.fromString("\"say \\\"hi\\\"\"")
        @Assert(v.isString())
        @Assert(v.asString(), "say \"hi\"")
    }

    @TestCase
    func testParseStringWithBackslash() {
        let v = JsonValue.fromString("\"a\\\\b\"")
        @Assert(v.isString())
        @Assert(v.asString(), "a\\b")
```

# method TestParseSimpleValues.func testParseStringWithBackslash()

## function:

实现 `` 中的 `testParseStringWithBackslash` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testParseStringWithBackslash() {
        let v = JsonValue.fromString("\"a\\\\b\"")
        @Assert(v.isString())
        @Assert(v.asString(), "a\\b")
    }

    @TestCase
    func testParseStringWithSlash() {
        let v = JsonValue.fromString("\"a\\/b\"")
        @Assert(v.isString())
        @Assert(v.asString(), "a/b")
```

# method TestParseSimpleValues.func testParseStringWithSlash()

## function:

实现 `` 中的 `testParseStringWithSlash` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testParseStringWithSlash() {
        let v = JsonValue.fromString("\"a\\/b\"")
        @Assert(v.isString())
        @Assert(v.asString(), "a/b")
    }

    @TestCase
    func testParseStringWithUnicode() {
        let v = JsonValue.fromString("\"\\u4f60\\u597d\"")
        @Assert(v.isString())
        @Assert(v.asString(), "你好")
```

# method TestParseSimpleValues.func testParseStringWithUnicode()

## function:

实现 `` 中的 `testParseStringWithUnicode` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testParseStringWithUnicode() {
        let v = JsonValue.fromString("\"\\u4f60\\u597d\"")
        @Assert(v.isString())
        @Assert(v.asString(), "你好")
    }

    @TestCase
    func testParseStringWithUTF8() {
        let v = JsonValue.fromString("\"中文测试\"")
        @Assert(v.isString())
        @Assert(v.asString(), "中文测试")
```

# method TestParseSimpleValues.func testParseStringWithUTF8()

## function:

实现 `` 中的 `testParseStringWithUTF8` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testParseStringWithUTF8() {
        let v = JsonValue.fromString("\"中文测试\"")
        @Assert(v.isString())
        @Assert(v.asString(), "中文测试")
    }
}

@Test
class TestParseWhitespace {
    @TestCase
    func testWhitespaceAroundValue() {
```

# class TestParseWhitespace

## function:

封装 `` 中与 `TestParseWhitespace` 相关的数据和行为，是项目中的类级实现单元。

## kind:

class

## access:

internal

## extends:

none

## implements:

none

## properties:

- `internal let v: None`

## usage example:

```cangjie
class TestParseWhitespace {
    @TestCase
    func testWhitespaceAroundValue() {
        let v = JsonValue.fromString("  42  ")
        @Assert(v.isNumber())
        @Assert(abs(v.asNumber() - 42.0) < 0.001)
    }

    @TestCase
    func testWhitespaceInObject() {
        let v = JsonValue.fromString("{ \"a\" : 1 }")
        @Assert(v.isObject())
    }

    @TestCase
    func testNewlinesAndTabs() {
        let v = JsonValue.fromString("{\n\t\"x\": 1\n}")
        @Assert(v.isObject())
    }
}
```

# method TestParseWhitespace.func testWhitespaceAroundValue()

## function:

实现 `` 中的 `testWhitespaceAroundValue` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testWhitespaceAroundValue() {
        let v = JsonValue.fromString("  42  ")
        @Assert(v.isNumber())
        @Assert(abs(v.asNumber() - 42.0) < 0.001)
    }

    @TestCase
    func testWhitespaceInObject() {
        let v = JsonValue.fromString("{ \"a\" : 1 }")
        @Assert(v.isObject())
    }
```

# method TestParseWhitespace.func testWhitespaceInObject()

## function:

实现 `` 中的 `testWhitespaceInObject` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testWhitespaceInObject() {
        let v = JsonValue.fromString("{ \"a\" : 1 }")
        @Assert(v.isObject())
    }

    @TestCase
    func testNewlinesAndTabs() {
        let v = JsonValue.fromString("{\n\t\"x\": 1\n}")
        @Assert(v.isObject())
    }
}
```

# method TestParseWhitespace.func testNewlinesAndTabs()

## function:

实现 `` 中的 `testNewlinesAndTabs` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testNewlinesAndTabs() {
        let v = JsonValue.fromString("{\n\t\"x\": 1\n}")
        @Assert(v.isObject())
    }
}

@Test
class TestParseArray {
    @TestCase
    func testEmptyArray() {
        let v = JsonValue.fromString("[]")
```

# class TestParseArray

## function:

封装 `` 中与 `TestParseArray` 相关的数据和行为，是项目中的类级实现单元。

## kind:

class

## access:

internal

## extends:

none

## implements:

none

## properties:

- `internal let v: None`

- `internal let arr: None`

- `internal let inner: None`

## usage example:

```cangjie
class TestParseArray {
    @TestCase
    func testEmptyArray() {
        let v = JsonValue.fromString("[]")
        @Assert(v.isArray())
        let arr = (v as JsonArr).getOrThrow()
        @Assert(arr.size(), 0)
    }

    @TestCase
    func testSingleElementArray() {
        let v = JsonValue.fromString("[1]")
        @Assert(v.isArray())
        let arr = (v as JsonArr).getOrThrow()
        @Assert(arr.size(), 1)
        @Assert(abs(arr.get(0).asNumber() - 1.0) < 0.001)
    }

    @TestCase
    func testMixedArray() {
```

# method TestParseArray.func testEmptyArray()

## function:

实现 `` 中的 `testEmptyArray` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testEmptyArray() {
        let v = JsonValue.fromString("[]")
        @Assert(v.isArray())
        let arr = (v as JsonArr).getOrThrow()
        @Assert(arr.size(), 0)
    }

    @TestCase
    func testSingleElementArray() {
        let v = JsonValue.fromString("[1]")
        @Assert(v.isArray())
```

# method TestParseArray.func testSingleElementArray()

## function:

实现 `` 中的 `testSingleElementArray` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testSingleElementArray() {
        let v = JsonValue.fromString("[1]")
        @Assert(v.isArray())
        let arr = (v as JsonArr).getOrThrow()
        @Assert(arr.size(), 1)
        @Assert(abs(arr.get(0).asNumber() - 1.0) < 0.001)
    }

    @TestCase
    func testMixedArray() {
        let v = JsonValue.fromString("[1, \"two\", true, null, 3.14]")
```

# method TestParseArray.func testMixedArray()

## function:

实现 `` 中的 `testMixedArray` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testMixedArray() {
        let v = JsonValue.fromString("[1, \"two\", true, null, 3.14]")
        @Assert(v.isArray())
        let arr = (v as JsonArr).getOrThrow()
        @Assert(arr.size(), 5)
        @Assert(arr.get(0).isNumber())
        @Assert(arr.get(1).isString())
        @Assert(arr.get(1).asString(), "two")
        @Assert(arr.get(2).isBool())
        @Assert(arr.get(2).asBool(), true)
        @Assert(arr.get(3).isNull())
```

# method TestParseArray.func testNestedArray()

## function:

实现 `` 中的 `testNestedArray` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testNestedArray() {
        let v = JsonValue.fromString("[[1, 2], [3, 4]]")
        @Assert(v.isArray())
        let arr = (v as JsonArr).getOrThrow()
        @Assert(arr.size(), 2)
        let inner = (arr.get(0) as JsonArr).getOrThrow()
        @Assert(inner.size(), 2)
        @Assert(abs(inner.get(0).asNumber() - 1.0) < 0.001)
    }
}
```

# class TestParseObject

## function:

封装 `` 中与 `TestParseObject` 相关的数据和行为，是项目中的类级实现单元。

## kind:

class

## access:

internal

## extends:

none

## implements:

none

## properties:

- `internal let v: None`

- `internal let obj: None`

- `internal let inner: None`

## usage example:

```cangjie
class TestParseObject {
    @TestCase
    func testEmptyObject() {
        let v = JsonValue.fromString("{}")
        @Assert(v.isObject())
        let obj = (v as JsonObj).getOrThrow()
        @Assert(obj.size(), 0)
    }

    @TestCase
    func testSimpleObject() {
        let v = JsonValue.fromString("{\"name\": \"Alice\", \"age\": 30}")
        @Assert(v.isObject())
        let obj = (v as JsonObj).getOrThrow()
        @Assert(obj.size(), 2)
        @Assert(obj.get("name").getOrThrow().asString(), "Alice")
        @Assert(abs(obj.get("age").getOrThrow().asNumber() - 30.0) < 0.001)
    }

    @TestCase
```

# method TestParseObject.func testEmptyObject()

## function:

实现 `` 中的 `testEmptyObject` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testEmptyObject() {
        let v = JsonValue.fromString("{}")
        @Assert(v.isObject())
        let obj = (v as JsonObj).getOrThrow()
        @Assert(obj.size(), 0)
    }

    @TestCase
    func testSimpleObject() {
        let v = JsonValue.fromString("{\"name\": \"Alice\", \"age\": 30}")
        @Assert(v.isObject())
```

# method TestParseObject.func testSimpleObject()

## function:

实现 `` 中的 `testSimpleObject` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testSimpleObject() {
        let v = JsonValue.fromString("{\"name\": \"Alice\", \"age\": 30}")
        @Assert(v.isObject())
        let obj = (v as JsonObj).getOrThrow()
        @Assert(obj.size(), 2)
        @Assert(obj.get("name").getOrThrow().asString(), "Alice")
        @Assert(abs(obj.get("age").getOrThrow().asNumber() - 30.0) < 0.001)
    }

    @TestCase
    func testNestedObject() {
```

# method TestParseObject.func testNestedObject()

## function:

实现 `` 中的 `testNestedObject` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testNestedObject() {
        let v = JsonValue.fromString("{\"a\": {\"b\": 1}}")
        @Assert(v.isObject())
        let obj = (v as JsonObj).getOrThrow()
        let inner = (obj.get("a").getOrThrow() as JsonObj).getOrThrow()
        @Assert(abs(inner.get("b").getOrThrow().asNumber() - 1.0) < 0.001)
    }

    @TestCase
    func testObjectContainsKey() {
        let v = JsonValue.fromString("{\"key\": \"value\"}")
```

# method TestParseObject.func testObjectContainsKey()

## function:

实现 `` 中的 `testObjectContainsKey` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testObjectContainsKey() {
        let v = JsonValue.fromString("{\"key\": \"value\"}")
        let obj = (v as JsonObj).getOrThrow()
        @Assert(obj.containsKey("key"))
        @Assert(!obj.containsKey("missing"))
    }

    @TestCase
    func testObjectGetMissing() {
        let v = JsonValue.fromString("{\"key\": \"value\"}")
        let obj = (v as JsonObj).getOrThrow()
```

# method TestParseObject.func testObjectGetMissing()

## function:

实现 `` 中的 `testObjectGetMissing` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testObjectGetMissing() {
        let v = JsonValue.fromString("{\"key\": \"value\"}")
        let obj = (v as JsonObj).getOrThrow()
        @Assert(obj.get("missing").isNone())
    }
}

@Test
class TestParseComplex {
    @TestCase
    func testComplexJson() {
```

# class TestParseComplex

## function:

封装 `` 中与 `TestParseComplex` 相关的数据和行为，是项目中的类级实现单元。

## kind:

class

## access:

internal

## extends:

none

## implements:

none

## properties:

- `internal let input: None`

- `internal let v: None`

- `internal let obj: None`

- `internal let scores: None`

- `internal let a: None`

- `internal let b: None`

- `internal let c: None`

- `internal let items: None`

- `internal let item1: None`

## usage example:

```cangjie
class TestParseComplex {
    @TestCase
    func testComplexJson() {
        let input = ##"{"name":"Alice","age":30,"active":true,"scores":[90,85,95],"address":null}"##
        let v = JsonValue.fromString(input)
        @Assert(v.isObject())
        let obj = (v as JsonObj).getOrThrow()
        @Assert(obj.get("name").getOrThrow().asString(), "Alice")
        @Assert(abs(obj.get("age").getOrThrow().asNumber() - 30.0) < 0.001)
        @Assert(obj.get("active").getOrThrow().asBool(), true)
        @Assert(obj.get("address").getOrThrow().isNull())
        let scores = (obj.get("scores").getOrThrow() as JsonArr).getOrThrow()
        @Assert(scores.size(), 3)
        @Assert(abs(scores.get(0).asNumber() - 90.0) < 0.001)
    }

    @TestCase
    func testDeeplyNestedJson() {
        let input = ##"{"a":{"b":{"c":{"d":42}}}}"##
        let v = JsonValue.fromString(input)
```

# method TestParseComplex.func testComplexJson()

## function:

实现 `` 中的 `testComplexJson` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testComplexJson() {
        let input = ##"{"name":"Alice","age":30,"active":true,"scores":[90,85,95],"address":null}"##
        let v = JsonValue.fromString(input)
        @Assert(v.isObject())
        let obj = (v as JsonObj).getOrThrow()
        @Assert(obj.get("name").getOrThrow().asString(), "Alice")
        @Assert(abs(obj.get("age").getOrThrow().asNumber() - 30.0) < 0.001)
        @Assert(obj.get("active").getOrThrow().asBool(), true)
        @Assert(obj.get("address").getOrThrow().isNull())
        let scores = (obj.get("scores").getOrThrow() as JsonArr).getOrThrow()
        @Assert(scores.size(), 3)
```

# method TestParseComplex.func testDeeplyNestedJson()

## function:

实现 `` 中的 `testDeeplyNestedJson` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testDeeplyNestedJson() {
        let input = ##"{"a":{"b":{"c":{"d":42}}}}"##
        let v = JsonValue.fromString(input)
        let obj = (v as JsonObj).getOrThrow()
        let a = (obj.get("a").getOrThrow() as JsonObj).getOrThrow()
        let b = (a.get("b").getOrThrow() as JsonObj).getOrThrow()
        let c = (b.get("c").getOrThrow() as JsonObj).getOrThrow()
        @Assert(abs(c.get("d").getOrThrow().asNumber() - 42.0) < 0.001)
    }

    @TestCase
```

# method TestParseComplex.func testObjectWithArray()

## function:

实现 `` 中的 `testObjectWithArray` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testObjectWithArray() {
        let input = ##"{"items":[{"id":1,"name":"a"},{"id":2,"name":"b"}]}"##
        let v = JsonValue.fromString(input)
        let obj = (v as JsonObj).getOrThrow()
        let items = (obj.get("items").getOrThrow() as JsonArr).getOrThrow()
        @Assert(items.size(), 2)
        let item1 = (items.get(0) as JsonObj).getOrThrow()
        @Assert(abs(item1.get("id").getOrThrow().asNumber() - 1.0) < 0.001)
        @Assert(item1.get("name").getOrThrow().asString(), "a")
    }
}
```

# class TestSerialize

## function:

封装 `` 中与 `TestSerialize` 相关的数据和行为，是项目中的类级实现单元。

## kind:

class

## access:

internal

## extends:

none

## implements:

none

## properties:

- `internal let s: None`

- `internal let arr: None`

- `internal let obj: None`

## usage example:

```cangjie
class TestSerialize {
    @TestCase
    func testSerializeNull() {
        @Assert(JsonNull().toString(), "null")
    }

    @TestCase
    func testSerializeTrue() {
        @Assert(JsonBool(true).toString(), "true")
    }

    @TestCase
    func testSerializeFalse() {
        @Assert(JsonBool(false).toString(), "false")
    }

    @TestCase
    func testSerializeInteger() {
        let s = JsonNum(42.0).toString()
        @Assert(s, "42")
```

# method TestSerialize.func testSerializeNull()

## function:

实现 `` 中的 `testSerializeNull` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testSerializeNull() {
        @Assert(JsonNull().toString(), "null")
    }

    @TestCase
    func testSerializeTrue() {
        @Assert(JsonBool(true).toString(), "true")
    }

    @TestCase
    func testSerializeFalse() {
```

# method TestSerialize.func testSerializeTrue()

## function:

实现 `` 中的 `testSerializeTrue` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testSerializeTrue() {
        @Assert(JsonBool(true).toString(), "true")
    }

    @TestCase
    func testSerializeFalse() {
        @Assert(JsonBool(false).toString(), "false")
    }

    @TestCase
    func testSerializeInteger() {
```

# method TestSerialize.func testSerializeFalse()

## function:

实现 `` 中的 `testSerializeFalse` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testSerializeFalse() {
        @Assert(JsonBool(false).toString(), "false")
    }

    @TestCase
    func testSerializeInteger() {
        let s = JsonNum(42.0).toString()
        @Assert(s, "42")
    }

    @TestCase
```

# method TestSerialize.func testSerializeInteger()

## function:

实现 `` 中的 `testSerializeInteger` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testSerializeInteger() {
        let s = JsonNum(42.0).toString()
        @Assert(s, "42")
    }

    @TestCase
    func testSerializeFloat() {
        let s = JsonNum(3.14).toString()
        @Assert(s.startsWith("3.14"))
    }
```

# method TestSerialize.func testSerializeFloat()

## function:

实现 `` 中的 `testSerializeFloat` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testSerializeFloat() {
        let s = JsonNum(3.14).toString()
        @Assert(s.startsWith("3.14"))
    }

    @TestCase
    func testSerializeString() {
        @Assert(JsonStr("hello").toString(), "\"hello\"")
    }

    @TestCase
```

# method TestSerialize.func testSerializeString()

## function:

实现 `` 中的 `testSerializeString` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testSerializeString() {
        @Assert(JsonStr("hello").toString(), "\"hello\"")
    }

    @TestCase
    func testSerializeStringWithEscapes() {
        @Assert(JsonStr("a\nb").toString(), "\"a\\nb\"")
    }

    @TestCase
    func testSerializeEmptyArray() {
```

# method TestSerialize.func testSerializeStringWithEscapes()

## function:

实现 `` 中的 `testSerializeStringWithEscapes` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testSerializeStringWithEscapes() {
        @Assert(JsonStr("a\nb").toString(), "\"a\\nb\"")
    }

    @TestCase
    func testSerializeEmptyArray() {
        @Assert(JsonArr().toString(), "[]")
    }

    @TestCase
    func testSerializeArray() {
```

# method TestSerialize.func testSerializeEmptyArray()

## function:

实现 `` 中的 `testSerializeEmptyArray` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testSerializeEmptyArray() {
        @Assert(JsonArr().toString(), "[]")
    }

    @TestCase
    func testSerializeArray() {
        let arr = JsonArr()
        arr.add(JsonNum(1.0))
        arr.add(JsonNum(2.0))
        @Assert(arr.toString(), "[1,2]")
    }
```

# method TestSerialize.func testSerializeArray()

## function:

实现 `` 中的 `testSerializeArray` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testSerializeArray() {
        let arr = JsonArr()
        arr.add(JsonNum(1.0))
        arr.add(JsonNum(2.0))
        @Assert(arr.toString(), "[1,2]")
    }

    @TestCase
    func testSerializeEmptyObject() {
        @Assert(JsonObj().toString(), "{}")
    }
```

# method TestSerialize.func testSerializeEmptyObject()

## function:

实现 `` 中的 `testSerializeEmptyObject` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testSerializeEmptyObject() {
        @Assert(JsonObj().toString(), "{}")
    }

    @TestCase
    func testSerializeObject() {
        let obj = JsonObj()
        obj.put("a", JsonNum(1.0))
        obj.put("b", JsonStr("hello"))
        @Assert(obj.toString(), "{\"a\":1,\"b\":\"hello\"}")
    }
```

# method TestSerialize.func testSerializeObject()

## function:

实现 `` 中的 `testSerializeObject` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testSerializeObject() {
        let obj = JsonObj()
        obj.put("a", JsonNum(1.0))
        obj.put("b", JsonStr("hello"))
        @Assert(obj.toString(), "{\"a\":1,\"b\":\"hello\"}")
    }
}

@Test
class TestRoundTrip {
    @TestCase
```

# class TestRoundTrip

## function:

封装 `` 中与 `TestRoundTrip` 相关的数据和行为，是项目中的类级实现单元。

## kind:

class

## access:

internal

## extends:

none

## implements:

none

## properties:

- `internal let s: None`

- `internal let v: None`

## usage example:

```cangjie
class TestRoundTrip {
    @TestCase
    func testRoundTripNull() {
        let s = "null"
        let v = JsonValue.fromString(s)
        @Assert(v.toString(), s)
    }

    @TestCase
    func testRoundTripBool() {
        let s = "true"
        let v = JsonValue.fromString(s)
        @Assert(v.toString(), s)
    }

    @TestCase
    func testRoundTripNumber() {
        let s = "42"
        let v = JsonValue.fromString(s)
        @Assert(v.toString(), s)
```

# method TestRoundTrip.func testRoundTripNull()

## function:

实现 `` 中的 `testRoundTripNull` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testRoundTripNull() {
        let s = "null"
        let v = JsonValue.fromString(s)
        @Assert(v.toString(), s)
    }

    @TestCase
    func testRoundTripBool() {
        let s = "true"
        let v = JsonValue.fromString(s)
        @Assert(v.toString(), s)
```

# method TestRoundTrip.func testRoundTripBool()

## function:

实现 `` 中的 `testRoundTripBool` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testRoundTripBool() {
        let s = "true"
        let v = JsonValue.fromString(s)
        @Assert(v.toString(), s)
    }

    @TestCase
    func testRoundTripNumber() {
        let s = "42"
        let v = JsonValue.fromString(s)
        @Assert(v.toString(), s)
```

# method TestRoundTrip.func testRoundTripNumber()

## function:

实现 `` 中的 `testRoundTripNumber` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testRoundTripNumber() {
        let s = "42"
        let v = JsonValue.fromString(s)
        @Assert(v.toString(), s)
    }

    @TestCase
    func testRoundTripString() {
        let s = "\"hello world\""
        let v = JsonValue.fromString(s)
        @Assert(v.toString(), s)
```

# method TestRoundTrip.func testRoundTripString()

## function:

实现 `` 中的 `testRoundTripString` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testRoundTripString() {
        let s = "\"hello world\""
        let v = JsonValue.fromString(s)
        @Assert(v.toString(), s)
    }

    @TestCase
    func testRoundTripArray() {
        let s = "[1,2,3]"
        let v = JsonValue.fromString(s)
        @Assert(v.toString(), s)
```

# method TestRoundTrip.func testRoundTripArray()

## function:

实现 `` 中的 `testRoundTripArray` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testRoundTripArray() {
        let s = "[1,2,3]"
        let v = JsonValue.fromString(s)
        @Assert(v.toString(), s)
    }

    @TestCase
    func testRoundTripObject() {
        let s = ##"{"name":"Alice","age":30}"##
        let v = JsonValue.fromString(s)
        @Assert(v.toString(), s)
```

# method TestRoundTrip.func testRoundTripObject()

## function:

实现 `` 中的 `testRoundTripObject` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testRoundTripObject() {
        let s = ##"{"name":"Alice","age":30}"##
        let v = JsonValue.fromString(s)
        @Assert(v.toString(), s)
    }

    @TestCase
    func testRoundTripComplex() {
        let s = ##"{"a":[1,true,null,"hi"],"b":{"c":3}}"##
        let v = JsonValue.fromString(s)
        @Assert(v.toString(), s)
```

# method TestRoundTrip.func testRoundTripComplex()

## function:

实现 `` 中的 `testRoundTripComplex` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testRoundTripComplex() {
        let s = ##"{"a":[1,true,null,"hi"],"b":{"c":3}}"##
        let v = JsonValue.fromString(s)
        @Assert(v.toString(), s)
    }
}

@Test
class TestErrorHandling {
    @TestCase
    func testEmptyInput() {
```

# class TestBuildValues

## function:

封装 `` 中与 `TestBuildValues` 相关的数据和行为，是项目中的类级实现单元。

## kind:

class

## access:

internal

## extends:

none

## implements:

none

## properties:

- `internal let arr: None`

- `internal let obj: None`

- `internal let keys: None`

## usage example:

```cangjie
class TestBuildValues {
    @TestCase
    func testBuildArray() {
        let arr = JsonArr()
        arr.add(JsonNum(1.0))
        arr.add(JsonStr("hello"))
        arr.add(JsonBool(true))
        arr.add(JsonNull())
        @Assert(arr.size(), 4)
        @Assert(abs(arr.get(0).asNumber() - 1.0) < 0.001)
        @Assert(arr.get(1).asString(), "hello")
        @Assert(arr.get(2).asBool(), true)
        @Assert(arr.get(3).isNull())
    }

    @TestCase
    func testBuildObject() {
        let obj = JsonObj()
        obj.put("name", JsonStr("Alice"))
        obj.put("age", JsonNum(30.0))
```

# method TestBuildValues.func testBuildArray()

## function:

实现 `` 中的 `testBuildArray` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testBuildArray() {
        let arr = JsonArr()
        arr.add(JsonNum(1.0))
        arr.add(JsonStr("hello"))
        arr.add(JsonBool(true))
        arr.add(JsonNull())
        @Assert(arr.size(), 4)
        @Assert(abs(arr.get(0).asNumber() - 1.0) < 0.001)
        @Assert(arr.get(1).asString(), "hello")
        @Assert(arr.get(2).asBool(), true)
        @Assert(arr.get(3).isNull())
```

# method TestBuildValues.func testBuildObject()

## function:

实现 `` 中的 `testBuildObject` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testBuildObject() {
        let obj = JsonObj()
        obj.put("name", JsonStr("Alice"))
        obj.put("age", JsonNum(30.0))
        @Assert(obj.size(), 2)
        @Assert(obj.get("name").getOrThrow().asString(), "Alice")
        @Assert(abs(obj.get("age").getOrThrow().asNumber() - 30.0) < 0.001)
    }

    @TestCase
    func testObjectPutOverwrite() {
```

# method TestBuildValues.func testObjectPutOverwrite()

## function:

实现 `` 中的 `testObjectPutOverwrite` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testObjectPutOverwrite() {
        let obj = JsonObj()
        obj.put("key", JsonStr("old"))
        obj.put("key", JsonStr("new"))
        @Assert(obj.size(), 1)
        @Assert(obj.get("key").getOrThrow().asString(), "new")
    }

    @TestCase
    func testObjectKeys() {
        let obj = JsonObj()
```

# method TestBuildValues.func testObjectKeys()

## function:

实现 `` 中的 `testObjectKeys` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testObjectKeys() {
        let obj = JsonObj()
        obj.put("a", JsonNum(1.0))
        obj.put("b", JsonNum(2.0))
        let keys = obj.keys()
        @Assert(keys.size, 2)
        @Assert(keys[0], "a")
        @Assert(keys[1], "b")
    }

    @TestCase
```

# method TestBuildValues.func testTypeChecks()

## function:

实现 `` 中的 `testTypeChecks` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testTypeChecks() {
        @Assert(JsonNull().isNull())
        @Assert(!JsonNull().isBool())
        @Assert(!JsonNull().isNumber())
        @Assert(!JsonNull().isString())
        @Assert(!JsonNull().isArray())
        @Assert(!JsonNull().isObject())

        @Assert(JsonBool(true).isBool())
        @Assert(JsonNum(1.0).isNumber())
        @Assert(JsonStr("x").isString())
```

# method TestBuildValues.func testTypeMismatchThrows()

## function:

实现 `` 中的 `testTypeMismatchThrows` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testTypeMismatchThrows() {
        try {
            JsonNull().asBool()
            @Fail("Should have thrown")
        } catch (e: JsonException) {
            @Assert(true)
        }
        try {
            JsonNull().asNumber()
            @Fail("Should have thrown")
        } catch (e: JsonException) {
```

# module tests/json_parser/project/src/json_parser.cj

## function:

负责测试 `json_parser` 相关功能是否符合预期。

## usage example:

```cangjie
# source: tests/json_parser/project/src/json_parser.cj
```

## package:
json_parser

## imports:

- `std.convert.*`

# class JsonParser

## function:

Recursive descent JSON parser。

## kind:

class

## access:

public

## extends:

none

## implements:

none

## properties:

- `internal let _input: Array<Rune>`

- `internal var _pos: Int64`

- `internal let _length: Int64`

- `internal let value: None`

- `internal let c: None`

- `internal let actual: None`

- `internal let sb: None`

- `internal let escaped: None`

- `internal let cp: None`

- `internal var codePoint: UInt32`

- `internal let digit: UInt32`

- `internal let start: None`

- `internal let numSb: None`

- `internal let numStr: None`

- `internal let keyRunes: None`

- `internal let arr: None`

- `internal let obj: None`

- `internal let key: None`

## usage example:

```cangjie
public class JsonParser {
    let _input: Array<Rune>
    var _pos: Int64 = 0
    let _length: Int64

    public init(text: String) {
        _input = text.toRuneArray()
        _length = _input.size
    }

    // Parse the input string into a JsonValue
    public func parse(): JsonValue {
        let value = parseValue()
        skipWhitespace()
        if (_pos < _length) {
            throw JsonException("Unexpected character at position ${_pos}")
        }
        return value
    }
```

# method JsonParser.func parse(): JsonValue

## function:

Parse the input string into a JsonValue。

## access:

public

## is_static:

False

## usage example:

```cangjie
public func parse(): JsonValue {
        let value = parseValue()
        skipWhitespace()
        if (_pos < _length) {
            throw JsonException("Unexpected character at position ${_pos}")
        }
        return value
    }

    // Skip whitespace characters (space, tab, newline, carriage return)
    func skipWhitespace(): Unit {
```

# method JsonParser.func skipWhitespace(): Unit

## function:

Skip whitespace characters (space, tab, newline, carriage return)。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func skipWhitespace(): Unit {
        while (_pos < _length) {
            let c = _input[_pos]
            if (c == r' ' || c == r'\t' || c == r'\n' || c == r'\r') {
                _pos++
            } else {
                break
            }
        }
    }
```

# method JsonParser.func peek(): Rune

## function:

Peek at the current character without advancing。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func peek(): Rune {
        if (_pos >= _length) {
            throw JsonException("Unexpected end of input")
        }
        return _input[_pos]
    }

    // Advance and return the current character
    func advance(): Rune {
        let c = peek()
        _pos++
```

# method JsonParser.func advance(): Rune

## function:

Advance and return the current character。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func advance(): Rune {
        let c = peek()
        _pos++
        return c
    }

    // Expect a specific character, throw if not found
    func expect(expected: Rune): Unit {
        let actual = advance()
        if (actual != expected) {
            throw JsonException("Expected '${expected}' but found '${actual}' at position ${_pos - 1}")
```

# method JsonParser.func expect(expected: Rune): Unit

## function:

Expect a specific character, throw if not found。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func expect(expected: Rune): Unit {
        let actual = advance()
        if (actual != expected) {
            throw JsonException("Expected '${expected}' but found '${actual}' at position ${_pos - 1}")
        }
    }

    // Parse a JSON value (dispatch to specific parsers)
    func parseValue(): JsonValue {
        skipWhitespace()
        if (_pos >= _length) {
```

# method JsonParser.func parseValue(): JsonValue

## function:

Parse a JSON value (dispatch to specific parsers)。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func parseValue(): JsonValue {
        skipWhitespace()
        if (_pos >= _length) {
            throw JsonException("Unexpected end of input")
        }
        let c = _input[_pos]
        if (c == r'"') {
            return parseString()
        } else if (c == r'{') {
            return parseObject()
        } else if (c == r'[') {
```

# method JsonParser.func parseString(): JsonStr

## function:

Parse a JSON string value。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func parseString(): JsonStr {
        expect(r'"')
        let sb = StringBuilder()
        while (_pos < _length) {
            let c = _input[_pos]
            _pos++
            if (c == r'"') {
                return JsonStr(sb.toString())
            } else if (c == r'\\') {
                if (_pos >= _length) {
                    throw JsonException("Unterminated string escape")
```

# method JsonParser.func parseUnicodeEscape(): Rune

## function:

Parse a 4-digit unicode escape sequence (\uXXXX)。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func parseUnicodeEscape(): Rune {
        if (_pos + 4 > _length) {
            throw JsonException("Incomplete unicode escape at position ${_pos}")
        }
        var codePoint: UInt32 = 0
        for (_ in 0..4) {
            let c = _input[_pos]
            _pos++
            let digit: UInt32 = if (c >= r'0' && c <= r'9') {
                UInt32(c) - UInt32(r'0')
            } else if (c >= r'a' && c <= r'f') {
```

# method JsonParser.func parseNumber(): JsonNum

## function:

Parse a JSON number。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func parseNumber(): JsonNum {
        let start = _pos

        // Optional negative sign
        if (_pos < _length && _input[_pos] == r'-') {
            _pos++
        }

        // Integer part
        if (_pos < _length && _input[_pos] == r'0') {
            _pos++
```

# method JsonParser.func parseTrue(): JsonBool

## function:

Parse JSON true。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func parseTrue(): JsonBool {
        expectKeyword("true")
        return JsonBool(true)
    }

    // Parse JSON false
    func parseFalse(): JsonBool {
        expectKeyword("false")
        return JsonBool(false)
    }
```

# method JsonParser.func parseFalse(): JsonBool

## function:

Parse JSON false。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func parseFalse(): JsonBool {
        expectKeyword("false")
        return JsonBool(false)
    }

    // Parse JSON null
    func parseNull(): JsonNull {
        expectKeyword("null")
        return JsonNull()
    }
```

# method JsonParser.func parseNull(): JsonNull

## function:

Parse JSON null。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func parseNull(): JsonNull {
        expectKeyword("null")
        return JsonNull()
    }

    // Expect a specific keyword
    func expectKeyword(keyword: String): Unit {
        let keyRunes = keyword.toRuneArray()
        for (i in 0..keyRunes.size) {
            if (_pos >= _length) {
                throw JsonException("Unexpected end of input, expected '${keyword}'")
```

# method JsonParser.func expectKeyword(keyword: String): Unit

## function:

Expect a specific keyword。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func expectKeyword(keyword: String): Unit {
        let keyRunes = keyword.toRuneArray()
        for (i in 0..keyRunes.size) {
            if (_pos >= _length) {
                throw JsonException("Unexpected end of input, expected '${keyword}'")
            }
            if (_input[_pos] != keyRunes[i]) {
                throw JsonException("Expected '${keyword}' at position ${_pos}")
            }
            _pos++
        }
```

# method JsonParser.func parseArray(): JsonArr

## function:

Parse a JSON array。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func parseArray(): JsonArr {
        expect(r'[')
        let arr = JsonArr()
        skipWhitespace()

        // Check for empty array
        if (_pos < _length && _input[_pos] == r']') {
            _pos++
            return arr
        }
```

# method JsonParser.func parseObject(): JsonObj

## function:

Parse a JSON object。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func parseObject(): JsonObj {
        expect(r'{')
        let obj = JsonObj()
        skipWhitespace()

        // Check for empty object
        if (_pos < _length && _input[_pos] == r'}') {
            _pos++
            return obj
        }
```

# module tests/json_parser/project/src/json_parser_test.cj

## function:

负责测试 `json_parser_test` 相关功能是否符合预期。

## usage example:

```cangjie
# source: tests/json_parser/project/src/json_parser_test.cj
```

## package:
json_parser

## imports:

- `std.collection.*`

- `std.math.*`

# class TestParseSimpleValues

## function:

封装 `` 中与 `TestParseSimpleValues` 相关的数据和行为，是项目中的类级实现单元。

## kind:

class

## access:

internal

## extends:

none

## implements:

none

## properties:

- `internal let v: None`

## usage example:

```cangjie
class TestParseSimpleValues {
    @TestCase
    func testParseNull() {
        let v = JsonValue.fromString("null")
        @Assert(v.isNull())
    }

    @TestCase
    func testParseTrue() {
        let v = JsonValue.fromString("true")
        @Assert(v.isBool())
        @Assert(v.asBool(), true)
    }

    @TestCase
    func testParseFalse() {
        let v = JsonValue.fromString("false")
        @Assert(v.isBool())
        @Assert(v.asBool(), false)
    }
```

# method TestParseSimpleValues.func testParseNull()

## function:

实现 `` 中的 `testParseNull` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testParseNull() {
        let v = JsonValue.fromString("null")
        @Assert(v.isNull())
    }

    @TestCase
    func testParseTrue() {
        let v = JsonValue.fromString("true")
        @Assert(v.isBool())
        @Assert(v.asBool(), true)
    }
```

# method TestParseSimpleValues.func testParseTrue()

## function:

实现 `` 中的 `testParseTrue` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testParseTrue() {
        let v = JsonValue.fromString("true")
        @Assert(v.isBool())
        @Assert(v.asBool(), true)
    }

    @TestCase
    func testParseFalse() {
        let v = JsonValue.fromString("false")
        @Assert(v.isBool())
        @Assert(v.asBool(), false)
```

# method TestParseSimpleValues.func testParseFalse()

## function:

实现 `` 中的 `testParseFalse` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testParseFalse() {
        let v = JsonValue.fromString("false")
        @Assert(v.isBool())
        @Assert(v.asBool(), false)
    }

    @TestCase
    func testParseInteger() {
        let v = JsonValue.fromString("42")
        @Assert(v.isNumber())
        @Assert(abs(v.asNumber() - 42.0) < 0.001)
```

# method TestParseSimpleValues.func testParseInteger()

## function:

实现 `` 中的 `testParseInteger` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testParseInteger() {
        let v = JsonValue.fromString("42")
        @Assert(v.isNumber())
        @Assert(abs(v.asNumber() - 42.0) < 0.001)
    }

    @TestCase
    func testParseNegativeInteger() {
        let v = JsonValue.fromString("-7")
        @Assert(v.isNumber())
        @Assert(abs(v.asNumber() - (-7.0)) < 0.001)
```

# method TestParseSimpleValues.func testParseNegativeInteger()

## function:

实现 `` 中的 `testParseNegativeInteger` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testParseNegativeInteger() {
        let v = JsonValue.fromString("-7")
        @Assert(v.isNumber())
        @Assert(abs(v.asNumber() - (-7.0)) < 0.001)
    }

    @TestCase
    func testParseZero() {
        let v = JsonValue.fromString("0")
        @Assert(v.isNumber())
        @Assert(abs(v.asNumber()) < 0.001)
```

# method TestParseSimpleValues.func testParseZero()

## function:

实现 `` 中的 `testParseZero` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testParseZero() {
        let v = JsonValue.fromString("0")
        @Assert(v.isNumber())
        @Assert(abs(v.asNumber()) < 0.001)
    }

    @TestCase
    func testParseFloat() {
        let v = JsonValue.fromString("3.14")
        @Assert(v.isNumber())
        @Assert(abs(v.asNumber() - 3.14) < 0.001)
```

# method TestParseSimpleValues.func testParseFloat()

## function:

实现 `` 中的 `testParseFloat` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testParseFloat() {
        let v = JsonValue.fromString("3.14")
        @Assert(v.isNumber())
        @Assert(abs(v.asNumber() - 3.14) < 0.001)
    }

    @TestCase
    func testParseNegativeFloat() {
        let v = JsonValue.fromString("-0.5")
        @Assert(v.isNumber())
        @Assert(abs(v.asNumber() - (-0.5)) < 0.001)
```

# method TestParseSimpleValues.func testParseNegativeFloat()

## function:

实现 `` 中的 `testParseNegativeFloat` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testParseNegativeFloat() {
        let v = JsonValue.fromString("-0.5")
        @Assert(v.isNumber())
        @Assert(abs(v.asNumber() - (-0.5)) < 0.001)
    }

    @TestCase
    func testParseScientificNotation() {
        let v = JsonValue.fromString("1e3")
        @Assert(v.isNumber())
        @Assert(abs(v.asNumber() - 1000.0) < 0.001)
```

# method TestParseSimpleValues.func testParseScientificNotation()

## function:

实现 `` 中的 `testParseScientificNotation` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testParseScientificNotation() {
        let v = JsonValue.fromString("1e3")
        @Assert(v.isNumber())
        @Assert(abs(v.asNumber() - 1000.0) < 0.001)
    }

    @TestCase
    func testParseScientificNotationWithSign() {
        let v = JsonValue.fromString("1.5e-2")
        @Assert(v.isNumber())
        @Assert(abs(v.asNumber() - 0.015) < 0.0001)
```

# method TestParseSimpleValues.func testParseScientificNotationWithSign()

## function:

实现 `` 中的 `testParseScientificNotationWithSign` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testParseScientificNotationWithSign() {
        let v = JsonValue.fromString("1.5e-2")
        @Assert(v.isNumber())
        @Assert(abs(v.asNumber() - 0.015) < 0.0001)
    }

    @TestCase
    func testParseSimpleString() {
        let v = JsonValue.fromString("\"hello\"")
        @Assert(v.isString())
        @Assert(v.asString(), "hello")
```

# method TestParseSimpleValues.func testParseSimpleString()

## function:

实现 `` 中的 `testParseSimpleString` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testParseSimpleString() {
        let v = JsonValue.fromString("\"hello\"")
        @Assert(v.isString())
        @Assert(v.asString(), "hello")
    }

    @TestCase
    func testParseEmptyString() {
        let v = JsonValue.fromString("\"\"")
        @Assert(v.isString())
        @Assert(v.asString(), "")
```

# method TestParseSimpleValues.func testParseEmptyString()

## function:

实现 `` 中的 `testParseEmptyString` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testParseEmptyString() {
        let v = JsonValue.fromString("\"\"")
        @Assert(v.isString())
        @Assert(v.asString(), "")
    }

    @TestCase
    func testParseStringWithEscapes() {
        let v = JsonValue.fromString("\"hello\\nworld\"")
        @Assert(v.isString())
        @Assert(v.asString(), "hello\nworld")
```

# method TestParseSimpleValues.func testParseStringWithEscapes()

## function:

实现 `` 中的 `testParseStringWithEscapes` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testParseStringWithEscapes() {
        let v = JsonValue.fromString("\"hello\\nworld\"")
        @Assert(v.isString())
        @Assert(v.asString(), "hello\nworld")
    }

    @TestCase
    func testParseStringWithTab() {
        let v = JsonValue.fromString("\"a\\tb\"")
        @Assert(v.isString())
        @Assert(v.asString(), "a\tb")
```

# method TestParseSimpleValues.func testParseStringWithTab()

## function:

实现 `` 中的 `testParseStringWithTab` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testParseStringWithTab() {
        let v = JsonValue.fromString("\"a\\tb\"")
        @Assert(v.isString())
        @Assert(v.asString(), "a\tb")
    }

    @TestCase
    func testParseStringWithEscapedQuote() {
        let v = JsonValue.fromString("\"say \\\"hi\\\"\"")
        @Assert(v.isString())
        @Assert(v.asString(), "say \"hi\"")
```

# method TestParseSimpleValues.func testParseStringWithEscapedQuote()

## function:

实现 `` 中的 `testParseStringWithEscapedQuote` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testParseStringWithEscapedQuote() {
        let v = JsonValue.fromString("\"say \\\"hi\\\"\"")
        @Assert(v.isString())
        @Assert(v.asString(), "say \"hi\"")
    }

    @TestCase
    func testParseStringWithBackslash() {
        let v = JsonValue.fromString("\"a\\\\b\"")
        @Assert(v.isString())
        @Assert(v.asString(), "a\\b")
```

# method TestParseSimpleValues.func testParseStringWithBackslash()

## function:

实现 `` 中的 `testParseStringWithBackslash` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testParseStringWithBackslash() {
        let v = JsonValue.fromString("\"a\\\\b\"")
        @Assert(v.isString())
        @Assert(v.asString(), "a\\b")
    }

    @TestCase
    func testParseStringWithSlash() {
        let v = JsonValue.fromString("\"a\\/b\"")
        @Assert(v.isString())
        @Assert(v.asString(), "a/b")
```

# method TestParseSimpleValues.func testParseStringWithSlash()

## function:

实现 `` 中的 `testParseStringWithSlash` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testParseStringWithSlash() {
        let v = JsonValue.fromString("\"a\\/b\"")
        @Assert(v.isString())
        @Assert(v.asString(), "a/b")
    }

    @TestCase
    func testParseStringWithUnicode() {
        let v = JsonValue.fromString("\"\\u4f60\\u597d\"")
        @Assert(v.isString())
        @Assert(v.asString(), "你好")
```

# method TestParseSimpleValues.func testParseStringWithUnicode()

## function:

实现 `` 中的 `testParseStringWithUnicode` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testParseStringWithUnicode() {
        let v = JsonValue.fromString("\"\\u4f60\\u597d\"")
        @Assert(v.isString())
        @Assert(v.asString(), "你好")
    }

    @TestCase
    func testParseStringWithUTF8() {
        let v = JsonValue.fromString("\"中文测试\"")
        @Assert(v.isString())
        @Assert(v.asString(), "中文测试")
```

# method TestParseSimpleValues.func testParseStringWithUTF8()

## function:

实现 `` 中的 `testParseStringWithUTF8` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testParseStringWithUTF8() {
        let v = JsonValue.fromString("\"中文测试\"")
        @Assert(v.isString())
        @Assert(v.asString(), "中文测试")
    }
}

@Test
class TestParseWhitespace {
    @TestCase
    func testWhitespaceAroundValue() {
```

# class TestParseWhitespace

## function:

封装 `` 中与 `TestParseWhitespace` 相关的数据和行为，是项目中的类级实现单元。

## kind:

class

## access:

internal

## extends:

none

## implements:

none

## properties:

- `internal let v: None`

## usage example:

```cangjie
class TestParseWhitespace {
    @TestCase
    func testWhitespaceAroundValue() {
        let v = JsonValue.fromString("  42  ")
        @Assert(v.isNumber())
        @Assert(abs(v.asNumber() - 42.0) < 0.001)
    }

    @TestCase
    func testWhitespaceInObject() {
        let v = JsonValue.fromString("{ \"a\" : 1 }")
        @Assert(v.isObject())
    }

    @TestCase
    func testNewlinesAndTabs() {
        let v = JsonValue.fromString("{\n\t\"x\": 1\n}")
        @Assert(v.isObject())
    }
}
```

# method TestParseWhitespace.func testWhitespaceAroundValue()

## function:

实现 `` 中的 `testWhitespaceAroundValue` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testWhitespaceAroundValue() {
        let v = JsonValue.fromString("  42  ")
        @Assert(v.isNumber())
        @Assert(abs(v.asNumber() - 42.0) < 0.001)
    }

    @TestCase
    func testWhitespaceInObject() {
        let v = JsonValue.fromString("{ \"a\" : 1 }")
        @Assert(v.isObject())
    }
```

# method TestParseWhitespace.func testWhitespaceInObject()

## function:

实现 `` 中的 `testWhitespaceInObject` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testWhitespaceInObject() {
        let v = JsonValue.fromString("{ \"a\" : 1 }")
        @Assert(v.isObject())
    }

    @TestCase
    func testNewlinesAndTabs() {
        let v = JsonValue.fromString("{\n\t\"x\": 1\n}")
        @Assert(v.isObject())
    }
}
```

# method TestParseWhitespace.func testNewlinesAndTabs()

## function:

实现 `` 中的 `testNewlinesAndTabs` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testNewlinesAndTabs() {
        let v = JsonValue.fromString("{\n\t\"x\": 1\n}")
        @Assert(v.isObject())
    }
}

@Test
class TestParseArray {
    @TestCase
    func testEmptyArray() {
        let v = JsonValue.fromString("[]")
```

# class TestParseArray

## function:

封装 `` 中与 `TestParseArray` 相关的数据和行为，是项目中的类级实现单元。

## kind:

class

## access:

internal

## extends:

none

## implements:

none

## properties:

- `internal let v: None`

- `internal let arr: None`

- `internal let inner: None`

## usage example:

```cangjie
class TestParseArray {
    @TestCase
    func testEmptyArray() {
        let v = JsonValue.fromString("[]")
        @Assert(v.isArray())
        let arr = (v as JsonArr).getOrThrow()
        @Assert(arr.size(), 0)
    }

    @TestCase
    func testSingleElementArray() {
        let v = JsonValue.fromString("[1]")
        @Assert(v.isArray())
        let arr = (v as JsonArr).getOrThrow()
        @Assert(arr.size(), 1)
        @Assert(abs(arr.get(0).asNumber() - 1.0) < 0.001)
    }

    @TestCase
    func testMixedArray() {
```

# method TestParseArray.func testEmptyArray()

## function:

实现 `` 中的 `testEmptyArray` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testEmptyArray() {
        let v = JsonValue.fromString("[]")
        @Assert(v.isArray())
        let arr = (v as JsonArr).getOrThrow()
        @Assert(arr.size(), 0)
    }

    @TestCase
    func testSingleElementArray() {
        let v = JsonValue.fromString("[1]")
        @Assert(v.isArray())
```

# method TestParseArray.func testSingleElementArray()

## function:

实现 `` 中的 `testSingleElementArray` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testSingleElementArray() {
        let v = JsonValue.fromString("[1]")
        @Assert(v.isArray())
        let arr = (v as JsonArr).getOrThrow()
        @Assert(arr.size(), 1)
        @Assert(abs(arr.get(0).asNumber() - 1.0) < 0.001)
    }

    @TestCase
    func testMixedArray() {
        let v = JsonValue.fromString("[1, \"two\", true, null, 3.14]")
```

# method TestParseArray.func testMixedArray()

## function:

实现 `` 中的 `testMixedArray` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testMixedArray() {
        let v = JsonValue.fromString("[1, \"two\", true, null, 3.14]")
        @Assert(v.isArray())
        let arr = (v as JsonArr).getOrThrow()
        @Assert(arr.size(), 5)
        @Assert(arr.get(0).isNumber())
        @Assert(arr.get(1).isString())
        @Assert(arr.get(1).asString(), "two")
        @Assert(arr.get(2).isBool())
        @Assert(arr.get(2).asBool(), true)
        @Assert(arr.get(3).isNull())
```

# method TestParseArray.func testNestedArray()

## function:

实现 `` 中的 `testNestedArray` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testNestedArray() {
        let v = JsonValue.fromString("[[1, 2], [3, 4]]")
        @Assert(v.isArray())
        let arr = (v as JsonArr).getOrThrow()
        @Assert(arr.size(), 2)
        let inner = (arr.get(0) as JsonArr).getOrThrow()
        @Assert(inner.size(), 2)
        @Assert(abs(inner.get(0).asNumber() - 1.0) < 0.001)
    }
}
```

# class TestParseObject

## function:

封装 `` 中与 `TestParseObject` 相关的数据和行为，是项目中的类级实现单元。

## kind:

class

## access:

internal

## extends:

none

## implements:

none

## properties:

- `internal let v: None`

- `internal let obj: None`

- `internal let inner: None`

## usage example:

```cangjie
class TestParseObject {
    @TestCase
    func testEmptyObject() {
        let v = JsonValue.fromString("{}")
        @Assert(v.isObject())
        let obj = (v as JsonObj).getOrThrow()
        @Assert(obj.size(), 0)
    }

    @TestCase
    func testSimpleObject() {
        let v = JsonValue.fromString("{\"name\": \"Alice\", \"age\": 30}")
        @Assert(v.isObject())
        let obj = (v as JsonObj).getOrThrow()
        @Assert(obj.size(), 2)
        @Assert(obj.get("name").getOrThrow().asString(), "Alice")
        @Assert(abs(obj.get("age").getOrThrow().asNumber() - 30.0) < 0.001)
    }

    @TestCase
```

# method TestParseObject.func testEmptyObject()

## function:

实现 `` 中的 `testEmptyObject` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testEmptyObject() {
        let v = JsonValue.fromString("{}")
        @Assert(v.isObject())
        let obj = (v as JsonObj).getOrThrow()
        @Assert(obj.size(), 0)
    }

    @TestCase
    func testSimpleObject() {
        let v = JsonValue.fromString("{\"name\": \"Alice\", \"age\": 30}")
        @Assert(v.isObject())
```

# method TestParseObject.func testSimpleObject()

## function:

实现 `` 中的 `testSimpleObject` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testSimpleObject() {
        let v = JsonValue.fromString("{\"name\": \"Alice\", \"age\": 30}")
        @Assert(v.isObject())
        let obj = (v as JsonObj).getOrThrow()
        @Assert(obj.size(), 2)
        @Assert(obj.get("name").getOrThrow().asString(), "Alice")
        @Assert(abs(obj.get("age").getOrThrow().asNumber() - 30.0) < 0.001)
    }

    @TestCase
    func testNestedObject() {
```

# method TestParseObject.func testNestedObject()

## function:

实现 `` 中的 `testNestedObject` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testNestedObject() {
        let v = JsonValue.fromString("{\"a\": {\"b\": 1}}")
        @Assert(v.isObject())
        let obj = (v as JsonObj).getOrThrow()
        let inner = (obj.get("a").getOrThrow() as JsonObj).getOrThrow()
        @Assert(abs(inner.get("b").getOrThrow().asNumber() - 1.0) < 0.001)
    }

    @TestCase
    func testObjectContainsKey() {
        let v = JsonValue.fromString("{\"key\": \"value\"}")
```

# method TestParseObject.func testObjectContainsKey()

## function:

实现 `` 中的 `testObjectContainsKey` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testObjectContainsKey() {
        let v = JsonValue.fromString("{\"key\": \"value\"}")
        let obj = (v as JsonObj).getOrThrow()
        @Assert(obj.containsKey("key"))
        @Assert(!obj.containsKey("missing"))
    }

    @TestCase
    func testObjectGetMissing() {
        let v = JsonValue.fromString("{\"key\": \"value\"}")
        let obj = (v as JsonObj).getOrThrow()
```

# method TestParseObject.func testObjectGetMissing()

## function:

实现 `` 中的 `testObjectGetMissing` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testObjectGetMissing() {
        let v = JsonValue.fromString("{\"key\": \"value\"}")
        let obj = (v as JsonObj).getOrThrow()
        @Assert(obj.get("missing").isNone())
    }
}

@Test
class TestParseComplex {
    @TestCase
    func testComplexJson() {
```

# class TestParseComplex

## function:

封装 `` 中与 `TestParseComplex` 相关的数据和行为，是项目中的类级实现单元。

## kind:

class

## access:

internal

## extends:

none

## implements:

none

## properties:

- `internal let input: None`

- `internal let v: None`

- `internal let obj: None`

- `internal let scores: None`

- `internal let a: None`

- `internal let b: None`

- `internal let c: None`

- `internal let items: None`

- `internal let item1: None`

## usage example:

```cangjie
class TestParseComplex {
    @TestCase
    func testComplexJson() {
        let input = ##"{"name":"Alice","age":30,"active":true,"scores":[90,85,95],"address":null}"##
        let v = JsonValue.fromString(input)
        @Assert(v.isObject())
        let obj = (v as JsonObj).getOrThrow()
        @Assert(obj.get("name").getOrThrow().asString(), "Alice")
        @Assert(abs(obj.get("age").getOrThrow().asNumber() - 30.0) < 0.001)
        @Assert(obj.get("active").getOrThrow().asBool(), true)
        @Assert(obj.get("address").getOrThrow().isNull())
        let scores = (obj.get("scores").getOrThrow() as JsonArr).getOrThrow()
        @Assert(scores.size(), 3)
        @Assert(abs(scores.get(0).asNumber() - 90.0) < 0.001)
    }

    @TestCase
    func testDeeplyNestedJson() {
        let input = ##"{"a":{"b":{"c":{"d":42}}}}"##
        let v = JsonValue.fromString(input)
```

# method TestParseComplex.func testComplexJson()

## function:

实现 `` 中的 `testComplexJson` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testComplexJson() {
        let input = ##"{"name":"Alice","age":30,"active":true,"scores":[90,85,95],"address":null}"##
        let v = JsonValue.fromString(input)
        @Assert(v.isObject())
        let obj = (v as JsonObj).getOrThrow()
        @Assert(obj.get("name").getOrThrow().asString(), "Alice")
        @Assert(abs(obj.get("age").getOrThrow().asNumber() - 30.0) < 0.001)
        @Assert(obj.get("active").getOrThrow().asBool(), true)
        @Assert(obj.get("address").getOrThrow().isNull())
        let scores = (obj.get("scores").getOrThrow() as JsonArr).getOrThrow()
        @Assert(scores.size(), 3)
```

# method TestParseComplex.func testDeeplyNestedJson()

## function:

实现 `` 中的 `testDeeplyNestedJson` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testDeeplyNestedJson() {
        let input = ##"{"a":{"b":{"c":{"d":42}}}}"##
        let v = JsonValue.fromString(input)
        let obj = (v as JsonObj).getOrThrow()
        let a = (obj.get("a").getOrThrow() as JsonObj).getOrThrow()
        let b = (a.get("b").getOrThrow() as JsonObj).getOrThrow()
        let c = (b.get("c").getOrThrow() as JsonObj).getOrThrow()
        @Assert(abs(c.get("d").getOrThrow().asNumber() - 42.0) < 0.001)
    }

    @TestCase
```

# method TestParseComplex.func testObjectWithArray()

## function:

实现 `` 中的 `testObjectWithArray` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testObjectWithArray() {
        let input = ##"{"items":[{"id":1,"name":"a"},{"id":2,"name":"b"}]}"##
        let v = JsonValue.fromString(input)
        let obj = (v as JsonObj).getOrThrow()
        let items = (obj.get("items").getOrThrow() as JsonArr).getOrThrow()
        @Assert(items.size(), 2)
        let item1 = (items.get(0) as JsonObj).getOrThrow()
        @Assert(abs(item1.get("id").getOrThrow().asNumber() - 1.0) < 0.001)
        @Assert(item1.get("name").getOrThrow().asString(), "a")
    }
}
```

# class TestSerialize

## function:

封装 `` 中与 `TestSerialize` 相关的数据和行为，是项目中的类级实现单元。

## kind:

class

## access:

internal

## extends:

none

## implements:

none

## properties:

- `internal let s: None`

- `internal let arr: None`

- `internal let obj: None`

## usage example:

```cangjie
class TestSerialize {
    @TestCase
    func testSerializeNull() {
        @Assert(JsonNull().toString(), "null")
    }

    @TestCase
    func testSerializeTrue() {
        @Assert(JsonBool(true).toString(), "true")
    }

    @TestCase
    func testSerializeFalse() {
        @Assert(JsonBool(false).toString(), "false")
    }

    @TestCase
    func testSerializeInteger() {
        let s = JsonNum(42.0).toString()
        @Assert(s, "42")
```

# method TestSerialize.func testSerializeNull()

## function:

实现 `` 中的 `testSerializeNull` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testSerializeNull() {
        @Assert(JsonNull().toString(), "null")
    }

    @TestCase
    func testSerializeTrue() {
        @Assert(JsonBool(true).toString(), "true")
    }

    @TestCase
    func testSerializeFalse() {
```

# method TestSerialize.func testSerializeTrue()

## function:

实现 `` 中的 `testSerializeTrue` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testSerializeTrue() {
        @Assert(JsonBool(true).toString(), "true")
    }

    @TestCase
    func testSerializeFalse() {
        @Assert(JsonBool(false).toString(), "false")
    }

    @TestCase
    func testSerializeInteger() {
```

# method TestSerialize.func testSerializeFalse()

## function:

实现 `` 中的 `testSerializeFalse` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testSerializeFalse() {
        @Assert(JsonBool(false).toString(), "false")
    }

    @TestCase
    func testSerializeInteger() {
        let s = JsonNum(42.0).toString()
        @Assert(s, "42")
    }

    @TestCase
```

# method TestSerialize.func testSerializeInteger()

## function:

实现 `` 中的 `testSerializeInteger` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testSerializeInteger() {
        let s = JsonNum(42.0).toString()
        @Assert(s, "42")
    }

    @TestCase
    func testSerializeFloat() {
        let s = JsonNum(3.14).toString()
        @Assert(s.startsWith("3.14"))
    }
```

# method TestSerialize.func testSerializeFloat()

## function:

实现 `` 中的 `testSerializeFloat` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testSerializeFloat() {
        let s = JsonNum(3.14).toString()
        @Assert(s.startsWith("3.14"))
    }

    @TestCase
    func testSerializeString() {
        @Assert(JsonStr("hello").toString(), "\"hello\"")
    }

    @TestCase
```

# method TestSerialize.func testSerializeString()

## function:

实现 `` 中的 `testSerializeString` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testSerializeString() {
        @Assert(JsonStr("hello").toString(), "\"hello\"")
    }

    @TestCase
    func testSerializeStringWithEscapes() {
        @Assert(JsonStr("a\nb").toString(), "\"a\\nb\"")
    }

    @TestCase
    func testSerializeEmptyArray() {
```

# method TestSerialize.func testSerializeStringWithEscapes()

## function:

实现 `` 中的 `testSerializeStringWithEscapes` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testSerializeStringWithEscapes() {
        @Assert(JsonStr("a\nb").toString(), "\"a\\nb\"")
    }

    @TestCase
    func testSerializeEmptyArray() {
        @Assert(JsonArr().toString(), "[]")
    }

    @TestCase
    func testSerializeArray() {
```

# method TestSerialize.func testSerializeEmptyArray()

## function:

实现 `` 中的 `testSerializeEmptyArray` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testSerializeEmptyArray() {
        @Assert(JsonArr().toString(), "[]")
    }

    @TestCase
    func testSerializeArray() {
        let arr = JsonArr()
        arr.add(JsonNum(1.0))
        arr.add(JsonNum(2.0))
        @Assert(arr.toString(), "[1,2]")
    }
```

# method TestSerialize.func testSerializeArray()

## function:

实现 `` 中的 `testSerializeArray` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testSerializeArray() {
        let arr = JsonArr()
        arr.add(JsonNum(1.0))
        arr.add(JsonNum(2.0))
        @Assert(arr.toString(), "[1,2]")
    }

    @TestCase
    func testSerializeEmptyObject() {
        @Assert(JsonObj().toString(), "{}")
    }
```

# method TestSerialize.func testSerializeEmptyObject()

## function:

实现 `` 中的 `testSerializeEmptyObject` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testSerializeEmptyObject() {
        @Assert(JsonObj().toString(), "{}")
    }

    @TestCase
    func testSerializeObject() {
        let obj = JsonObj()
        obj.put("a", JsonNum(1.0))
        obj.put("b", JsonStr("hello"))
        @Assert(obj.toString(), "{\"a\":1,\"b\":\"hello\"}")
    }
```

# method TestSerialize.func testSerializeObject()

## function:

实现 `` 中的 `testSerializeObject` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testSerializeObject() {
        let obj = JsonObj()
        obj.put("a", JsonNum(1.0))
        obj.put("b", JsonStr("hello"))
        @Assert(obj.toString(), "{\"a\":1,\"b\":\"hello\"}")
    }
}

@Test
class TestRoundTrip {
    @TestCase
```

# class TestRoundTrip

## function:

封装 `` 中与 `TestRoundTrip` 相关的数据和行为，是项目中的类级实现单元。

## kind:

class

## access:

internal

## extends:

none

## implements:

none

## properties:

- `internal let s: None`

- `internal let v: None`

## usage example:

```cangjie
class TestRoundTrip {
    @TestCase
    func testRoundTripNull() {
        let s = "null"
        let v = JsonValue.fromString(s)
        @Assert(v.toString(), s)
    }

    @TestCase
    func testRoundTripBool() {
        let s = "true"
        let v = JsonValue.fromString(s)
        @Assert(v.toString(), s)
    }

    @TestCase
    func testRoundTripNumber() {
        let s = "42"
        let v = JsonValue.fromString(s)
        @Assert(v.toString(), s)
```

# method TestRoundTrip.func testRoundTripNull()

## function:

实现 `` 中的 `testRoundTripNull` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testRoundTripNull() {
        let s = "null"
        let v = JsonValue.fromString(s)
        @Assert(v.toString(), s)
    }

    @TestCase
    func testRoundTripBool() {
        let s = "true"
        let v = JsonValue.fromString(s)
        @Assert(v.toString(), s)
```

# method TestRoundTrip.func testRoundTripBool()

## function:

实现 `` 中的 `testRoundTripBool` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testRoundTripBool() {
        let s = "true"
        let v = JsonValue.fromString(s)
        @Assert(v.toString(), s)
    }

    @TestCase
    func testRoundTripNumber() {
        let s = "42"
        let v = JsonValue.fromString(s)
        @Assert(v.toString(), s)
```

# method TestRoundTrip.func testRoundTripNumber()

## function:

实现 `` 中的 `testRoundTripNumber` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testRoundTripNumber() {
        let s = "42"
        let v = JsonValue.fromString(s)
        @Assert(v.toString(), s)
    }

    @TestCase
    func testRoundTripString() {
        let s = "\"hello world\""
        let v = JsonValue.fromString(s)
        @Assert(v.toString(), s)
```

# method TestRoundTrip.func testRoundTripString()

## function:

实现 `` 中的 `testRoundTripString` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testRoundTripString() {
        let s = "\"hello world\""
        let v = JsonValue.fromString(s)
        @Assert(v.toString(), s)
    }

    @TestCase
    func testRoundTripArray() {
        let s = "[1,2,3]"
        let v = JsonValue.fromString(s)
        @Assert(v.toString(), s)
```

# method TestRoundTrip.func testRoundTripArray()

## function:

实现 `` 中的 `testRoundTripArray` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testRoundTripArray() {
        let s = "[1,2,3]"
        let v = JsonValue.fromString(s)
        @Assert(v.toString(), s)
    }

    @TestCase
    func testRoundTripObject() {
        let s = ##"{"name":"Alice","age":30}"##
        let v = JsonValue.fromString(s)
        @Assert(v.toString(), s)
```

# method TestRoundTrip.func testRoundTripObject()

## function:

实现 `` 中的 `testRoundTripObject` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testRoundTripObject() {
        let s = ##"{"name":"Alice","age":30}"##
        let v = JsonValue.fromString(s)
        @Assert(v.toString(), s)
    }

    @TestCase
    func testRoundTripComplex() {
        let s = ##"{"a":[1,true,null,"hi"],"b":{"c":3}}"##
        let v = JsonValue.fromString(s)
        @Assert(v.toString(), s)
```

# method TestRoundTrip.func testRoundTripComplex()

## function:

实现 `` 中的 `testRoundTripComplex` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testRoundTripComplex() {
        let s = ##"{"a":[1,true,null,"hi"],"b":{"c":3}}"##
        let v = JsonValue.fromString(s)
        @Assert(v.toString(), s)
    }
}

@Test
class TestErrorHandling {
    @TestCase
    func testEmptyInput() {
```

# class TestBuildValues

## function:

封装 `` 中与 `TestBuildValues` 相关的数据和行为，是项目中的类级实现单元。

## kind:

class

## access:

internal

## extends:

none

## implements:

none

## properties:

- `internal let arr: None`

- `internal let obj: None`

- `internal let keys: None`

## usage example:

```cangjie
class TestBuildValues {
    @TestCase
    func testBuildArray() {
        let arr = JsonArr()
        arr.add(JsonNum(1.0))
        arr.add(JsonStr("hello"))
        arr.add(JsonBool(true))
        arr.add(JsonNull())
        @Assert(arr.size(), 4)
        @Assert(abs(arr.get(0).asNumber() - 1.0) < 0.001)
        @Assert(arr.get(1).asString(), "hello")
        @Assert(arr.get(2).asBool(), true)
        @Assert(arr.get(3).isNull())
    }

    @TestCase
    func testBuildObject() {
        let obj = JsonObj()
        obj.put("name", JsonStr("Alice"))
        obj.put("age", JsonNum(30.0))
```

# method TestBuildValues.func testBuildArray()

## function:

实现 `` 中的 `testBuildArray` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testBuildArray() {
        let arr = JsonArr()
        arr.add(JsonNum(1.0))
        arr.add(JsonStr("hello"))
        arr.add(JsonBool(true))
        arr.add(JsonNull())
        @Assert(arr.size(), 4)
        @Assert(abs(arr.get(0).asNumber() - 1.0) < 0.001)
        @Assert(arr.get(1).asString(), "hello")
        @Assert(arr.get(2).asBool(), true)
        @Assert(arr.get(3).isNull())
```

# method TestBuildValues.func testBuildObject()

## function:

实现 `` 中的 `testBuildObject` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testBuildObject() {
        let obj = JsonObj()
        obj.put("name", JsonStr("Alice"))
        obj.put("age", JsonNum(30.0))
        @Assert(obj.size(), 2)
        @Assert(obj.get("name").getOrThrow().asString(), "Alice")
        @Assert(abs(obj.get("age").getOrThrow().asNumber() - 30.0) < 0.001)
    }

    @TestCase
    func testObjectPutOverwrite() {
```

# method TestBuildValues.func testObjectPutOverwrite()

## function:

实现 `` 中的 `testObjectPutOverwrite` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testObjectPutOverwrite() {
        let obj = JsonObj()
        obj.put("key", JsonStr("old"))
        obj.put("key", JsonStr("new"))
        @Assert(obj.size(), 1)
        @Assert(obj.get("key").getOrThrow().asString(), "new")
    }

    @TestCase
    func testObjectKeys() {
        let obj = JsonObj()
```

# method TestBuildValues.func testObjectKeys()

## function:

实现 `` 中的 `testObjectKeys` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testObjectKeys() {
        let obj = JsonObj()
        obj.put("a", JsonNum(1.0))
        obj.put("b", JsonNum(2.0))
        let keys = obj.keys()
        @Assert(keys.size, 2)
        @Assert(keys[0], "a")
        @Assert(keys[1], "b")
    }

    @TestCase
```

# method TestBuildValues.func testTypeChecks()

## function:

实现 `` 中的 `testTypeChecks` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testTypeChecks() {
        @Assert(JsonNull().isNull())
        @Assert(!JsonNull().isBool())
        @Assert(!JsonNull().isNumber())
        @Assert(!JsonNull().isString())
        @Assert(!JsonNull().isArray())
        @Assert(!JsonNull().isObject())

        @Assert(JsonBool(true).isBool())
        @Assert(JsonNum(1.0).isNumber())
        @Assert(JsonStr("x").isString())
```

# method TestBuildValues.func testTypeMismatchThrows()

## function:

实现 `` 中的 `testTypeMismatchThrows` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testTypeMismatchThrows() {
        try {
            JsonNull().asBool()
            @Fail("Should have thrown")
        } catch (e: JsonException) {
            @Assert(true)
        }
        try {
            JsonNull().asNumber()
            @Fail("Should have thrown")
        } catch (e: JsonException) {
```

# module tests/json_parser/project/src/json_value.cj

## function:

负责测试 `json_value` 相关功能是否符合预期。

## usage example:

```cangjie
# source: tests/json_parser/project/src/json_value.cj
```

## package:
json_parser

## imports:

- `std.collection.*`

# class JsonException

## function:

Custom exception for JSON parsing errors。

## kind:

class

## access:

public

## extends:

none

## implements:

none

## usage example:

```cangjie
public class JsonException <: Exception {
    public init(message: String) {
        super(message)
    }
}
```

# class JsonNull

## function:

JSON null value。

## kind:

class

## access:

public

## extends:

none

## implements:

none

## usage example:

```cangjie
public class JsonNull <: JsonValue {
    public init() {}

    public override func isNull(): Bool { return true }

    public func toString(): String { return "null" }
}
```

# method JsonNull.func toString(): String

## function:

实现 `` 中的 `toString` 逻辑，是该模块中的可调用函数单元。

## access:

public

## is_static:

False

## usage example:

```cangjie
public func toString(): String { return "null" }
}

// JSON boolean value
public class JsonBool <: JsonValue {
    let _value: Bool

    public init(value: Bool) {
        _value = value
    }
```

# class JsonBool

## function:

JSON boolean value。

## kind:

class

## access:

public

## extends:

none

## implements:

none

## properties:

- `internal let _value: Bool`

## usage example:

```cangjie
public class JsonBool <: JsonValue {
    let _value: Bool

    public init(value: Bool) {
        _value = value
    }

    public override func isBool(): Bool { return true }
    public override func asBool(): Bool { return _value }

    public func toString(): String {
        if (_value) {
            return "true"
        } else {
            return "false"
        }
    }
}
```

# method JsonBool.func toString(): String

## function:

实现 `` 中的 `toString` 逻辑，是该模块中的可调用函数单元。

## access:

public

## is_static:

False

## usage example:

```cangjie
public func toString(): String {
        if (_value) {
            return "true"
        } else {
            return "false"
        }
    }
}

// JSON number value (stored as Float64)
public class JsonNum <: JsonValue {
```

# class JsonNum

## function:

JSON number value (stored as Float64)。

## kind:

class

## access:

public

## extends:

none

## implements:

none

## properties:

- `internal let _value: Float64`

- `internal let s: None`

## usage example:

```cangjie
public class JsonNum <: JsonValue {
    let _value: Float64

    public init(value: Float64) {
        _value = value
    }

    public override func isNumber(): Bool { return true }
    public override func asNumber(): Float64 { return _value }

    public func toString(): String {
        let s = "${_value}"
        // If the value is a whole number, remove trailing ".0" for clean JSON output
        if (s.endsWith(".000000")) {
            return s.removeSuffix(".000000")
        }
        return s
    }
}
```

# method JsonNum.func toString(): String

## function:

实现 `` 中的 `toString` 逻辑，是该模块中的可调用函数单元。

## access:

public

## is_static:

False

## usage example:

```cangjie
public func toString(): String {
        let s = "${_value}"
        // If the value is a whole number, remove trailing ".0" for clean JSON output
        if (s.endsWith(".000000")) {
            return s.removeSuffix(".000000")
        }
        return s
    }
}

// JSON string value
```

# class JsonStr

## function:

JSON string value。

## kind:

class

## access:

public

## extends:

none

## implements:

none

## properties:

- `internal let _value: String`

## usage example:

```cangjie
public class JsonStr <: JsonValue {
    let _value: String

    public init(value: String) {
        _value = value
    }

    public override func isString(): Bool { return true }
    public override func asString(): String { return _value }

    public func toString(): String {
        return escapeJsonString(_value)
    }
}
```

# method JsonStr.func toString(): String

## function:

实现 `` 中的 `toString` 逻辑，是该模块中的可调用函数单元。

## access:

public

## is_static:

False

## usage example:

```cangjie
public func toString(): String {
        return escapeJsonString(_value)
    }
}

// Helper function: escape a string for JSON output
func escapeJsonString(s: String): String {
    let sb = StringBuilder()
    sb.append("\"")
    for (r in s.runes()) {
        if (r == r'"') {
```

# class JsonArr

## function:

JSON array value。

## kind:

class

## access:

public

## extends:

none

## implements:

none

## properties:

- `internal let _elements: ArrayList<JsonValue>`

- `internal let sb: None`

## usage example:

```cangjie
public class JsonArr <: JsonValue {
    let _elements: ArrayList<JsonValue> = ArrayList<JsonValue>()

    public init() {}

    public override func isArray(): Bool { return true }

    public func size(): Int64 { return _elements.size }

    public func add(value: JsonValue): Unit {
        _elements.add(value)
    }

    public func get(index: Int64): JsonValue {
        return _elements[index]
    }

    public func toString(): String {
        let sb = StringBuilder()
        sb.append("[")
```

# method JsonArr.func size(): Int64

## function:

实现 `` 中的 `size` 逻辑，是该模块中的可调用函数单元。

## access:

public

## is_static:

False

## usage example:

```cangjie
public func size(): Int64 { return _elements.size }

    public func add(value: JsonValue): Unit {
        _elements.add(value)
    }

    public func get(index: Int64): JsonValue {
        return _elements[index]
    }

    public func toString(): String {
```

# method JsonArr.func add(value: JsonValue): Unit

## function:

实现 `` 中的 `add` 逻辑，是该模块中的可调用函数单元。

## access:

public

## is_static:

False

## usage example:

```cangjie
public func add(value: JsonValue): Unit {
        _elements.add(value)
    }

    public func get(index: Int64): JsonValue {
        return _elements[index]
    }

    public func toString(): String {
        let sb = StringBuilder()
        sb.append("[")
```

# method JsonArr.func get(index: Int64): JsonValue

## function:

获取与 `get` 相关的数据或对象，供项目内部逻辑调用。

## access:

public

## is_static:

False

## usage example:

```cangjie
public func get(index: Int64): JsonValue {
        return _elements[index]
    }

    public func toString(): String {
        let sb = StringBuilder()
        sb.append("[")
        for (i in 0.._elements.size) {
            if (i > 0) {
                sb.append(",")
            }
```

# method JsonArr.func toString(): String

## function:

实现 `` 中的 `toString` 逻辑，是该模块中的可调用函数单元。

## access:

public

## is_static:

False

## usage example:

```cangjie
public func toString(): String {
        let sb = StringBuilder()
        sb.append("[")
        for (i in 0.._elements.size) {
            if (i > 0) {
                sb.append(",")
            }
            sb.append(_elements[i].toString())
        }
        sb.append("]")
        return sb.toString()
```

# class JsonObj

## function:

JSON object value。

## kind:

class

## access:

public

## extends:

none

## implements:

none

## properties:

- `internal let _keys: ArrayList<String>`

- `internal let _values: ArrayList<JsonValue>`

- `internal let sb: None`

## usage example:

```cangjie
public class JsonObj <: JsonValue {
    let _keys: ArrayList<String> = ArrayList<String>()
    let _values: ArrayList<JsonValue> = ArrayList<JsonValue>()

    public init() {}

    public override func isObject(): Bool { return true }

    public func size(): Int64 { return _keys.size }

    public func get(key: String): ?JsonValue {
        for (i in 0.._keys.size) {
            if (_keys[i] == key) {
                return _values[i]
            }
        }
        return None
    }

    public func put(key: String, value: JsonValue): Unit {
```

# method JsonObj.func size(): Int64

## function:

实现 `` 中的 `size` 逻辑，是该模块中的可调用函数单元。

## access:

public

## is_static:

False

## usage example:

```cangjie
public func size(): Int64 { return _keys.size }

    public func get(key: String): ?JsonValue {
        for (i in 0.._keys.size) {
            if (_keys[i] == key) {
                return _values[i]
            }
        }
        return None
    }
```

# method JsonObj.func get(key: String): ?JsonValue

## function:

获取与 `get` 相关的数据或对象，供项目内部逻辑调用。

## access:

public

## is_static:

False

## usage example:

```cangjie
public func get(key: String): ?JsonValue {
        for (i in 0.._keys.size) {
            if (_keys[i] == key) {
                return _values[i]
            }
        }
        return None
    }

    public func put(key: String, value: JsonValue): Unit {
        for (i in 0.._keys.size) {
```

# method JsonObj.func put(key: String, value: JsonValue): Unit

## function:

实现 `` 中的 `put` 逻辑，是该模块中的可调用函数单元。

## access:

public

## is_static:

False

## usage example:

```cangjie
public func put(key: String, value: JsonValue): Unit {
        for (i in 0.._keys.size) {
            if (_keys[i] == key) {
                _values[i] = value
                return
            }
        }
        _keys.add(key)
        _values.add(value)
    }
```

# method JsonObj.func containsKey(key: String): Bool

## function:

实现 `` 中的 `containsKey` 逻辑，是该模块中的可调用函数单元。

## access:

public

## is_static:

False

## usage example:

```cangjie
public func containsKey(key: String): Bool {
        for (i in 0.._keys.size) {
            if (_keys[i] == key) {
                return true
            }
        }
        return false
    }

    public func keys(): ArrayList<String> {
        return _keys
```

# method JsonObj.func keys(): ArrayList<String>

## function:

实现 `` 中的 `keys` 逻辑，是该模块中的可调用函数单元。

## access:

public

## is_static:

False

## usage example:

```cangjie
public func keys(): ArrayList<String> {
        return _keys
    }

    public func toString(): String {
        let sb = StringBuilder()
        sb.append("{")
        for (i in 0.._keys.size) {
            if (i > 0) {
                sb.append(",")
            }
```

# method JsonObj.func toString(): String

## function:

实现 `` 中的 `toString` 逻辑，是该模块中的可调用函数单元。

## access:

public

## is_static:

False

## usage example:

```cangjie
public func toString(): String {
        let sb = StringBuilder()
        sb.append("{")
        for (i in 0.._keys.size) {
            if (i > 0) {
                sb.append(",")
            }
            sb.append(escapeJsonString(_keys[i]))
            sb.append(":")
            sb.append(_values[i].toString())
        }
```

# func func isNull(): Bool

## function:

Type checking methods。

## access:

public

## usage example:

```cangjie
public open func isNull(): Bool { return false }
    public open func isBool(): Bool { return false }
    public open func isNumber(): Bool { return false }
    public open func isString(): Bool { return false }
    public open func isArray(): Bool { return false }
    public open func isObject(): Bool { return false }

    // Safe type casting methods (throw JsonException if type mismatch)
    public open func asBool(): Bool { throw JsonException("Not a boolean") }
    public open func asNumber(): Float64 { throw JsonException("Not a number") }
    public open func asString(): String { throw JsonException("Not a string") }
```

# func func isBool(): Bool

## function:

实现 `` 中的 `isBool` 逻辑，是该模块中的可调用函数单元。

## access:

public

## usage example:

```cangjie
public open func isBool(): Bool { return false }
    public open func isNumber(): Bool { return false }
    public open func isString(): Bool { return false }
    public open func isArray(): Bool { return false }
    public open func isObject(): Bool { return false }

    // Safe type casting methods (throw JsonException if type mismatch)
    public open func asBool(): Bool { throw JsonException("Not a boolean") }
    public open func asNumber(): Float64 { throw JsonException("Not a number") }
    public open func asString(): String { throw JsonException("Not a string") }
```

# func func isNumber(): Bool

## function:

实现 `` 中的 `isNumber` 逻辑，是该模块中的可调用函数单元。

## access:

public

## usage example:

```cangjie
public open func isNumber(): Bool { return false }
    public open func isString(): Bool { return false }
    public open func isArray(): Bool { return false }
    public open func isObject(): Bool { return false }

    // Safe type casting methods (throw JsonException if type mismatch)
    public open func asBool(): Bool { throw JsonException("Not a boolean") }
    public open func asNumber(): Float64 { throw JsonException("Not a number") }
    public open func asString(): String { throw JsonException("Not a string") }

    // Parse a JSON string into a JsonValue
```

# func func isString(): Bool

## function:

实现 `` 中的 `isString` 逻辑，是该模块中的可调用函数单元。

## access:

public

## usage example:

```cangjie
public open func isString(): Bool { return false }
    public open func isArray(): Bool { return false }
    public open func isObject(): Bool { return false }

    // Safe type casting methods (throw JsonException if type mismatch)
    public open func asBool(): Bool { throw JsonException("Not a boolean") }
    public open func asNumber(): Float64 { throw JsonException("Not a number") }
    public open func asString(): String { throw JsonException("Not a string") }

    // Parse a JSON string into a JsonValue
    public static func fromString(input: String): JsonValue {
```

# func func isArray(): Bool

## function:

实现 `` 中的 `isArray` 逻辑，是该模块中的可调用函数单元。

## access:

public

## usage example:

```cangjie
public open func isArray(): Bool { return false }
    public open func isObject(): Bool { return false }

    // Safe type casting methods (throw JsonException if type mismatch)
    public open func asBool(): Bool { throw JsonException("Not a boolean") }
    public open func asNumber(): Float64 { throw JsonException("Not a number") }
    public open func asString(): String { throw JsonException("Not a string") }

    // Parse a JSON string into a JsonValue
    public static func fromString(input: String): JsonValue {
        let parser = JsonParser(input)
```

# func func isObject(): Bool

## function:

实现 `` 中的 `isObject` 逻辑，是该模块中的可调用函数单元。

## access:

public

## usage example:

```cangjie
public open func isObject(): Bool { return false }

    // Safe type casting methods (throw JsonException if type mismatch)
    public open func asBool(): Bool { throw JsonException("Not a boolean") }
    public open func asNumber(): Float64 { throw JsonException("Not a number") }
    public open func asString(): String { throw JsonException("Not a string") }

    // Parse a JSON string into a JsonValue
    public static func fromString(input: String): JsonValue {
        let parser = JsonParser(input)
        return parser.parse()
```

# func func asBool(): Bool

## function:

Safe type casting methods (throw JsonException if type mismatch)。

## access:

public

## usage example:

```cangjie
public open func asBool(): Bool { throw JsonException("Not a boolean") }
    public open func asNumber(): Float64 { throw JsonException("Not a number") }
    public open func asString(): String { throw JsonException("Not a string") }

    // Parse a JSON string into a JsonValue
    public static func fromString(input: String): JsonValue {
        let parser = JsonParser(input)
        return parser.parse()
    }
}
```

# func func asNumber(): Float64

## function:

实现 `` 中的 `asNumber` 逻辑，是该模块中的可调用函数单元。

## access:

public

## usage example:

```cangjie
public open func asNumber(): Float64 { throw JsonException("Not a number") }
    public open func asString(): String { throw JsonException("Not a string") }

    // Parse a JSON string into a JsonValue
    public static func fromString(input: String): JsonValue {
        let parser = JsonParser(input)
        return parser.parse()
    }
}

// JSON null value
```

# func func asString(): String

## function:

实现 `` 中的 `asString` 逻辑，是该模块中的可调用函数单元。

## access:

public

## usage example:

```cangjie
public open func asString(): String { throw JsonException("Not a string") }

    // Parse a JSON string into a JsonValue
    public static func fromString(input: String): JsonValue {
        let parser = JsonParser(input)
        return parser.parse()
    }
}

// JSON null value
public class JsonNull <: JsonValue {
```

# func func fromString(input: String): JsonValue

## function:

Parse a JSON string into a JsonValue。

## access:

public

## usage example:

```cangjie
public static func fromString(input: String): JsonValue {
        let parser = JsonParser(input)
        return parser.parse()
    }
}

// JSON null value
public class JsonNull <: JsonValue {
    public init() {}

    public override func isNull(): Bool { return true }
```

# func func escapeJsonString(s: String): String

## function:

Helper function: escape a string for JSON output。

## access:

internal

## usage example:

```cangjie
func escapeJsonString(s: String): String {
    let sb = StringBuilder()
    sb.append("\"")
    for (r in s.runes()) {
        if (r == r'"') {
            sb.append("\\\"")
        } else if (r == r'\\') {
            sb.append("\\\\")
        } else if (r == r'\n') {
            sb.append("\\n")
        } else if (r == r'\r') {
```

# let parser

## function:

`parser` 是不可变变量，类型为 `None`，用于保存常量值或不可变引用。

## access:

internal

## usage example:

```cangjie
let parser = JsonParser(input)
```

# let sb

## function:

`sb` 是不可变变量，类型为 `None`，用于保存常量值或不可变引用。

## access:

internal

## usage example:

```cangjie
let sb = StringBuilder()
```

# module tests/json_parser/project/src/main.cj

## function:

负责测试 `main` 相关功能是否符合预期。

## usage example:

```cangjie
# source: tests/json_parser/project/src/main.cj
```

## package:
json_parser

# let jsonStr

## function:

`jsonStr` 是不可变变量，类型为 `None`，用于保存常量值或不可变引用。

## access:

internal

## usage example:

```cangjie
let jsonStr = ##"{"name":"Alice","age":30,"active":true,"scores":[90,85,95],"address":null}"##
```

# let value

## function:

`value` 是不可变变量，类型为 `None`，用于保存常量值或不可变引用。

## access:

internal

## usage example:

```cangjie
let value = JsonValue.fromString(jsonStr)
```

# module tests/kalman_filter/kalman_test.cj

## function:

负责测试 `kalman_test` 相关功能是否符合预期。

## usage example:

```cangjie
# source: tests/kalman_filter/kalman_test.cj
```

## package:
kalman

## imports:

- `std.math.*`

- `std.collection.*`

# class TestKalmanFilterCreate

## function:

封装 `` 中与 `TestKalmanFilterCreate` 相关的数据和行为，是项目中的类级实现单元。

## kind:

class

## access:

internal

## extends:

none

## implements:

none

## properties:

- `internal let kf: None`

- `internal let _: None`

## usage example:

```cangjie
class TestKalmanFilterCreate {
    /** 创建和销毁滤波器 */
    @TestCase
    func testCreateAndDestroy() {
        let kf = KalmanFilter(4, 2)
        @Assert(kf.stateDim, 4)
        @Assert(kf.measDim, 2)
        kf.destroy()
    }

    /** 创建 1 维滤波器 */
    @TestCase
    func testCreate1D() {
        let kf = KalmanFilter(2, 1)
        @Assert(kf.stateDim, 2)
        @Assert(kf.measDim, 1)
        kf.destroy()
    }

    /** 无效维度应抛出异常 */
```

# method TestKalmanFilterCreate.func testCreateAndDestroy()

## function:

实现 `` 中的 `testCreateAndDestroy` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testCreateAndDestroy() {
        let kf = KalmanFilter(4, 2)
        @Assert(kf.stateDim, 4)
        @Assert(kf.measDim, 2)
        kf.destroy()
    }

    /** 创建 1 维滤波器 */
    @TestCase
    func testCreate1D() {
        let kf = KalmanFilter(2, 1)
```

# method TestKalmanFilterCreate.func testCreate1D()

## function:

实现 `` 中的 `testCreate1D` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testCreate1D() {
        let kf = KalmanFilter(2, 1)
        @Assert(kf.stateDim, 2)
        @Assert(kf.measDim, 1)
        kf.destroy()
    }

    /** 无效维度应抛出异常 */
    @TestCase
    func testInvalidDimensions() {
        try {
```

# method TestKalmanFilterCreate.func testInvalidDimensions()

## function:

实现 `` 中的 `testInvalidDimensions` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testInvalidDimensions() {
        try {
            let _ = KalmanFilter(0, 2)
            @Fail("Should have thrown KalmanException")
        } catch (e: KalmanException) {
            @Assert(true)
        }
        try {
            let _ = KalmanFilter(2, -1)
            @Fail("Should have thrown KalmanException")
        } catch (e: KalmanException) {
```

# method TestKalmanFilterCreate.func testDoubleDestroy()

## function:

实现 `` 中的 `testDoubleDestroy` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testDoubleDestroy() {
        let kf = KalmanFilter(2, 1)
        kf.destroy()
        kf.destroy()
        @Assert(true)
    }

    /** 销毁后操作应抛出异常 */
    @TestCase
    func testUseAfterDestroy() {
        let kf = KalmanFilter(2, 1)
```

# method TestKalmanFilterCreate.func testUseAfterDestroy()

## function:

实现 `` 中的 `testUseAfterDestroy` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testUseAfterDestroy() {
        let kf = KalmanFilter(2, 1)
        kf.destroy()
        try {
            kf.getState()
            @Fail("Should have thrown KalmanException")
        } catch (e: KalmanException) {
            @Assert(true)
        }
    }
}
```

# class TestKalmanFilterSetup

## function:

封装 `` 中与 `TestKalmanFilterSetup` 相关的数据和行为，是项目中的类级实现单元。

## kind:

class

## access:

internal

## extends:

none

## implements:

none

## properties:

- `internal let kf: None`

- `internal let x0: Array<Float64>`

- `internal let x: None`

- `internal let P: Array<Float64>`

- `internal let P2: None`

## usage example:

```cangjie
class TestKalmanFilterSetup {
    /** 设置和获取状态 */
    @TestCase
    func testSetAndGetState() {
        let kf = KalmanFilter(3, 1)
        let x0: Array<Float64> = [1.0, 2.0, 3.0]
        kf.setState(x0)
        let x = kf.getState()
        @Assert(x.size, 3)
        @Assert(abs(x[0] - 1.0) < 1.0e-10)
        @Assert(abs(x[1] - 2.0) < 1.0e-10)
        @Assert(abs(x[2] - 3.0) < 1.0e-10)
        kf.destroy()
    }

    /** 设置和获取协方差矩阵 */
    @TestCase
    func testSetAndGetCovariance() {
        let kf = KalmanFilter(2, 1)
        let P: Array<Float64> = [4.0, 0.0, 0.0, 9.0]
```

# method TestKalmanFilterSetup.func testSetAndGetState()

## function:

实现 `` 中的 `testSetAndGetState` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testSetAndGetState() {
        let kf = KalmanFilter(3, 1)
        let x0: Array<Float64> = [1.0, 2.0, 3.0]
        kf.setState(x0)
        let x = kf.getState()
        @Assert(x.size, 3)
        @Assert(abs(x[0] - 1.0) < 1.0e-10)
        @Assert(abs(x[1] - 2.0) < 1.0e-10)
        @Assert(abs(x[2] - 3.0) < 1.0e-10)
        kf.destroy()
    }
```

# method TestKalmanFilterSetup.func testSetAndGetCovariance()

## function:

实现 `` 中的 `testSetAndGetCovariance` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testSetAndGetCovariance() {
        let kf = KalmanFilter(2, 1)
        let P: Array<Float64> = [4.0, 0.0, 0.0, 9.0]
        kf.setCovariance(P)
        let P2 = kf.getCovariance()
        @Assert(P2.size, 4)
        @Assert(abs(P2[0] - 4.0) < 1.0e-10)
        @Assert(abs(P2[3] - 9.0) < 1.0e-10)
        kf.destroy()
    }
```

# method TestKalmanFilterSetup.func testStateSizeMismatch()

## function:

实现 `` 中的 `testStateSizeMismatch` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testStateSizeMismatch() {
        let kf = KalmanFilter(3, 1)
        try {
            kf.setState([1.0, 2.0])  // 期望 3，给了 2
            @Fail("Should have thrown KalmanException")
        } catch (e: KalmanException) {
            @Assert(true)
        }
        kf.destroy()
    }
```

# method TestKalmanFilterSetup.func testTransitionSizeMismatch()

## function:

实现 `` 中的 `testTransitionSizeMismatch` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testTransitionSizeMismatch() {
        let kf = KalmanFilter(2, 1)
        try {
            kf.setTransition([1.0, 0.0, 0.0])  // 期望 4 (2x2)，给了 3
            @Fail("Should have thrown KalmanException")
        } catch (e: KalmanException) {
            @Assert(true)
        }
        kf.destroy()
    }
```

# method TestKalmanFilterSetup.func testObservationSizeMismatch()

## function:

实现 `` 中的 `testObservationSizeMismatch` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testObservationSizeMismatch() {
        let kf = KalmanFilter(2, 1)
        try {
            kf.setObservation([1.0, 0.0, 0.0])  // 期望 2 (1x2)，给了 3
            @Fail("Should have thrown KalmanException")
        } catch (e: KalmanException) {
            @Assert(true)
        }
        kf.destroy()
    }
```

# method TestKalmanFilterSetup.func testMeasNoiseSizeMismatch()

## function:

实现 `` 中的 `testMeasNoiseSizeMismatch` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testMeasNoiseSizeMismatch() {
        let kf = KalmanFilter(2, 2)
        try {
            kf.setMeasurementNoise([1.0, 0.0, 0.0])  // 期望 4 (2x2)，给了 3
            @Fail("Should have thrown KalmanException")
        } catch (e: KalmanException) {
            @Assert(true)
        }
        kf.destroy()
    }
}
```

# class TestKalmanFilter1D

## function:

封装 `` 中与 `TestKalmanFilter1D` 相关的数据和行为，是项目中的类级实现单元。

## kind:

class

## access:

internal

## extends:

none

## implements:

none

## properties:

- `internal let kf: None`

- `internal let measurements: Array<Float64>`

- `internal let state: None`

- `internal let dt: None`

- `internal let trueVelocity: None`

- `internal let rng: None`

- `internal let truePos: None`

- `internal let measPos: None`

- `internal let P: None`

## usage example:

```cangjie
class TestKalmanFilter1D {
    /**
     * 1D 静态值估计：真值为常数 100，测量带噪声。
     * 滤波后估计值应趋近 100。
     */
    @TestCase
    func testStaticValueEstimation() {
        let kf = KalmanFilter(1, 1)
        // F = [1], H = [1]
        kf.setTransition([1.0])
        kf.setObservation([1.0])
        kf.setProcessNoise([0.0001])
        kf.setMeasurementNoise([100.0])  // R = 100 (sigma=10)
        kf.setState([0.0])
        kf.setCovariance([1000.0])

        // 用固定的测量序列模拟（围绕 100 波动）
        let measurements: Array<Float64> = [
            105.0, 95.0, 110.0, 88.0, 102.0,
            97.0, 108.0, 92.0, 100.0, 103.0,
```

# method TestKalmanFilter1D.func testStaticValueEstimation()

## function:

实现 `` 中的 `testStaticValueEstimation` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testStaticValueEstimation() {
        let kf = KalmanFilter(1, 1)
        // F = [1], H = [1]
        kf.setTransition([1.0])
        kf.setObservation([1.0])
        kf.setProcessNoise([0.0001])
        kf.setMeasurementNoise([100.0])  // R = 100 (sigma=10)
        kf.setState([0.0])
        kf.setCovariance([1000.0])

        // 用固定的测量序列模拟（围绕 100 波动）
```

# method TestKalmanFilter1D.func testConstantVelocity1D()

## function:

实现 `` 中的 `testConstantVelocity1D` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testConstantVelocity1D() {
        let kf = KalmanFilter(2, 1)
        let dt = 1.0

        // F = [[1, dt], [0, 1]]
        kf.setTransition([1.0, dt, 0.0, 1.0])
        // H = [[1, 0]]（只测量位置）
        kf.setObservation([1.0, 0.0])
        // Q: 较小的过程噪声
        kf.setProcessNoise([0.01, 0.0, 0.0, 0.01])
        // R: 测量噪声
```

# method TestKalmanFilter1D.func testPredictOnly()

## function:

实现 `` 中的 `testPredictOnly` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testPredictOnly() {
        let kf = KalmanFilter(2, 1)
        let dt = 1.0
        kf.setTransition([1.0, dt, 0.0, 1.0])
        kf.setObservation([1.0, 0.0])
        kf.setProcessNoise([0.1, 0.0, 0.0, 0.1])
        kf.setMeasurementNoise([1.0])
        // 初始状态：位置=10, 速度=5
        kf.setState([10.0, 5.0])
        kf.setCovariance([1.0, 0.0, 0.0, 1.0])
```

# class TestKalmanFilter2D

## function:

封装 `` 中与 `TestKalmanFilter2D` 相关的数据和行为，是项目中的类级实现单元。

## kind:

class

## access:

internal

## extends:

none

## implements:

none

## properties:

- `internal let kf: None`

- `internal let dt: None`

- `internal let trueVx: None`

- `internal let trueVy: None`

- `internal let rng: None`

- `internal let t: None`

- `internal let truePx: None`

- `internal let truePy: None`

- `internal let measPx: None`

- `internal let measPy: None`

- `internal let state: None`

## usage example:

```cangjie
class TestKalmanFilter2D {
    /**
     * 2D 匀速运动跟踪：状态 = [px, py, vx, vy]，测量 = [px, py]。
     * 真实运动：位置 (0,0)，速度 (10, 5) m/s。
     */
    @TestCase
    func testConstantVelocity2D() {
        let kf = KalmanFilter(4, 2)
        let dt = 1.0

        // F: 匀速模型
        kf.setTransition([
            1.0, 0.0, dt,  0.0,
            0.0, 1.0, 0.0, dt,
            0.0, 0.0, 1.0, 0.0,
            0.0, 0.0, 0.0, 1.0
        ])
        // H: 观测位置
        kf.setObservation([
            1.0, 0.0, 0.0, 0.0,
```

# method TestKalmanFilter2D.func testConstantVelocity2D()

## function:

实现 `` 中的 `testConstantVelocity2D` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testConstantVelocity2D() {
        let kf = KalmanFilter(4, 2)
        let dt = 1.0

        // F: 匀速模型
        kf.setTransition([
            1.0, 0.0, dt,  0.0,
            0.0, 1.0, 0.0, dt,
            0.0, 0.0, 1.0, 0.0,
            0.0, 0.0, 0.0, 1.0
        ])
```

# method TestKalmanFilter2D.func testStaticTarget2D()

## function:

实现 `` 中的 `testStaticTarget2D` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testStaticTarget2D() {
        let kf = KalmanFilter(2, 2)
        // 静态模型 F = I
        kf.setTransition([1.0, 0.0, 0.0, 1.0])
        // H = I
        kf.setObservation([1.0, 0.0, 0.0, 1.0])
        kf.setProcessNoise([0.001, 0.0, 0.0, 0.001])
        kf.setMeasurementNoise([25.0, 0.0, 0.0, 25.0])
        kf.setState([0.0, 0.0])
        kf.setCovariance([1000.0, 0.0, 0.0, 1000.0])
```

# class TestKalmanConvergence

## function:

封装 `` 中与 `TestKalmanConvergence` 相关的数据和行为，是项目中的类级实现单元。

## kind:

class

## access:

internal

## extends:

none

## implements:

none

## properties:

- `internal let kf: None`

- `internal let initialP: None`

- `internal let finalP: None`

- `internal let dt: None`

- `internal let trueVel: None`

- `internal let rng: None`

- `internal var earlyErrors: None`

- `internal var lateErrors: None`

- `internal let truePos: None`

- `internal let measPos: None`

- `internal let state: None`

- `internal let error: None`

- `internal var earlySum: None`

- `internal let earlyAvg: None`

- `internal var lateSum: None`

- `internal let lateAvg: None`

- `internal let gain1: None`

- `internal let gain10: None`

## usage example:

```cangjie
class TestKalmanConvergence {
    /**
     * 验证协方差收敛：多次预测+更新后，P 应减小。
     */
    @TestCase
    func testCovarianceDecreases() {
        let kf = KalmanFilter(1, 1)
        kf.setTransition([1.0])
        kf.setObservation([1.0])
        kf.setProcessNoise([0.01])
        kf.setMeasurementNoise([1.0])
        kf.setState([0.0])
        kf.setCovariance([100.0])

        let initialP = kf.getCovariance()[0]

        for (_ in 0..10) {
            kf.predict()
            kf.update([50.0])
        }
```

# method TestKalmanConvergence.func testCovarianceDecreases()

## function:

实现 `` 中的 `testCovarianceDecreases` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testCovarianceDecreases() {
        let kf = KalmanFilter(1, 1)
        kf.setTransition([1.0])
        kf.setObservation([1.0])
        kf.setProcessNoise([0.01])
        kf.setMeasurementNoise([1.0])
        kf.setState([0.0])
        kf.setCovariance([100.0])

        let initialP = kf.getCovariance()[0]
```

# method TestKalmanConvergence.func testErrorConverges()

## function:

实现 `` 中的 `testErrorConverges` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testErrorConverges() {
        let kf = KalmanFilter(2, 1)
        let dt = 1.0
        kf.setTransition([1.0, dt, 0.0, 1.0])
        kf.setObservation([1.0, 0.0])
        kf.setProcessNoise([0.01, 0.0, 0.0, 0.01])
        kf.setMeasurementNoise([25.0])
        kf.setState([0.0, 0.0])
        kf.setCovariance([100.0, 0.0, 0.0, 100.0])

        let trueVel = 10.0
```

# method TestKalmanConvergence.func testGainDecreases()

## function:

实现 `` 中的 `testGainDecreases` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testGainDecreases() {
        let kf = KalmanFilter(1, 1)
        kf.setTransition([1.0])
        kf.setObservation([1.0])
        kf.setProcessNoise([0.01])
        kf.setMeasurementNoise([10.0])
        kf.setState([0.0])
        kf.setCovariance([100.0])

        // 第一次
        kf.predict()
```

# class TestTargetTracker

## function:

封装 `` 中与 `TestTargetTracker` 相关的数据和行为，是项目中的类级实现单元。

## kind:

class

## access:

internal

## extends:

none

## implements:

none

## properties:

- `internal let tracker: None`

- `internal let trueInitial: None`

- `internal let results: None`

- `internal let initEstimate: None`

- `internal var earlyError: None`

- `internal var lateError: None`

- `internal let tracker1: None`

- `internal let trueInit: None`

- `internal let results1: None`

- `internal let tracker2: None`

- `internal let results2: None`

- `internal let trackerHigh: None`

- `internal let resultsHigh: None`

- `internal let trackerLow: None`

- `internal let resultsLow: None`

- `internal var highError: None`

- `internal var lowError: None`

## usage example:

```cangjie
class TestTargetTracker {
    /**
     * 基本仿真运行：验证仿真正常完成，返回正确数量的步骤。
     */
    @TestCase
    func testSimulationRuns() {
        let tracker = TargetTracker(1.0, 0.5, 10.0)
        let trueInitial = TargetState(0.0, 0.0, 10.0, 5.0)
        tracker.initialize(trueInitial, 20.0, 5.0)
        let results = tracker.simulate(trueInitial, 30, 42)
        @Assert(results.size, 30)
        tracker.destroy()
    }

    /**
     * 仿真结果中时间步应递增。
     */
    @TestCase
    func testTimeStepsIncrease() {
        let tracker = TargetTracker(0.5, 0.3, 5.0)
```

# method TestTargetTracker.func testSimulationRuns()

## function:

实现 `` 中的 `testSimulationRuns` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testSimulationRuns() {
        let tracker = TargetTracker(1.0, 0.5, 10.0)
        let trueInitial = TargetState(0.0, 0.0, 10.0, 5.0)
        tracker.initialize(trueInitial, 20.0, 5.0)
        let results = tracker.simulate(trueInitial, 30, 42)
        @Assert(results.size, 30)
        tracker.destroy()
    }

    /**
     * 仿真结果中时间步应递增。
```

# method TestTargetTracker.func testTimeStepsIncrease()

## function:

实现 `` 中的 `testTimeStepsIncrease` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testTimeStepsIncrease() {
        let tracker = TargetTracker(0.5, 0.3, 5.0)
        let trueInitial = TargetState(0.0, 0.0, 5.0, 3.0)
        tracker.initialize(trueInitial, 10.0, 3.0)
        let results = tracker.simulate(trueInitial, 20, 99)

        for (i in 1..results.size) {
            @Assert(results[i].time > results[i - 1].time)
        }
        tracker.destroy()
    }
```

# method TestTargetTracker.func testTrackingConvergence()

## function:

实现 `` 中的 `testTrackingConvergence` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testTrackingConvergence() {
        let tracker = TargetTracker(1.0, 0.5, 10.0)
        let trueInitial = TargetState(0.0, 0.0, 10.0, 5.0)
        let initEstimate = TargetState(5.0, -3.0, 8.0, 6.0)
        tracker.initialize(initEstimate, 20.0, 5.0)
        let results = tracker.simulate(trueInitial, 50, 42)

        // 前 10 步平均误差
        var earlyError = 0.0
        for (i in 0..10) {
            earlyError += results[i].positionError
```

# method TestTargetTracker.func testDeterministicSimulation()

## function:

实现 `` 中的 `testDeterministicSimulation` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testDeterministicSimulation() {
        let tracker1 = TargetTracker(1.0, 0.5, 10.0)
        let trueInit = TargetState(0.0, 0.0, 10.0, 5.0)
        tracker1.initialize(TargetState(0.0, 0.0, 0.0, 0.0), 50.0, 10.0)
        let results1 = tracker1.simulate(trueInit, 20, 12345)

        let tracker2 = TargetTracker(1.0, 0.5, 10.0)
        tracker2.initialize(TargetState(0.0, 0.0, 0.0, 0.0), 50.0, 10.0)
        let results2 = tracker2.simulate(trueInit, 20, 12345)

        @Assert(results1.size, results2.size)
```

# method TestTargetTracker.func testLowNoiseBetterAccuracy()

## function:

实现 `` 中的 `testLowNoiseBetterAccuracy` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testLowNoiseBetterAccuracy() {
        // 高噪声跟踪
        let trackerHigh = TargetTracker(1.0, 0.5, 50.0)
        let trueInit = TargetState(0.0, 0.0, 10.0, 5.0)
        trackerHigh.initialize(TargetState(0.0, 0.0, 0.0, 0.0), 100.0, 10.0)
        let resultsHigh = trackerHigh.simulate(trueInit, 50, 42)

        // 低噪声跟踪
        let trackerLow = TargetTracker(1.0, 0.5, 5.0)
        trackerLow.initialize(TargetState(0.0, 0.0, 0.0, 0.0), 100.0, 10.0)
        let resultsLow = trackerLow.simulate(trueInit, 50, 42)
```

# class TestKalmanRobustness

## function:

封装 `` 中与 `TestKalmanRobustness` 相关的数据和行为，是项目中的类级实现单元。

## kind:

class

## access:

internal

## extends:

none

## implements:

none

## properties:

- `internal let n: None`

- `internal let m: None`

- `internal let kf: None`

- `internal let F: None`

- `internal let H: None`

- `internal let row: None`

- `internal let col: None`

- `internal let Q: None`

- `internal let R: None`

- `internal let P0: None`

- `internal let state: None`

- `internal let P: None`

## usage example:

```cangjie
class TestKalmanRobustness {
    /**
     * 大维度滤波器：验证 6 维状态可以正常工作。
     */
    @TestCase
    func testHighDimension() {
        let n = 6
        let m = 3
        let kf = KalmanFilter(Int64(n), Int64(m))

        // 设置单位矩阵作为 F
        let F = Array<Float64>(n * n, {i => if (i / n == i % n) { 1.0 } else { 0.0 }})
        kf.setTransition(F)

        // 设置观测矩阵（前 3 个状态可观测）
        let H = Array<Float64>(m * n, {i =>
            let row = i / n
            let col = i % n
            if (row == col) { 1.0 } else { 0.0 }
        })
```

# method TestKalmanRobustness.func testHighDimension()

## function:

实现 `` 中的 `testHighDimension` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testHighDimension() {
        let n = 6
        let m = 3
        let kf = KalmanFilter(Int64(n), Int64(m))

        // 设置单位矩阵作为 F
        let F = Array<Float64>(n * n, {i => if (i / n == i % n) { 1.0 } else { 0.0 }})
        kf.setTransition(F)

        // 设置观测矩阵（前 3 个状态可观测）
        let H = Array<Float64>(m * n, {i =>
```

# method TestKalmanRobustness.func testZeroProcessNoise()

## function:

实现 `` 中的 `testZeroProcessNoise` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testZeroProcessNoise() {
        let kf = KalmanFilter(1, 1)
        kf.setTransition([1.0])
        kf.setObservation([1.0])
        kf.setProcessNoise([0.0])
        kf.setMeasurementNoise([1.0])
        kf.setState([0.0])
        kf.setCovariance([100.0])

        for (_ in 0..20) {
            kf.predict()
```

# method TestKalmanRobustness.func testLargeMeasurementNoise()

## function:

实现 `` 中的 `testLargeMeasurementNoise` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testLargeMeasurementNoise() {
        let kf = KalmanFilter(1, 1)
        kf.setTransition([1.0])
        kf.setObservation([1.0])
        kf.setProcessNoise([0.01])
        kf.setMeasurementNoise([10000.0])  // 非常大的测量噪声
        kf.setState([50.0])
        kf.setCovariance([1.0])

        // 给一个很远的测量值
        kf.predict()
```

# method TestKalmanRobustness.func testSmallMeasurementNoise()

## function:

实现 `` 中的 `testSmallMeasurementNoise` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testSmallMeasurementNoise() {
        let kf = KalmanFilter(1, 1)
        kf.setTransition([1.0])
        kf.setObservation([1.0])
        kf.setProcessNoise([100.0])
        kf.setMeasurementNoise([0.001])  // 非常小的测量噪声
        kf.setState([50.0])
        kf.setCovariance([100.0])

        kf.predict()
        kf.update([200.0])
```

# class TestTrackerStepByStep

## function:

封装 `` 中与 `TestTrackerStepByStep` 相关的数据和行为，是项目中的类级实现单元。

## kind:

class

## access:

internal

## extends:

none

## implements:

none

## properties:

- `internal let tracker: None`

- `internal let state: None`

- `internal let cov: None`

## usage example:

```cangjie
class TestTrackerStepByStep {
    /**
     * 手动逐步操作跟踪器。
     */
    @TestCase
    func testManualPredictUpdate() {
        let tracker = TargetTracker(1.0, 0.5, 10.0)
        tracker.initialize(TargetState(0.0, 0.0, 10.0, 5.0), 10.0, 5.0)

        // 手动执行几步
        for (i in 1..=5) {
            tracker.predict()
            tracker.update(Position(Float64(i) * 10.0, Float64(i) * 5.0))
        }

        let state = tracker.getState()
        @Assert(state.size, 4)
        // 状态应在合理范围内
        @Assert(abs(state[0]) < 200.0)
        @Assert(abs(state[1]) < 200.0)
```

# method TestTrackerStepByStep.func testManualPredictUpdate()

## function:

实现 `` 中的 `testManualPredictUpdate` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testManualPredictUpdate() {
        let tracker = TargetTracker(1.0, 0.5, 10.0)
        tracker.initialize(TargetState(0.0, 0.0, 10.0, 5.0), 10.0, 5.0)

        // 手动执行几步
        for (i in 1..=5) {
            tracker.predict()
            tracker.update(Position(Float64(i) * 10.0, Float64(i) * 5.0))
        }

        let state = tracker.getState()
```

# method TestTrackerStepByStep.func testGetCovariance()

## function:

实现 `` 中的 `testGetCovariance` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testGetCovariance() {
        let tracker = TargetTracker(1.0, 0.5, 10.0)
        tracker.initialize(TargetState(0.0, 0.0, 10.0, 5.0), 20.0, 5.0)

        let cov = tracker.getCovariance()
        @Assert(cov.size, 16)  // 4x4 矩阵

        // 对角线元素应为正
        @Assert(cov[0] > 0.0)   // P(px, px)
        @Assert(cov[5] > 0.0)   // P(py, py)
        @Assert(cov[10] > 0.0)  // P(vx, vx)
```

# class TestSimpleRandom

## function:

封装 `` 中与 `TestSimpleRandom` 相关的数据和行为，是项目中的类级实现单元。

## kind:

class

## access:

internal

## extends:

none

## implements:

none

## properties:

- `internal let rng1: None`

- `internal let rng2: None`

- `internal let rng: None`

- `internal let v: None`

- `internal let n: None`

- `internal var sum: None`

- `internal var sumSq: None`

- `internal let mean: None`

- `internal let variance: None`

- `internal let std: None`

- `internal var allSame: None`

## usage example:

```cangjie
class TestSimpleRandom {
    /**
     * 相同种子应产生相同序列。
     */
    @TestCase
    func testDeterministic() {
        let rng1 = SimpleRandom(42)
        let rng2 = SimpleRandom(42)

        for (_ in 0..100) {
            @Assert(abs(rng1.nextUniform() - rng2.nextUniform()) < 1.0e-15)
        }
    }

    /**
     * 均匀分布应在 [0, 1) 范围内。
     */
    @TestCase
    func testUniformRange() {
        let rng = SimpleRandom(123)
```

# method TestSimpleRandom.func testDeterministic()

## function:

实现 `` 中的 `testDeterministic` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testDeterministic() {
        let rng1 = SimpleRandom(42)
        let rng2 = SimpleRandom(42)

        for (_ in 0..100) {
            @Assert(abs(rng1.nextUniform() - rng2.nextUniform()) < 1.0e-15)
        }
    }

    /**
     * 均匀分布应在 [0, 1) 范围内。
```

# method TestSimpleRandom.func testUniformRange()

## function:

实现 `` 中的 `testUniformRange` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testUniformRange() {
        let rng = SimpleRandom(123)
        for (_ in 0..1000) {
            let v = rng.nextUniform()
            @Assert(v >= 0.0)
            @Assert(v < 1.0)
        }
    }

    /**
     * 高斯分布：大量样本的均值应接近 0，标准差接近 1。
```

# method TestSimpleRandom.func testGaussianDistribution()

## function:

实现 `` 中的 `testGaussianDistribution` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testGaussianDistribution() {
        let rng = SimpleRandom(456)
        let n = 10000
        var sum = 0.0
        var sumSq = 0.0

        for (_ in 0..n) {
            let v = rng.nextGaussian()
            sum += v
            sumSq += v * v
        }
```

# method TestSimpleRandom.func testDifferentSeeds()

## function:

实现 `` 中的 `testDifferentSeeds` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testDifferentSeeds() {
        let rng1 = SimpleRandom(1)
        let rng2 = SimpleRandom(2)
        var allSame = true
        for (_ in 0..10) {
            if (abs(rng1.nextUniform() - rng2.nextUniform()) > 1.0e-10) {
                allSame = false
                break
            }
        }
        @Assert(!allSame)
```

# module tests/kalman_filter/project/src/kalman_ffi.cj

## function:

负责测试 `kalman_ffi` 相关功能是否符合预期。

## usage example:

```cangjie
# source: tests/kalman_filter/project/src/kalman_ffi.cj
```

## package:
kalman

# func func kf_create(state_dim: Int32, meas_dim: Int32): CPointer<Unit>

## function:

实现 `` 中的 `kf_create` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## usage example:

```cangjie
func kf_create(state_dim: Int32, meas_dim: Int32): CPointer<Unit>
    func kf_destroy(kf: CPointer<Unit>): Unit
    func kf_set_transition(kf: CPointer<Unit>, F: CPointer<Float64>): Unit
    func kf_set_observation(kf: CPointer<Unit>, H: CPointer<Float64>): Unit
    func kf_set_process_noise(kf: CPointer<Unit>, Q: CPointer<Float64>): Unit
    func kf_set_measurement_noise(kf: CPointer<Unit>, R: CPointer<Float64>): Unit
    func kf_set_state(kf: CPointer<Unit>, x: CPointer<Float64>): Unit
    func kf_set_covariance(kf: CPointer<Unit>, P: CPointer<Float64>): Unit
    func kf_predict(kf: CPointer<Unit>): Unit
    func kf_update(kf: CPointer<Unit>, z: CPointer<Float64>): Unit
    func kf_get_state(kf: CPointer<Unit>, x_out: CPointer<Float64>): Unit
```

# func func kf_destroy(kf: CPointer<Unit>): Unit

## function:

实现 `` 中的 `kf_destroy` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## usage example:

```cangjie
func kf_destroy(kf: CPointer<Unit>): Unit
    func kf_set_transition(kf: CPointer<Unit>, F: CPointer<Float64>): Unit
    func kf_set_observation(kf: CPointer<Unit>, H: CPointer<Float64>): Unit
    func kf_set_process_noise(kf: CPointer<Unit>, Q: CPointer<Float64>): Unit
    func kf_set_measurement_noise(kf: CPointer<Unit>, R: CPointer<Float64>): Unit
    func kf_set_state(kf: CPointer<Unit>, x: CPointer<Float64>): Unit
    func kf_set_covariance(kf: CPointer<Unit>, P: CPointer<Float64>): Unit
    func kf_predict(kf: CPointer<Unit>): Unit
    func kf_update(kf: CPointer<Unit>, z: CPointer<Float64>): Unit
    func kf_get_state(kf: CPointer<Unit>, x_out: CPointer<Float64>): Unit
    func kf_get_covariance(kf: CPointer<Unit>, P_out: CPointer<Float64>): Unit
```

# func func kf_set_transition(kf: CPointer<Unit>, F: CPointer<Float64>): Unit

## function:

实现 `` 中的 `kf_set_transition` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## usage example:

```cangjie
func kf_set_transition(kf: CPointer<Unit>, F: CPointer<Float64>): Unit
    func kf_set_observation(kf: CPointer<Unit>, H: CPointer<Float64>): Unit
    func kf_set_process_noise(kf: CPointer<Unit>, Q: CPointer<Float64>): Unit
    func kf_set_measurement_noise(kf: CPointer<Unit>, R: CPointer<Float64>): Unit
    func kf_set_state(kf: CPointer<Unit>, x: CPointer<Float64>): Unit
    func kf_set_covariance(kf: CPointer<Unit>, P: CPointer<Float64>): Unit
    func kf_predict(kf: CPointer<Unit>): Unit
    func kf_update(kf: CPointer<Unit>, z: CPointer<Float64>): Unit
    func kf_get_state(kf: CPointer<Unit>, x_out: CPointer<Float64>): Unit
    func kf_get_covariance(kf: CPointer<Unit>, P_out: CPointer<Float64>): Unit
    func kf_get_gain(kf: CPointer<Unit>, K_out: CPointer<Float64>): Unit
```

# func func kf_set_observation(kf: CPointer<Unit>, H: CPointer<Float64>): Unit

## function:

实现 `` 中的 `kf_set_observation` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## usage example:

```cangjie
func kf_set_observation(kf: CPointer<Unit>, H: CPointer<Float64>): Unit
    func kf_set_process_noise(kf: CPointer<Unit>, Q: CPointer<Float64>): Unit
    func kf_set_measurement_noise(kf: CPointer<Unit>, R: CPointer<Float64>): Unit
    func kf_set_state(kf: CPointer<Unit>, x: CPointer<Float64>): Unit
    func kf_set_covariance(kf: CPointer<Unit>, P: CPointer<Float64>): Unit
    func kf_predict(kf: CPointer<Unit>): Unit
    func kf_update(kf: CPointer<Unit>, z: CPointer<Float64>): Unit
    func kf_get_state(kf: CPointer<Unit>, x_out: CPointer<Float64>): Unit
    func kf_get_covariance(kf: CPointer<Unit>, P_out: CPointer<Float64>): Unit
    func kf_get_gain(kf: CPointer<Unit>, K_out: CPointer<Float64>): Unit
    func kf_get_state_dim(kf: CPointer<Unit>): Int32
```

# func func kf_set_process_noise(kf: CPointer<Unit>, Q: CPointer<Float64>): Unit

## function:

实现 `` 中的 `kf_set_process_noise` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## usage example:

```cangjie
func kf_set_process_noise(kf: CPointer<Unit>, Q: CPointer<Float64>): Unit
    func kf_set_measurement_noise(kf: CPointer<Unit>, R: CPointer<Float64>): Unit
    func kf_set_state(kf: CPointer<Unit>, x: CPointer<Float64>): Unit
    func kf_set_covariance(kf: CPointer<Unit>, P: CPointer<Float64>): Unit
    func kf_predict(kf: CPointer<Unit>): Unit
    func kf_update(kf: CPointer<Unit>, z: CPointer<Float64>): Unit
    func kf_get_state(kf: CPointer<Unit>, x_out: CPointer<Float64>): Unit
    func kf_get_covariance(kf: CPointer<Unit>, P_out: CPointer<Float64>): Unit
    func kf_get_gain(kf: CPointer<Unit>, K_out: CPointer<Float64>): Unit
    func kf_get_state_dim(kf: CPointer<Unit>): Int32
    func kf_get_meas_dim(kf: CPointer<Unit>): Int32
```

# func func kf_set_measurement_noise(kf: CPointer<Unit>, R: CPointer<Float64>): Unit

## function:

实现 `` 中的 `kf_set_measurement_noise` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## usage example:

```cangjie
func kf_set_measurement_noise(kf: CPointer<Unit>, R: CPointer<Float64>): Unit
    func kf_set_state(kf: CPointer<Unit>, x: CPointer<Float64>): Unit
    func kf_set_covariance(kf: CPointer<Unit>, P: CPointer<Float64>): Unit
    func kf_predict(kf: CPointer<Unit>): Unit
    func kf_update(kf: CPointer<Unit>, z: CPointer<Float64>): Unit
    func kf_get_state(kf: CPointer<Unit>, x_out: CPointer<Float64>): Unit
    func kf_get_covariance(kf: CPointer<Unit>, P_out: CPointer<Float64>): Unit
    func kf_get_gain(kf: CPointer<Unit>, K_out: CPointer<Float64>): Unit
    func kf_get_state_dim(kf: CPointer<Unit>): Int32
    func kf_get_meas_dim(kf: CPointer<Unit>): Int32
}
```

# func func kf_set_state(kf: CPointer<Unit>, x: CPointer<Float64>): Unit

## function:

实现 `` 中的 `kf_set_state` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## usage example:

```cangjie
func kf_set_state(kf: CPointer<Unit>, x: CPointer<Float64>): Unit
    func kf_set_covariance(kf: CPointer<Unit>, P: CPointer<Float64>): Unit
    func kf_predict(kf: CPointer<Unit>): Unit
    func kf_update(kf: CPointer<Unit>, z: CPointer<Float64>): Unit
    func kf_get_state(kf: CPointer<Unit>, x_out: CPointer<Float64>): Unit
    func kf_get_covariance(kf: CPointer<Unit>, P_out: CPointer<Float64>): Unit
    func kf_get_gain(kf: CPointer<Unit>, K_out: CPointer<Float64>): Unit
    func kf_get_state_dim(kf: CPointer<Unit>): Int32
    func kf_get_meas_dim(kf: CPointer<Unit>): Int32
}
```

# func func kf_set_covariance(kf: CPointer<Unit>, P: CPointer<Float64>): Unit

## function:

实现 `` 中的 `kf_set_covariance` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## usage example:

```cangjie
func kf_set_covariance(kf: CPointer<Unit>, P: CPointer<Float64>): Unit
    func kf_predict(kf: CPointer<Unit>): Unit
    func kf_update(kf: CPointer<Unit>, z: CPointer<Float64>): Unit
    func kf_get_state(kf: CPointer<Unit>, x_out: CPointer<Float64>): Unit
    func kf_get_covariance(kf: CPointer<Unit>, P_out: CPointer<Float64>): Unit
    func kf_get_gain(kf: CPointer<Unit>, K_out: CPointer<Float64>): Unit
    func kf_get_state_dim(kf: CPointer<Unit>): Int32
    func kf_get_meas_dim(kf: CPointer<Unit>): Int32
}
```

# func func kf_predict(kf: CPointer<Unit>): Unit

## function:

实现 `` 中的 `kf_predict` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## usage example:

```cangjie
func kf_predict(kf: CPointer<Unit>): Unit
    func kf_update(kf: CPointer<Unit>, z: CPointer<Float64>): Unit
    func kf_get_state(kf: CPointer<Unit>, x_out: CPointer<Float64>): Unit
    func kf_get_covariance(kf: CPointer<Unit>, P_out: CPointer<Float64>): Unit
    func kf_get_gain(kf: CPointer<Unit>, K_out: CPointer<Float64>): Unit
    func kf_get_state_dim(kf: CPointer<Unit>): Int32
    func kf_get_meas_dim(kf: CPointer<Unit>): Int32
}
```

# func func kf_update(kf: CPointer<Unit>, z: CPointer<Float64>): Unit

## function:

实现 `` 中的 `kf_update` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## usage example:

```cangjie
func kf_update(kf: CPointer<Unit>, z: CPointer<Float64>): Unit
    func kf_get_state(kf: CPointer<Unit>, x_out: CPointer<Float64>): Unit
    func kf_get_covariance(kf: CPointer<Unit>, P_out: CPointer<Float64>): Unit
    func kf_get_gain(kf: CPointer<Unit>, K_out: CPointer<Float64>): Unit
    func kf_get_state_dim(kf: CPointer<Unit>): Int32
    func kf_get_meas_dim(kf: CPointer<Unit>): Int32
}
```

# func func kf_get_state(kf: CPointer<Unit>, x_out: CPointer<Float64>): Unit

## function:

实现 `` 中的 `kf_get_state` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## usage example:

```cangjie
func kf_get_state(kf: CPointer<Unit>, x_out: CPointer<Float64>): Unit
    func kf_get_covariance(kf: CPointer<Unit>, P_out: CPointer<Float64>): Unit
    func kf_get_gain(kf: CPointer<Unit>, K_out: CPointer<Float64>): Unit
    func kf_get_state_dim(kf: CPointer<Unit>): Int32
    func kf_get_meas_dim(kf: CPointer<Unit>): Int32
}
```

# func func kf_get_covariance(kf: CPointer<Unit>, P_out: CPointer<Float64>): Unit

## function:

实现 `` 中的 `kf_get_covariance` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## usage example:

```cangjie
func kf_get_covariance(kf: CPointer<Unit>, P_out: CPointer<Float64>): Unit
    func kf_get_gain(kf: CPointer<Unit>, K_out: CPointer<Float64>): Unit
    func kf_get_state_dim(kf: CPointer<Unit>): Int32
    func kf_get_meas_dim(kf: CPointer<Unit>): Int32
}
```

# func func kf_get_gain(kf: CPointer<Unit>, K_out: CPointer<Float64>): Unit

## function:

实现 `` 中的 `kf_get_gain` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## usage example:

```cangjie
func kf_get_gain(kf: CPointer<Unit>, K_out: CPointer<Float64>): Unit
    func kf_get_state_dim(kf: CPointer<Unit>): Int32
    func kf_get_meas_dim(kf: CPointer<Unit>): Int32
}
```

# func func kf_get_state_dim(kf: CPointer<Unit>): Int32

## function:

实现 `` 中的 `kf_get_state_dim` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## usage example:

```cangjie
func kf_get_state_dim(kf: CPointer<Unit>): Int32
    func kf_get_meas_dim(kf: CPointer<Unit>): Int32
}
```

# func func kf_get_meas_dim(kf: CPointer<Unit>): Int32

## function:

实现 `` 中的 `kf_get_meas_dim` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## usage example:

```cangjie
func kf_get_meas_dim(kf: CPointer<Unit>): Int32
}
```

# module tests/kalman_filter/project/src/kalman_test.cj

## function:

负责测试 `kalman_test` 相关功能是否符合预期。

## usage example:

```cangjie
# source: tests/kalman_filter/project/src/kalman_test.cj
```

## package:
kalman

## imports:

- `std.math.*`

- `std.collection.*`

# class TestKalmanFilterCreate

## function:

封装 `` 中与 `TestKalmanFilterCreate` 相关的数据和行为，是项目中的类级实现单元。

## kind:

class

## access:

internal

## extends:

none

## implements:

none

## properties:

- `internal let kf: None`

- `internal let _: None`

## usage example:

```cangjie
class TestKalmanFilterCreate {
    /** 创建和销毁滤波器 */
    @TestCase
    func testCreateAndDestroy() {
        let kf = KalmanFilter(4, 2)
        @Assert(kf.stateDim, 4)
        @Assert(kf.measDim, 2)
        kf.destroy()
    }

    /** 创建 1 维滤波器 */
    @TestCase
    func testCreate1D() {
        let kf = KalmanFilter(2, 1)
        @Assert(kf.stateDim, 2)
        @Assert(kf.measDim, 1)
        kf.destroy()
    }

    /** 无效维度应抛出异常 */
```

# method TestKalmanFilterCreate.func testCreateAndDestroy()

## function:

实现 `` 中的 `testCreateAndDestroy` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testCreateAndDestroy() {
        let kf = KalmanFilter(4, 2)
        @Assert(kf.stateDim, 4)
        @Assert(kf.measDim, 2)
        kf.destroy()
    }

    /** 创建 1 维滤波器 */
    @TestCase
    func testCreate1D() {
        let kf = KalmanFilter(2, 1)
```

# method TestKalmanFilterCreate.func testCreate1D()

## function:

实现 `` 中的 `testCreate1D` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testCreate1D() {
        let kf = KalmanFilter(2, 1)
        @Assert(kf.stateDim, 2)
        @Assert(kf.measDim, 1)
        kf.destroy()
    }

    /** 无效维度应抛出异常 */
    @TestCase
    func testInvalidDimensions() {
        try {
```

# method TestKalmanFilterCreate.func testInvalidDimensions()

## function:

实现 `` 中的 `testInvalidDimensions` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testInvalidDimensions() {
        try {
            let _ = KalmanFilter(0, 2)
            @Fail("Should have thrown KalmanException")
        } catch (e: KalmanException) {
            @Assert(true)
        }
        try {
            let _ = KalmanFilter(2, -1)
            @Fail("Should have thrown KalmanException")
        } catch (e: KalmanException) {
```

# method TestKalmanFilterCreate.func testDoubleDestroy()

## function:

实现 `` 中的 `testDoubleDestroy` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testDoubleDestroy() {
        let kf = KalmanFilter(2, 1)
        kf.destroy()
        kf.destroy()
        @Assert(true)
    }

    /** 销毁后操作应抛出异常 */
    @TestCase
    func testUseAfterDestroy() {
        let kf = KalmanFilter(2, 1)
```

# method TestKalmanFilterCreate.func testUseAfterDestroy()

## function:

实现 `` 中的 `testUseAfterDestroy` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testUseAfterDestroy() {
        let kf = KalmanFilter(2, 1)
        kf.destroy()
        try {
            kf.getState()
            @Fail("Should have thrown KalmanException")
        } catch (e: KalmanException) {
            @Assert(true)
        }
    }
}
```

# class TestKalmanFilterSetup

## function:

封装 `` 中与 `TestKalmanFilterSetup` 相关的数据和行为，是项目中的类级实现单元。

## kind:

class

## access:

internal

## extends:

none

## implements:

none

## properties:

- `internal let kf: None`

- `internal let x0: Array<Float64>`

- `internal let x: None`

- `internal let P: Array<Float64>`

- `internal let P2: None`

## usage example:

```cangjie
class TestKalmanFilterSetup {
    /** 设置和获取状态 */
    @TestCase
    func testSetAndGetState() {
        let kf = KalmanFilter(3, 1)
        let x0: Array<Float64> = [1.0, 2.0, 3.0]
        kf.setState(x0)
        let x = kf.getState()
        @Assert(x.size, 3)
        @Assert(abs(x[0] - 1.0) < 1.0e-10)
        @Assert(abs(x[1] - 2.0) < 1.0e-10)
        @Assert(abs(x[2] - 3.0) < 1.0e-10)
        kf.destroy()
    }

    /** 设置和获取协方差矩阵 */
    @TestCase
    func testSetAndGetCovariance() {
        let kf = KalmanFilter(2, 1)
        let P: Array<Float64> = [4.0, 0.0, 0.0, 9.0]
```

# method TestKalmanFilterSetup.func testSetAndGetState()

## function:

实现 `` 中的 `testSetAndGetState` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testSetAndGetState() {
        let kf = KalmanFilter(3, 1)
        let x0: Array<Float64> = [1.0, 2.0, 3.0]
        kf.setState(x0)
        let x = kf.getState()
        @Assert(x.size, 3)
        @Assert(abs(x[0] - 1.0) < 1.0e-10)
        @Assert(abs(x[1] - 2.0) < 1.0e-10)
        @Assert(abs(x[2] - 3.0) < 1.0e-10)
        kf.destroy()
    }
```

# method TestKalmanFilterSetup.func testSetAndGetCovariance()

## function:

实现 `` 中的 `testSetAndGetCovariance` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testSetAndGetCovariance() {
        let kf = KalmanFilter(2, 1)
        let P: Array<Float64> = [4.0, 0.0, 0.0, 9.0]
        kf.setCovariance(P)
        let P2 = kf.getCovariance()
        @Assert(P2.size, 4)
        @Assert(abs(P2[0] - 4.0) < 1.0e-10)
        @Assert(abs(P2[3] - 9.0) < 1.0e-10)
        kf.destroy()
    }
```

# method TestKalmanFilterSetup.func testStateSizeMismatch()

## function:

实现 `` 中的 `testStateSizeMismatch` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testStateSizeMismatch() {
        let kf = KalmanFilter(3, 1)
        try {
            kf.setState([1.0, 2.0])  // 期望 3，给了 2
            @Fail("Should have thrown KalmanException")
        } catch (e: KalmanException) {
            @Assert(true)
        }
        kf.destroy()
    }
```

# method TestKalmanFilterSetup.func testTransitionSizeMismatch()

## function:

实现 `` 中的 `testTransitionSizeMismatch` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testTransitionSizeMismatch() {
        let kf = KalmanFilter(2, 1)
        try {
            kf.setTransition([1.0, 0.0, 0.0])  // 期望 4 (2x2)，给了 3
            @Fail("Should have thrown KalmanException")
        } catch (e: KalmanException) {
            @Assert(true)
        }
        kf.destroy()
    }
```

# method TestKalmanFilterSetup.func testObservationSizeMismatch()

## function:

实现 `` 中的 `testObservationSizeMismatch` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testObservationSizeMismatch() {
        let kf = KalmanFilter(2, 1)
        try {
            kf.setObservation([1.0, 0.0, 0.0])  // 期望 2 (1x2)，给了 3
            @Fail("Should have thrown KalmanException")
        } catch (e: KalmanException) {
            @Assert(true)
        }
        kf.destroy()
    }
```

# method TestKalmanFilterSetup.func testMeasNoiseSizeMismatch()

## function:

实现 `` 中的 `testMeasNoiseSizeMismatch` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testMeasNoiseSizeMismatch() {
        let kf = KalmanFilter(2, 2)
        try {
            kf.setMeasurementNoise([1.0, 0.0, 0.0])  // 期望 4 (2x2)，给了 3
            @Fail("Should have thrown KalmanException")
        } catch (e: KalmanException) {
            @Assert(true)
        }
        kf.destroy()
    }
}
```

# class TestKalmanFilter1D

## function:

封装 `` 中与 `TestKalmanFilter1D` 相关的数据和行为，是项目中的类级实现单元。

## kind:

class

## access:

internal

## extends:

none

## implements:

none

## properties:

- `internal let kf: None`

- `internal let measurements: Array<Float64>`

- `internal let state: None`

- `internal let dt: None`

- `internal let trueVelocity: None`

- `internal let rng: None`

- `internal let truePos: None`

- `internal let measPos: None`

- `internal let P: None`

## usage example:

```cangjie
class TestKalmanFilter1D {
    /**
     * 1D 静态值估计：真值为常数 100，测量带噪声。
     * 滤波后估计值应趋近 100。
     */
    @TestCase
    func testStaticValueEstimation() {
        let kf = KalmanFilter(1, 1)
        // F = [1], H = [1]
        kf.setTransition([1.0])
        kf.setObservation([1.0])
        kf.setProcessNoise([0.0001])
        kf.setMeasurementNoise([100.0])  // R = 100 (sigma=10)
        kf.setState([0.0])
        kf.setCovariance([1000.0])

        // 用固定的测量序列模拟（围绕 100 波动）
        let measurements: Array<Float64> = [
            105.0, 95.0, 110.0, 88.0, 102.0,
            97.0, 108.0, 92.0, 100.0, 103.0,
```

# method TestKalmanFilter1D.func testStaticValueEstimation()

## function:

实现 `` 中的 `testStaticValueEstimation` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testStaticValueEstimation() {
        let kf = KalmanFilter(1, 1)
        // F = [1], H = [1]
        kf.setTransition([1.0])
        kf.setObservation([1.0])
        kf.setProcessNoise([0.0001])
        kf.setMeasurementNoise([100.0])  // R = 100 (sigma=10)
        kf.setState([0.0])
        kf.setCovariance([1000.0])

        // 用固定的测量序列模拟（围绕 100 波动）
```

# method TestKalmanFilter1D.func testConstantVelocity1D()

## function:

实现 `` 中的 `testConstantVelocity1D` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testConstantVelocity1D() {
        let kf = KalmanFilter(2, 1)
        let dt = 1.0

        // F = [[1, dt], [0, 1]]
        kf.setTransition([1.0, dt, 0.0, 1.0])
        // H = [[1, 0]]（只测量位置）
        kf.setObservation([1.0, 0.0])
        // Q: 较小的过程噪声
        kf.setProcessNoise([0.01, 0.0, 0.0, 0.01])
        // R: 测量噪声
```

# method TestKalmanFilter1D.func testPredictOnly()

## function:

实现 `` 中的 `testPredictOnly` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testPredictOnly() {
        let kf = KalmanFilter(2, 1)
        let dt = 1.0
        kf.setTransition([1.0, dt, 0.0, 1.0])
        kf.setObservation([1.0, 0.0])
        kf.setProcessNoise([0.1, 0.0, 0.0, 0.1])
        kf.setMeasurementNoise([1.0])
        // 初始状态：位置=10, 速度=5
        kf.setState([10.0, 5.0])
        kf.setCovariance([1.0, 0.0, 0.0, 1.0])
```

# class TestKalmanFilter2D

## function:

封装 `` 中与 `TestKalmanFilter2D` 相关的数据和行为，是项目中的类级实现单元。

## kind:

class

## access:

internal

## extends:

none

## implements:

none

## properties:

- `internal let kf: None`

- `internal let dt: None`

- `internal let trueVx: None`

- `internal let trueVy: None`

- `internal let rng: None`

- `internal let t: None`

- `internal let truePx: None`

- `internal let truePy: None`

- `internal let measPx: None`

- `internal let measPy: None`

- `internal let state: None`

## usage example:

```cangjie
class TestKalmanFilter2D {
    /**
     * 2D 匀速运动跟踪：状态 = [px, py, vx, vy]，测量 = [px, py]。
     * 真实运动：位置 (0,0)，速度 (10, 5) m/s。
     */
    @TestCase
    func testConstantVelocity2D() {
        let kf = KalmanFilter(4, 2)
        let dt = 1.0

        // F: 匀速模型
        kf.setTransition([
            1.0, 0.0, dt,  0.0,
            0.0, 1.0, 0.0, dt,
            0.0, 0.0, 1.0, 0.0,
            0.0, 0.0, 0.0, 1.0
        ])
        // H: 观测位置
        kf.setObservation([
            1.0, 0.0, 0.0, 0.0,
```

# method TestKalmanFilter2D.func testConstantVelocity2D()

## function:

实现 `` 中的 `testConstantVelocity2D` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testConstantVelocity2D() {
        let kf = KalmanFilter(4, 2)
        let dt = 1.0

        // F: 匀速模型
        kf.setTransition([
            1.0, 0.0, dt,  0.0,
            0.0, 1.0, 0.0, dt,
            0.0, 0.0, 1.0, 0.0,
            0.0, 0.0, 0.0, 1.0
        ])
```

# method TestKalmanFilter2D.func testStaticTarget2D()

## function:

实现 `` 中的 `testStaticTarget2D` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testStaticTarget2D() {
        let kf = KalmanFilter(2, 2)
        // 静态模型 F = I
        kf.setTransition([1.0, 0.0, 0.0, 1.0])
        // H = I
        kf.setObservation([1.0, 0.0, 0.0, 1.0])
        kf.setProcessNoise([0.001, 0.0, 0.0, 0.001])
        kf.setMeasurementNoise([25.0, 0.0, 0.0, 25.0])
        kf.setState([0.0, 0.0])
        kf.setCovariance([1000.0, 0.0, 0.0, 1000.0])
```

# class TestKalmanConvergence

## function:

封装 `` 中与 `TestKalmanConvergence` 相关的数据和行为，是项目中的类级实现单元。

## kind:

class

## access:

internal

## extends:

none

## implements:

none

## properties:

- `internal let kf: None`

- `internal let initialP: None`

- `internal let finalP: None`

- `internal let dt: None`

- `internal let trueVel: None`

- `internal let rng: None`

- `internal var earlyErrors: None`

- `internal var lateErrors: None`

- `internal let truePos: None`

- `internal let measPos: None`

- `internal let state: None`

- `internal let error: None`

- `internal var earlySum: None`

- `internal let earlyAvg: None`

- `internal var lateSum: None`

- `internal let lateAvg: None`

- `internal let gain1: None`

- `internal let gain10: None`

## usage example:

```cangjie
class TestKalmanConvergence {
    /**
     * 验证协方差收敛：多次预测+更新后，P 应减小。
     */
    @TestCase
    func testCovarianceDecreases() {
        let kf = KalmanFilter(1, 1)
        kf.setTransition([1.0])
        kf.setObservation([1.0])
        kf.setProcessNoise([0.01])
        kf.setMeasurementNoise([1.0])
        kf.setState([0.0])
        kf.setCovariance([100.0])

        let initialP = kf.getCovariance()[0]

        for (_ in 0..10) {
            kf.predict()
            kf.update([50.0])
        }
```

# method TestKalmanConvergence.func testCovarianceDecreases()

## function:

实现 `` 中的 `testCovarianceDecreases` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testCovarianceDecreases() {
        let kf = KalmanFilter(1, 1)
        kf.setTransition([1.0])
        kf.setObservation([1.0])
        kf.setProcessNoise([0.01])
        kf.setMeasurementNoise([1.0])
        kf.setState([0.0])
        kf.setCovariance([100.0])

        let initialP = kf.getCovariance()[0]
```

# method TestKalmanConvergence.func testErrorConverges()

## function:

实现 `` 中的 `testErrorConverges` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testErrorConverges() {
        let kf = KalmanFilter(2, 1)
        let dt = 1.0
        kf.setTransition([1.0, dt, 0.0, 1.0])
        kf.setObservation([1.0, 0.0])
        kf.setProcessNoise([0.01, 0.0, 0.0, 0.01])
        kf.setMeasurementNoise([25.0])
        kf.setState([0.0, 0.0])
        kf.setCovariance([100.0, 0.0, 0.0, 100.0])

        let trueVel = 10.0
```

# method TestKalmanConvergence.func testGainDecreases()

## function:

实现 `` 中的 `testGainDecreases` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testGainDecreases() {
        let kf = KalmanFilter(1, 1)
        kf.setTransition([1.0])
        kf.setObservation([1.0])
        kf.setProcessNoise([0.01])
        kf.setMeasurementNoise([10.0])
        kf.setState([0.0])
        kf.setCovariance([100.0])

        // 第一次
        kf.predict()
```

# class TestTargetTracker

## function:

封装 `` 中与 `TestTargetTracker` 相关的数据和行为，是项目中的类级实现单元。

## kind:

class

## access:

internal

## extends:

none

## implements:

none

## properties:

- `internal let tracker: None`

- `internal let trueInitial: None`

- `internal let results: None`

- `internal let initEstimate: None`

- `internal var earlyError: None`

- `internal var lateError: None`

- `internal let tracker1: None`

- `internal let trueInit: None`

- `internal let results1: None`

- `internal let tracker2: None`

- `internal let results2: None`

- `internal let trackerHigh: None`

- `internal let resultsHigh: None`

- `internal let trackerLow: None`

- `internal let resultsLow: None`

- `internal var highError: None`

- `internal var lowError: None`

## usage example:

```cangjie
class TestTargetTracker {
    /**
     * 基本仿真运行：验证仿真正常完成，返回正确数量的步骤。
     */
    @TestCase
    func testSimulationRuns() {
        let tracker = TargetTracker(1.0, 0.5, 10.0)
        let trueInitial = TargetState(0.0, 0.0, 10.0, 5.0)
        tracker.initialize(trueInitial, 20.0, 5.0)
        let results = tracker.simulate(trueInitial, 30, 42)
        @Assert(results.size, 30)
        tracker.destroy()
    }

    /**
     * 仿真结果中时间步应递增。
     */
    @TestCase
    func testTimeStepsIncrease() {
        let tracker = TargetTracker(0.5, 0.3, 5.0)
```

# method TestTargetTracker.func testSimulationRuns()

## function:

实现 `` 中的 `testSimulationRuns` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testSimulationRuns() {
        let tracker = TargetTracker(1.0, 0.5, 10.0)
        let trueInitial = TargetState(0.0, 0.0, 10.0, 5.0)
        tracker.initialize(trueInitial, 20.0, 5.0)
        let results = tracker.simulate(trueInitial, 30, 42)
        @Assert(results.size, 30)
        tracker.destroy()
    }

    /**
     * 仿真结果中时间步应递增。
```

# method TestTargetTracker.func testTimeStepsIncrease()

## function:

实现 `` 中的 `testTimeStepsIncrease` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testTimeStepsIncrease() {
        let tracker = TargetTracker(0.5, 0.3, 5.0)
        let trueInitial = TargetState(0.0, 0.0, 5.0, 3.0)
        tracker.initialize(trueInitial, 10.0, 3.0)
        let results = tracker.simulate(trueInitial, 20, 99)

        for (i in 1..results.size) {
            @Assert(results[i].time > results[i - 1].time)
        }
        tracker.destroy()
    }
```

# method TestTargetTracker.func testTrackingConvergence()

## function:

实现 `` 中的 `testTrackingConvergence` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testTrackingConvergence() {
        let tracker = TargetTracker(1.0, 0.5, 10.0)
        let trueInitial = TargetState(0.0, 0.0, 10.0, 5.0)
        let initEstimate = TargetState(5.0, -3.0, 8.0, 6.0)
        tracker.initialize(initEstimate, 20.0, 5.0)
        let results = tracker.simulate(trueInitial, 50, 42)

        // 前 10 步平均误差
        var earlyError = 0.0
        for (i in 0..10) {
            earlyError += results[i].positionError
```

# method TestTargetTracker.func testDeterministicSimulation()

## function:

实现 `` 中的 `testDeterministicSimulation` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testDeterministicSimulation() {
        let tracker1 = TargetTracker(1.0, 0.5, 10.0)
        let trueInit = TargetState(0.0, 0.0, 10.0, 5.0)
        tracker1.initialize(TargetState(0.0, 0.0, 0.0, 0.0), 50.0, 10.0)
        let results1 = tracker1.simulate(trueInit, 20, 12345)

        let tracker2 = TargetTracker(1.0, 0.5, 10.0)
        tracker2.initialize(TargetState(0.0, 0.0, 0.0, 0.0), 50.0, 10.0)
        let results2 = tracker2.simulate(trueInit, 20, 12345)

        @Assert(results1.size, results2.size)
```

# method TestTargetTracker.func testLowNoiseBetterAccuracy()

## function:

实现 `` 中的 `testLowNoiseBetterAccuracy` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testLowNoiseBetterAccuracy() {
        // 高噪声跟踪
        let trackerHigh = TargetTracker(1.0, 0.5, 50.0)
        let trueInit = TargetState(0.0, 0.0, 10.0, 5.0)
        trackerHigh.initialize(TargetState(0.0, 0.0, 0.0, 0.0), 100.0, 10.0)
        let resultsHigh = trackerHigh.simulate(trueInit, 50, 42)

        // 低噪声跟踪
        let trackerLow = TargetTracker(1.0, 0.5, 5.0)
        trackerLow.initialize(TargetState(0.0, 0.0, 0.0, 0.0), 100.0, 10.0)
        let resultsLow = trackerLow.simulate(trueInit, 50, 42)
```

# class TestKalmanRobustness

## function:

封装 `` 中与 `TestKalmanRobustness` 相关的数据和行为，是项目中的类级实现单元。

## kind:

class

## access:

internal

## extends:

none

## implements:

none

## properties:

- `internal let n: None`

- `internal let m: None`

- `internal let kf: None`

- `internal let F: None`

- `internal let H: None`

- `internal let row: None`

- `internal let col: None`

- `internal let Q: None`

- `internal let R: None`

- `internal let P0: None`

- `internal let state: None`

- `internal let P: None`

## usage example:

```cangjie
class TestKalmanRobustness {
    /**
     * 大维度滤波器：验证 6 维状态可以正常工作。
     */
    @TestCase
    func testHighDimension() {
        let n = 6
        let m = 3
        let kf = KalmanFilter(Int64(n), Int64(m))

        // 设置单位矩阵作为 F
        let F = Array<Float64>(n * n, {i => if (i / n == i % n) { 1.0 } else { 0.0 }})
        kf.setTransition(F)

        // 设置观测矩阵（前 3 个状态可观测）
        let H = Array<Float64>(m * n, {i =>
            let row = i / n
            let col = i % n
            if (row == col) { 1.0 } else { 0.0 }
        })
```

# method TestKalmanRobustness.func testHighDimension()

## function:

实现 `` 中的 `testHighDimension` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testHighDimension() {
        let n = 6
        let m = 3
        let kf = KalmanFilter(Int64(n), Int64(m))

        // 设置单位矩阵作为 F
        let F = Array<Float64>(n * n, {i => if (i / n == i % n) { 1.0 } else { 0.0 }})
        kf.setTransition(F)

        // 设置观测矩阵（前 3 个状态可观测）
        let H = Array<Float64>(m * n, {i =>
```

# method TestKalmanRobustness.func testZeroProcessNoise()

## function:

实现 `` 中的 `testZeroProcessNoise` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testZeroProcessNoise() {
        let kf = KalmanFilter(1, 1)
        kf.setTransition([1.0])
        kf.setObservation([1.0])
        kf.setProcessNoise([0.0])
        kf.setMeasurementNoise([1.0])
        kf.setState([0.0])
        kf.setCovariance([100.0])

        for (_ in 0..20) {
            kf.predict()
```

# method TestKalmanRobustness.func testLargeMeasurementNoise()

## function:

实现 `` 中的 `testLargeMeasurementNoise` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testLargeMeasurementNoise() {
        let kf = KalmanFilter(1, 1)
        kf.setTransition([1.0])
        kf.setObservation([1.0])
        kf.setProcessNoise([0.01])
        kf.setMeasurementNoise([10000.0])  // 非常大的测量噪声
        kf.setState([50.0])
        kf.setCovariance([1.0])

        // 给一个很远的测量值
        kf.predict()
```

# method TestKalmanRobustness.func testSmallMeasurementNoise()

## function:

实现 `` 中的 `testSmallMeasurementNoise` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testSmallMeasurementNoise() {
        let kf = KalmanFilter(1, 1)
        kf.setTransition([1.0])
        kf.setObservation([1.0])
        kf.setProcessNoise([100.0])
        kf.setMeasurementNoise([0.001])  // 非常小的测量噪声
        kf.setState([50.0])
        kf.setCovariance([100.0])

        kf.predict()
        kf.update([200.0])
```

# class TestTrackerStepByStep

## function:

封装 `` 中与 `TestTrackerStepByStep` 相关的数据和行为，是项目中的类级实现单元。

## kind:

class

## access:

internal

## extends:

none

## implements:

none

## properties:

- `internal let tracker: None`

- `internal let state: None`

- `internal let cov: None`

## usage example:

```cangjie
class TestTrackerStepByStep {
    /**
     * 手动逐步操作跟踪器。
     */
    @TestCase
    func testManualPredictUpdate() {
        let tracker = TargetTracker(1.0, 0.5, 10.0)
        tracker.initialize(TargetState(0.0, 0.0, 10.0, 5.0), 10.0, 5.0)

        // 手动执行几步
        for (i in 1..=5) {
            tracker.predict()
            tracker.update(Position(Float64(i) * 10.0, Float64(i) * 5.0))
        }

        let state = tracker.getState()
        @Assert(state.size, 4)
        // 状态应在合理范围内
        @Assert(abs(state[0]) < 200.0)
        @Assert(abs(state[1]) < 200.0)
```

# method TestTrackerStepByStep.func testManualPredictUpdate()

## function:

实现 `` 中的 `testManualPredictUpdate` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testManualPredictUpdate() {
        let tracker = TargetTracker(1.0, 0.5, 10.0)
        tracker.initialize(TargetState(0.0, 0.0, 10.0, 5.0), 10.0, 5.0)

        // 手动执行几步
        for (i in 1..=5) {
            tracker.predict()
            tracker.update(Position(Float64(i) * 10.0, Float64(i) * 5.0))
        }

        let state = tracker.getState()
```

# method TestTrackerStepByStep.func testGetCovariance()

## function:

实现 `` 中的 `testGetCovariance` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testGetCovariance() {
        let tracker = TargetTracker(1.0, 0.5, 10.0)
        tracker.initialize(TargetState(0.0, 0.0, 10.0, 5.0), 20.0, 5.0)

        let cov = tracker.getCovariance()
        @Assert(cov.size, 16)  // 4x4 矩阵

        // 对角线元素应为正
        @Assert(cov[0] > 0.0)   // P(px, px)
        @Assert(cov[5] > 0.0)   // P(py, py)
        @Assert(cov[10] > 0.0)  // P(vx, vx)
```

# class TestSimpleRandom

## function:

封装 `` 中与 `TestSimpleRandom` 相关的数据和行为，是项目中的类级实现单元。

## kind:

class

## access:

internal

## extends:

none

## implements:

none

## properties:

- `internal let rng1: None`

- `internal let rng2: None`

- `internal let rng: None`

- `internal let v: None`

- `internal let n: None`

- `internal var sum: None`

- `internal var sumSq: None`

- `internal let mean: None`

- `internal let variance: None`

- `internal let std: None`

- `internal var allSame: None`

## usage example:

```cangjie
class TestSimpleRandom {
    /**
     * 相同种子应产生相同序列。
     */
    @TestCase
    func testDeterministic() {
        let rng1 = SimpleRandom(42)
        let rng2 = SimpleRandom(42)

        for (_ in 0..100) {
            @Assert(abs(rng1.nextUniform() - rng2.nextUniform()) < 1.0e-15)
        }
    }

    /**
     * 均匀分布应在 [0, 1) 范围内。
     */
    @TestCase
    func testUniformRange() {
        let rng = SimpleRandom(123)
```

# method TestSimpleRandom.func testDeterministic()

## function:

实现 `` 中的 `testDeterministic` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testDeterministic() {
        let rng1 = SimpleRandom(42)
        let rng2 = SimpleRandom(42)

        for (_ in 0..100) {
            @Assert(abs(rng1.nextUniform() - rng2.nextUniform()) < 1.0e-15)
        }
    }

    /**
     * 均匀分布应在 [0, 1) 范围内。
```

# method TestSimpleRandom.func testUniformRange()

## function:

实现 `` 中的 `testUniformRange` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testUniformRange() {
        let rng = SimpleRandom(123)
        for (_ in 0..1000) {
            let v = rng.nextUniform()
            @Assert(v >= 0.0)
            @Assert(v < 1.0)
        }
    }

    /**
     * 高斯分布：大量样本的均值应接近 0，标准差接近 1。
```

# method TestSimpleRandom.func testGaussianDistribution()

## function:

实现 `` 中的 `testGaussianDistribution` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testGaussianDistribution() {
        let rng = SimpleRandom(456)
        let n = 10000
        var sum = 0.0
        var sumSq = 0.0

        for (_ in 0..n) {
            let v = rng.nextGaussian()
            sum += v
            sumSq += v * v
        }
```

# method TestSimpleRandom.func testDifferentSeeds()

## function:

实现 `` 中的 `testDifferentSeeds` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testDifferentSeeds() {
        let rng1 = SimpleRandom(1)
        let rng2 = SimpleRandom(2)
        var allSame = true
        for (_ in 0..10) {
            if (abs(rng1.nextUniform() - rng2.nextUniform()) > 1.0e-10) {
                allSame = false
                break
            }
        }
        @Assert(!allSame)
```

# module tests/kalman_filter/project/src/kalman_wrapper.cj

## function:

负责测试 `kalman_wrapper` 相关功能是否符合预期。

## usage example:

```cangjie
# source: tests/kalman_filter/project/src/kalman_wrapper.cj
```

## package:
kalman

# class KalmanException

## function:

* * Exception type for Kalman filter operations.。

## kind:

class

## access:

public

## extends:

none

## implements:

none

## usage example:

```cangjie
public class KalmanException <: Exception {
    public init(message: String) {
        super(message)
    }
}
```

# class KalmanFilter

## function:

* * Safe Cangjie wrapper around the C Kalman filter library. * Manages the lifecycle of the C filter handle and provides * a convenient API using Array<Float64>. * * Usage: *   let kf = KalmanFilter(4, 2) *   kf.setTransition(F) *   kf.setObservation(H) *   kf.setProcessNoise(Q) *   kf.setMeasurementNoise(R) *   kf.setState(x0) *   kf.setCovariance(P0) *   kf.predict() *   kf.update(measurement) *   let state = kf.getState()。

## kind:

class

## access:

public

## extends:

none

## implements:

none

## properties:

- `private let handle: CPointer<Unit>`

- `private let _stateDim: Int64`

- `private let _measDim: Int64`

- `private var _destroyed: Bool`

- `internal let h: None`

- `internal let result: None`

## usage example:

```cangjie
public class KalmanFilter {
    private let handle: CPointer<Unit>
    private let _stateDim: Int64
    private let _measDim: Int64
    private var _destroyed: Bool = false

    /**
     * Create a Kalman filter with given state and measurement dimensions.
     * @param stateDim state vector dimension (must be > 0)
     * @param measDim measurement vector dimension (must be > 0)
     * @throws KalmanException if creation fails
     */
    public init(stateDim: Int64, measDim: Int64) {
        if (stateDim <= 0 || measDim <= 0) {
            throw KalmanException("Dimensions must be positive: stateDim=${stateDim}, measDim=${measDim}")
        }
        _stateDim = stateDim
        _measDim = measDim
        handle = unsafe { kf_create(Int32(stateDim), Int32(measDim)) }
        if (handle.isNull()) {
```

# method KalmanFilter.func destroy(): Unit

## function:

* * Destroy the filter and release C memory. * Safe to call multiple times.。

## access:

public

## is_static:

False

## usage example:

```cangjie
public func destroy(): Unit {
        if (!_destroyed) {
            unsafe { kf_destroy(handle) }
            _destroyed = true
        }
    }

    /** State vector dimension */
    public prop stateDim: Int64 {
        get() { _stateDim }
    }
```

# method KalmanFilter.func checkNotDestroyed(): Unit

## function:

实现 `` 中的 `checkNotDestroyed` 逻辑，是该模块中的可调用函数单元。

## access:

private

## is_static:

False

## usage example:

```cangjie
private func checkNotDestroyed(): Unit {
        if (_destroyed) {
            throw KalmanException("Filter has been destroyed")
        }
    }

    /**
     * Set the state transition matrix F (row-major, stateDim x stateDim).
     */
    public func setTransition(F: Array<Float64>): Unit {
        checkNotDestroyed()
```

# method KalmanFilter.func setTransition(F: Array<Float64>): Unit

## function:

* * Set the state transition matrix F (row-major, stateDim x stateDim).。

## access:

public

## is_static:

False

## usage example:

```cangjie
public func setTransition(F: Array<Float64>): Unit {
        checkNotDestroyed()
        if (F.size != _stateDim * _stateDim) {
            throw KalmanException("F size mismatch: expected ${_stateDim * _stateDim}, got ${F.size}")
        }
        unsafe {
            let h = acquireArrayRawData(F)
            kf_set_transition(handle, h.pointer)
            releaseArrayRawData(h)
        }
    }
```

# method KalmanFilter.func setObservation(H: Array<Float64>): Unit

## function:

* * Set the observation matrix H (row-major, measDim x stateDim).。

## access:

public

## is_static:

False

## usage example:

```cangjie
public func setObservation(H: Array<Float64>): Unit {
        checkNotDestroyed()
        if (H.size != _measDim * _stateDim) {
            throw KalmanException("H size mismatch: expected ${_measDim * _stateDim}, got ${H.size}")
        }
        unsafe {
            let h = acquireArrayRawData(H)
            kf_set_observation(handle, h.pointer)
            releaseArrayRawData(h)
        }
    }
```

# method KalmanFilter.func setProcessNoise(Q: Array<Float64>): Unit

## function:

* * Set the process noise covariance Q (row-major, stateDim x stateDim).。

## access:

public

## is_static:

False

## usage example:

```cangjie
public func setProcessNoise(Q: Array<Float64>): Unit {
        checkNotDestroyed()
        if (Q.size != _stateDim * _stateDim) {
            throw KalmanException("Q size mismatch: expected ${_stateDim * _stateDim}, got ${Q.size}")
        }
        unsafe {
            let h = acquireArrayRawData(Q)
            kf_set_process_noise(handle, h.pointer)
            releaseArrayRawData(h)
        }
    }
```

# method KalmanFilter.func setMeasurementNoise(R: Array<Float64>): Unit

## function:

* * Set the measurement noise covariance R (row-major, measDim x measDim).。

## access:

public

## is_static:

False

## usage example:

```cangjie
public func setMeasurementNoise(R: Array<Float64>): Unit {
        checkNotDestroyed()
        if (R.size != _measDim * _measDim) {
            throw KalmanException("R size mismatch: expected ${_measDim * _measDim}, got ${R.size}")
        }
        unsafe {
            let h = acquireArrayRawData(R)
            kf_set_measurement_noise(handle, h.pointer)
            releaseArrayRawData(h)
        }
    }
```

# method KalmanFilter.func setState(x: Array<Float64>): Unit

## function:

* * Set the state vector x (stateDim x 1).。

## access:

public

## is_static:

False

## usage example:

```cangjie
public func setState(x: Array<Float64>): Unit {
        checkNotDestroyed()
        if (x.size != _stateDim) {
            throw KalmanException("State size mismatch: expected ${_stateDim}, got ${x.size}")
        }
        unsafe {
            let h = acquireArrayRawData(x)
            kf_set_state(handle, h.pointer)
            releaseArrayRawData(h)
        }
    }
```

# method KalmanFilter.func setCovariance(P: Array<Float64>): Unit

## function:

* * Set the error covariance matrix P (row-major, stateDim x stateDim).。

## access:

public

## is_static:

False

## usage example:

```cangjie
public func setCovariance(P: Array<Float64>): Unit {
        checkNotDestroyed()
        if (P.size != _stateDim * _stateDim) {
            throw KalmanException("P size mismatch: expected ${_stateDim * _stateDim}, got ${P.size}")
        }
        unsafe {
            let h = acquireArrayRawData(P)
            kf_set_covariance(handle, h.pointer)
            releaseArrayRawData(h)
        }
    }
```

# method KalmanFilter.func predict(): Unit

## function:

* * Perform the prediction step.。

## access:

public

## is_static:

False

## usage example:

```cangjie
public func predict(): Unit {
        checkNotDestroyed()
        unsafe { kf_predict(handle) }
    }

    /**
     * Perform the update step with measurement z.
     * @param z measurement vector (measDim x 1)
     */
    public func update(z: Array<Float64>): Unit {
        checkNotDestroyed()
```

# method KalmanFilter.func update(z: Array<Float64>): Unit

## function:

* * Perform the update step with measurement z. * @param z measurement vector (measDim x 1)。

## access:

public

## is_static:

False

## usage example:

```cangjie
public func update(z: Array<Float64>): Unit {
        checkNotDestroyed()
        if (z.size != _measDim) {
            throw KalmanException("Measurement size mismatch: expected ${_measDim}, got ${z.size}")
        }
        unsafe {
            let h = acquireArrayRawData(z)
            kf_update(handle, h.pointer)
            releaseArrayRawData(h)
        }
    }
```

# method KalmanFilter.func getState(): Array<Float64>

## function:

* * Get the current state estimate. * @return state vector (stateDim x 1)。

## access:

public

## is_static:

False

## usage example:

```cangjie
public func getState(): Array<Float64> {
        checkNotDestroyed()
        let result = Array<Float64>(_stateDim, repeat: 0.0)
        unsafe {
            let h = acquireArrayRawData(result)
            kf_get_state(handle, h.pointer)
            releaseArrayRawData(h)
        }
        return result
    }
```

# method KalmanFilter.func getCovariance(): Array<Float64>

## function:

* * Get the current error covariance. * @return covariance matrix (row-major, stateDim x stateDim)。

## access:

public

## is_static:

False

## usage example:

```cangjie
public func getCovariance(): Array<Float64> {
        checkNotDestroyed()
        let result = Array<Float64>(_stateDim * _stateDim, repeat: 0.0)
        unsafe {
            let h = acquireArrayRawData(result)
            kf_get_covariance(handle, h.pointer)
            releaseArrayRawData(h)
        }
        return result
    }
```

# method KalmanFilter.func getGain(): Array<Float64>

## function:

* * Get the Kalman gain from the last update. * @return Kalman gain matrix (row-major, stateDim x measDim)。

## access:

public

## is_static:

False

## usage example:

```cangjie
public func getGain(): Array<Float64> {
        checkNotDestroyed()
        let result = Array<Float64>(_stateDim * _measDim, repeat: 0.0)
        unsafe {
            let h = acquireArrayRawData(result)
            kf_get_gain(handle, h.pointer)
            releaseArrayRawData(h)
        }
        return result
    }
}
```

# module tests/kalman_filter/project/src/main.cj

## function:

负责测试 `main` 相关功能是否符合预期。

## usage example:

```cangjie
# source: tests/kalman_filter/project/src/main.cj
```

## package:
kalman

## imports:

- `std.math.*`

# func func formatF(v: Float64): String

## function:

实现 `` 中的 `formatF` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## usage example:

```cangjie
func formatF(v: Float64): String {
    // Simple formatting: keep 2 decimal places
    let sign = if (v < 0.0) { "-" } else { "" }
    let absV = abs(v)
    let intPart = Int64(absV)
    let fracPart = Int64((absV - Float64(intPart)) * 100.0 + 0.5)
    if (fracPart >= 100) {
        return "${sign}${intPart + 1}.00"
    }
    let fracStr = if (fracPart < 10) { "0${fracPart}" } else { "${fracPart}" }
    return "${sign}${intPart}.${fracStr}"
```

# let tracker

## function:

`tracker` 是不可变变量，类型为 `None`，用于保存常量值或不可变引用。

## access:

internal

## usage example:

```cangjie
let tracker = TargetTracker(1.0, 0.5, 10.0)
```

# let trueInitial

## function:

`trueInitial` 是不可变变量，类型为 `None`，用于保存常量值或不可变引用。

## access:

internal

## usage example:

```cangjie
let trueInitial = TargetState(0.0, 0.0, 10.0, 5.0)
```

# let initEstimate

## function:

`initEstimate` 是不可变变量，类型为 `None`，用于保存常量值或不可变引用。

## access:

internal

## usage example:

```cangjie
let initEstimate = TargetState(5.0, -3.0, 8.0, 6.0)
```

# let results

## function:

`results` 是不可变变量，类型为 `None`，用于保存常量值或不可变引用。

## access:

internal

## usage example:

```cangjie
let results = tracker.simulate(trueInitial, 50, 42)
```

# var totalError

## function:

`totalError` 是可变变量，类型为 `None`，用于保存运行时状态或可变数据。

## access:

internal

## usage example:

```cangjie
var totalError = 0.0
```

# let r

## function:

`r` 是不可变变量，类型为 `None`，用于保存常量值或不可变引用。

## access:

internal

## usage example:

```cangjie
let r = results[i]
```

# let avgError

## function:

`avgError` 是不可变变量，类型为 `None`，用于保存常量值或不可变引用。

## access:

internal

## usage example:

```cangjie
let avgError = totalError / Float64(results.size)
```

# var earlyError

## function:

`earlyError` 是可变变量，类型为 `None`，用于保存运行时状态或可变数据。

## access:

internal

## usage example:

```cangjie
var earlyError = 0.0
```

# var lateError

## function:

`lateError` 是可变变量，类型为 `None`，用于保存运行时状态或可变数据。

## access:

internal

## usage example:

```cangjie
var lateError = 0.0
```

# let sign

## function:

`sign` 是不可变变量，类型为 `None`，用于保存常量值或不可变引用。

## access:

internal

## usage example:

```cangjie
let sign = if (v < 0.0) { "-" } else { "" }
```

# let absV

## function:

`absV` 是不可变变量，类型为 `None`，用于保存常量值或不可变引用。

## access:

internal

## usage example:

```cangjie
let absV = abs(v)
```

# let intPart

## function:

`intPart` 是不可变变量，类型为 `None`，用于保存常量值或不可变引用。

## access:

internal

## usage example:

```cangjie
let intPart = Int64(absV)
```

# let fracPart

## function:

`fracPart` 是不可变变量，类型为 `None`，用于保存常量值或不可变引用。

## access:

internal

## usage example:

```cangjie
let fracPart = Int64((absV - Float64(intPart)) * 100.0 + 0.5)
```

# let fracStr

## function:

`fracStr` 是不可变变量，类型为 `None`，用于保存常量值或不可变引用。

## access:

internal

## usage example:

```cangjie
let fracStr = if (fracPart < 10) { "0${fracPart}" } else { "${fracPart}" }
```

# module tests/kalman_filter/project/src/target_tracker.cj

## function:

负责测试 `target_tracker` 相关功能是否符合预期。

## usage example:

```cangjie
# source: tests/kalman_filter/project/src/target_tracker.cj
```

## package:
kalman

## imports:

- `std.math.*`

- `std.collection.*`

# class Position

## function:

* * Represents a 2D position.。

## kind:

struct

## access:

public

## extends:

none

## implements:

none

## properties:

- `public var x: Float64`

- `public var y: Float64`

## usage example:

```cangjie
public struct Position {
    public var x: Float64
    public var y: Float64

    public init(x: Float64, y: Float64) {
        this.x = x
        this.y = y
    }
}
```

# class TargetState

## function:

* * Represents a 2D target state (position + velocity).。

## kind:

struct

## access:

public

## extends:

none

## implements:

none

## properties:

- `public var px: Float64`

- `public var py: Float64`

- `public var vx: Float64`

- `public var vy: Float64`

## usage example:

```cangjie
public struct TargetState {
    public var px: Float64  // position x
    public var py: Float64  // position y
    public var vx: Float64  // velocity x
    public var vy: Float64  // velocity y

    public init(px: Float64, py: Float64, vx: Float64, vy: Float64) {
        this.px = px
        this.py = py
        this.vx = vx
        this.vy = vy
    }
}
```

# class TrackingStep

## function:

* * Result of a single tracking step.。

## kind:

struct

## access:

public

## extends:

none

## implements:

none

## properties:

- `public let time: Float64`

- `public let trueState: TargetState`

- `public let measurement: Position`

- `public let estimated: TargetState`

- `public let positionError: Float64`

## usage example:

```cangjie
public struct TrackingStep {
    public let time: Float64
    public let trueState: TargetState
    public let measurement: Position
    public let estimated: TargetState
    public let positionError: Float64

    public init(time: Float64, trueState: TargetState, measurement: Position,
                estimated: TargetState, positionError: Float64) {
        this.time = time
        this.trueState = trueState
        this.measurement = measurement
        this.estimated = estimated
        this.positionError = positionError
    }
}
```

# class SimpleRandom

## function:

* * A simple linear congruential random number generator for deterministic simulation. * Uses xorshift64 algorithm for pseudo-random generation and Box-Muller transform * for Gaussian distribution.。

## kind:

class

## access:

public

## extends:

none

## implements:

none

## properties:

- `private var state: UInt64`

- `internal var u1: None`

- `internal let u2: None`

## usage example:

```cangjie
public class SimpleRandom {
    private var state: UInt64

    public init(seed: UInt64) {
        state = if (seed == 0) { 1 } else { seed }
    }

    /** Generate next uniform random number in [0, 1) using xorshift64 */
    public func nextUniform(): Float64 {
        state = state ^ (state << 13)
        state = state ^ (state >> 7)
        state = state ^ (state << 17)
        return Float64(state % 1000000000) / 1000000000.0
    }

    /** Generate next Gaussian (normal) random number with mean 0 and std 1 */
    public func nextGaussian(): Float64 {
        var u1 = nextUniform()
        while (u1 < 1.0e-10) {
            u1 = nextUniform()
```

# method SimpleRandom.func nextUniform(): Float64

## function:

* Generate next uniform random number in [0, 1) using xorshift64。

## access:

public

## is_static:

False

## usage example:

```cangjie
public func nextUniform(): Float64 {
        state = state ^ (state << 13)
        state = state ^ (state >> 7)
        state = state ^ (state << 17)
        return Float64(state % 1000000000) / 1000000000.0
    }

    /** Generate next Gaussian (normal) random number with mean 0 and std 1 */
    public func nextGaussian(): Float64 {
        var u1 = nextUniform()
        while (u1 < 1.0e-10) {
```

# method SimpleRandom.func nextGaussian(mean: Float64, std: Float64): Float64

## function:

* Generate Gaussian with specified mean and standard deviation。

## access:

public

## is_static:

False

## usage example:

```cangjie
public func nextGaussian(mean: Float64, std: Float64): Float64 {
        return mean + std * nextGaussian()
    }
}

/**
 * 2D target tracking simulator using Kalman filter.
 *
 * Models a target moving in 2D with constant velocity model.
 * State vector: [px, py, vx, vy] (position and velocity)
 * Measurement: [px, py] (position only, with noise)
```

# class TargetTracker

## function:

* * 2D target tracking simulator using Kalman filter. * * Models a target moving in 2D with constant velocity model. * State vector: [px, py, vx, vy] (position and velocity) * Measurement: [px, py] (position only, with noise) * * The simulation generates ground truth trajectory, adds measurement noise, * and uses the Kalman filter to estimate the target state.。

## kind:

class

## access:

public

## extends:

none

## implements:

none

## properties:

- `private let dt: Float64`

- `private let processNoise: Float64`

- `private let measurementNoise: Float64`

- `private let kf: KalmanFilter`

- `internal let F: Array<Float64>`

- `internal let H: Array<Float64>`

- `internal let q: None`

- `internal let dt2: None`

- `internal let dt3: None`

- `internal let dt4: None`

- `internal let Q: Array<Float64>`

- `internal let r: None`

- `internal let R: Array<Float64>`

- `internal let x0: Array<Float64>`

- `internal let pu2: None`

- `internal let vu2: None`

- `internal let P0: Array<Float64>`

- `internal let rng: None`

- `internal let results: None`

- `internal var trueState: None`

- `internal let time: None`

- `internal let ax: None`

- `internal let ay: None`

- `internal let measX: None`

- `internal let measY: None`

- `internal let measurement: None`

- `internal let state: None`

- `internal let estimated: None`

- `internal let errX: None`

- `internal let errY: None`

- `internal let posError: None`

## usage example:

```cangjie
public class TargetTracker {
    private let dt: Float64
    private let processNoise: Float64
    private let measurementNoise: Float64
    private let kf: KalmanFilter

    /**
     * Create a target tracker.
     * @param dt time step (seconds)
     * @param processNoise process noise standard deviation (acceleration noise)
     * @param measurementNoise measurement noise standard deviation (position noise)
     */
    public init(dt: Float64, processNoise: Float64, measurementNoise: Float64) {
        this.dt = dt
        this.processNoise = processNoise
        this.measurementNoise = measurementNoise

        // State: [px, py, vx, vy], Measurement: [px, py]
        kf = KalmanFilter(4, 2)
```

# method TargetTracker.func getState(): Array<Float64>

## function:

* Get the current Kalman filter state estimate。

## access:

public

## is_static:

False

## usage example:

```cangjie
public func getState(): Array<Float64> {
        return kf.getState()
    }

    /** Get the current error covariance */
    public func getCovariance(): Array<Float64> {
        return kf.getCovariance()
    }

    /** Perform a single predict step */
    public func predict(): Unit {
```

# method TargetTracker.func getCovariance(): Array<Float64>

## function:

* Get the current error covariance。

## access:

public

## is_static:

False

## usage example:

```cangjie
public func getCovariance(): Array<Float64> {
        return kf.getCovariance()
    }

    /** Perform a single predict step */
    public func predict(): Unit {
        kf.predict()
    }

    /** Perform a single update step */
    public func update(measurement: Position): Unit {
```

# method TargetTracker.func predict(): Unit

## function:

* Perform a single predict step。

## access:

public

## is_static:

False

## usage example:

```cangjie
public func predict(): Unit {
        kf.predict()
    }

    /** Perform a single update step */
    public func update(measurement: Position): Unit {
        kf.update([measurement.x, measurement.y])
    }

    /** Destroy the underlying filter */
    public func destroy(): Unit {
```

# method TargetTracker.func update(measurement: Position): Unit

## function:

* Perform a single update step。

## access:

public

## is_static:

False

## usage example:

```cangjie
public func update(measurement: Position): Unit {
        kf.update([measurement.x, measurement.y])
    }

    /** Destroy the underlying filter */
    public func destroy(): Unit {
        kf.destroy()
    }
}
```

# method TargetTracker.func destroy(): Unit

## function:

* Destroy the underlying filter。

## access:

public

## is_static:

False

## usage example:

```cangjie
public func destroy(): Unit {
        kf.destroy()
    }
}
```

# let KF_PI

## function:

`KF_PI` 是不可变变量，类型为 `None`，用于保存常量值或不可变引用。

## access:

internal

## usage example:

```cangjie
let KF_PI = 3.14159265358979323846
```

# module tests/linq_dsl/macro_dsl_test.cj

## function:

负责测试 `macro_dsl_test` 相关功能是否符合预期。

## usage example:

```cangjie
# source: tests/linq_dsl/macro_dsl_test.cj
```

## package:
macro_dsl

## imports:

- `std.unittest.*`

- `std.unittest.testmacro.*`

- `std.collection.*`

- `std.sort.*`

- `macros.*`

# class TestBasicSelect

## function:

封装 `` 中与 `TestBasicSelect` 相关的数据和行为，是项目中的类级实现单元。

## kind:

class

## access:

internal

## extends:

none

## implements:

none

## properties:

- `internal let arr: None`

- `internal let result: None`

## usage example:

```cangjie
class TestBasicSelect {
    @TestCase
    func testSelectAll() {
        let arr = [1, 2, 3, 4, 5]
        let result = @query[Int64](from x in arr select x * 2)
        @Assert(result.size == 5)
        @Assert(result[0] == 2)
        @Assert(result[1] == 4)
        @Assert(result[2] == 6)
        @Assert(result[3] == 8)
        @Assert(result[4] == 10)
    }

    @TestCase
    func testSelectIdentity() {
        let arr = [10, 20, 30]
        let result = @query[Int64](from x in arr select x)
        @Assert(result.size == 3)
        @Assert(result[0] == 10)
        @Assert(result[1] == 20)
```

# method TestBasicSelect.func testSelectAll()

## function:

实现 `` 中的 `testSelectAll` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testSelectAll() {
        let arr = [1, 2, 3, 4, 5]
        let result = @query[Int64](from x in arr select x * 2)
        @Assert(result.size == 5)
        @Assert(result[0] == 2)
        @Assert(result[1] == 4)
        @Assert(result[2] == 6)
        @Assert(result[3] == 8)
        @Assert(result[4] == 10)
    }
```

# method TestBasicSelect.func testSelectIdentity()

## function:

实现 `` 中的 `testSelectIdentity` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testSelectIdentity() {
        let arr = [10, 20, 30]
        let result = @query[Int64](from x in arr select x)
        @Assert(result.size == 3)
        @Assert(result[0] == 10)
        @Assert(result[1] == 20)
        @Assert(result[2] == 30)
    }

    @TestCase
    func testSelectExpression() {
```

# method TestBasicSelect.func testSelectExpression()

## function:

实现 `` 中的 `testSelectExpression` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testSelectExpression() {
        let arr = [1, 2, 3]
        let result = @query[Int64](from x in arr select x * x + 1)
        @Assert(result.size == 3)
        @Assert(result[0] == 2)
        @Assert(result[1] == 5)
        @Assert(result[2] == 10)
    }

    @TestCase
    func testSelectNegation() {
```

# method TestBasicSelect.func testSelectNegation()

## function:

实现 `` 中的 `testSelectNegation` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testSelectNegation() {
        let arr = [1, 2, 3]
        let result = @query[Int64](from x in arr select 0 - x)
        @Assert(result.size == 3)
        @Assert(result[0] == -1)
        @Assert(result[1] == -2)
        @Assert(result[2] == -3)
    }
}

// ==========================================
```

# class TestWhereClause

## function:

封装 `` 中与 `TestWhereClause` 相关的数据和行为，是项目中的类级实现单元。

## kind:

class

## access:

internal

## extends:

none

## implements:

none

## properties:

- `internal let arr: None`

- `internal let result: None`

## usage example:

```cangjie
class TestWhereClause {
    @TestCase
    func testSingleWhere() {
        let arr = [1, 2, 3, 4, 5]
        let result = @query[Int64](from x in arr where x > 3 select x)
        @Assert(result.size == 2)
        @Assert(result[0] == 4)
        @Assert(result[1] == 5)
    }

    @TestCase
    func testMultipleWhere() {
        let arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
        let result = @query[Int64](from x in arr where x > 2 where x < 8 select x)
        @Assert(result.size == 5)
        @Assert(result[0] == 3)
        @Assert(result[1] == 4)
        @Assert(result[2] == 5)
        @Assert(result[3] == 6)
        @Assert(result[4] == 7)
```

# method TestWhereClause.func testSingleWhere()

## function:

实现 `` 中的 `testSingleWhere` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testSingleWhere() {
        let arr = [1, 2, 3, 4, 5]
        let result = @query[Int64](from x in arr where x > 3 select x)
        @Assert(result.size == 2)
        @Assert(result[0] == 4)
        @Assert(result[1] == 5)
    }

    @TestCase
    func testMultipleWhere() {
        let arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
```

# method TestWhereClause.func testMultipleWhere()

## function:

实现 `` 中的 `testMultipleWhere` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testMultipleWhere() {
        let arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
        let result = @query[Int64](from x in arr where x > 2 where x < 8 select x)
        @Assert(result.size == 5)
        @Assert(result[0] == 3)
        @Assert(result[1] == 4)
        @Assert(result[2] == 5)
        @Assert(result[3] == 6)
        @Assert(result[4] == 7)
    }
```

# method TestWhereClause.func testWhereNoMatch()

## function:

实现 `` 中的 `testWhereNoMatch` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testWhereNoMatch() {
        let arr = [1, 2, 3]
        let result = @query[Int64](from x in arr where x > 100 select x)
        @Assert(result.size == 0)
    }

    @TestCase
    func testWhereAllMatch() {
        let arr = [1, 2, 3]
        let result = @query[Int64](from x in arr where x > 0 select x)
        @Assert(result.size == 3)
```

# method TestWhereClause.func testWhereAllMatch()

## function:

实现 `` 中的 `testWhereAllMatch` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testWhereAllMatch() {
        let arr = [1, 2, 3]
        let result = @query[Int64](from x in arr where x > 0 select x)
        @Assert(result.size == 3)
    }

    @TestCase
    func testWhereModulo() {
        let arr = [1, 2, 3, 4, 5, 6]
        let result = @query[Int64](from x in arr where x % 2 == 0 select x)
        @Assert(result.size == 3)
```

# method TestWhereClause.func testWhereModulo()

## function:

实现 `` 中的 `testWhereModulo` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testWhereModulo() {
        let arr = [1, 2, 3, 4, 5, 6]
        let result = @query[Int64](from x in arr where x % 2 == 0 select x)
        @Assert(result.size == 3)
        @Assert(result[0] == 2)
        @Assert(result[1] == 4)
        @Assert(result[2] == 6)
    }

    @TestCase
    func testWhereComplexCondition() {
```

# method TestWhereClause.func testWhereComplexCondition()

## function:

实现 `` 中的 `testWhereComplexCondition` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testWhereComplexCondition() {
        let arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
        let result = @query[Int64](from x in arr where x >= 3 where x <= 7 where x % 2 == 1 select x)
        @Assert(result.size == 3)
        @Assert(result[0] == 3)
        @Assert(result[1] == 5)
        @Assert(result[2] == 7)
    }
}

// ==========================================
```

# class TestOrderBy

## function:

封装 `` 中与 `TestOrderBy` 相关的数据和行为，是项目中的类级实现单元。

## kind:

class

## access:

internal

## extends:

none

## implements:

none

## properties:

- `internal let arr: None`

- `internal let result: None`

## usage example:

```cangjie
class TestOrderBy {
    @TestCase
    func testOrderByAsc() {
        let arr = [3, 1, 4, 1, 5, 9, 2, 6]
        let result = @query[Int64](from x in arr select x orderby asc)
        @Assert(result.size == 8)
        @Assert(result[0] == 1)
        @Assert(result[1] == 1)
        @Assert(result[2] == 2)
        @Assert(result[3] == 3)
        @Assert(result[result.size - 1] == 9)
    }

    @TestCase
    func testOrderByDesc() {
        let arr = [3, 1, 4, 1, 5, 9, 2, 6]
        let result = @query[Int64](from x in arr select x orderby desc)
        @Assert(result.size == 8)
        @Assert(result[0] == 9)
        @Assert(result[1] == 6)
```

# method TestOrderBy.func testOrderByAsc()

## function:

实现 `` 中的 `testOrderByAsc` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testOrderByAsc() {
        let arr = [3, 1, 4, 1, 5, 9, 2, 6]
        let result = @query[Int64](from x in arr select x orderby asc)
        @Assert(result.size == 8)
        @Assert(result[0] == 1)
        @Assert(result[1] == 1)
        @Assert(result[2] == 2)
        @Assert(result[3] == 3)
        @Assert(result[result.size - 1] == 9)
    }
```

# method TestOrderBy.func testOrderByDesc()

## function:

实现 `` 中的 `testOrderByDesc` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testOrderByDesc() {
        let arr = [3, 1, 4, 1, 5, 9, 2, 6]
        let result = @query[Int64](from x in arr select x orderby desc)
        @Assert(result.size == 8)
        @Assert(result[0] == 9)
        @Assert(result[1] == 6)
        @Assert(result[2] == 5)
        @Assert(result[result.size - 1] == 1)
    }

    @TestCase
```

# method TestOrderBy.func testOrderByWithWhere()

## function:

实现 `` 中的 `testOrderByWithWhere` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testOrderByWithWhere() {
        let arr = [5, 3, 8, 1, 9, 2, 7]
        let result = @query[Int64](from x in arr where x > 3 select x orderby asc)
        @Assert(result.size == 4)
        @Assert(result[0] == 5)
        @Assert(result[1] == 7)
        @Assert(result[2] == 8)
        @Assert(result[3] == 9)
    }

    @TestCase
```

# method TestOrderBy.func testOrderByDefault()

## function:

实现 `` 中的 `testOrderByDefault` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testOrderByDefault() {
        let arr = [3, 1, 2]
        let result = @query[Int64](from x in arr select x orderby)
        @Assert(result[0] == 1)
        @Assert(result[1] == 2)
        @Assert(result[2] == 3)
    }

    @TestCase
    func testOrderByWithTransform() {
        let arr = [5, 3, 8, 1]
```

# method TestOrderBy.func testOrderByWithTransform()

## function:

实现 `` 中的 `testOrderByWithTransform` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testOrderByWithTransform() {
        let arr = [5, 3, 8, 1]
        let result = @query[Int64](from x in arr select x * 10 orderby asc)
        @Assert(result.size == 4)
        @Assert(result[0] == 10)
        @Assert(result[1] == 30)
        @Assert(result[2] == 50)
        @Assert(result[3] == 80)
    }
}
```

# class TestCount

## function:

封装 `` 中与 `TestCount` 相关的数据和行为，是项目中的类级实现单元。

## kind:

class

## access:

internal

## extends:

none

## implements:

none

## properties:

- `internal let arr: None`

- `internal let result: Int64`

## usage example:

```cangjie
class TestCount {
    @TestCase
    func testCountAll() {
        let arr = [1, 2, 3, 4, 5]
        let result: Int64 = @query[count](from x in arr)
        @Assert(result == 5)
    }

    @TestCase
    func testCountWithWhere() {
        let arr = [1, 2, 3, 4, 5]
        let result: Int64 = @query[count](from x in arr where x > 3)
        @Assert(result == 2)
    }

    @TestCase
    func testCountZero() {
        let arr = [1, 2, 3]
        let result: Int64 = @query[count](from x in arr where x > 100)
        @Assert(result == 0)
```

# method TestCount.func testCountAll()

## function:

实现 `` 中的 `testCountAll` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testCountAll() {
        let arr = [1, 2, 3, 4, 5]
        let result: Int64 = @query[count](from x in arr)
        @Assert(result == 5)
    }

    @TestCase
    func testCountWithWhere() {
        let arr = [1, 2, 3, 4, 5]
        let result: Int64 = @query[count](from x in arr where x > 3)
        @Assert(result == 2)
```

# method TestCount.func testCountWithWhere()

## function:

实现 `` 中的 `testCountWithWhere` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testCountWithWhere() {
        let arr = [1, 2, 3, 4, 5]
        let result: Int64 = @query[count](from x in arr where x > 3)
        @Assert(result == 2)
    }

    @TestCase
    func testCountZero() {
        let arr = [1, 2, 3]
        let result: Int64 = @query[count](from x in arr where x > 100)
        @Assert(result == 0)
```

# method TestCount.func testCountZero()

## function:

实现 `` 中的 `testCountZero` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testCountZero() {
        let arr = [1, 2, 3]
        let result: Int64 = @query[count](from x in arr where x > 100)
        @Assert(result == 0)
    }

    @TestCase
    func testCountMultipleWhere() {
        let arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
        let result: Int64 = @query[count](from x in arr where x > 3 where x < 8)
        @Assert(result == 4)
```

# method TestCount.func testCountMultipleWhere()

## function:

实现 `` 中的 `testCountMultipleWhere` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testCountMultipleWhere() {
        let arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
        let result: Int64 = @query[count](from x in arr where x > 3 where x < 8)
        @Assert(result == 4)
    }
}

// ==========================================
// Test 5: Type Conversion
// ==========================================
@Test
```

# class TestTypeConversion

## function:

封装 `` 中与 `TestTypeConversion` 相关的数据和行为，是项目中的类级实现单元。

## kind:

class

## access:

internal

## extends:

none

## implements:

none

## properties:

- `internal let arr: None`

- `internal let result: None`

## usage example:

```cangjie
class TestTypeConversion {
    @TestCase
    func testIntToString() {
        let arr = [1, 2, 3]
        let result = @query[String](from x in arr select x.toString())
        @Assert(result.size == 3)
        @Assert(result[0] == "1")
        @Assert(result[1] == "2")
        @Assert(result[2] == "3")
    }

    @TestCase
    func testBoolResult() {
        let arr = [1, 2, 3, 4, 5]
        let result = @query[Bool](from x in arr select x > 3)
        @Assert(result.size == 5)
        @Assert(result[0] == false)
        @Assert(result[1] == false)
        @Assert(result[2] == false)
        @Assert(result[3] == true)
```

# method TestTypeConversion.func testIntToString()

## function:

实现 `` 中的 `testIntToString` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testIntToString() {
        let arr = [1, 2, 3]
        let result = @query[String](from x in arr select x.toString())
        @Assert(result.size == 3)
        @Assert(result[0] == "1")
        @Assert(result[1] == "2")
        @Assert(result[2] == "3")
    }

    @TestCase
    func testBoolResult() {
```

# method TestTypeConversion.func testBoolResult()

## function:

实现 `` 中的 `testBoolResult` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testBoolResult() {
        let arr = [1, 2, 3, 4, 5]
        let result = @query[Bool](from x in arr select x > 3)
        @Assert(result.size == 5)
        @Assert(result[0] == false)
        @Assert(result[1] == false)
        @Assert(result[2] == false)
        @Assert(result[3] == true)
        @Assert(result[4] == true)
    }
}
```

# class TestComplexQuery

## function:

封装 `` 中与 `TestComplexQuery` 相关的数据和行为，是项目中的类级实现单元。

## kind:

class

## access:

internal

## extends:

none

## implements:

none

## properties:

- `internal let list: None`

- `internal let result: None`

- `internal let arr: None`

- `internal let cnt: Int64`

- `internal let selected: None`

## usage example:

```cangjie
class TestComplexQuery {
    @TestCase
    func testWithArrayList() {
        let list = ArrayList<Int64>([1, 2, 3, 4, 5])
        let result = @query[Int64](from x in list where x > 2 select x * 10)
        @Assert(result.size == 3)
        @Assert(result[0] == 30)
        @Assert(result[1] == 40)
        @Assert(result[2] == 50)
    }

    @TestCase
    func testEmptySource() {
        let arr = Array<Int64>(0, {_ => 0})
        let result = @query[Int64](from x in arr select x)
        @Assert(result.size == 0)
    }

    @TestCase
    func testSingleElement() {
```

# method TestComplexQuery.func testWithArrayList()

## function:

实现 `` 中的 `testWithArrayList` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testWithArrayList() {
        let list = ArrayList<Int64>([1, 2, 3, 4, 5])
        let result = @query[Int64](from x in list where x > 2 select x * 10)
        @Assert(result.size == 3)
        @Assert(result[0] == 30)
        @Assert(result[1] == 40)
        @Assert(result[2] == 50)
    }

    @TestCase
    func testEmptySource() {
```

# method TestComplexQuery.func testEmptySource()

## function:

实现 `` 中的 `testEmptySource` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testEmptySource() {
        let arr = Array<Int64>(0, {_ => 0})
        let result = @query[Int64](from x in arr select x)
        @Assert(result.size == 0)
    }

    @TestCase
    func testSingleElement() {
        let arr = [42]
        let result = @query[Int64](from x in arr select x)
        @Assert(result.size == 1)
```

# method TestComplexQuery.func testSingleElement()

## function:

实现 `` 中的 `testSingleElement` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testSingleElement() {
        let arr = [42]
        let result = @query[Int64](from x in arr select x)
        @Assert(result.size == 1)
        @Assert(result[0] == 42)
    }

    @TestCase
    func testWhereAndSelect() {
        let arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
        let result = @query[Int64](from x in arr where x % 2 == 0 select x * 3)
```

# method TestComplexQuery.func testWhereAndSelect()

## function:

实现 `` 中的 `testWhereAndSelect` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testWhereAndSelect() {
        let arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
        let result = @query[Int64](from x in arr where x % 2 == 0 select x * 3)
        @Assert(result.size == 5)
        @Assert(result[0] == 6)
        @Assert(result[1] == 12)
        @Assert(result[2] == 18)
        @Assert(result[3] == 24)
        @Assert(result[4] == 30)
    }
```

# method TestComplexQuery.func testFullPipeline()

## function:

实现 `` 中的 `testFullPipeline` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testFullPipeline() {
        let arr = [15, 3, 8, 12, 1, 20, 7, 14]
        let result = @query[Int64](from x in arr where x > 5 where x < 16 select x orderby desc)
        @Assert(result.size == 5)
        @Assert(result[0] == 15)
        @Assert(result[1] == 14)
        @Assert(result[2] == 12)
        @Assert(result[3] == 8)
        @Assert(result[4] == 7)
    }
```

# method TestComplexQuery.func testLargeDataset()

## function:

实现 `` 中的 `testLargeDataset` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testLargeDataset() {
        let arr = Array<Int64>(100, {i => i + 1})
        let result = @query[Int64](from x in arr where x % 10 == 0 select x)
        @Assert(result.size == 10)
        @Assert(result[0] == 10)
        @Assert(result[9] == 100)
    }

    @TestCase
    func testCountAndSelectConsistency() {
        let arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
```

# method TestComplexQuery.func testCountAndSelectConsistency()

## function:

实现 `` 中的 `testCountAndSelectConsistency` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testCountAndSelectConsistency() {
        let arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
        let cnt: Int64 = @query[count](from x in arr where x > 5)
        let selected = @query[Int64](from x in arr where x > 5 select x)
        @Assert(cnt == selected.size)
    }
}
```

# module tests/linq_dsl/project/macros/src/query_macro.cj

## function:

负责测试 `query_macro` 相关功能是否符合预期。

## usage example:

```cangjie
# source: tests/linq_dsl/project/macros/src/query_macro.cj
```

## imports:

- `std.ast.*`

- `std.collection.*`

# func func subTokens(tokens: Tokens, startIdx: Int64, endIdx: Int64): Tokens

## function:

实现 `` 中的 `subTokens` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## usage example:

```cangjie
func subTokens(tokens: Tokens, startIdx: Int64, endIdx: Int64): Tokens {
    var result = ArrayList<Token>()
    var i = startIdx
    while (i < endIdx) {
        result.add(tokens[i])
        i += 1
    }
    return Tokens(result)
}

func isQueryKeyword(value: String): Bool {
```

# func func isQueryKeyword(value: String): Bool

## function:

实现 `` 中的 `isQueryKeyword` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## usage example:

```cangjie
func isQueryKeyword(value: String): Bool {
    return value == "from" || value == "in" || value == "where" ||
           value == "select" || value == "orderby" || value == "count" ||
           value == "asc" || value == "desc"
}

public macro query(attrTokens: Tokens, inputTokens: Tokens): Tokens {
    // Determine mode from attribute
    let isCount = (attrTokens.size > 0 && attrTokens[0].value == "count")

    let tokens = inputTokens
```

# func func generateCount(iterVar: Token, collExpr: Tokens, whereExprs: ArrayList<Tokens>): Tokens

## function:

实现 `` 中的 `generateCount` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## usage example:

```cangjie
func generateCount(iterVar: Token, collExpr: Tokens, whereExprs: ArrayList<Tokens>): Tokens {
    var loopBody: Tokens
    if (whereExprs.size > 0) {
        var cond = whereExprs[0]
        var i: Int64 = 1
        while (i < whereExprs.size) {
            let next = whereExprs[i]
            cond = quote($(cond) && $(next))
            i += 1
        }
        loopBody = quote(
```

# var result

## function:

`result` 是可变变量，类型为 `None`，用于保存运行时状态或可变数据。

## access:

internal

## usage example:

```cangjie
var result = ArrayList<Token>()
```

# var i

## function:

`i` 是可变变量，类型为 `Int64`，用于保存运行时状态或可变数据。

## access:

internal

## usage example:

```cangjie
var i: Int64 = 1
```

# let isCount

## function:

`isCount` 是不可变变量，类型为 `None`，用于保存常量值或不可变引用。

## access:

internal

## usage example:

```cangjie
let isCount = (attrTokens.size > 0 && attrTokens[0].value == "count")
```

# let tokens

## function:

`tokens` 是不可变变量，类型为 `None`，用于保存常量值或不可变引用。

## access:

internal

## usage example:

```cangjie
let tokens = inputTokens
```

# let n

## function:

`n` 是不可变变量，类型为 `None`，用于保存常量值或不可变引用。

## access:

internal

## usage example:

```cangjie
let n = tokens.size
```

# var kwPositions

## function:

`kwPositions` 是可变变量，类型为 `None`，用于保存运行时状态或可变数据。

## access:

internal

## usage example:

```cangjie
var kwPositions = ArrayList<Int64>()
```

# var kwNames

## function:

`kwNames` 是可变变量，类型为 `None`，用于保存运行时状态或可变数据。

## access:

internal

## usage example:

```cangjie
var kwNames = ArrayList<String>()
```

# var depth

## function:

`depth` 是可变变量，类型为 `Int64`，用于保存运行时状态或可变数据。

## access:

internal

## usage example:

```cangjie
var depth: Int64 = 0
```

# let tok

## function:

`tok` 是不可变变量，类型为 `None`，用于保存常量值或不可变引用。

## access:

internal

## usage example:

```cangjie
let tok = tokens[i]
```

# let v

## function:

`v` 是不可变变量，类型为 `None`，用于保存常量值或不可变引用。

## access:

internal

## usage example:

```cangjie
let v = tok.value
```

# let fromPos

## function:

`fromPos` 是不可变变量，类型为 `None`，用于保存常量值或不可变引用。

## access:

internal

## usage example:

```cangjie
let fromPos = kwPositions[0]
```

# let inPos

## function:

`inPos` 是不可变变量，类型为 `None`，用于保存常量值或不可变引用。

## access:

internal

## usage example:

```cangjie
let inPos = kwPositions[1]
```

# let iterVar

## function:

`iterVar` 是不可变变量，类型为 `None`，用于保存常量值或不可变引用。

## access:

internal

## usage example:

```cangjie
let iterVar = tokens[fromPos + 1]
```

# var kwIdx

## function:

`kwIdx` 是可变变量，类型为 `Int64`，用于保存运行时状态或可变数据。

## access:

internal

## usage example:

```cangjie
var kwIdx: Int64 = 2
```

# var collEnd

## function:

`collEnd` 是可变变量，类型为 `None`，用于保存运行时状态或可变数据。

## access:

internal

## usage example:

```cangjie
var collEnd = n
```

# let collExpr

## function:

`collExpr` 是不可变变量，类型为 `None`，用于保存常量值或不可变引用。

## access:

internal

## usage example:

```cangjie
let collExpr = subTokens(tokens, inPos + 1, collEnd)
```

# var whereExprs

## function:

`whereExprs` 是可变变量，类型为 `None`，用于保存运行时状态或可变数据。

## access:

internal

## usage example:

```cangjie
var whereExprs = ArrayList<Tokens>()
```

# let whereStart

## function:

`whereStart` 是不可变变量，类型为 `None`，用于保存常量值或不可变引用。

## access:

internal

## usage example:

```cangjie
let whereStart = kwPositions[kwIdx] + 1
```

# var whereEnd

## function:

`whereEnd` 是可变变量，类型为 `None`，用于保存运行时状态或可变数据。

## access:

internal

## usage example:

```cangjie
var whereEnd = n
```

# let selectStart

## function:

`selectStart` 是不可变变量，类型为 `None`，用于保存常量值或不可变引用。

## access:

internal

## usage example:

```cangjie
let selectStart = kwPositions[kwIdx] + 1
```

# var selectEnd

## function:

`selectEnd` 是可变变量，类型为 `None`，用于保存运行时状态或可变数据。

## access:

internal

## usage example:

```cangjie
var selectEnd = n
```

# let selectExpr

## function:

`selectExpr` 是不可变变量，类型为 `None`，用于保存常量值或不可变引用。

## access:

internal

## usage example:

```cangjie
let selectExpr = subTokens(tokens, selectStart, selectEnd)
```

# var orderDir

## function:

`orderDir` 是可变变量，类型为 `None`，用于保存运行时状态或可变数据。

## access:

internal

## usage example:

```cangjie
var orderDir = ""
```

# let dir

## function:

`dir` 是不可变变量，类型为 `None`，用于保存常量值或不可变引用。

## access:

internal

## usage example:

```cangjie
let dir = kwNames[kwIdx]
```

# var loopBody

## function:

`loopBody` 是可变变量，类型为 `Tokens`，用于保存运行时状态或可变数据。

## access:

internal

## usage example:

```cangjie
var loopBody: Tokens
```

# var cond

## function:

`cond` 是可变变量，类型为 `None`，用于保存运行时状态或可变数据。

## access:

internal

## usage example:

```cangjie
var cond = whereExprs[0]
```

# let next

## function:

`next` 是不可变变量，类型为 `None`，用于保存常量值或不可变引用。

## access:

internal

## usage example:

```cangjie
let next = whereExprs[i]
```

# var code

## function:

`code` 是可变变量，类型为 `None`，用于保存运行时状态或可变数据。

## access:

internal

## usage example:

```cangjie
var code = quote({ =>
```

# var _query_count

## function:

`_query_count` 是可变变量，类型为 `Int64`，用于保存运行时状态或可变数据。

## access:

internal

## usage example:

```cangjie
var _query_count: Int64 = 0
```

# var sortCode

## function:

`sortCode` 是可变变量，类型为 `Tokens`，用于保存运行时状态或可变数据。

## access:

internal

## usage example:

```cangjie
var sortCode: Tokens
```

# var _query_result

## function:

`_query_result` 是可变变量，类型为 `None`，用于保存运行时状态或可变数据。

## access:

internal

## usage example:

```cangjie
var _query_result = ArrayList<$(resultType)>()
```

# module tests/linq_dsl/project/src/macro_dsl_test.cj

## function:

负责测试 `macro_dsl_test` 相关功能是否符合预期。

## usage example:

```cangjie
# source: tests/linq_dsl/project/src/macro_dsl_test.cj
```

## package:
macro_dsl

## imports:

- `std.unittest.*`

- `std.unittest.testmacro.*`

- `std.collection.*`

- `std.sort.*`

- `macros.*`

# class TestBasicSelect

## function:

封装 `` 中与 `TestBasicSelect` 相关的数据和行为，是项目中的类级实现单元。

## kind:

class

## access:

internal

## extends:

none

## implements:

none

## properties:

- `internal let arr: None`

- `internal let result: None`

## usage example:

```cangjie
class TestBasicSelect {
    @TestCase
    func testSelectAll() {
        let arr = [1, 2, 3, 4, 5]
        let result = @query[Int64](from x in arr select x * 2)
        @Assert(result.size == 5)
        @Assert(result[0] == 2)
        @Assert(result[1] == 4)
        @Assert(result[2] == 6)
        @Assert(result[3] == 8)
        @Assert(result[4] == 10)
    }

    @TestCase
    func testSelectIdentity() {
        let arr = [10, 20, 30]
        let result = @query[Int64](from x in arr select x)
        @Assert(result.size == 3)
        @Assert(result[0] == 10)
        @Assert(result[1] == 20)
```

# method TestBasicSelect.func testSelectAll()

## function:

实现 `` 中的 `testSelectAll` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testSelectAll() {
        let arr = [1, 2, 3, 4, 5]
        let result = @query[Int64](from x in arr select x * 2)
        @Assert(result.size == 5)
        @Assert(result[0] == 2)
        @Assert(result[1] == 4)
        @Assert(result[2] == 6)
        @Assert(result[3] == 8)
        @Assert(result[4] == 10)
    }
```

# method TestBasicSelect.func testSelectIdentity()

## function:

实现 `` 中的 `testSelectIdentity` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testSelectIdentity() {
        let arr = [10, 20, 30]
        let result = @query[Int64](from x in arr select x)
        @Assert(result.size == 3)
        @Assert(result[0] == 10)
        @Assert(result[1] == 20)
        @Assert(result[2] == 30)
    }

    @TestCase
    func testSelectExpression() {
```

# method TestBasicSelect.func testSelectExpression()

## function:

实现 `` 中的 `testSelectExpression` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testSelectExpression() {
        let arr = [1, 2, 3]
        let result = @query[Int64](from x in arr select x * x + 1)
        @Assert(result.size == 3)
        @Assert(result[0] == 2)
        @Assert(result[1] == 5)
        @Assert(result[2] == 10)
    }

    @TestCase
    func testSelectNegation() {
```

# method TestBasicSelect.func testSelectNegation()

## function:

实现 `` 中的 `testSelectNegation` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testSelectNegation() {
        let arr = [1, 2, 3]
        let result = @query[Int64](from x in arr select 0 - x)
        @Assert(result.size == 3)
        @Assert(result[0] == -1)
        @Assert(result[1] == -2)
        @Assert(result[2] == -3)
    }
}

// ==========================================
```

# class TestWhereClause

## function:

封装 `` 中与 `TestWhereClause` 相关的数据和行为，是项目中的类级实现单元。

## kind:

class

## access:

internal

## extends:

none

## implements:

none

## properties:

- `internal let arr: None`

- `internal let result: None`

## usage example:

```cangjie
class TestWhereClause {
    @TestCase
    func testSingleWhere() {
        let arr = [1, 2, 3, 4, 5]
        let result = @query[Int64](from x in arr where x > 3 select x)
        @Assert(result.size == 2)
        @Assert(result[0] == 4)
        @Assert(result[1] == 5)
    }

    @TestCase
    func testMultipleWhere() {
        let arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
        let result = @query[Int64](from x in arr where x > 2 where x < 8 select x)
        @Assert(result.size == 5)
        @Assert(result[0] == 3)
        @Assert(result[1] == 4)
        @Assert(result[2] == 5)
        @Assert(result[3] == 6)
        @Assert(result[4] == 7)
```

# method TestWhereClause.func testSingleWhere()

## function:

实现 `` 中的 `testSingleWhere` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testSingleWhere() {
        let arr = [1, 2, 3, 4, 5]
        let result = @query[Int64](from x in arr where x > 3 select x)
        @Assert(result.size == 2)
        @Assert(result[0] == 4)
        @Assert(result[1] == 5)
    }

    @TestCase
    func testMultipleWhere() {
        let arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
```

# method TestWhereClause.func testMultipleWhere()

## function:

实现 `` 中的 `testMultipleWhere` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testMultipleWhere() {
        let arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
        let result = @query[Int64](from x in arr where x > 2 where x < 8 select x)
        @Assert(result.size == 5)
        @Assert(result[0] == 3)
        @Assert(result[1] == 4)
        @Assert(result[2] == 5)
        @Assert(result[3] == 6)
        @Assert(result[4] == 7)
    }
```

# method TestWhereClause.func testWhereNoMatch()

## function:

实现 `` 中的 `testWhereNoMatch` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testWhereNoMatch() {
        let arr = [1, 2, 3]
        let result = @query[Int64](from x in arr where x > 100 select x)
        @Assert(result.size == 0)
    }

    @TestCase
    func testWhereAllMatch() {
        let arr = [1, 2, 3]
        let result = @query[Int64](from x in arr where x > 0 select x)
        @Assert(result.size == 3)
```

# method TestWhereClause.func testWhereAllMatch()

## function:

实现 `` 中的 `testWhereAllMatch` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testWhereAllMatch() {
        let arr = [1, 2, 3]
        let result = @query[Int64](from x in arr where x > 0 select x)
        @Assert(result.size == 3)
    }

    @TestCase
    func testWhereModulo() {
        let arr = [1, 2, 3, 4, 5, 6]
        let result = @query[Int64](from x in arr where x % 2 == 0 select x)
        @Assert(result.size == 3)
```

# method TestWhereClause.func testWhereModulo()

## function:

实现 `` 中的 `testWhereModulo` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testWhereModulo() {
        let arr = [1, 2, 3, 4, 5, 6]
        let result = @query[Int64](from x in arr where x % 2 == 0 select x)
        @Assert(result.size == 3)
        @Assert(result[0] == 2)
        @Assert(result[1] == 4)
        @Assert(result[2] == 6)
    }

    @TestCase
    func testWhereComplexCondition() {
```

# method TestWhereClause.func testWhereComplexCondition()

## function:

实现 `` 中的 `testWhereComplexCondition` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testWhereComplexCondition() {
        let arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
        let result = @query[Int64](from x in arr where x >= 3 where x <= 7 where x % 2 == 1 select x)
        @Assert(result.size == 3)
        @Assert(result[0] == 3)
        @Assert(result[1] == 5)
        @Assert(result[2] == 7)
    }
}

// ==========================================
```

# class TestOrderBy

## function:

封装 `` 中与 `TestOrderBy` 相关的数据和行为，是项目中的类级实现单元。

## kind:

class

## access:

internal

## extends:

none

## implements:

none

## properties:

- `internal let arr: None`

- `internal let result: None`

## usage example:

```cangjie
class TestOrderBy {
    @TestCase
    func testOrderByAsc() {
        let arr = [3, 1, 4, 1, 5, 9, 2, 6]
        let result = @query[Int64](from x in arr select x orderby asc)
        @Assert(result.size == 8)
        @Assert(result[0] == 1)
        @Assert(result[1] == 1)
        @Assert(result[2] == 2)
        @Assert(result[3] == 3)
        @Assert(result[result.size - 1] == 9)
    }

    @TestCase
    func testOrderByDesc() {
        let arr = [3, 1, 4, 1, 5, 9, 2, 6]
        let result = @query[Int64](from x in arr select x orderby desc)
        @Assert(result.size == 8)
        @Assert(result[0] == 9)
        @Assert(result[1] == 6)
```

# method TestOrderBy.func testOrderByAsc()

## function:

实现 `` 中的 `testOrderByAsc` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testOrderByAsc() {
        let arr = [3, 1, 4, 1, 5, 9, 2, 6]
        let result = @query[Int64](from x in arr select x orderby asc)
        @Assert(result.size == 8)
        @Assert(result[0] == 1)
        @Assert(result[1] == 1)
        @Assert(result[2] == 2)
        @Assert(result[3] == 3)
        @Assert(result[result.size - 1] == 9)
    }
```

# method TestOrderBy.func testOrderByDesc()

## function:

实现 `` 中的 `testOrderByDesc` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testOrderByDesc() {
        let arr = [3, 1, 4, 1, 5, 9, 2, 6]
        let result = @query[Int64](from x in arr select x orderby desc)
        @Assert(result.size == 8)
        @Assert(result[0] == 9)
        @Assert(result[1] == 6)
        @Assert(result[2] == 5)
        @Assert(result[result.size - 1] == 1)
    }

    @TestCase
```

# method TestOrderBy.func testOrderByWithWhere()

## function:

实现 `` 中的 `testOrderByWithWhere` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testOrderByWithWhere() {
        let arr = [5, 3, 8, 1, 9, 2, 7]
        let result = @query[Int64](from x in arr where x > 3 select x orderby asc)
        @Assert(result.size == 4)
        @Assert(result[0] == 5)
        @Assert(result[1] == 7)
        @Assert(result[2] == 8)
        @Assert(result[3] == 9)
    }

    @TestCase
```

# method TestOrderBy.func testOrderByDefault()

## function:

实现 `` 中的 `testOrderByDefault` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testOrderByDefault() {
        let arr = [3, 1, 2]
        let result = @query[Int64](from x in arr select x orderby)
        @Assert(result[0] == 1)
        @Assert(result[1] == 2)
        @Assert(result[2] == 3)
    }

    @TestCase
    func testOrderByWithTransform() {
        let arr = [5, 3, 8, 1]
```

# method TestOrderBy.func testOrderByWithTransform()

## function:

实现 `` 中的 `testOrderByWithTransform` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testOrderByWithTransform() {
        let arr = [5, 3, 8, 1]
        let result = @query[Int64](from x in arr select x * 10 orderby asc)
        @Assert(result.size == 4)
        @Assert(result[0] == 10)
        @Assert(result[1] == 30)
        @Assert(result[2] == 50)
        @Assert(result[3] == 80)
    }
}
```

# class TestCount

## function:

封装 `` 中与 `TestCount` 相关的数据和行为，是项目中的类级实现单元。

## kind:

class

## access:

internal

## extends:

none

## implements:

none

## properties:

- `internal let arr: None`

- `internal let result: Int64`

## usage example:

```cangjie
class TestCount {
    @TestCase
    func testCountAll() {
        let arr = [1, 2, 3, 4, 5]
        let result: Int64 = @query[count](from x in arr)
        @Assert(result == 5)
    }

    @TestCase
    func testCountWithWhere() {
        let arr = [1, 2, 3, 4, 5]
        let result: Int64 = @query[count](from x in arr where x > 3)
        @Assert(result == 2)
    }

    @TestCase
    func testCountZero() {
        let arr = [1, 2, 3]
        let result: Int64 = @query[count](from x in arr where x > 100)
        @Assert(result == 0)
```

# method TestCount.func testCountAll()

## function:

实现 `` 中的 `testCountAll` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testCountAll() {
        let arr = [1, 2, 3, 4, 5]
        let result: Int64 = @query[count](from x in arr)
        @Assert(result == 5)
    }

    @TestCase
    func testCountWithWhere() {
        let arr = [1, 2, 3, 4, 5]
        let result: Int64 = @query[count](from x in arr where x > 3)
        @Assert(result == 2)
```

# method TestCount.func testCountWithWhere()

## function:

实现 `` 中的 `testCountWithWhere` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testCountWithWhere() {
        let arr = [1, 2, 3, 4, 5]
        let result: Int64 = @query[count](from x in arr where x > 3)
        @Assert(result == 2)
    }

    @TestCase
    func testCountZero() {
        let arr = [1, 2, 3]
        let result: Int64 = @query[count](from x in arr where x > 100)
        @Assert(result == 0)
```

# method TestCount.func testCountZero()

## function:

实现 `` 中的 `testCountZero` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testCountZero() {
        let arr = [1, 2, 3]
        let result: Int64 = @query[count](from x in arr where x > 100)
        @Assert(result == 0)
    }

    @TestCase
    func testCountMultipleWhere() {
        let arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
        let result: Int64 = @query[count](from x in arr where x > 3 where x < 8)
        @Assert(result == 4)
```

# method TestCount.func testCountMultipleWhere()

## function:

实现 `` 中的 `testCountMultipleWhere` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testCountMultipleWhere() {
        let arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
        let result: Int64 = @query[count](from x in arr where x > 3 where x < 8)
        @Assert(result == 4)
    }
}

// ==========================================
// Test 5: Type Conversion
// ==========================================
@Test
```

# class TestTypeConversion

## function:

封装 `` 中与 `TestTypeConversion` 相关的数据和行为，是项目中的类级实现单元。

## kind:

class

## access:

internal

## extends:

none

## implements:

none

## properties:

- `internal let arr: None`

- `internal let result: None`

## usage example:

```cangjie
class TestTypeConversion {
    @TestCase
    func testIntToString() {
        let arr = [1, 2, 3]
        let result = @query[String](from x in arr select x.toString())
        @Assert(result.size == 3)
        @Assert(result[0] == "1")
        @Assert(result[1] == "2")
        @Assert(result[2] == "3")
    }

    @TestCase
    func testBoolResult() {
        let arr = [1, 2, 3, 4, 5]
        let result = @query[Bool](from x in arr select x > 3)
        @Assert(result.size == 5)
        @Assert(result[0] == false)
        @Assert(result[1] == false)
        @Assert(result[2] == false)
        @Assert(result[3] == true)
```

# method TestTypeConversion.func testIntToString()

## function:

实现 `` 中的 `testIntToString` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testIntToString() {
        let arr = [1, 2, 3]
        let result = @query[String](from x in arr select x.toString())
        @Assert(result.size == 3)
        @Assert(result[0] == "1")
        @Assert(result[1] == "2")
        @Assert(result[2] == "3")
    }

    @TestCase
    func testBoolResult() {
```

# method TestTypeConversion.func testBoolResult()

## function:

实现 `` 中的 `testBoolResult` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testBoolResult() {
        let arr = [1, 2, 3, 4, 5]
        let result = @query[Bool](from x in arr select x > 3)
        @Assert(result.size == 5)
        @Assert(result[0] == false)
        @Assert(result[1] == false)
        @Assert(result[2] == false)
        @Assert(result[3] == true)
        @Assert(result[4] == true)
    }
}
```

# class TestComplexQuery

## function:

封装 `` 中与 `TestComplexQuery` 相关的数据和行为，是项目中的类级实现单元。

## kind:

class

## access:

internal

## extends:

none

## implements:

none

## properties:

- `internal let list: None`

- `internal let result: None`

- `internal let arr: None`

- `internal let cnt: Int64`

- `internal let selected: None`

## usage example:

```cangjie
class TestComplexQuery {
    @TestCase
    func testWithArrayList() {
        let list = ArrayList<Int64>([1, 2, 3, 4, 5])
        let result = @query[Int64](from x in list where x > 2 select x * 10)
        @Assert(result.size == 3)
        @Assert(result[0] == 30)
        @Assert(result[1] == 40)
        @Assert(result[2] == 50)
    }

    @TestCase
    func testEmptySource() {
        let arr = Array<Int64>(0, {_ => 0})
        let result = @query[Int64](from x in arr select x)
        @Assert(result.size == 0)
    }

    @TestCase
    func testSingleElement() {
```

# method TestComplexQuery.func testWithArrayList()

## function:

实现 `` 中的 `testWithArrayList` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testWithArrayList() {
        let list = ArrayList<Int64>([1, 2, 3, 4, 5])
        let result = @query[Int64](from x in list where x > 2 select x * 10)
        @Assert(result.size == 3)
        @Assert(result[0] == 30)
        @Assert(result[1] == 40)
        @Assert(result[2] == 50)
    }

    @TestCase
    func testEmptySource() {
```

# method TestComplexQuery.func testEmptySource()

## function:

实现 `` 中的 `testEmptySource` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testEmptySource() {
        let arr = Array<Int64>(0, {_ => 0})
        let result = @query[Int64](from x in arr select x)
        @Assert(result.size == 0)
    }

    @TestCase
    func testSingleElement() {
        let arr = [42]
        let result = @query[Int64](from x in arr select x)
        @Assert(result.size == 1)
```

# method TestComplexQuery.func testSingleElement()

## function:

实现 `` 中的 `testSingleElement` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testSingleElement() {
        let arr = [42]
        let result = @query[Int64](from x in arr select x)
        @Assert(result.size == 1)
        @Assert(result[0] == 42)
    }

    @TestCase
    func testWhereAndSelect() {
        let arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
        let result = @query[Int64](from x in arr where x % 2 == 0 select x * 3)
```

# method TestComplexQuery.func testWhereAndSelect()

## function:

实现 `` 中的 `testWhereAndSelect` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testWhereAndSelect() {
        let arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
        let result = @query[Int64](from x in arr where x % 2 == 0 select x * 3)
        @Assert(result.size == 5)
        @Assert(result[0] == 6)
        @Assert(result[1] == 12)
        @Assert(result[2] == 18)
        @Assert(result[3] == 24)
        @Assert(result[4] == 30)
    }
```

# method TestComplexQuery.func testFullPipeline()

## function:

实现 `` 中的 `testFullPipeline` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testFullPipeline() {
        let arr = [15, 3, 8, 12, 1, 20, 7, 14]
        let result = @query[Int64](from x in arr where x > 5 where x < 16 select x orderby desc)
        @Assert(result.size == 5)
        @Assert(result[0] == 15)
        @Assert(result[1] == 14)
        @Assert(result[2] == 12)
        @Assert(result[3] == 8)
        @Assert(result[4] == 7)
    }
```

# method TestComplexQuery.func testLargeDataset()

## function:

实现 `` 中的 `testLargeDataset` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testLargeDataset() {
        let arr = Array<Int64>(100, {i => i + 1})
        let result = @query[Int64](from x in arr where x % 10 == 0 select x)
        @Assert(result.size == 10)
        @Assert(result[0] == 10)
        @Assert(result[9] == 100)
    }

    @TestCase
    func testCountAndSelectConsistency() {
        let arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
```

# method TestComplexQuery.func testCountAndSelectConsistency()

## function:

实现 `` 中的 `testCountAndSelectConsistency` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testCountAndSelectConsistency() {
        let arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
        let cnt: Int64 = @query[count](from x in arr where x > 5)
        let selected = @query[Int64](from x in arr where x > 5 select x)
        @Assert(cnt == selected.size)
    }
}
```

# module tests/linq_dsl/project/src/main.cj

## function:

负责测试 `main` 相关功能是否符合预期。

## usage example:

```cangjie
# source: tests/linq_dsl/project/src/main.cj
```

## package:
macro_dsl

## imports:

- `std.collection.*`

- `std.sort.*`

- `macros.*`

# let data

## function:

`data` 是不可变变量，类型为 `None`，用于保存常量值或不可变引用。

## access:

internal

## usage example:

```cangjie
let data = [5, 3, 8, 1, 9, 2, 7, 4, 6, 10]
```

# let result

## function:

`result` 是不可变变量，类型为 `None`，用于保存常量值或不可变引用。

## access:

internal

## usage example:

```cangjie
let result = @query[Int64](from x in data where x > 5 select x * 2)
```

# let cnt

## function:

`cnt` 是不可变变量，类型为 `None`，用于保存常量值或不可变引用。

## access:

internal

## usage example:

```cangjie
let cnt = @query[count](from x in data where x > 5)
```

# let sorted

## function:

`sorted` 是不可变变量，类型为 `None`，用于保存常量值或不可变引用。

## access:

internal

## usage example:

```cangjie
let sorted = @query[Int64](from x in data select x orderby desc)
```

# module tests/mustache/mustache_test.cj

## function:

负责测试 `mustache_test` 相关功能是否符合预期。

## usage example:

```cangjie
# source: tests/mustache/mustache_test.cj
```

## package:
mustache

# class TestVariableInterpolation

## function:

封装 `` 中与 `TestVariableInterpolation` 相关的数据和行为，是项目中的类级实现单元。

## kind:

class

## access:

internal

## extends:

none

## implements:

none

## properties:

- `internal let tmpl: None`

- `internal let ctx: None`

## usage example:

```cangjie
class TestVariableInterpolation {
    @TestCase
    func testSimpleVariable() {
        let tmpl = MustacheTemplate.fromString("Hello, {{name}}!")
        let ctx = MustacheContext()
        ctx.put("name", MustacheStr("World"))
        @Assert(tmpl.render(ctx), "Hello, World!")
    }

    @TestCase
    func testMultipleVariables() {
        let tmpl = MustacheTemplate.fromString("{{greeting}}, {{name}}!")
        let ctx = MustacheContext()
        ctx.put("greeting", MustacheStr("Hi"))
        ctx.put("name", MustacheStr("Alice"))
        @Assert(tmpl.render(ctx), "Hi, Alice!")
    }

    @TestCase
    func testMissingVariable() {
```

# method TestVariableInterpolation.func testSimpleVariable()

## function:

实现 `` 中的 `testSimpleVariable` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testSimpleVariable() {
        let tmpl = MustacheTemplate.fromString("Hello, {{name}}!")
        let ctx = MustacheContext()
        ctx.put("name", MustacheStr("World"))
        @Assert(tmpl.render(ctx), "Hello, World!")
    }

    @TestCase
    func testMultipleVariables() {
        let tmpl = MustacheTemplate.fromString("{{greeting}}, {{name}}!")
        let ctx = MustacheContext()
```

# method TestVariableInterpolation.func testMultipleVariables()

## function:

实现 `` 中的 `testMultipleVariables` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testMultipleVariables() {
        let tmpl = MustacheTemplate.fromString("{{greeting}}, {{name}}!")
        let ctx = MustacheContext()
        ctx.put("greeting", MustacheStr("Hi"))
        ctx.put("name", MustacheStr("Alice"))
        @Assert(tmpl.render(ctx), "Hi, Alice!")
    }

    @TestCase
    func testMissingVariable() {
        let tmpl = MustacheTemplate.fromString("Hello, {{name}}!")
```

# method TestVariableInterpolation.func testMissingVariable()

## function:

实现 `` 中的 `testMissingVariable` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testMissingVariable() {
        let tmpl = MustacheTemplate.fromString("Hello, {{name}}!")
        let ctx = MustacheContext()
        @Assert(tmpl.render(ctx), "Hello, !")
    }

    @TestCase
    func testHtmlEscaping() {
        let tmpl = MustacheTemplate.fromString("{{content}}")
        let ctx = MustacheContext()
        ctx.put("content", MustacheStr("<b>bold</b>"))
```

# method TestVariableInterpolation.func testHtmlEscaping()

## function:

实现 `` 中的 `testHtmlEscaping` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testHtmlEscaping() {
        let tmpl = MustacheTemplate.fromString("{{content}}")
        let ctx = MustacheContext()
        ctx.put("content", MustacheStr("<b>bold</b>"))
        @Assert(tmpl.render(ctx), "&lt;b&gt;bold&lt;/b&gt;")
    }

    @TestCase
    func testAllHtmlEntities() {
        let tmpl = MustacheTemplate.fromString("{{content}}")
        let ctx = MustacheContext()
```

# method TestVariableInterpolation.func testAllHtmlEntities()

## function:

实现 `` 中的 `testAllHtmlEntities` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testAllHtmlEntities() {
        let tmpl = MustacheTemplate.fromString("{{content}}")
        let ctx = MustacheContext()
        ctx.put("content", MustacheStr("&<>\"'"))
        @Assert(tmpl.render(ctx), "&amp;&lt;&gt;&quot;&#39;")
    }

    @TestCase
    func testEmptyTemplate() {
        let tmpl = MustacheTemplate.fromString("")
        let ctx = MustacheContext()
```

# method TestVariableInterpolation.func testEmptyTemplate()

## function:

实现 `` 中的 `testEmptyTemplate` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testEmptyTemplate() {
        let tmpl = MustacheTemplate.fromString("")
        let ctx = MustacheContext()
        @Assert(tmpl.render(ctx), "")
    }

    @TestCase
    func testPlainText() {
        let tmpl = MustacheTemplate.fromString("Just plain text")
        let ctx = MustacheContext()
        @Assert(tmpl.render(ctx), "Just plain text")
```

# method TestVariableInterpolation.func testPlainText()

## function:

实现 `` 中的 `testPlainText` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testPlainText() {
        let tmpl = MustacheTemplate.fromString("Just plain text")
        let ctx = MustacheContext()
        @Assert(tmpl.render(ctx), "Just plain text")
    }

    @TestCase
    func testVariableWithWhitespace() {
        let tmpl = MustacheTemplate.fromString("{{ name }}")
        let ctx = MustacheContext()
        ctx.put("name", MustacheStr("Alice"))
```

# method TestVariableInterpolation.func testVariableWithWhitespace()

## function:

实现 `` 中的 `testVariableWithWhitespace` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testVariableWithWhitespace() {
        let tmpl = MustacheTemplate.fromString("{{ name }}")
        let ctx = MustacheContext()
        ctx.put("name", MustacheStr("Alice"))
        @Assert(tmpl.render(ctx), "Alice")
    }
}

@Test
class TestUnescapedVariable {
    @TestCase
```

# class TestUnescapedVariable

## function:

封装 `` 中与 `TestUnescapedVariable` 相关的数据和行为，是项目中的类级实现单元。

## kind:

class

## access:

internal

## extends:

none

## implements:

none

## properties:

- `internal let tmpl: None`

- `internal let ctx: None`

## usage example:

```cangjie
class TestUnescapedVariable {
    @TestCase
    func testTripleBrace() {
        let tmpl = MustacheTemplate.fromString("{{{content}}}")
        let ctx = MustacheContext()
        ctx.put("content", MustacheStr("<b>bold</b>"))
        @Assert(tmpl.render(ctx), "<b>bold</b>")
    }

    @TestCase
    func testAmpersandSyntax() {
        let tmpl = MustacheTemplate.fromString("{{&content}}")
        let ctx = MustacheContext()
        ctx.put("content", MustacheStr("<b>bold</b>"))
        @Assert(tmpl.render(ctx), "<b>bold</b>")
    }

    @TestCase
    func testUnescapedMissing() {
        let tmpl = MustacheTemplate.fromString("{{{missing}}}")
```

# method TestUnescapedVariable.func testTripleBrace()

## function:

实现 `` 中的 `testTripleBrace` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testTripleBrace() {
        let tmpl = MustacheTemplate.fromString("{{{content}}}")
        let ctx = MustacheContext()
        ctx.put("content", MustacheStr("<b>bold</b>"))
        @Assert(tmpl.render(ctx), "<b>bold</b>")
    }

    @TestCase
    func testAmpersandSyntax() {
        let tmpl = MustacheTemplate.fromString("{{&content}}")
        let ctx = MustacheContext()
```

# method TestUnescapedVariable.func testAmpersandSyntax()

## function:

实现 `` 中的 `testAmpersandSyntax` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testAmpersandSyntax() {
        let tmpl = MustacheTemplate.fromString("{{&content}}")
        let ctx = MustacheContext()
        ctx.put("content", MustacheStr("<b>bold</b>"))
        @Assert(tmpl.render(ctx), "<b>bold</b>")
    }

    @TestCase
    func testUnescapedMissing() {
        let tmpl = MustacheTemplate.fromString("{{{missing}}}")
        let ctx = MustacheContext()
```

# method TestUnescapedVariable.func testUnescapedMissing()

## function:

实现 `` 中的 `testUnescapedMissing` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testUnescapedMissing() {
        let tmpl = MustacheTemplate.fromString("{{{missing}}}")
        let ctx = MustacheContext()
        @Assert(tmpl.render(ctx), "")
    }

    @TestCase
    func testMixedEscaping() {
        let tmpl = MustacheTemplate.fromString("{{escaped}} {{{unescaped}}}")
        let ctx = MustacheContext()
        ctx.put("escaped", MustacheStr("<b>"))
```

# method TestUnescapedVariable.func testMixedEscaping()

## function:

实现 `` 中的 `testMixedEscaping` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testMixedEscaping() {
        let tmpl = MustacheTemplate.fromString("{{escaped}} {{{unescaped}}}")
        let ctx = MustacheContext()
        ctx.put("escaped", MustacheStr("<b>"))
        ctx.put("unescaped", MustacheStr("<b>"))
        @Assert(tmpl.render(ctx), "&lt;b&gt; <b>")
    }
}

@Test
class TestSections {
```

# class TestSections

## function:

封装 `` 中与 `TestSections` 相关的数据和行为，是项目中的类级实现单元。

## kind:

class

## access:

internal

## extends:

none

## implements:

none

## properties:

- `internal let tmpl: None`

- `internal let ctx: None`

- `internal let items: None`

- `internal let person: None`

- `internal let people: None`

- `internal let p1: None`

- `internal let p2: None`

## usage example:

```cangjie
class TestSections {
    @TestCase
    func testBoolTrueSection() {
        let tmpl = MustacheTemplate.fromString("{{#show}}Visible{{/show}}")
        let ctx = MustacheContext()
        ctx.put("show", MustacheBool(true))
        @Assert(tmpl.render(ctx), "Visible")
    }

    @TestCase
    func testBoolFalseSection() {
        let tmpl = MustacheTemplate.fromString("{{#show}}Visible{{/show}}")
        let ctx = MustacheContext()
        ctx.put("show", MustacheBool(false))
        @Assert(tmpl.render(ctx), "")
    }

    @TestCase
    func testMissingKeySection() {
        let tmpl = MustacheTemplate.fromString("{{#show}}Visible{{/show}}")
```

# method TestSections.func testBoolTrueSection()

## function:

实现 `` 中的 `testBoolTrueSection` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testBoolTrueSection() {
        let tmpl = MustacheTemplate.fromString("{{#show}}Visible{{/show}}")
        let ctx = MustacheContext()
        ctx.put("show", MustacheBool(true))
        @Assert(tmpl.render(ctx), "Visible")
    }

    @TestCase
    func testBoolFalseSection() {
        let tmpl = MustacheTemplate.fromString("{{#show}}Visible{{/show}}")
        let ctx = MustacheContext()
```

# method TestSections.func testBoolFalseSection()

## function:

实现 `` 中的 `testBoolFalseSection` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testBoolFalseSection() {
        let tmpl = MustacheTemplate.fromString("{{#show}}Visible{{/show}}")
        let ctx = MustacheContext()
        ctx.put("show", MustacheBool(false))
        @Assert(tmpl.render(ctx), "")
    }

    @TestCase
    func testMissingKeySection() {
        let tmpl = MustacheTemplate.fromString("{{#show}}Visible{{/show}}")
        let ctx = MustacheContext()
```

# method TestSections.func testMissingKeySection()

## function:

实现 `` 中的 `testMissingKeySection` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testMissingKeySection() {
        let tmpl = MustacheTemplate.fromString("{{#show}}Visible{{/show}}")
        let ctx = MustacheContext()
        @Assert(tmpl.render(ctx), "")
    }

    @TestCase
    func testListSection() {
        let tmpl = MustacheTemplate.fromString("{{#items}}{{.}} {{/items}}")
        let ctx = MustacheContext()
        let items = MustacheList()
```

# method TestSections.func testListSection()

## function:

实现 `` 中的 `testListSection` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testListSection() {
        let tmpl = MustacheTemplate.fromString("{{#items}}{{.}} {{/items}}")
        let ctx = MustacheContext()
        let items = MustacheList()
        items.add(MustacheStr("a"))
        items.add(MustacheStr("b"))
        items.add(MustacheStr("c"))
        ctx.put("items", items)
        @Assert(tmpl.render(ctx), "a b c ")
    }
```

# method TestSections.func testEmptyListSection()

## function:

实现 `` 中的 `testEmptyListSection` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testEmptyListSection() {
        let tmpl = MustacheTemplate.fromString("{{#items}}item{{/items}}")
        let ctx = MustacheContext()
        ctx.put("items", MustacheList())
        @Assert(tmpl.render(ctx), "")
    }

    @TestCase
    func testContextSection() {
        let tmpl = MustacheTemplate.fromString("{{#person}}{{name}} is {{age}}{{/person}}")
        let ctx = MustacheContext()
```

# method TestSections.func testContextSection()

## function:

实现 `` 中的 `testContextSection` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testContextSection() {
        let tmpl = MustacheTemplate.fromString("{{#person}}{{name}} is {{age}}{{/person}}")
        let ctx = MustacheContext()
        let person = MustacheContext()
        person.put("name", MustacheStr("Alice"))
        person.put("age", MustacheStr("30"))
        ctx.put("person", person)
        @Assert(tmpl.render(ctx), "Alice is 30")
    }

    @TestCase
```

# method TestSections.func testListOfContexts()

## function:

实现 `` 中的 `testListOfContexts` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testListOfContexts() {
        let tmpl = MustacheTemplate.fromString("{{#people}}{{name}} {{/people}}")
        let ctx = MustacheContext()
        let people = MustacheList()
        let p1 = MustacheContext()
        p1.put("name", MustacheStr("Alice"))
        let p2 = MustacheContext()
        p2.put("name", MustacheStr("Bob"))
        people.add(p1)
        people.add(p2)
        ctx.put("people", people)
```

# method TestSections.func testNestedSections()

## function:

实现 `` 中的 `testNestedSections` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testNestedSections() {
        let tmpl = MustacheTemplate.fromString("{{#a}}{{#b}}yes{{/b}}{{/a}}")
        let ctx = MustacheContext()
        ctx.put("a", MustacheBool(true))
        ctx.put("b", MustacheBool(true))
        @Assert(tmpl.render(ctx), "yes")
    }
}

@Test
class TestInvertedSections {
```

# class TestInvertedSections

## function:

封装 `` 中与 `TestInvertedSections` 相关的数据和行为，是项目中的类级实现单元。

## kind:

class

## access:

internal

## extends:

none

## implements:

none

## properties:

- `internal let tmpl: None`

- `internal let ctx: None`

- `internal let items: None`

## usage example:

```cangjie
class TestInvertedSections {
    @TestCase
    func testInvertedFalse() {
        let tmpl = MustacheTemplate.fromString("{{^show}}Hidden{{/show}}")
        let ctx = MustacheContext()
        ctx.put("show", MustacheBool(false))
        @Assert(tmpl.render(ctx), "Hidden")
    }

    @TestCase
    func testInvertedTrue() {
        let tmpl = MustacheTemplate.fromString("{{^show}}Hidden{{/show}}")
        let ctx = MustacheContext()
        ctx.put("show", MustacheBool(true))
        @Assert(tmpl.render(ctx), "")
    }

    @TestCase
    func testInvertedMissing() {
        let tmpl = MustacheTemplate.fromString("{{^show}}Hidden{{/show}}")
```

# method TestInvertedSections.func testInvertedFalse()

## function:

实现 `` 中的 `testInvertedFalse` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testInvertedFalse() {
        let tmpl = MustacheTemplate.fromString("{{^show}}Hidden{{/show}}")
        let ctx = MustacheContext()
        ctx.put("show", MustacheBool(false))
        @Assert(tmpl.render(ctx), "Hidden")
    }

    @TestCase
    func testInvertedTrue() {
        let tmpl = MustacheTemplate.fromString("{{^show}}Hidden{{/show}}")
        let ctx = MustacheContext()
```

# method TestInvertedSections.func testInvertedTrue()

## function:

实现 `` 中的 `testInvertedTrue` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testInvertedTrue() {
        let tmpl = MustacheTemplate.fromString("{{^show}}Hidden{{/show}}")
        let ctx = MustacheContext()
        ctx.put("show", MustacheBool(true))
        @Assert(tmpl.render(ctx), "")
    }

    @TestCase
    func testInvertedMissing() {
        let tmpl = MustacheTemplate.fromString("{{^show}}Hidden{{/show}}")
        let ctx = MustacheContext()
```

# method TestInvertedSections.func testInvertedMissing()

## function:

实现 `` 中的 `testInvertedMissing` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testInvertedMissing() {
        let tmpl = MustacheTemplate.fromString("{{^show}}Hidden{{/show}}")
        let ctx = MustacheContext()
        @Assert(tmpl.render(ctx), "Hidden")
    }

    @TestCase
    func testInvertedEmptyList() {
        let tmpl = MustacheTemplate.fromString("{{^items}}No items{{/items}}")
        let ctx = MustacheContext()
        ctx.put("items", MustacheList())
```

# method TestInvertedSections.func testInvertedEmptyList()

## function:

实现 `` 中的 `testInvertedEmptyList` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testInvertedEmptyList() {
        let tmpl = MustacheTemplate.fromString("{{^items}}No items{{/items}}")
        let ctx = MustacheContext()
        ctx.put("items", MustacheList())
        @Assert(tmpl.render(ctx), "No items")
    }

    @TestCase
    func testInvertedNonEmptyList() {
        let tmpl = MustacheTemplate.fromString("{{^items}}No items{{/items}}")
        let ctx = MustacheContext()
```

# method TestInvertedSections.func testInvertedNonEmptyList()

## function:

实现 `` 中的 `testInvertedNonEmptyList` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testInvertedNonEmptyList() {
        let tmpl = MustacheTemplate.fromString("{{^items}}No items{{/items}}")
        let ctx = MustacheContext()
        let items = MustacheList()
        items.add(MustacheStr("a"))
        ctx.put("items", items)
        @Assert(tmpl.render(ctx), "")
    }
}

@Test
```

# class TestComments

## function:

封装 `` 中与 `TestComments` 相关的数据和行为，是项目中的类级实现单元。

## kind:

class

## access:

internal

## extends:

none

## implements:

none

## properties:

- `internal let tmpl: None`

- `internal let ctx: None`

## usage example:

```cangjie
class TestComments {
    @TestCase
    func testComment() {
        let tmpl = MustacheTemplate.fromString("Before{{! comment }}After")
        let ctx = MustacheContext()
        @Assert(tmpl.render(ctx), "BeforeAfter")
    }

    @TestCase
    func testCommentOnly() {
        let tmpl = MustacheTemplate.fromString("{{! this is a comment }}")
        let ctx = MustacheContext()
        @Assert(tmpl.render(ctx), "")
    }

    @TestCase
    func testCommentInTemplate() {
        let tmpl = MustacheTemplate.fromString("{{name}}{{! greeting }}!")
        let ctx = MustacheContext()
        ctx.put("name", MustacheStr("Alice"))
```

# method TestComments.func testComment()

## function:

实现 `` 中的 `testComment` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testComment() {
        let tmpl = MustacheTemplate.fromString("Before{{! comment }}After")
        let ctx = MustacheContext()
        @Assert(tmpl.render(ctx), "BeforeAfter")
    }

    @TestCase
    func testCommentOnly() {
        let tmpl = MustacheTemplate.fromString("{{! this is a comment }}")
        let ctx = MustacheContext()
        @Assert(tmpl.render(ctx), "")
```

# method TestComments.func testCommentOnly()

## function:

实现 `` 中的 `testCommentOnly` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testCommentOnly() {
        let tmpl = MustacheTemplate.fromString("{{! this is a comment }}")
        let ctx = MustacheContext()
        @Assert(tmpl.render(ctx), "")
    }

    @TestCase
    func testCommentInTemplate() {
        let tmpl = MustacheTemplate.fromString("{{name}}{{! greeting }}!")
        let ctx = MustacheContext()
        ctx.put("name", MustacheStr("Alice"))
```

# method TestComments.func testCommentInTemplate()

## function:

实现 `` 中的 `testCommentInTemplate` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testCommentInTemplate() {
        let tmpl = MustacheTemplate.fromString("{{name}}{{! greeting }}!")
        let ctx = MustacheContext()
        ctx.put("name", MustacheStr("Alice"))
        @Assert(tmpl.render(ctx), "Alice!")
    }
}

@Test
class TestDotNotation {
    @TestCase
```

# class TestDotNotation

## function:

封装 `` 中与 `TestDotNotation` 相关的数据和行为，是项目中的类级实现单元。

## kind:

class

## access:

internal

## extends:

none

## implements:

none

## properties:

- `internal let tmpl: None`

- `internal let ctx: None`

- `internal let person: None`

- `internal let a: None`

- `internal let b: None`

## usage example:

```cangjie
class TestDotNotation {
    @TestCase
    func testNestedAccess() {
        let tmpl = MustacheTemplate.fromString("{{person.name}}")
        let ctx = MustacheContext()
        let person = MustacheContext()
        person.put("name", MustacheStr("Alice"))
        ctx.put("person", person)
        @Assert(tmpl.render(ctx), "Alice")
    }

    @TestCase
    func testDeepNesting() {
        let tmpl = MustacheTemplate.fromString("{{a.b.c}}")
        let ctx = MustacheContext()
        let a = MustacheContext()
        let b = MustacheContext()
        b.put("c", MustacheStr("deep"))
        a.put("b", b)
        ctx.put("a", a)
```

# method TestDotNotation.func testNestedAccess()

## function:

实现 `` 中的 `testNestedAccess` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testNestedAccess() {
        let tmpl = MustacheTemplate.fromString("{{person.name}}")
        let ctx = MustacheContext()
        let person = MustacheContext()
        person.put("name", MustacheStr("Alice"))
        ctx.put("person", person)
        @Assert(tmpl.render(ctx), "Alice")
    }

    @TestCase
    func testDeepNesting() {
```

# method TestDotNotation.func testDeepNesting()

## function:

实现 `` 中的 `testDeepNesting` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testDeepNesting() {
        let tmpl = MustacheTemplate.fromString("{{a.b.c}}")
        let ctx = MustacheContext()
        let a = MustacheContext()
        let b = MustacheContext()
        b.put("c", MustacheStr("deep"))
        a.put("b", b)
        ctx.put("a", a)
        @Assert(tmpl.render(ctx), "deep")
    }
```

# method TestDotNotation.func testMissingNested()

## function:

实现 `` 中的 `testMissingNested` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testMissingNested() {
        let tmpl = MustacheTemplate.fromString("{{person.unknown}}")
        let ctx = MustacheContext()
        let person = MustacheContext()
        person.put("name", MustacheStr("Alice"))
        ctx.put("person", person)
        @Assert(tmpl.render(ctx), "")
    }

    @TestCase
    func testDotOnNonContext() {
```

# method TestDotNotation.func testDotOnNonContext()

## function:

实现 `` 中的 `testDotOnNonContext` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testDotOnNonContext() {
        let tmpl = MustacheTemplate.fromString("{{name.length}}")
        let ctx = MustacheContext()
        ctx.put("name", MustacheStr("Alice"))
        @Assert(tmpl.render(ctx), "")
    }
}

@Test
class TestDotValue {
    @TestCase
```

# class TestDotValue

## function:

封装 `` 中与 `TestDotValue` 相关的数据和行为，是项目中的类级实现单元。

## kind:

class

## access:

internal

## extends:

none

## implements:

none

## properties:

- `internal let tmpl: None`

- `internal let ctx: None`

- `internal let items: None`

## usage example:

```cangjie
class TestDotValue {
    @TestCase
    func testDotInList() {
        let tmpl = MustacheTemplate.fromString("{{#items}}{{.}}{{/items}}")
        let ctx = MustacheContext()
        let items = MustacheList()
        items.add(MustacheStr("a"))
        items.add(MustacheStr("b"))
        items.add(MustacheStr("c"))
        ctx.put("items", items)
        @Assert(tmpl.render(ctx), "abc")
    }

    @TestCase
    func testDotOutsideList() {
        let tmpl = MustacheTemplate.fromString("{{.}}")
        let ctx = MustacheContext()
        @Assert(tmpl.render(ctx), "")
    }
```

# method TestDotValue.func testDotInList()

## function:

实现 `` 中的 `testDotInList` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testDotInList() {
        let tmpl = MustacheTemplate.fromString("{{#items}}{{.}}{{/items}}")
        let ctx = MustacheContext()
        let items = MustacheList()
        items.add(MustacheStr("a"))
        items.add(MustacheStr("b"))
        items.add(MustacheStr("c"))
        ctx.put("items", items)
        @Assert(tmpl.render(ctx), "abc")
    }
```

# method TestDotValue.func testDotOutsideList()

## function:

实现 `` 中的 `testDotOutsideList` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testDotOutsideList() {
        let tmpl = MustacheTemplate.fromString("{{.}}")
        let ctx = MustacheContext()
        @Assert(tmpl.render(ctx), "")
    }

    @TestCase
    func testDotWithSeparator() {
        let tmpl = MustacheTemplate.fromString("{{#items}}{{.}},{{/items}}")
        let ctx = MustacheContext()
        let items = MustacheList()
```

# method TestDotValue.func testDotWithSeparator()

## function:

实现 `` 中的 `testDotWithSeparator` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testDotWithSeparator() {
        let tmpl = MustacheTemplate.fromString("{{#items}}{{.}},{{/items}}")
        let ctx = MustacheContext()
        let items = MustacheList()
        items.add(MustacheStr("x"))
        items.add(MustacheStr("y"))
        items.add(MustacheStr("z"))
        ctx.put("items", items)
        @Assert(tmpl.render(ctx), "x,y,z,")
    }
}
```

# class TestContextStack

## function:

封装 `` 中与 `TestContextStack` 相关的数据和行为，是项目中的类级实现单元。

## kind:

class

## access:

internal

## extends:

none

## implements:

none

## properties:

- `internal let tmpl: None`

- `internal let ctx: None`

- `internal let person: None`

- `internal let inner: None`

- `internal let a: None`

- `internal let b: None`

## usage example:

```cangjie
class TestContextStack {
    @TestCase
    func testParentFallback() {
        let tmpl = MustacheTemplate.fromString("{{#person}}{{name}} - {{title}}{{/person}}")
        let ctx = MustacheContext()
        ctx.put("title", MustacheStr("Engineer"))
        let person = MustacheContext()
        person.put("name", MustacheStr("Alice"))
        ctx.put("person", person)
        @Assert(tmpl.render(ctx), "Alice - Engineer")
    }

    @TestCase
    func testInnerOverride() {
        let tmpl = MustacheTemplate.fromString("{{#inner}}{{value}}{{/inner}}")
        let ctx = MustacheContext()
        ctx.put("value", MustacheStr("outer"))
        let inner = MustacheContext()
        inner.put("value", MustacheStr("inner"))
        ctx.put("inner", inner)
```

# method TestContextStack.func testParentFallback()

## function:

实现 `` 中的 `testParentFallback` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testParentFallback() {
        let tmpl = MustacheTemplate.fromString("{{#person}}{{name}} - {{title}}{{/person}}")
        let ctx = MustacheContext()
        ctx.put("title", MustacheStr("Engineer"))
        let person = MustacheContext()
        person.put("name", MustacheStr("Alice"))
        ctx.put("person", person)
        @Assert(tmpl.render(ctx), "Alice - Engineer")
    }

    @TestCase
```

# method TestContextStack.func testInnerOverride()

## function:

实现 `` 中的 `testInnerOverride` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testInnerOverride() {
        let tmpl = MustacheTemplate.fromString("{{#inner}}{{value}}{{/inner}}")
        let ctx = MustacheContext()
        ctx.put("value", MustacheStr("outer"))
        let inner = MustacheContext()
        inner.put("value", MustacheStr("inner"))
        ctx.put("inner", inner)
        @Assert(tmpl.render(ctx), "inner")
    }

    @TestCase
```

# method TestContextStack.func testDeepStack()

## function:

实现 `` 中的 `testDeepStack` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testDeepStack() {
        let tmpl = MustacheTemplate.fromString("{{#a}}{{#b}}{{x}}-{{y}}-{{z}}{{/b}}{{/a}}")
        let ctx = MustacheContext()
        ctx.put("x", MustacheStr("1"))
        let a = MustacheContext()
        a.put("y", MustacheStr("2"))
        let b = MustacheContext()
        b.put("z", MustacheStr("3"))
        a.put("b", b)
        ctx.put("a", a)
        @Assert(tmpl.render(ctx), "1-2-3")
```

# class TestComplex

## function:

封装 `` 中与 `TestComplex` 相关的数据和行为，是项目中的类级实现单元。

## kind:

class

## access:

internal

## extends:

none

## implements:

none

## properties:

- `internal let tmpl: None`

- `internal let ctx: None`

- `internal let items: None`

- `internal let i1: None`

- `internal let i2: None`

- `internal let groups: None`

- `internal let g1: None`

- `internal let m1: None`

- `internal let g2: None`

- `internal let m2: None`

- `internal let ctx1: None`

- `internal let ctx2: None`

## usage example:

```cangjie
class TestComplex {
    @TestCase
    func testHtmlTemplate() {
        let tmpl = MustacheTemplate.fromString("<h1>{{title}}</h1><ul>{{#items}}<li>{{name}}: {{value}}</li>{{/items}}</ul>{{^items}}<p>No items</p>{{/items}}")
        let ctx = MustacheContext()
        ctx.put("title", MustacheStr("My List"))
        let items = MustacheList()
        let i1 = MustacheContext()
        i1.put("name", MustacheStr("Item 1"))
        i1.put("value", MustacheStr("100"))
        let i2 = MustacheContext()
        i2.put("name", MustacheStr("Item 2"))
        i2.put("value", MustacheStr("200"))
        items.add(i1)
        items.add(i2)
        ctx.put("items", items)
        @Assert(tmpl.render(ctx), "<h1>My List</h1><ul><li>Item 1: 100</li><li>Item 2: 200</li></ul>")
    }

    @TestCase
```

# method TestComplex.func testHtmlTemplate()

## function:

实现 `` 中的 `testHtmlTemplate` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testHtmlTemplate() {
        let tmpl = MustacheTemplate.fromString("<h1>{{title}}</h1><ul>{{#items}}<li>{{name}}: {{value}}</li>{{/items}}</ul>{{^items}}<p>No items</p>{{/items}}")
        let ctx = MustacheContext()
        ctx.put("title", MustacheStr("My List"))
        let items = MustacheList()
        let i1 = MustacheContext()
        i1.put("name", MustacheStr("Item 1"))
        i1.put("value", MustacheStr("100"))
        let i2 = MustacheContext()
        i2.put("name", MustacheStr("Item 2"))
        i2.put("value", MustacheStr("200"))
```

# method TestComplex.func testNestedListsTemplate()

## function:

实现 `` 中的 `testNestedListsTemplate` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testNestedListsTemplate() {
        let tmpl = MustacheTemplate.fromString("{{#groups}}[{{#members}}{{.}} {{/members}}]{{/groups}}")
        let ctx = MustacheContext()
        let groups = MustacheList()
        let g1 = MustacheContext()
        let m1 = MustacheList()
        m1.add(MustacheStr("Alice"))
        m1.add(MustacheStr("Bob"))
        g1.put("members", m1)
        let g2 = MustacheContext()
        let m2 = MustacheList()
```

# method TestComplex.func testConditionalSections()

## function:

实现 `` 中的 `testConditionalSections` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testConditionalSections() {
        let tmpl = MustacheTemplate.fromString("{{#loggedIn}}Welcome, {{name}}!{{/loggedIn}}{{^loggedIn}}Please log in.{{/loggedIn}}")
        let ctx1 = MustacheContext()
        ctx1.put("loggedIn", MustacheBool(true))
        ctx1.put("name", MustacheStr("Alice"))
        @Assert(tmpl.render(ctx1), "Welcome, Alice!")

        let ctx2 = MustacheContext()
        ctx2.put("loggedIn", MustacheBool(false))
        @Assert(tmpl.render(ctx2), "Please log in.")
    }
```

# module tests/mustache/project/src/main.cj

## function:

负责测试 `main` 相关功能是否符合预期。

## usage example:

```cangjie
# source: tests/mustache/project/src/main.cj
```

## package:
mustache

# let template

## function:

`template` 是不可变变量，类型为 `None`，用于保存常量值或不可变引用。

## access:

internal

## usage example:

```cangjie
let template = MustacheTemplate.fromString("Hello, {{name}}! {{#items}}<li>{{.}}</li> {{/items}}{{^items}}No items.{{/items}}")
```

# let ctx

## function:

`ctx` 是不可变变量，类型为 `None`，用于保存常量值或不可变引用。

## access:

internal

## usage example:

```cangjie
let ctx = MustacheContext()
```

# let items

## function:

`items` 是不可变变量，类型为 `None`，用于保存常量值或不可变引用。

## access:

internal

## usage example:

```cangjie
let items = MustacheList()
```

# module tests/mustache/project/src/mustache_template.cj

## function:

负责测试 `mustache_template` 相关功能是否符合预期。

## usage example:

```cangjie
# source: tests/mustache/project/src/mustache_template.cj
```

## package:
mustache

## imports:

- `std.collection.*`

# class TextNode

## function:

封装 `` 中与 `TextNode` 相关的数据和行为，是项目中的类级实现单元。

## kind:

class

## access:

internal

## extends:

none

## implements:

none

## properties:

- `internal let _text: String`

## usage example:

```cangjie
class TextNode <: MustacheNode {
    let _text: String
    init(text: String) {
        _text = text
    }
}
```

# class VariableNode

## function:

封装 `` 中与 `VariableNode` 相关的数据和行为，是项目中的类级实现单元。

## kind:

class

## access:

internal

## extends:

none

## implements:

none

## properties:

- `internal let _name: String`

- `internal let _escaped: Bool`

## usage example:

```cangjie
class VariableNode <: MustacheNode {
    let _name: String
    let _escaped: Bool
    init(name: String, escaped: Bool) {
        _name = name
        _escaped = escaped
    }
}
```

# class SectionNode

## function:

封装 `` 中与 `SectionNode` 相关的数据和行为，是项目中的类级实现单元。

## kind:

class

## access:

internal

## extends:

none

## implements:

none

## properties:

- `internal let _name: String`

- `internal let _inverted: Bool`

- `internal let _children: ArrayList<MustacheNode>`

## usage example:

```cangjie
class SectionNode <: MustacheNode {
    let _name: String
    let _inverted: Bool
    let _children: ArrayList<MustacheNode> = ArrayList<MustacheNode>()
    init(name: String, inverted: Bool) {
        _name = name
        _inverted = inverted
    }
}
```

# class TemplateParser

## function:

Template parser (internal)。

## kind:

class

## access:

internal

## extends:

none

## implements:

none

## properties:

- `internal let _runes: Array<Rune>`

- `internal var _pos: Int64`

- `internal let nodes: None`

- `internal var textStart: None`

- `internal let name: None`

- `internal let children: None`

- `internal let section: None`

## usage example:

```cangjie
class TemplateParser {
    let _runes: Array<Rune>
    var _pos: Int64 = 0

    init(template: String) {
        _runes = template.toRuneArray()
    }

    func parse(): ArrayList<MustacheNode> {
        return parseNodes(None)
    }

    func parseNodes(sectionName: ?String): ArrayList<MustacheNode> {
        let nodes = ArrayList<MustacheNode>()
        var textStart = _pos

        while (_pos < _runes.size) {
            if (_pos + 1 < _runes.size && _runes[_pos] == r'{' && _runes[_pos + 1] == r'{') {
                // Flush accumulated text
                if (_pos > textStart) {
```

# method TemplateParser.func parse(): ArrayList<MustacheNode>

## function:

实现 `` 中的 `parse` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func parse(): ArrayList<MustacheNode> {
        return parseNodes(None)
    }

    func parseNodes(sectionName: ?String): ArrayList<MustacheNode> {
        let nodes = ArrayList<MustacheNode>()
        var textStart = _pos

        while (_pos < _runes.size) {
            if (_pos + 1 < _runes.size && _runes[_pos] == r'{' && _runes[_pos + 1] == r'{') {
                // Flush accumulated text
```

# method TemplateParser.func parseNodes(sectionName: ?String): ArrayList<MustacheNode>

## function:

实现 `` 中的 `parseNodes` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func parseNodes(sectionName: ?String): ArrayList<MustacheNode> {
        let nodes = ArrayList<MustacheNode>()
        var textStart = _pos

        while (_pos < _runes.size) {
            if (_pos + 1 < _runes.size && _runes[_pos] == r'{' && _runes[_pos + 1] == r'{') {
                // Flush accumulated text
                if (_pos > textStart) {
                    nodes.add(TextNode(runeSlice(textStart, _pos)))
                }
```

# class MustacheTemplate

## function:

Public template class。

## kind:

class

## access:

public

## extends:

none

## implements:

none

## properties:

- `internal let _nodes: ArrayList<MustacheNode>`

## usage example:

```cangjie
public class MustacheTemplate {
    let _nodes: ArrayList<MustacheNode>

    init(nodes: ArrayList<MustacheNode>) {
        _nodes = nodes
    }
```

# func func htmlEscape(s: String): String

## function:

实现 `` 中的 `htmlEscape` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## usage example:

```cangjie
func htmlEscape(s: String): String {
    let sb = StringBuilder()
    for (r in s.runes()) {
        if (r == r'&') {
            sb.append("&amp;")
        } else if (r == r'<') {
            sb.append("&lt;")
        } else if (r == r'>') {
            sb.append("&gt;")
        } else if (r == r'"') {
            sb.append("&quot;")
```

# func func runeSlice(start: Int64, end: Int64): String

## function:

实现 `` 中的 `runeSlice` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## usage example:

```cangjie
func runeSlice(start: Int64, end: Int64): String {
        let sb = StringBuilder()
        for (i in start..end) {
            sb.append(_runes[i])
        }
        return sb.toString()
    }

    func readUntilClose(): String {
        let sb = StringBuilder()
        while (_pos < _runes.size && _runes[_pos] != r'}') {
```

# func func readUntilClose(): String

## function:

实现 `` 中的 `readUntilClose` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## usage example:

```cangjie
func readUntilClose(): String {
        let sb = StringBuilder()
        while (_pos < _runes.size && _runes[_pos] != r'}') {
            sb.append(_runes[_pos])
            _pos++
        }
        return sb.toString()
    }

    func expectStr(s: String): Unit {
        let runes = s.toRuneArray()
```

# func func expectStr(s: String): Unit

## function:

实现 `` 中的 `expectStr` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## usage example:

```cangjie
func expectStr(s: String): Unit {
        let runes = s.toRuneArray()
        for (r in runes) {
            if (_pos >= _runes.size || _runes[_pos] != r) {
                throw MustacheException("Expected '${s}'")
            }
            _pos++
        }
    }
}
```

# func func fromString(template: String): MustacheTemplate

## function:

实现 `` 中的 `fromString` 逻辑，是该模块中的可调用函数单元。

## access:

public

## usage example:

```cangjie
public static func fromString(template: String): MustacheTemplate {
        let parser = TemplateParser(template)
        let nodes = parser.parse()
        return MustacheTemplate(nodes)
    }

    public func render(context: MustacheContext): String {
        let sb = StringBuilder()
        let stack = ArrayList<MustacheContext>()
        stack.add(context)
        renderNodes(_nodes, stack, None, sb)
```

# func func render(context: MustacheContext): String

## function:

实现 `` 中的 `render` 逻辑，是该模块中的可调用函数单元。

## access:

public

## usage example:

```cangjie
public func render(context: MustacheContext): String {
        let sb = StringBuilder()
        let stack = ArrayList<MustacheContext>()
        stack.add(context)
        renderNodes(_nodes, stack, None, sb)
        return sb.toString()
    }

    func renderNodes(nodes: ArrayList<MustacheNode>, stack: ArrayList<MustacheContext>,
                     currentValue: ?MustacheValue, sb: StringBuilder): Unit {
        for (node in nodes) {
```

# func func lookupValue(name: String, stack: ArrayList<MustacheContext>): MustacheValue

## function:

实现 `` 中的 `lookupValue` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## usage example:

```cangjie
func lookupValue(name: String, stack: ArrayList<MustacheContext>): MustacheValue {
        let parts = name.split(".")
        if (parts.size == 0) {
            return MustacheNone()
        }

        // Find first part in context stack (top to bottom)
        var current: MustacheValue = MustacheNone()
        var found = false
        var i = stack.size - 1
        while (i >= 0) {
```

# func func valueToString(value: MustacheValue): String

## function:

实现 `` 中的 `valueToString` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## usage example:

```cangjie
func valueToString(value: MustacheValue): String {
        if (value.isString()) {
            return value.asString()
        } else if (value.isBool()) {
            if (value.asBool()) {
                return "true"
            } else {
                return "false"
            }
        } else {
            return ""
```

# func func isFalsy(value: MustacheValue): Bool

## function:

实现 `` 中的 `isFalsy` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## usage example:

```cangjie
func isFalsy(value: MustacheValue): Bool {
        if (value.isNone()) { return true }
        if (value.isBool() && !value.asBool()) { return true }
        if (value.isList()) {
            let list = (value as MustacheList).getOrThrow()
            return list.size() == 0
        }
        return false
    }
}
```

# let SINGLE_QUOTE

## function:

`SINGLE_QUOTE` 是不可变变量，类型为 `Rune`，用于保存常量值或不可变引用。

## access:

internal

## usage example:

```cangjie
let SINGLE_QUOTE: Rune = Rune(39)
```

# let sb

## function:

`sb` 是不可变变量，类型为 `None`，用于保存常量值或不可变引用。

## access:

internal

## usage example:

```cangjie
let sb = StringBuilder()
```

# let children

## function:

`children` 是不可变变量，类型为 `None`，用于保存常量值或不可变引用。

## access:

internal

## usage example:

```cangjie
let children = parseNodes(name)
```

# let section

## function:

`section` 是不可变变量，类型为 `None`，用于保存常量值或不可变引用。

## access:

internal

## usage example:

```cangjie
let section = SectionNode(name, true)
```

# let name

## function:

`name` 是不可变变量，类型为 `None`，用于保存常量值或不可变引用。

## access:

internal

## usage example:

```cangjie
let name = readUntilClose().trimAscii()
```

# let runes

## function:

`runes` 是不可变变量，类型为 `None`，用于保存常量值或不可变引用。

## access:

internal

## usage example:

```cangjie
let runes = s.toRuneArray()
```

# let parser

## function:

`parser` 是不可变变量，类型为 `None`，用于保存常量值或不可变引用。

## access:

internal

## usage example:

```cangjie
let parser = TemplateParser(template)
```

# let nodes

## function:

`nodes` 是不可变变量，类型为 `None`，用于保存常量值或不可变引用。

## access:

internal

## usage example:

```cangjie
let nodes = parser.parse()
```

# let stack

## function:

`stack` 是不可变变量，类型为 `None`，用于保存常量值或不可变引用。

## access:

internal

## usage example:

```cangjie
let stack = ArrayList<MustacheContext>()
```

# let value

## function:

`value` 是不可变变量，类型为 `None`，用于保存常量值或不可变引用。

## access:

internal

## usage example:

```cangjie
let value = lookupValue(node._name, stack)
```

# let text

## function:

`text` 是不可变变量，类型为 `None`，用于保存常量值或不可变引用。

## access:

internal

## usage example:

```cangjie
let text = valueToString(value)
```

# let falsy

## function:

`falsy` 是不可变变量，类型为 `None`，用于保存常量值或不可变引用。

## access:

internal

## usage example:

```cangjie
let falsy = isFalsy(value)
```

# let list

## function:

`list` 是不可变变量，类型为 `None`，用于保存常量值或不可变引用。

## access:

internal

## usage example:

```cangjie
let list = (value as MustacheList).getOrThrow()
```

# let item

## function:

`item` 是不可变变量，类型为 `None`，用于保存常量值或不可变引用。

## access:

internal

## usage example:

```cangjie
let item = list.get(i)
```

# let itemCtx

## function:

`itemCtx` 是不可变变量，类型为 `None`，用于保存常量值或不可变引用。

## access:

internal

## usage example:

```cangjie
let itemCtx = (item as MustacheContext).getOrThrow()
```

# let ctx

## function:

`ctx` 是不可变变量，类型为 `None`，用于保存常量值或不可变引用。

## access:

internal

## usage example:

```cangjie
let ctx = (current as MustacheContext).getOrThrow()
```

# let parts

## function:

`parts` 是不可变变量，类型为 `None`，用于保存常量值或不可变引用。

## access:

internal

## usage example:

```cangjie
let parts = name.split(".")
```

# var current

## function:

`current` 是可变变量，类型为 `MustacheValue`，用于保存运行时状态或可变数据。

## access:

internal

## usage example:

```cangjie
var current: MustacheValue = MustacheNone()
```

# var found

## function:

`found` 是可变变量，类型为 `None`，用于保存运行时状态或可变数据。

## access:

internal

## usage example:

```cangjie
var found = false
```

# var i

## function:

`i` 是可变变量，类型为 `None`，用于保存运行时状态或可变数据。

## access:

internal

## usage example:

```cangjie
var i = stack.size - 1
```

# module tests/mustache/project/src/mustache_test.cj

## function:

负责测试 `mustache_test` 相关功能是否符合预期。

## usage example:

```cangjie
# source: tests/mustache/project/src/mustache_test.cj
```

## package:
mustache

# class TestVariableInterpolation

## function:

封装 `` 中与 `TestVariableInterpolation` 相关的数据和行为，是项目中的类级实现单元。

## kind:

class

## access:

internal

## extends:

none

## implements:

none

## properties:

- `internal let tmpl: None`

- `internal let ctx: None`

## usage example:

```cangjie
class TestVariableInterpolation {
    @TestCase
    func testSimpleVariable() {
        let tmpl = MustacheTemplate.fromString("Hello, {{name}}!")
        let ctx = MustacheContext()
        ctx.put("name", MustacheStr("World"))
        @Assert(tmpl.render(ctx), "Hello, World!")
    }

    @TestCase
    func testMultipleVariables() {
        let tmpl = MustacheTemplate.fromString("{{greeting}}, {{name}}!")
        let ctx = MustacheContext()
        ctx.put("greeting", MustacheStr("Hi"))
        ctx.put("name", MustacheStr("Alice"))
        @Assert(tmpl.render(ctx), "Hi, Alice!")
    }

    @TestCase
    func testMissingVariable() {
```

# method TestVariableInterpolation.func testSimpleVariable()

## function:

实现 `` 中的 `testSimpleVariable` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testSimpleVariable() {
        let tmpl = MustacheTemplate.fromString("Hello, {{name}}!")
        let ctx = MustacheContext()
        ctx.put("name", MustacheStr("World"))
        @Assert(tmpl.render(ctx), "Hello, World!")
    }

    @TestCase
    func testMultipleVariables() {
        let tmpl = MustacheTemplate.fromString("{{greeting}}, {{name}}!")
        let ctx = MustacheContext()
```

# method TestVariableInterpolation.func testMultipleVariables()

## function:

实现 `` 中的 `testMultipleVariables` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testMultipleVariables() {
        let tmpl = MustacheTemplate.fromString("{{greeting}}, {{name}}!")
        let ctx = MustacheContext()
        ctx.put("greeting", MustacheStr("Hi"))
        ctx.put("name", MustacheStr("Alice"))
        @Assert(tmpl.render(ctx), "Hi, Alice!")
    }

    @TestCase
    func testMissingVariable() {
        let tmpl = MustacheTemplate.fromString("Hello, {{name}}!")
```

# method TestVariableInterpolation.func testMissingVariable()

## function:

实现 `` 中的 `testMissingVariable` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testMissingVariable() {
        let tmpl = MustacheTemplate.fromString("Hello, {{name}}!")
        let ctx = MustacheContext()
        @Assert(tmpl.render(ctx), "Hello, !")
    }

    @TestCase
    func testHtmlEscaping() {
        let tmpl = MustacheTemplate.fromString("{{content}}")
        let ctx = MustacheContext()
        ctx.put("content", MustacheStr("<b>bold</b>"))
```

# method TestVariableInterpolation.func testHtmlEscaping()

## function:

实现 `` 中的 `testHtmlEscaping` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testHtmlEscaping() {
        let tmpl = MustacheTemplate.fromString("{{content}}")
        let ctx = MustacheContext()
        ctx.put("content", MustacheStr("<b>bold</b>"))
        @Assert(tmpl.render(ctx), "&lt;b&gt;bold&lt;/b&gt;")
    }

    @TestCase
    func testAllHtmlEntities() {
        let tmpl = MustacheTemplate.fromString("{{content}}")
        let ctx = MustacheContext()
```

# method TestVariableInterpolation.func testAllHtmlEntities()

## function:

实现 `` 中的 `testAllHtmlEntities` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testAllHtmlEntities() {
        let tmpl = MustacheTemplate.fromString("{{content}}")
        let ctx = MustacheContext()
        ctx.put("content", MustacheStr("&<>\"'"))
        @Assert(tmpl.render(ctx), "&amp;&lt;&gt;&quot;&#39;")
    }

    @TestCase
    func testEmptyTemplate() {
        let tmpl = MustacheTemplate.fromString("")
        let ctx = MustacheContext()
```

# method TestVariableInterpolation.func testEmptyTemplate()

## function:

实现 `` 中的 `testEmptyTemplate` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testEmptyTemplate() {
        let tmpl = MustacheTemplate.fromString("")
        let ctx = MustacheContext()
        @Assert(tmpl.render(ctx), "")
    }

    @TestCase
    func testPlainText() {
        let tmpl = MustacheTemplate.fromString("Just plain text")
        let ctx = MustacheContext()
        @Assert(tmpl.render(ctx), "Just plain text")
```

# method TestVariableInterpolation.func testPlainText()

## function:

实现 `` 中的 `testPlainText` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testPlainText() {
        let tmpl = MustacheTemplate.fromString("Just plain text")
        let ctx = MustacheContext()
        @Assert(tmpl.render(ctx), "Just plain text")
    }

    @TestCase
    func testVariableWithWhitespace() {
        let tmpl = MustacheTemplate.fromString("{{ name }}")
        let ctx = MustacheContext()
        ctx.put("name", MustacheStr("Alice"))
```

# method TestVariableInterpolation.func testVariableWithWhitespace()

## function:

实现 `` 中的 `testVariableWithWhitespace` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testVariableWithWhitespace() {
        let tmpl = MustacheTemplate.fromString("{{ name }}")
        let ctx = MustacheContext()
        ctx.put("name", MustacheStr("Alice"))
        @Assert(tmpl.render(ctx), "Alice")
    }
}

@Test
class TestUnescapedVariable {
    @TestCase
```

# class TestUnescapedVariable

## function:

封装 `` 中与 `TestUnescapedVariable` 相关的数据和行为，是项目中的类级实现单元。

## kind:

class

## access:

internal

## extends:

none

## implements:

none

## properties:

- `internal let tmpl: None`

- `internal let ctx: None`

## usage example:

```cangjie
class TestUnescapedVariable {
    @TestCase
    func testTripleBrace() {
        let tmpl = MustacheTemplate.fromString("{{{content}}}")
        let ctx = MustacheContext()
        ctx.put("content", MustacheStr("<b>bold</b>"))
        @Assert(tmpl.render(ctx), "<b>bold</b>")
    }

    @TestCase
    func testAmpersandSyntax() {
        let tmpl = MustacheTemplate.fromString("{{&content}}")
        let ctx = MustacheContext()
        ctx.put("content", MustacheStr("<b>bold</b>"))
        @Assert(tmpl.render(ctx), "<b>bold</b>")
    }

    @TestCase
    func testUnescapedMissing() {
        let tmpl = MustacheTemplate.fromString("{{{missing}}}")
```

# method TestUnescapedVariable.func testTripleBrace()

## function:

实现 `` 中的 `testTripleBrace` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testTripleBrace() {
        let tmpl = MustacheTemplate.fromString("{{{content}}}")
        let ctx = MustacheContext()
        ctx.put("content", MustacheStr("<b>bold</b>"))
        @Assert(tmpl.render(ctx), "<b>bold</b>")
    }

    @TestCase
    func testAmpersandSyntax() {
        let tmpl = MustacheTemplate.fromString("{{&content}}")
        let ctx = MustacheContext()
```

# method TestUnescapedVariable.func testAmpersandSyntax()

## function:

实现 `` 中的 `testAmpersandSyntax` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testAmpersandSyntax() {
        let tmpl = MustacheTemplate.fromString("{{&content}}")
        let ctx = MustacheContext()
        ctx.put("content", MustacheStr("<b>bold</b>"))
        @Assert(tmpl.render(ctx), "<b>bold</b>")
    }

    @TestCase
    func testUnescapedMissing() {
        let tmpl = MustacheTemplate.fromString("{{{missing}}}")
        let ctx = MustacheContext()
```

# method TestUnescapedVariable.func testUnescapedMissing()

## function:

实现 `` 中的 `testUnescapedMissing` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testUnescapedMissing() {
        let tmpl = MustacheTemplate.fromString("{{{missing}}}")
        let ctx = MustacheContext()
        @Assert(tmpl.render(ctx), "")
    }

    @TestCase
    func testMixedEscaping() {
        let tmpl = MustacheTemplate.fromString("{{escaped}} {{{unescaped}}}")
        let ctx = MustacheContext()
        ctx.put("escaped", MustacheStr("<b>"))
```

# method TestUnescapedVariable.func testMixedEscaping()

## function:

实现 `` 中的 `testMixedEscaping` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testMixedEscaping() {
        let tmpl = MustacheTemplate.fromString("{{escaped}} {{{unescaped}}}")
        let ctx = MustacheContext()
        ctx.put("escaped", MustacheStr("<b>"))
        ctx.put("unescaped", MustacheStr("<b>"))
        @Assert(tmpl.render(ctx), "&lt;b&gt; <b>")
    }
}

@Test
class TestSections {
```

# class TestSections

## function:

封装 `` 中与 `TestSections` 相关的数据和行为，是项目中的类级实现单元。

## kind:

class

## access:

internal

## extends:

none

## implements:

none

## properties:

- `internal let tmpl: None`

- `internal let ctx: None`

- `internal let items: None`

- `internal let person: None`

- `internal let people: None`

- `internal let p1: None`

- `internal let p2: None`

## usage example:

```cangjie
class TestSections {
    @TestCase
    func testBoolTrueSection() {
        let tmpl = MustacheTemplate.fromString("{{#show}}Visible{{/show}}")
        let ctx = MustacheContext()
        ctx.put("show", MustacheBool(true))
        @Assert(tmpl.render(ctx), "Visible")
    }

    @TestCase
    func testBoolFalseSection() {
        let tmpl = MustacheTemplate.fromString("{{#show}}Visible{{/show}}")
        let ctx = MustacheContext()
        ctx.put("show", MustacheBool(false))
        @Assert(tmpl.render(ctx), "")
    }

    @TestCase
    func testMissingKeySection() {
        let tmpl = MustacheTemplate.fromString("{{#show}}Visible{{/show}}")
```

# method TestSections.func testBoolTrueSection()

## function:

实现 `` 中的 `testBoolTrueSection` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testBoolTrueSection() {
        let tmpl = MustacheTemplate.fromString("{{#show}}Visible{{/show}}")
        let ctx = MustacheContext()
        ctx.put("show", MustacheBool(true))
        @Assert(tmpl.render(ctx), "Visible")
    }

    @TestCase
    func testBoolFalseSection() {
        let tmpl = MustacheTemplate.fromString("{{#show}}Visible{{/show}}")
        let ctx = MustacheContext()
```

# method TestSections.func testBoolFalseSection()

## function:

实现 `` 中的 `testBoolFalseSection` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testBoolFalseSection() {
        let tmpl = MustacheTemplate.fromString("{{#show}}Visible{{/show}}")
        let ctx = MustacheContext()
        ctx.put("show", MustacheBool(false))
        @Assert(tmpl.render(ctx), "")
    }

    @TestCase
    func testMissingKeySection() {
        let tmpl = MustacheTemplate.fromString("{{#show}}Visible{{/show}}")
        let ctx = MustacheContext()
```

# method TestSections.func testMissingKeySection()

## function:

实现 `` 中的 `testMissingKeySection` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testMissingKeySection() {
        let tmpl = MustacheTemplate.fromString("{{#show}}Visible{{/show}}")
        let ctx = MustacheContext()
        @Assert(tmpl.render(ctx), "")
    }

    @TestCase
    func testListSection() {
        let tmpl = MustacheTemplate.fromString("{{#items}}{{.}} {{/items}}")
        let ctx = MustacheContext()
        let items = MustacheList()
```

# method TestSections.func testListSection()

## function:

实现 `` 中的 `testListSection` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testListSection() {
        let tmpl = MustacheTemplate.fromString("{{#items}}{{.}} {{/items}}")
        let ctx = MustacheContext()
        let items = MustacheList()
        items.add(MustacheStr("a"))
        items.add(MustacheStr("b"))
        items.add(MustacheStr("c"))
        ctx.put("items", items)
        @Assert(tmpl.render(ctx), "a b c ")
    }
```

# method TestSections.func testEmptyListSection()

## function:

实现 `` 中的 `testEmptyListSection` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testEmptyListSection() {
        let tmpl = MustacheTemplate.fromString("{{#items}}item{{/items}}")
        let ctx = MustacheContext()
        ctx.put("items", MustacheList())
        @Assert(tmpl.render(ctx), "")
    }

    @TestCase
    func testContextSection() {
        let tmpl = MustacheTemplate.fromString("{{#person}}{{name}} is {{age}}{{/person}}")
        let ctx = MustacheContext()
```

# method TestSections.func testContextSection()

## function:

实现 `` 中的 `testContextSection` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testContextSection() {
        let tmpl = MustacheTemplate.fromString("{{#person}}{{name}} is {{age}}{{/person}}")
        let ctx = MustacheContext()
        let person = MustacheContext()
        person.put("name", MustacheStr("Alice"))
        person.put("age", MustacheStr("30"))
        ctx.put("person", person)
        @Assert(tmpl.render(ctx), "Alice is 30")
    }

    @TestCase
```

# method TestSections.func testListOfContexts()

## function:

实现 `` 中的 `testListOfContexts` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testListOfContexts() {
        let tmpl = MustacheTemplate.fromString("{{#people}}{{name}} {{/people}}")
        let ctx = MustacheContext()
        let people = MustacheList()
        let p1 = MustacheContext()
        p1.put("name", MustacheStr("Alice"))
        let p2 = MustacheContext()
        p2.put("name", MustacheStr("Bob"))
        people.add(p1)
        people.add(p2)
        ctx.put("people", people)
```

# method TestSections.func testNestedSections()

## function:

实现 `` 中的 `testNestedSections` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testNestedSections() {
        let tmpl = MustacheTemplate.fromString("{{#a}}{{#b}}yes{{/b}}{{/a}}")
        let ctx = MustacheContext()
        ctx.put("a", MustacheBool(true))
        ctx.put("b", MustacheBool(true))
        @Assert(tmpl.render(ctx), "yes")
    }
}

@Test
class TestInvertedSections {
```

# class TestInvertedSections

## function:

封装 `` 中与 `TestInvertedSections` 相关的数据和行为，是项目中的类级实现单元。

## kind:

class

## access:

internal

## extends:

none

## implements:

none

## properties:

- `internal let tmpl: None`

- `internal let ctx: None`

- `internal let items: None`

## usage example:

```cangjie
class TestInvertedSections {
    @TestCase
    func testInvertedFalse() {
        let tmpl = MustacheTemplate.fromString("{{^show}}Hidden{{/show}}")
        let ctx = MustacheContext()
        ctx.put("show", MustacheBool(false))
        @Assert(tmpl.render(ctx), "Hidden")
    }

    @TestCase
    func testInvertedTrue() {
        let tmpl = MustacheTemplate.fromString("{{^show}}Hidden{{/show}}")
        let ctx = MustacheContext()
        ctx.put("show", MustacheBool(true))
        @Assert(tmpl.render(ctx), "")
    }

    @TestCase
    func testInvertedMissing() {
        let tmpl = MustacheTemplate.fromString("{{^show}}Hidden{{/show}}")
```

# method TestInvertedSections.func testInvertedFalse()

## function:

实现 `` 中的 `testInvertedFalse` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testInvertedFalse() {
        let tmpl = MustacheTemplate.fromString("{{^show}}Hidden{{/show}}")
        let ctx = MustacheContext()
        ctx.put("show", MustacheBool(false))
        @Assert(tmpl.render(ctx), "Hidden")
    }

    @TestCase
    func testInvertedTrue() {
        let tmpl = MustacheTemplate.fromString("{{^show}}Hidden{{/show}}")
        let ctx = MustacheContext()
```

# method TestInvertedSections.func testInvertedTrue()

## function:

实现 `` 中的 `testInvertedTrue` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testInvertedTrue() {
        let tmpl = MustacheTemplate.fromString("{{^show}}Hidden{{/show}}")
        let ctx = MustacheContext()
        ctx.put("show", MustacheBool(true))
        @Assert(tmpl.render(ctx), "")
    }

    @TestCase
    func testInvertedMissing() {
        let tmpl = MustacheTemplate.fromString("{{^show}}Hidden{{/show}}")
        let ctx = MustacheContext()
```

# method TestInvertedSections.func testInvertedMissing()

## function:

实现 `` 中的 `testInvertedMissing` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testInvertedMissing() {
        let tmpl = MustacheTemplate.fromString("{{^show}}Hidden{{/show}}")
        let ctx = MustacheContext()
        @Assert(tmpl.render(ctx), "Hidden")
    }

    @TestCase
    func testInvertedEmptyList() {
        let tmpl = MustacheTemplate.fromString("{{^items}}No items{{/items}}")
        let ctx = MustacheContext()
        ctx.put("items", MustacheList())
```

# method TestInvertedSections.func testInvertedEmptyList()

## function:

实现 `` 中的 `testInvertedEmptyList` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testInvertedEmptyList() {
        let tmpl = MustacheTemplate.fromString("{{^items}}No items{{/items}}")
        let ctx = MustacheContext()
        ctx.put("items", MustacheList())
        @Assert(tmpl.render(ctx), "No items")
    }

    @TestCase
    func testInvertedNonEmptyList() {
        let tmpl = MustacheTemplate.fromString("{{^items}}No items{{/items}}")
        let ctx = MustacheContext()
```

# method TestInvertedSections.func testInvertedNonEmptyList()

## function:

实现 `` 中的 `testInvertedNonEmptyList` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testInvertedNonEmptyList() {
        let tmpl = MustacheTemplate.fromString("{{^items}}No items{{/items}}")
        let ctx = MustacheContext()
        let items = MustacheList()
        items.add(MustacheStr("a"))
        ctx.put("items", items)
        @Assert(tmpl.render(ctx), "")
    }
}

@Test
```

# class TestComments

## function:

封装 `` 中与 `TestComments` 相关的数据和行为，是项目中的类级实现单元。

## kind:

class

## access:

internal

## extends:

none

## implements:

none

## properties:

- `internal let tmpl: None`

- `internal let ctx: None`

## usage example:

```cangjie
class TestComments {
    @TestCase
    func testComment() {
        let tmpl = MustacheTemplate.fromString("Before{{! comment }}After")
        let ctx = MustacheContext()
        @Assert(tmpl.render(ctx), "BeforeAfter")
    }

    @TestCase
    func testCommentOnly() {
        let tmpl = MustacheTemplate.fromString("{{! this is a comment }}")
        let ctx = MustacheContext()
        @Assert(tmpl.render(ctx), "")
    }

    @TestCase
    func testCommentInTemplate() {
        let tmpl = MustacheTemplate.fromString("{{name}}{{! greeting }}!")
        let ctx = MustacheContext()
        ctx.put("name", MustacheStr("Alice"))
```

# method TestComments.func testComment()

## function:

实现 `` 中的 `testComment` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testComment() {
        let tmpl = MustacheTemplate.fromString("Before{{! comment }}After")
        let ctx = MustacheContext()
        @Assert(tmpl.render(ctx), "BeforeAfter")
    }

    @TestCase
    func testCommentOnly() {
        let tmpl = MustacheTemplate.fromString("{{! this is a comment }}")
        let ctx = MustacheContext()
        @Assert(tmpl.render(ctx), "")
```

# method TestComments.func testCommentOnly()

## function:

实现 `` 中的 `testCommentOnly` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testCommentOnly() {
        let tmpl = MustacheTemplate.fromString("{{! this is a comment }}")
        let ctx = MustacheContext()
        @Assert(tmpl.render(ctx), "")
    }

    @TestCase
    func testCommentInTemplate() {
        let tmpl = MustacheTemplate.fromString("{{name}}{{! greeting }}!")
        let ctx = MustacheContext()
        ctx.put("name", MustacheStr("Alice"))
```

# method TestComments.func testCommentInTemplate()

## function:

实现 `` 中的 `testCommentInTemplate` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testCommentInTemplate() {
        let tmpl = MustacheTemplate.fromString("{{name}}{{! greeting }}!")
        let ctx = MustacheContext()
        ctx.put("name", MustacheStr("Alice"))
        @Assert(tmpl.render(ctx), "Alice!")
    }
}

@Test
class TestDotNotation {
    @TestCase
```

# class TestDotNotation

## function:

封装 `` 中与 `TestDotNotation` 相关的数据和行为，是项目中的类级实现单元。

## kind:

class

## access:

internal

## extends:

none

## implements:

none

## properties:

- `internal let tmpl: None`

- `internal let ctx: None`

- `internal let person: None`

- `internal let a: None`

- `internal let b: None`

## usage example:

```cangjie
class TestDotNotation {
    @TestCase
    func testNestedAccess() {
        let tmpl = MustacheTemplate.fromString("{{person.name}}")
        let ctx = MustacheContext()
        let person = MustacheContext()
        person.put("name", MustacheStr("Alice"))
        ctx.put("person", person)
        @Assert(tmpl.render(ctx), "Alice")
    }

    @TestCase
    func testDeepNesting() {
        let tmpl = MustacheTemplate.fromString("{{a.b.c}}")
        let ctx = MustacheContext()
        let a = MustacheContext()
        let b = MustacheContext()
        b.put("c", MustacheStr("deep"))
        a.put("b", b)
        ctx.put("a", a)
```

# method TestDotNotation.func testNestedAccess()

## function:

实现 `` 中的 `testNestedAccess` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testNestedAccess() {
        let tmpl = MustacheTemplate.fromString("{{person.name}}")
        let ctx = MustacheContext()
        let person = MustacheContext()
        person.put("name", MustacheStr("Alice"))
        ctx.put("person", person)
        @Assert(tmpl.render(ctx), "Alice")
    }

    @TestCase
    func testDeepNesting() {
```

# method TestDotNotation.func testDeepNesting()

## function:

实现 `` 中的 `testDeepNesting` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testDeepNesting() {
        let tmpl = MustacheTemplate.fromString("{{a.b.c}}")
        let ctx = MustacheContext()
        let a = MustacheContext()
        let b = MustacheContext()
        b.put("c", MustacheStr("deep"))
        a.put("b", b)
        ctx.put("a", a)
        @Assert(tmpl.render(ctx), "deep")
    }
```

# method TestDotNotation.func testMissingNested()

## function:

实现 `` 中的 `testMissingNested` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testMissingNested() {
        let tmpl = MustacheTemplate.fromString("{{person.unknown}}")
        let ctx = MustacheContext()
        let person = MustacheContext()
        person.put("name", MustacheStr("Alice"))
        ctx.put("person", person)
        @Assert(tmpl.render(ctx), "")
    }

    @TestCase
    func testDotOnNonContext() {
```

# method TestDotNotation.func testDotOnNonContext()

## function:

实现 `` 中的 `testDotOnNonContext` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testDotOnNonContext() {
        let tmpl = MustacheTemplate.fromString("{{name.length}}")
        let ctx = MustacheContext()
        ctx.put("name", MustacheStr("Alice"))
        @Assert(tmpl.render(ctx), "")
    }
}

@Test
class TestDotValue {
    @TestCase
```

# class TestDotValue

## function:

封装 `` 中与 `TestDotValue` 相关的数据和行为，是项目中的类级实现单元。

## kind:

class

## access:

internal

## extends:

none

## implements:

none

## properties:

- `internal let tmpl: None`

- `internal let ctx: None`

- `internal let items: None`

## usage example:

```cangjie
class TestDotValue {
    @TestCase
    func testDotInList() {
        let tmpl = MustacheTemplate.fromString("{{#items}}{{.}}{{/items}}")
        let ctx = MustacheContext()
        let items = MustacheList()
        items.add(MustacheStr("a"))
        items.add(MustacheStr("b"))
        items.add(MustacheStr("c"))
        ctx.put("items", items)
        @Assert(tmpl.render(ctx), "abc")
    }

    @TestCase
    func testDotOutsideList() {
        let tmpl = MustacheTemplate.fromString("{{.}}")
        let ctx = MustacheContext()
        @Assert(tmpl.render(ctx), "")
    }
```

# method TestDotValue.func testDotInList()

## function:

实现 `` 中的 `testDotInList` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testDotInList() {
        let tmpl = MustacheTemplate.fromString("{{#items}}{{.}}{{/items}}")
        let ctx = MustacheContext()
        let items = MustacheList()
        items.add(MustacheStr("a"))
        items.add(MustacheStr("b"))
        items.add(MustacheStr("c"))
        ctx.put("items", items)
        @Assert(tmpl.render(ctx), "abc")
    }
```

# method TestDotValue.func testDotOutsideList()

## function:

实现 `` 中的 `testDotOutsideList` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testDotOutsideList() {
        let tmpl = MustacheTemplate.fromString("{{.}}")
        let ctx = MustacheContext()
        @Assert(tmpl.render(ctx), "")
    }

    @TestCase
    func testDotWithSeparator() {
        let tmpl = MustacheTemplate.fromString("{{#items}}{{.}},{{/items}}")
        let ctx = MustacheContext()
        let items = MustacheList()
```

# method TestDotValue.func testDotWithSeparator()

## function:

实现 `` 中的 `testDotWithSeparator` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testDotWithSeparator() {
        let tmpl = MustacheTemplate.fromString("{{#items}}{{.}},{{/items}}")
        let ctx = MustacheContext()
        let items = MustacheList()
        items.add(MustacheStr("x"))
        items.add(MustacheStr("y"))
        items.add(MustacheStr("z"))
        ctx.put("items", items)
        @Assert(tmpl.render(ctx), "x,y,z,")
    }
}
```

# class TestContextStack

## function:

封装 `` 中与 `TestContextStack` 相关的数据和行为，是项目中的类级实现单元。

## kind:

class

## access:

internal

## extends:

none

## implements:

none

## properties:

- `internal let tmpl: None`

- `internal let ctx: None`

- `internal let person: None`

- `internal let inner: None`

- `internal let a: None`

- `internal let b: None`

## usage example:

```cangjie
class TestContextStack {
    @TestCase
    func testParentFallback() {
        let tmpl = MustacheTemplate.fromString("{{#person}}{{name}} - {{title}}{{/person}}")
        let ctx = MustacheContext()
        ctx.put("title", MustacheStr("Engineer"))
        let person = MustacheContext()
        person.put("name", MustacheStr("Alice"))
        ctx.put("person", person)
        @Assert(tmpl.render(ctx), "Alice - Engineer")
    }

    @TestCase
    func testInnerOverride() {
        let tmpl = MustacheTemplate.fromString("{{#inner}}{{value}}{{/inner}}")
        let ctx = MustacheContext()
        ctx.put("value", MustacheStr("outer"))
        let inner = MustacheContext()
        inner.put("value", MustacheStr("inner"))
        ctx.put("inner", inner)
```

# method TestContextStack.func testParentFallback()

## function:

实现 `` 中的 `testParentFallback` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testParentFallback() {
        let tmpl = MustacheTemplate.fromString("{{#person}}{{name}} - {{title}}{{/person}}")
        let ctx = MustacheContext()
        ctx.put("title", MustacheStr("Engineer"))
        let person = MustacheContext()
        person.put("name", MustacheStr("Alice"))
        ctx.put("person", person)
        @Assert(tmpl.render(ctx), "Alice - Engineer")
    }

    @TestCase
```

# method TestContextStack.func testInnerOverride()

## function:

实现 `` 中的 `testInnerOverride` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testInnerOverride() {
        let tmpl = MustacheTemplate.fromString("{{#inner}}{{value}}{{/inner}}")
        let ctx = MustacheContext()
        ctx.put("value", MustacheStr("outer"))
        let inner = MustacheContext()
        inner.put("value", MustacheStr("inner"))
        ctx.put("inner", inner)
        @Assert(tmpl.render(ctx), "inner")
    }

    @TestCase
```

# method TestContextStack.func testDeepStack()

## function:

实现 `` 中的 `testDeepStack` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testDeepStack() {
        let tmpl = MustacheTemplate.fromString("{{#a}}{{#b}}{{x}}-{{y}}-{{z}}{{/b}}{{/a}}")
        let ctx = MustacheContext()
        ctx.put("x", MustacheStr("1"))
        let a = MustacheContext()
        a.put("y", MustacheStr("2"))
        let b = MustacheContext()
        b.put("z", MustacheStr("3"))
        a.put("b", b)
        ctx.put("a", a)
        @Assert(tmpl.render(ctx), "1-2-3")
```

# class TestComplex

## function:

封装 `` 中与 `TestComplex` 相关的数据和行为，是项目中的类级实现单元。

## kind:

class

## access:

internal

## extends:

none

## implements:

none

## properties:

- `internal let tmpl: None`

- `internal let ctx: None`

- `internal let items: None`

- `internal let i1: None`

- `internal let i2: None`

- `internal let groups: None`

- `internal let g1: None`

- `internal let m1: None`

- `internal let g2: None`

- `internal let m2: None`

- `internal let ctx1: None`

- `internal let ctx2: None`

## usage example:

```cangjie
class TestComplex {
    @TestCase
    func testHtmlTemplate() {
        let tmpl = MustacheTemplate.fromString("<h1>{{title}}</h1><ul>{{#items}}<li>{{name}}: {{value}}</li>{{/items}}</ul>{{^items}}<p>No items</p>{{/items}}")
        let ctx = MustacheContext()
        ctx.put("title", MustacheStr("My List"))
        let items = MustacheList()
        let i1 = MustacheContext()
        i1.put("name", MustacheStr("Item 1"))
        i1.put("value", MustacheStr("100"))
        let i2 = MustacheContext()
        i2.put("name", MustacheStr("Item 2"))
        i2.put("value", MustacheStr("200"))
        items.add(i1)
        items.add(i2)
        ctx.put("items", items)
        @Assert(tmpl.render(ctx), "<h1>My List</h1><ul><li>Item 1: 100</li><li>Item 2: 200</li></ul>")
    }

    @TestCase
```

# method TestComplex.func testHtmlTemplate()

## function:

实现 `` 中的 `testHtmlTemplate` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testHtmlTemplate() {
        let tmpl = MustacheTemplate.fromString("<h1>{{title}}</h1><ul>{{#items}}<li>{{name}}: {{value}}</li>{{/items}}</ul>{{^items}}<p>No items</p>{{/items}}")
        let ctx = MustacheContext()
        ctx.put("title", MustacheStr("My List"))
        let items = MustacheList()
        let i1 = MustacheContext()
        i1.put("name", MustacheStr("Item 1"))
        i1.put("value", MustacheStr("100"))
        let i2 = MustacheContext()
        i2.put("name", MustacheStr("Item 2"))
        i2.put("value", MustacheStr("200"))
```

# method TestComplex.func testNestedListsTemplate()

## function:

实现 `` 中的 `testNestedListsTemplate` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testNestedListsTemplate() {
        let tmpl = MustacheTemplate.fromString("{{#groups}}[{{#members}}{{.}} {{/members}}]{{/groups}}")
        let ctx = MustacheContext()
        let groups = MustacheList()
        let g1 = MustacheContext()
        let m1 = MustacheList()
        m1.add(MustacheStr("Alice"))
        m1.add(MustacheStr("Bob"))
        g1.put("members", m1)
        let g2 = MustacheContext()
        let m2 = MustacheList()
```

# method TestComplex.func testConditionalSections()

## function:

实现 `` 中的 `testConditionalSections` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testConditionalSections() {
        let tmpl = MustacheTemplate.fromString("{{#loggedIn}}Welcome, {{name}}!{{/loggedIn}}{{^loggedIn}}Please log in.{{/loggedIn}}")
        let ctx1 = MustacheContext()
        ctx1.put("loggedIn", MustacheBool(true))
        ctx1.put("name", MustacheStr("Alice"))
        @Assert(tmpl.render(ctx1), "Welcome, Alice!")

        let ctx2 = MustacheContext()
        ctx2.put("loggedIn", MustacheBool(false))
        @Assert(tmpl.render(ctx2), "Please log in.")
    }
```

# module tests/mustache/project/src/mustache_value.cj

## function:

负责测试 `mustache_value` 相关功能是否符合预期。

## usage example:

```cangjie
# source: tests/mustache/project/src/mustache_value.cj
```

## package:
mustache

## imports:

- `std.collection.*`

# class MustacheException

## function:

Custom exception for Mustache template errors。

## kind:

class

## access:

public

## extends:

none

## implements:

none

## usage example:

```cangjie
public class MustacheException <: Exception {
    public init(message: String) {
        super(message)
    }
}
```

# class MustacheNone

## function:

Represents a missing or undefined value。

## kind:

class

## access:

public

## extends:

none

## implements:

none

## usage example:

```cangjie
public class MustacheNone <: MustacheValue {
    public init() {}

    public override func isNone(): Bool { return true }
}
```

# class MustacheBool

## function:

Boolean value。

## kind:

class

## access:

public

## extends:

none

## implements:

none

## properties:

- `internal let _value: Bool`

## usage example:

```cangjie
public class MustacheBool <: MustacheValue {
    let _value: Bool

    public init(value: Bool) {
        _value = value
    }

    public override func isBool(): Bool { return true }
    public override func asBool(): Bool { return _value }
}
```

# class MustacheStr

## function:

String value。

## kind:

class

## access:

public

## extends:

none

## implements:

none

## properties:

- `internal let _value: String`

## usage example:

```cangjie
public class MustacheStr <: MustacheValue {
    let _value: String

    public init(value: String) {
        _value = value
    }

    public override func isString(): Bool { return true }
    public override func asString(): String { return _value }
}
```

# class MustacheList

## function:

List of values (for iteration in sections)。

## kind:

class

## access:

public

## extends:

none

## implements:

none

## properties:

- `internal let _items: ArrayList<MustacheValue>`

## usage example:

```cangjie
public class MustacheList <: MustacheValue {
    let _items: ArrayList<MustacheValue> = ArrayList<MustacheValue>()

    public init() {}

    public override func isList(): Bool { return true }

    public func size(): Int64 { return _items.size }

    public func add(value: MustacheValue): Unit {
        _items.add(value)
    }

    public func get(index: Int64): MustacheValue {
        return _items[index]
    }
}
```

# method MustacheList.func size(): Int64

## function:

实现 `` 中的 `size` 逻辑，是该模块中的可调用函数单元。

## access:

public

## is_static:

False

## usage example:

```cangjie
public func size(): Int64 { return _items.size }

    public func add(value: MustacheValue): Unit {
        _items.add(value)
    }

    public func get(index: Int64): MustacheValue {
        return _items[index]
    }
}
```

# method MustacheList.func add(value: MustacheValue): Unit

## function:

实现 `` 中的 `add` 逻辑，是该模块中的可调用函数单元。

## access:

public

## is_static:

False

## usage example:

```cangjie
public func add(value: MustacheValue): Unit {
        _items.add(value)
    }

    public func get(index: Int64): MustacheValue {
        return _items[index]
    }
}

// Context (key-value map for template rendering)
public class MustacheContext <: MustacheValue {
```

# method MustacheList.func get(index: Int64): MustacheValue

## function:

获取与 `get` 相关的数据或对象，供项目内部逻辑调用。

## access:

public

## is_static:

False

## usage example:

```cangjie
public func get(index: Int64): MustacheValue {
        return _items[index]
    }
}

// Context (key-value map for template rendering)
public class MustacheContext <: MustacheValue {
    let _keys: ArrayList<String> = ArrayList<String>()
    let _values: ArrayList<MustacheValue> = ArrayList<MustacheValue>()

    public init() {}
```

# class MustacheContext

## function:

Context (key-value map for template rendering)。

## kind:

class

## access:

public

## extends:

none

## implements:

none

## properties:

- `internal let _keys: ArrayList<String>`

- `internal let _values: ArrayList<MustacheValue>`

## usage example:

```cangjie
public class MustacheContext <: MustacheValue {
    let _keys: ArrayList<String> = ArrayList<String>()
    let _values: ArrayList<MustacheValue> = ArrayList<MustacheValue>()

    public init() {}

    public override func isContext(): Bool { return true }

    public func get(key: String): ?MustacheValue {
        for (i in 0.._keys.size) {
            if (_keys[i] == key) {
                return _values[i]
            }
        }
        return None
    }

    public func put(key: String, value: MustacheValue): Unit {
        for (i in 0.._keys.size) {
            if (_keys[i] == key) {
```

# method MustacheContext.func get(key: String): ?MustacheValue

## function:

获取与 `get` 相关的数据或对象，供项目内部逻辑调用。

## access:

public

## is_static:

False

## usage example:

```cangjie
public func get(key: String): ?MustacheValue {
        for (i in 0.._keys.size) {
            if (_keys[i] == key) {
                return _values[i]
            }
        }
        return None
    }

    public func put(key: String, value: MustacheValue): Unit {
        for (i in 0.._keys.size) {
```

# method MustacheContext.func put(key: String, value: MustacheValue): Unit

## function:

实现 `` 中的 `put` 逻辑，是该模块中的可调用函数单元。

## access:

public

## is_static:

False

## usage example:

```cangjie
public func put(key: String, value: MustacheValue): Unit {
        for (i in 0.._keys.size) {
            if (_keys[i] == key) {
                _values[i] = value
                return
            }
        }
        _keys.add(key)
        _values.add(value)
    }
```

# method MustacheContext.func containsKey(key: String): Bool

## function:

实现 `` 中的 `containsKey` 逻辑，是该模块中的可调用函数单元。

## access:

public

## is_static:

False

## usage example:

```cangjie
public func containsKey(key: String): Bool {
        for (i in 0.._keys.size) {
            if (_keys[i] == key) {
                return true
            }
        }
        return false
    }
}
```

# func func isNone(): Bool

## function:

Type checking methods。

## access:

public

## usage example:

```cangjie
public open func isNone(): Bool { return false }
    public open func isBool(): Bool { return false }
    public open func isString(): Bool { return false }
    public open func isList(): Bool { return false }
    public open func isContext(): Bool { return false }

    // Safe type casting methods (throw MustacheException if type mismatch)
    public open func asBool(): Bool { throw MustacheException("Not a boolean value") }
    public open func asString(): String { throw MustacheException("Not a string value") }
}
```

# func func isBool(): Bool

## function:

实现 `` 中的 `isBool` 逻辑，是该模块中的可调用函数单元。

## access:

public

## usage example:

```cangjie
public open func isBool(): Bool { return false }
    public open func isString(): Bool { return false }
    public open func isList(): Bool { return false }
    public open func isContext(): Bool { return false }

    // Safe type casting methods (throw MustacheException if type mismatch)
    public open func asBool(): Bool { throw MustacheException("Not a boolean value") }
    public open func asString(): String { throw MustacheException("Not a string value") }
}

// Represents a missing or undefined value
```

# func func isString(): Bool

## function:

实现 `` 中的 `isString` 逻辑，是该模块中的可调用函数单元。

## access:

public

## usage example:

```cangjie
public open func isString(): Bool { return false }
    public open func isList(): Bool { return false }
    public open func isContext(): Bool { return false }

    // Safe type casting methods (throw MustacheException if type mismatch)
    public open func asBool(): Bool { throw MustacheException("Not a boolean value") }
    public open func asString(): String { throw MustacheException("Not a string value") }
}

// Represents a missing or undefined value
public class MustacheNone <: MustacheValue {
```

# func func isList(): Bool

## function:

实现 `` 中的 `isList` 逻辑，是该模块中的可调用函数单元。

## access:

public

## usage example:

```cangjie
public open func isList(): Bool { return false }
    public open func isContext(): Bool { return false }

    // Safe type casting methods (throw MustacheException if type mismatch)
    public open func asBool(): Bool { throw MustacheException("Not a boolean value") }
    public open func asString(): String { throw MustacheException("Not a string value") }
}

// Represents a missing or undefined value
public class MustacheNone <: MustacheValue {
    public init() {}
```

# func func isContext(): Bool

## function:

实现 `` 中的 `isContext` 逻辑，是该模块中的可调用函数单元。

## access:

public

## usage example:

```cangjie
public open func isContext(): Bool { return false }

    // Safe type casting methods (throw MustacheException if type mismatch)
    public open func asBool(): Bool { throw MustacheException("Not a boolean value") }
    public open func asString(): String { throw MustacheException("Not a string value") }
}

// Represents a missing or undefined value
public class MustacheNone <: MustacheValue {
    public init() {}
```

# func func asBool(): Bool

## function:

Safe type casting methods (throw MustacheException if type mismatch)。

## access:

public

## usage example:

```cangjie
public open func asBool(): Bool { throw MustacheException("Not a boolean value") }
    public open func asString(): String { throw MustacheException("Not a string value") }
}

// Represents a missing or undefined value
public class MustacheNone <: MustacheValue {
    public init() {}

    public override func isNone(): Bool { return true }
}
```

# func func asString(): String

## function:

实现 `` 中的 `asString` 逻辑，是该模块中的可调用函数单元。

## access:

public

## usage example:

```cangjie
public open func asString(): String { throw MustacheException("Not a string value") }
}

// Represents a missing or undefined value
public class MustacheNone <: MustacheValue {
    public init() {}

    public override func isNone(): Bool { return true }
}

// Boolean value
```

# module tests/notebook/notebook_test.cj

## function:

负责测试 `notebook_test` 相关功能是否符合预期。

## usage example:

```cangjie
# source: tests/notebook/notebook_test.cj
```

## package:
notebook

## imports:

- `std.collection.*`

- `std.io.*`

- `std.fs.*`

- `stdx.encoding.json.*`

- `stdx.net.http.*`

- `stdx.net.tls.*`

- `stdx.crypto.x509.X509Certificate`

# class TestNoteModel

## function:

定义数据模型，封装 `TestNoteModel` 相关的数据结构。

## kind:

class

## access:

internal

## extends:

none

## implements:

none

## properties:

- `internal let tags: None`

- `internal let note: None`

- `internal let jv: None`

- `internal let obj: None`

- `internal let jsonTags: None`

- `internal let json: None`

- `internal let jsonStr: None`

- `internal let jv2: None`

- `internal let note2: None`

## usage example:

```cangjie
class TestNoteModel {
    @TestCase
    func testNoteToJson() {
        let tags = ArrayList<String>()
        tags.add("work")
        tags.add("urgent")
        let note = Note(1, "Meeting Notes", "Discuss project plan", tags)
        let jv = note.toJsonValue()
        let obj = jv.asObject()
        @Assert(obj["id"].asInt().getValue(), 1)
        @Assert(obj["title"].asString().getValue(), "Meeting Notes")
        @Assert(obj["content"].asString().getValue(), "Discuss project plan")
        let jsonTags = obj["tags"].asArray()
        @Assert(jsonTags.size(), 2)
        @Assert(jsonTags[0].asString().getValue(), "work")
        @Assert(jsonTags[1].asString().getValue(), "urgent")
    }

    @TestCase
    func testNoteFromJson() {
```

# method TestNoteModel.func testNoteToJson()

## function:

实现 `` 中的 `testNoteToJson` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testNoteToJson() {
        let tags = ArrayList<String>()
        tags.add("work")
        tags.add("urgent")
        let note = Note(1, "Meeting Notes", "Discuss project plan", tags)
        let jv = note.toJsonValue()
        let obj = jv.asObject()
        @Assert(obj["id"].asInt().getValue(), 1)
        @Assert(obj["title"].asString().getValue(), "Meeting Notes")
        @Assert(obj["content"].asString().getValue(), "Discuss project plan")
        let jsonTags = obj["tags"].asArray()
```

# method TestNoteModel.func testNoteFromJson()

## function:

实现 `` 中的 `testNoteFromJson` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testNoteFromJson() {
        let json = ##"{"id":2,"title":"Shopping List","content":"Buy milk and eggs","tags":["personal"]}"##
        let jv = JsonValue.fromStr(json)
        let note = Note.fromJsonValue(jv)
        @Assert(note.id, 2)
        @Assert(note.title, "Shopping List")
        @Assert(note.content, "Buy milk and eggs")
        @Assert(note.tags.size, 1)
        @Assert(note.tags[0], "personal")
    }
```

# method TestNoteModel.func testNoteEmptyTags()

## function:

实现 `` 中的 `testNoteEmptyTags` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testNoteEmptyTags() {
        let tags = ArrayList<String>()
        let note = Note(3, "Empty", "No tags", tags)
        let jv = note.toJsonValue()
        let obj = jv.asObject()
        @Assert(obj["tags"].asArray().size(), 0)
    }

    @TestCase
    func testNoteRoundTrip() {
        let tags = ArrayList<String>()
```

# method TestNoteModel.func testNoteRoundTrip()

## function:

实现 `` 中的 `testNoteRoundTrip` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testNoteRoundTrip() {
        let tags = ArrayList<String>()
        tags.add("a")
        tags.add("b")
        tags.add("c")
        let note = Note(10, "Round Trip", "Test round trip", tags)
        let jv = note.toJsonValue()
        let jsonStr = jv.toString()
        let jv2 = JsonValue.fromStr(jsonStr)
        let note2 = Note.fromJsonValue(jv2)
        @Assert(note2.id, 10)
```

# method TestNoteModel.func testNoteWithSpecialChars()

## function:

实现 `` 中的 `testNoteWithSpecialChars` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testNoteWithSpecialChars() {
        let tags = ArrayList<String>()
        tags.add("special")
        let note = Note(4, "Hello \"World\"", "Line1\nLine2", tags)
        let jv = note.toJsonValue()
        let jsonStr = jv.toString()
        let jv2 = JsonValue.fromStr(jsonStr)
        let note2 = Note.fromJsonValue(jv2)
        @Assert(note2.title, "Hello \"World\"")
        @Assert(note2.content, "Line1\nLine2")
        @Assert(note2.tags[0], "special")
```

# method TestNoteModel.func testNoteWithChineseContent()

## function:

实现 `` 中的 `testNoteWithChineseContent` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testNoteWithChineseContent() {
        let tags = ArrayList<String>()
        tags.add("学习")
        tags.add("仓颉")
        let note = Note(6, "仓颉学习笔记", "今天学习了仓颉语言的基本语法", tags)
        let jv = note.toJsonValue()
        let jsonStr = jv.toString()
        let jv2 = JsonValue.fromStr(jsonStr)
        let note2 = Note.fromJsonValue(jv2)
        @Assert(note2.title, "仓颉学习笔记")
        @Assert(note2.content, "今天学习了仓颉语言的基本语法")
```

# method TestNoteModel.func testNoteMultipleTags()

## function:

实现 `` 中的 `testNoteMultipleTags` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testNoteMultipleTags() {
        let tags = ArrayList<String>()
        tags.add("work")
        tags.add("project")
        tags.add("meeting")
        tags.add("Q1")
        let note = Note(5, "Quarterly Review", "Review Q1 progress", tags)
        let jv = note.toJsonValue()
        let obj = jv.asObject()
        let jsonTags = obj["tags"].asArray()
        @Assert(jsonTags.size(), 4)
```

# method TestNoteModel.func testNoteJsonFieldOrder()

## function:

实现 `` 中的 `testNoteJsonFieldOrder` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testNoteJsonFieldOrder() {
        let tags = ArrayList<String>()
        let note = Note(99, "Order", "Check field order", tags)
        let jv = note.toJsonValue()
        let obj = jv.asObject()
        @Assert(obj.containsKey("id"))
        @Assert(obj.containsKey("title"))
        @Assert(obj.containsKey("content"))
        @Assert(obj.containsKey("tags"))
    }
```

# method TestNoteModel.func testNoteFromJsonPreservesAllFields()

## function:

实现 `` 中的 `testNoteFromJsonPreservesAllFields` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testNoteFromJsonPreservesAllFields() {
        let json = ##"{"id":100,"title":"Full","content":"All fields","tags":["x","y","z"]}"##
        let note = Note.fromJsonValue(JsonValue.fromStr(json))
        @Assert(note.id, 100)
        @Assert(note.title, "Full")
        @Assert(note.content, "All fields")
        @Assert(note.tags.size, 3)
        @Assert(note.tags[2], "z")
    }
}
```

# class TestNoteService

## function:

封装业务逻辑，提供 `TestNoteService` 相关的服务功能。

## kind:

class

## access:

internal

## extends:

none

## implements:

none

## properties:

- `internal let svc: None`

- `internal let tags: None`

- `internal let note: None`

- `internal let n1: None`

- `internal let n2: None`

- `internal let n3: None`

- `internal let created: None`

- `internal let all: None`

- `internal let tags1: None`

- `internal let tags2: None`

- `internal let tags3: None`

- `internal let workNotes: None`

- `internal let personalNotes: None`

- `internal let result: None`

- `internal let newTags: None`

- `internal let stats: None`

- `internal let obj: None`

- `internal let tagCounts: None`

- `internal let origId: None`

## usage example:

```cangjie
class TestNoteService {
    @TestCase
    func testCreateNote() {
        let svc = NoteService()
        let tags = ArrayList<String>()
        tags.add("test")
        let note = svc.createNote("Title", "Content", tags)
        @Assert(note.title, "Title")
        @Assert(note.content, "Content")
        @Assert(note.tags.size, 1)
        @Assert(note.tags[0], "test")
    }

    @TestCase
    func testAutoIncrementId() {
        let svc = NoteService()
        let n1 = svc.createNote("Note 1", "C1", ArrayList<String>())
        let n2 = svc.createNote("Note 2", "C2", ArrayList<String>())
        let n3 = svc.createNote("Note 3", "C3", ArrayList<String>())
        @Assert(n2.id > n1.id)
```

# method TestNoteService.func testCreateNote()

## function:

实现 `` 中的 `testCreateNote` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testCreateNote() {
        let svc = NoteService()
        let tags = ArrayList<String>()
        tags.add("test")
        let note = svc.createNote("Title", "Content", tags)
        @Assert(note.title, "Title")
        @Assert(note.content, "Content")
        @Assert(note.tags.size, 1)
        @Assert(note.tags[0], "test")
    }
```

# method TestNoteService.func testAutoIncrementId()

## function:

实现 `` 中的 `testAutoIncrementId` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testAutoIncrementId() {
        let svc = NoteService()
        let n1 = svc.createNote("Note 1", "C1", ArrayList<String>())
        let n2 = svc.createNote("Note 2", "C2", ArrayList<String>())
        let n3 = svc.createNote("Note 3", "C3", ArrayList<String>())
        @Assert(n2.id > n1.id)
        @Assert(n3.id > n2.id)
    }

    @TestCase
    func testGetNote() {
```

# method TestNoteService.func testGetNote()

## function:

实现 `` 中的 `testGetNote` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testGetNote() {
        let svc = NoteService()
        let tags = ArrayList<String>()
        tags.add("find")
        let created = svc.createNote("Find Me", "Content", tags)
        if (let Some(found) <- svc.getNote(created.id)) {
            @Assert(found.title, "Find Me")
            @Assert(found.content, "Content")
        } else {
            @Fail("Note should be found")
        }
```

# method TestNoteService.func testGetNoteNotFound()

## function:

实现 `` 中的 `testGetNoteNotFound` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testGetNoteNotFound() {
        let svc = NoteService()
        if (let Some(_) <- svc.getNote(999)) {
            @Fail("Note should not exist")
        }
    }

    @TestCase
    func testGetAllNotes() {
        let svc = NoteService()
        svc.createNote("N1", "C1", ArrayList<String>())
```

# method TestNoteService.func testGetAllNotes()

## function:

实现 `` 中的 `testGetAllNotes` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testGetAllNotes() {
        let svc = NoteService()
        svc.createNote("N1", "C1", ArrayList<String>())
        svc.createNote("N2", "C2", ArrayList<String>())
        svc.createNote("N3", "C3", ArrayList<String>())
        let all = svc.getAllNotes()
        @Assert(all.size, 3)
    }

    @TestCase
    func testGetNotesByTag() {
```

# method TestNoteService.func testGetNotesByTag()

## function:

实现 `` 中的 `testGetNotesByTag` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testGetNotesByTag() {
        let svc = NoteService()
        let tags1 = ArrayList<String>()
        tags1.add("work")
        tags1.add("project")
        svc.createNote("Work Note", "Content", tags1)

        let tags2 = ArrayList<String>()
        tags2.add("personal")
        svc.createNote("Personal Note", "Content", tags2)
```

# method TestNoteService.func testGetNotesByTagNoMatch()

## function:

实现 `` 中的 `testGetNotesByTagNoMatch` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testGetNotesByTagNoMatch() {
        let svc = NoteService()
        let tags = ArrayList<String>()
        tags.add("work")
        svc.createNote("Work", "Content", tags)
        let result = svc.getNotesByTag("nonexistent")
        @Assert(result.size, 0)
    }

    @TestCase
    func testUpdateNote() {
```

# method TestNoteService.func testUpdateNote()

## function:

实现 `` 中的 `testUpdateNote` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testUpdateNote() {
        let svc = NoteService()
        let tags = ArrayList<String>()
        tags.add("old")
        let created = svc.createNote("Original", "Old content", tags)

        let newTags = ArrayList<String>()
        newTags.add("updated")
        if (let Some(updated) <- svc.updateNote(created.id, "Updated", "New content", newTags)) {
            @Assert(updated.title, "Updated")
            @Assert(updated.content, "New content")
```

# method TestNoteService.func testUpdateNoteNotFound()

## function:

实现 `` 中的 `testUpdateNoteNotFound` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testUpdateNoteNotFound() {
        let svc = NoteService()
        if (let Some(_) <- svc.updateNote(999, "X", "Y", ArrayList<String>())) {
            @Fail("Update should fail for non-existent note")
        }
    }

    @TestCase
    func testDeleteNote() {
        let svc = NoteService()
        let created = svc.createNote("Delete Me", "Content", ArrayList<String>())
```

# method TestNoteService.func testDeleteNote()

## function:

实现 `` 中的 `testDeleteNote` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testDeleteNote() {
        let svc = NoteService()
        let created = svc.createNote("Delete Me", "Content", ArrayList<String>())
        @Assert(svc.deleteNote(created.id))
        if (let Some(_) <- svc.getNote(created.id)) {
            @Fail("Deleted note should not be found")
        }
        @Assert(svc.getAllNotes().size, 0)
    }

    @TestCase
```

# method TestNoteService.func testDeleteNoteNotFound()

## function:

实现 `` 中的 `testDeleteNoteNotFound` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testDeleteNoteNotFound() {
        let svc = NoteService()
        @Assert(!svc.deleteNote(999))
    }

    @TestCase
    func testGetStats() {
        let svc = NoteService()
        let tags1 = ArrayList<String>()
        tags1.add("work")
        tags1.add("meeting")
```

# method TestNoteService.func testGetStats()

## function:

实现 `` 中的 `testGetStats` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testGetStats() {
        let svc = NoteService()
        let tags1 = ArrayList<String>()
        tags1.add("work")
        tags1.add("meeting")
        svc.createNote("N1", "C1", tags1)

        let tags2 = ArrayList<String>()
        tags2.add("work")
        svc.createNote("N2", "C2", tags2)
```

# method TestNoteService.func testGetStatsEmpty()

## function:

实现 `` 中的 `testGetStatsEmpty` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testGetStatsEmpty() {
        let svc = NoteService()
        let stats = svc.getStats()
        let obj = stats.asObject()
        @Assert(obj["total_notes"].asInt().getValue(), 0)
    }

    @TestCase
    func testCreateAndDeleteMultiple() {
        let svc = NoteService()
        let n1 = svc.createNote("A", "1", ArrayList<String>())
```

# method TestNoteService.func testCreateAndDeleteMultiple()

## function:

实现 `` 中的 `testCreateAndDeleteMultiple` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testCreateAndDeleteMultiple() {
        let svc = NoteService()
        let n1 = svc.createNote("A", "1", ArrayList<String>())
        let n2 = svc.createNote("B", "2", ArrayList<String>())
        let n3 = svc.createNote("C", "3", ArrayList<String>())
        @Assert(svc.getAllNotes().size, 3)
        @Assert(svc.deleteNote(n2.id))
        @Assert(svc.getAllNotes().size, 2)
        if (let Some(a) <- svc.getNote(n1.id)) {
            @Assert(a.title, "A")
        } else {
```

# method TestNoteService.func testUpdatePreservesId()

## function:

实现 `` 中的 `testUpdatePreservesId` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testUpdatePreservesId() {
        let svc = NoteService()
        let tags = ArrayList<String>()
        tags.add("orig")
        let created = svc.createNote("Orig", "Content", tags)
        let origId = created.id

        let newTags = ArrayList<String>()
        newTags.add("new")
        if (let Some(updated) <- svc.updateNote(origId, "New", "New content", newTags)) {
            @Assert(updated.id, origId)
```

# class TestNoteAPI

## function:

封装笔记数据和操作，提供 `TestNoteAPI` 相关的功能。

## kind:

class

## access:

internal

## extends:

none

## implements:

none

## properties:

- `internal var _server: ?NoteServer`

- `internal var _client: ?Client`

- `internal var _baseUrl: String`

- `internal let service: None`

- `internal let server: None`

- `internal let client: None`

- `internal let body: None`

- `internal let resp: None`

- `internal let respBody: None`

- `internal let jv: None`

- `internal let obj: None`

- `internal let createResp: None`

- `internal let createBody: None`

- `internal let created: None`

- `internal let id: None`

- `internal let getResp: None`

- `internal let getBody: None`

- `internal let got: None`

- `internal let listResp: None`

- `internal let listBody: None`

- `internal let total: None`

- `internal let body1: None`

- `internal let r1: None`

- `internal let body2: None`

- `internal let r2: None`

- `internal let filterResp: None`

- `internal let filterBody: None`

- `internal let createRespBody: None`

- `internal let updateBody: None`

- `internal let updateReq: None`

- `internal let updateResp: None`

- `internal let updateRespBody: None`

- `internal let updated: None`

- `internal let deleteResp: None`

- `internal let deleteBody: None`

- `internal let result: None`

- `internal let statsResp: None`

- `internal let statsBody: None`

- `internal let totalNotes: None`

- `internal let getResp2: None`

- `internal let getBody2: None`

- `internal let got2: None`

- `internal let getResp3: None`

## usage example:

```cangjie
class TestNoteAPI {
    var _server: ?NoteServer = None
    var _client: ?Client = None
    var _baseUrl: String = ""

    @BeforeAll
    func setup() {
        let service = NoteService()
        let server = NoteServer(service)
        server.start("127.0.0.1", 0)
        _server = server
        _baseUrl = "http://127.0.0.1:${server.getPort()}"
        _client = ClientBuilder().build()
    }

    @AfterAll
    func teardown() {
        if (let Some(c) <- _client) { c.close() }
        if (let Some(s) <- _server) { s.stop() }
    }
```

# method TestNoteAPI.func setup()

## function:

设置与 `setup` 相关的状态、配置或对象属性。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func setup() {
        let service = NoteService()
        let server = NoteServer(service)
        server.start("127.0.0.1", 0)
        _server = server
        _baseUrl = "http://127.0.0.1:${server.getPort()}"
        _client = ClientBuilder().build()
    }

    @AfterAll
    func teardown() {
```

# method TestNoteAPI.func teardown()

## function:

实现 `` 中的 `teardown` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func teardown() {
        if (let Some(c) <- _client) { c.close() }
        if (let Some(s) <- _server) { s.stop() }
    }

    @TestCase
    func testCreateNoteAPI() {
        let client = _client.getOrThrow()
        let body = ##"{"title":"API Note","content":"Created via API","tags":["api","test"]}"##
        let resp = client.post("${_baseUrl}/api/notes", body)
        let respBody = StringReader(resp.body).readToEnd()
```

# method TestNoteAPI.func testCreateNoteAPI()

## function:

实现 `` 中的 `testCreateNoteAPI` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testCreateNoteAPI() {
        let client = _client.getOrThrow()
        let body = ##"{"title":"API Note","content":"Created via API","tags":["api","test"]}"##
        let resp = client.post("${_baseUrl}/api/notes", body)
        let respBody = StringReader(resp.body).readToEnd()
        @Assert(resp.status == 200)
        let jv = JsonValue.fromStr(respBody)
        let obj = jv.asObject()
        @Assert(obj["title"].asString().getValue(), "API Note")
        @Assert(obj["content"].asString().getValue(), "Created via API")
        @Assert(obj["tags"].asArray().size(), 2)
```

# method TestNoteAPI.func testCreateAndGetNoteAPI()

## function:

实现 `` 中的 `testCreateAndGetNoteAPI` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testCreateAndGetNoteAPI() {
        let client = _client.getOrThrow()
        // Create
        let body = ##"{"title":"Get Test","content":"Test content for get","tags":["gettest"]}"##
        let createResp = client.post("${_baseUrl}/api/notes", body)
        let createBody = StringReader(createResp.body).readToEnd()
        let created = JsonValue.fromStr(createBody).asObject()
        let id = created["id"].asInt().getValue()

        // Get
        let getResp = client.get("${_baseUrl}/api/note?id=${id}")
```

# method TestNoteAPI.func testGetNoteNotFoundAPI()

## function:

实现 `` 中的 `testGetNoteNotFoundAPI` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testGetNoteNotFoundAPI() {
        let client = _client.getOrThrow()
        let resp = client.get("${_baseUrl}/api/note?id=99999")
        let respBody = StringReader(resp.body).readToEnd()
        @Assert(resp.status == 404)
        let obj = JsonValue.fromStr(respBody).asObject()
        @Assert(obj.containsKey("error"))
    }

    @TestCase
    func testListNotesAPI() {
```

# method TestNoteAPI.func testListNotesAPI()

## function:

实现 `` 中的 `testListNotesAPI` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testListNotesAPI() {
        let client = _client.getOrThrow()
        // Create a note with a unique tag
        let body = ##"{"title":"List Test","content":"For listing","tags":["listtest_unique"]}"##
        let createResp = client.post("${_baseUrl}/api/notes", body)
        StringReader(createResp.body).readToEnd()

        // List all
        let listResp = client.get("${_baseUrl}/api/notes")
        let listBody = StringReader(listResp.body).readToEnd()
        @Assert(listResp.status == 200)
```

# method TestNoteAPI.func testFilterByTagAPI()

## function:

实现 `` 中的 `testFilterByTagAPI` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testFilterByTagAPI() {
        let client = _client.getOrThrow()
        // Create two notes with specific tag
        let body1 = ##"{"title":"Filter A","content":"Content A","tags":["filtertag"]}"##
        let r1 = client.post("${_baseUrl}/api/notes", body1)
        StringReader(r1.body).readToEnd()

        let body2 = ##"{"title":"Filter B","content":"Content B","tags":["filtertag"]}"##
        let r2 = client.post("${_baseUrl}/api/notes", body2)
        StringReader(r2.body).readToEnd()
```

# method TestNoteAPI.func testUpdateNoteAPI()

## function:

实现 `` 中的 `testUpdateNoteAPI` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testUpdateNoteAPI() {
        let client = _client.getOrThrow()
        // Create
        let createBody = ##"{"title":"Before Update","content":"Old content","tags":["old"]}"##
        let createResp = client.post("${_baseUrl}/api/notes", createBody)
        let createRespBody = StringReader(createResp.body).readToEnd()
        let created = JsonValue.fromStr(createRespBody).asObject()
        let id = created["id"].asInt().getValue()

        // Update via PUT
        let updateBody = ##"{"id":ID_PLACEHOLDER,"title":"After Update","content":"New content","tags":["new"]}"##
```

# method TestNoteAPI.func testUpdateNoteNotFoundAPI()

## function:

实现 `` 中的 `testUpdateNoteNotFoundAPI` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testUpdateNoteNotFoundAPI() {
        let client = _client.getOrThrow()
        let updateBody = ##"{"id":99999,"title":"Ghost","content":"Phantom","tags":[]}"##
        let updateReq = HttpRequestBuilder()
            .put()
            .url("${_baseUrl}/api/note")
            .header("Content-Type", "application/json")
            .body(updateBody)
            .build()
        let updateResp = client.send(updateReq)
        StringReader(updateResp.body).readToEnd()
```

# method TestNoteAPI.func testDeleteNoteAPI()

## function:

实现 `` 中的 `testDeleteNoteAPI` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testDeleteNoteAPI() {
        let client = _client.getOrThrow()
        // Create
        let createBody = ##"{"title":"To Delete","content":"Will be deleted","tags":["delete"]}"##
        let createResp = client.post("${_baseUrl}/api/notes", createBody)
        let createRespBody = StringReader(createResp.body).readToEnd()
        let created = JsonValue.fromStr(createRespBody).asObject()
        let id = created["id"].asInt().getValue()

        // Delete
        let deleteResp = client.delete("${_baseUrl}/api/note?id=${id}")
```

# method TestNoteAPI.func testDeleteNoteNotFoundAPI()

## function:

实现 `` 中的 `testDeleteNoteNotFoundAPI` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testDeleteNoteNotFoundAPI() {
        let client = _client.getOrThrow()
        let resp = client.delete("${_baseUrl}/api/note?id=99999")
        StringReader(resp.body).readToEnd()
        @Assert(resp.status == 404)
    }

    @TestCase
    func testGetStatsAPI() {
        let client = _client.getOrThrow()
        // Create notes with known tags
```

# method TestNoteAPI.func testGetStatsAPI()

## function:

实现 `` 中的 `testGetStatsAPI` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testGetStatsAPI() {
        let client = _client.getOrThrow()
        // Create notes with known tags
        let body1 = ##"{"title":"Stats A","content":"CA","tags":["statstag1","statstag2"]}"##
        let r1 = client.post("${_baseUrl}/api/notes", body1)
        StringReader(r1.body).readToEnd()

        let body2 = ##"{"title":"Stats B","content":"CB","tags":["statstag1"]}"##
        let r2 = client.post("${_baseUrl}/api/notes", body2)
        StringReader(r2.body).readToEnd()
```

# method TestNoteAPI.func testMissingIdParamAPI()

## function:

实现 `` 中的 `testMissingIdParamAPI` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testMissingIdParamAPI() {
        let client = _client.getOrThrow()
        let resp = client.get("${_baseUrl}/api/note")
        StringReader(resp.body).readToEnd()
        @Assert(resp.status == 400)
    }

    @TestCase
    func testInvalidJsonBodyAPI() {
        let client = _client.getOrThrow()
        let resp = client.post("${_baseUrl}/api/notes", "not json at all")
```

# method TestNoteAPI.func testInvalidJsonBodyAPI()

## function:

实现 `` 中的 `testInvalidJsonBodyAPI` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testInvalidJsonBodyAPI() {
        let client = _client.getOrThrow()
        let resp = client.post("${_baseUrl}/api/notes", "not json at all")
        let respBody = StringReader(resp.body).readToEnd()
        @Assert(resp.status == 400)
        let obj = JsonValue.fromStr(respBody).asObject()
        @Assert(obj.containsKey("error"))
    }

    @TestCase
    func testFullWorkflowAPI() {
```

# method TestNoteAPI.func testFullWorkflowAPI()

## function:

实现 `` 中的 `testFullWorkflowAPI` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testFullWorkflowAPI() {
        let client = _client.getOrThrow()

        // 1. Create a note
        let createBody = ##"{"title":"Workflow Note","content":"Full workflow test","tags":["workflow","e2e"]}"##
        let createResp = client.post("${_baseUrl}/api/notes", createBody)
        let createRespBody = StringReader(createResp.body).readToEnd()
        @Assert(createResp.status == 200)
        let created = JsonValue.fromStr(createRespBody).asObject()
        let id = created["id"].asInt().getValue()
        @Assert(created["title"].asString().getValue(), "Workflow Note")
```

# class TestNoteHTTPSAPI

## function:

封装笔记数据和操作，提供 `TestNoteHTTPSAPI` 相关的功能。

## kind:

class

## access:

internal

## extends:

none

## implements:

none

## properties:

- `internal var _server: ?NoteServer`

- `internal var _client: ?Client`

- `internal var _baseUrl: String`

- `internal let certPem: None`

- `internal let keyPem: None`

- `internal let caPem: None`

- `internal let service: None`

- `internal let server: None`

- `internal var tlsConfig: None`

- `internal let client: None`

- `internal let body: None`

- `internal let resp: None`

- `internal let respBody: None`

- `internal let obj: None`

- `internal let createResp: None`

- `internal let listResp: None`

- `internal let listBody: None`

- `internal let createBody: None`

- `internal let created: None`

- `internal let id: None`

- `internal let getResp: None`

- `internal let getBody: None`

- `internal let got: None`

- `internal let createRespBody: None`

- `internal let updateBody: None`

- `internal let updateReq: None`

- `internal let updateResp: None`

- `internal let updateRespBody: None`

- `internal let updated: None`

- `internal let deleteResp: None`

- `internal let deleteBody: None`

- `internal let result: None`

- `internal let statsResp: None`

- `internal let statsBody: None`

- `internal let getResp2: None`

## usage example:

```cangjie
class TestNoteHTTPSAPI {
    var _server: ?NoteServer = None
    var _client: ?Client = None
    var _baseUrl: String = ""

    @BeforeAll
    func setup() {
        let certPem = String.fromUtf8(readToEnd(File("./certs/server.crt", Read)))
        let keyPem = String.fromUtf8(readToEnd(File("./certs/server.key", Read)))
        let caPem = String.fromUtf8(readToEnd(File("./certs/ca.crt", Read)))

        let service = NoteService()
        let server = NoteServer(service)
        server.startTls("127.0.0.1", 0, certPem, keyPem)
        _server = server
        _baseUrl = "https://127.0.0.1:${server.getPort()}"

        var tlsConfig = TlsClientConfig()
        tlsConfig.verifyMode = CustomCA(X509Certificate.decodeFromPem(caPem))
        _client = ClientBuilder().tlsConfig(tlsConfig).build()
```

# method TestNoteHTTPSAPI.func setup()

## function:

设置与 `setup` 相关的状态、配置或对象属性。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func setup() {
        let certPem = String.fromUtf8(readToEnd(File("./certs/server.crt", Read)))
        let keyPem = String.fromUtf8(readToEnd(File("./certs/server.key", Read)))
        let caPem = String.fromUtf8(readToEnd(File("./certs/ca.crt", Read)))

        let service = NoteService()
        let server = NoteServer(service)
        server.startTls("127.0.0.1", 0, certPem, keyPem)
        _server = server
        _baseUrl = "https://127.0.0.1:${server.getPort()}"
```

# method TestNoteHTTPSAPI.func teardown()

## function:

实现 `` 中的 `teardown` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func teardown() {
        if (let Some(c) <- _client) { c.close() }
        if (let Some(s) <- _server) { s.stop() }
    }

    @TestCase
    func testHttpsCreateNoteAPI() {
        let client = _client.getOrThrow()
        let body = ##"{"title":"HTTPS Note","content":"Created over TLS","tags":["https","secure"]}"##
        let resp = client.post("${_baseUrl}/api/notes", body)
        let respBody = StringReader(resp.body).readToEnd()
```

# method TestNoteHTTPSAPI.func testHttpsCreateNoteAPI()

## function:

实现 `` 中的 `testHttpsCreateNoteAPI` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testHttpsCreateNoteAPI() {
        let client = _client.getOrThrow()
        let body = ##"{"title":"HTTPS Note","content":"Created over TLS","tags":["https","secure"]}"##
        let resp = client.post("${_baseUrl}/api/notes", body)
        let respBody = StringReader(resp.body).readToEnd()
        @Assert(resp.status == 200)
        let obj = JsonValue.fromStr(respBody).asObject()
        @Assert(obj["title"].asString().getValue(), "HTTPS Note")
        @Assert(obj.containsKey("id"))
    }
```

# method TestNoteHTTPSAPI.func testHttpsListNotesAPI()

## function:

实现 `` 中的 `testHttpsListNotesAPI` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testHttpsListNotesAPI() {
        let client = _client.getOrThrow()
        // Create a note first
        let body = ##"{"title":"HTTPS List","content":"List over TLS","tags":["httpslist"]}"##
        let createResp = client.post("${_baseUrl}/api/notes", body)
        StringReader(createResp.body).readToEnd()

        // List
        let listResp = client.get("${_baseUrl}/api/notes")
        let listBody = StringReader(listResp.body).readToEnd()
        @Assert(listResp.status == 200)
```

# method TestNoteHTTPSAPI.func testHttpsGetNoteAPI()

## function:

实现 `` 中的 `testHttpsGetNoteAPI` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testHttpsGetNoteAPI() {
        let client = _client.getOrThrow()
        // Create
        let body = ##"{"title":"HTTPS Get","content":"Get via TLS","tags":["httpsget"]}"##
        let createResp = client.post("${_baseUrl}/api/notes", body)
        let createBody = StringReader(createResp.body).readToEnd()
        let created = JsonValue.fromStr(createBody).asObject()
        let id = created["id"].asInt().getValue()

        // Get
        let getResp = client.get("${_baseUrl}/api/note?id=${id}")
```

# method TestNoteHTTPSAPI.func testHttpsUpdateNoteAPI()

## function:

实现 `` 中的 `testHttpsUpdateNoteAPI` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testHttpsUpdateNoteAPI() {
        let client = _client.getOrThrow()
        // Create
        let createBody = ##"{"title":"HTTPS Update","content":"Old","tags":["httpsupd"]}"##
        let createResp = client.post("${_baseUrl}/api/notes", createBody)
        let createRespBody = StringReader(createResp.body).readToEnd()
        let created = JsonValue.fromStr(createRespBody).asObject()
        let id = created["id"].asInt().getValue()

        // Update
        let updateBody = ##"{"id":ID_PLACEHOLDER,"title":"HTTPS Updated","content":"New","tags":["httpsupd","done"]}"##
```

# method TestNoteHTTPSAPI.func testHttpsDeleteNoteAPI()

## function:

实现 `` 中的 `testHttpsDeleteNoteAPI` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testHttpsDeleteNoteAPI() {
        let client = _client.getOrThrow()
        // Create
        let body = ##"{"title":"HTTPS Del","content":"Delete via TLS","tags":["httpsdel"]}"##
        let createResp = client.post("${_baseUrl}/api/notes", body)
        let createRespBody = StringReader(createResp.body).readToEnd()
        let created = JsonValue.fromStr(createRespBody).asObject()
        let id = created["id"].asInt().getValue()

        // Delete
        let deleteResp = client.delete("${_baseUrl}/api/note?id=${id}")
```

# method TestNoteHTTPSAPI.func testHttpsGetStatsAPI()

## function:

实现 `` 中的 `testHttpsGetStatsAPI` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testHttpsGetStatsAPI() {
        let client = _client.getOrThrow()
        let body = ##"{"title":"HTTPS Stats","content":"Stats via TLS","tags":["httpsstat"]}"##
        let createResp = client.post("${_baseUrl}/api/notes", body)
        StringReader(createResp.body).readToEnd()

        let statsResp = client.get("${_baseUrl}/api/stats")
        let statsBody = StringReader(statsResp.body).readToEnd()
        @Assert(statsResp.status == 200)
        let obj = JsonValue.fromStr(statsBody).asObject()
        @Assert(obj.containsKey("total_notes"))
```

# method TestNoteHTTPSAPI.func testHttpsFullWorkflow()

## function:

实现 `` 中的 `testHttpsFullWorkflow` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testHttpsFullWorkflow() {
        let client = _client.getOrThrow()

        // 1. Create
        let createBody = ##"{"title":"HTTPS Workflow","content":"Full HTTPS test","tags":["https","e2e"]}"##
        let createResp = client.post("${_baseUrl}/api/notes", createBody)
        let createRespBody = StringReader(createResp.body).readToEnd()
        @Assert(createResp.status == 200)
        let created = JsonValue.fromStr(createRespBody).asObject()
        let id = created["id"].asInt().getValue()
```

# module tests/notebook/project/src/main.cj

## function:

负责测试 `main` 相关功能是否符合预期。

## usage example:

```cangjie
# source: tests/notebook/project/src/main.cj
```

## package:
notebook

## imports:

- `stdx.net.http.*`

- `stdx.net.tls.*`

- `stdx.crypto.x509.X509Certificate`

- `std.io.*`

- `std.fs.*`

# let certPem

## function:

`certPem` 是不可变变量，类型为 `None`，用于保存常量值或不可变引用。

## access:

internal

## usage example:

```cangjie
let certPem = String.fromUtf8(readToEnd(File("./certs/server.crt", Read)))
```

# let keyPem

## function:

`keyPem` 是不可变变量，类型为 `None`，用于保存常量值或不可变引用。

## access:

internal

## usage example:

```cangjie
let keyPem = String.fromUtf8(readToEnd(File("./certs/server.key", Read)))
```

# let caPem

## function:

`caPem` 是不可变变量，类型为 `None`，用于保存常量值或不可变引用。

## access:

internal

## usage example:

```cangjie
let caPem = String.fromUtf8(readToEnd(File("./certs/ca.crt", Read)))
```

# let service

## function:

`service` 是不可变变量，类型为 `None`，用于保存常量值或不可变引用。

## access:

internal

## usage example:

```cangjie
let service = NoteService()
```

# let server

## function:

`server` 是不可变变量，类型为 `None`，用于保存常量值或不可变引用。

## access:

internal

## usage example:

```cangjie
let server = NoteServer(service)
```

# let port

## function:

`port` 是不可变变量，类型为 `None`，用于保存常量值或不可变引用。

## access:

internal

## usage example:

```cangjie
let port = server.getPort()
```

# let baseUrl

## function:

`baseUrl` 是不可变变量，类型为 `None`，用于保存常量值或不可变引用。

## access:

internal

## usage example:

```cangjie
let baseUrl = "https://127.0.0.1:${port}"
```

# var tlsConfig

## function:

`tlsConfig` 是可变变量，类型为 `None`，用于保存运行时状态或可变数据。

## access:

internal

## usage example:

```cangjie
var tlsConfig = TlsClientConfig()
```

# let client

## function:

`client` 是不可变变量，类型为 `None`，用于保存常量值或不可变引用。

## access:

internal

## usage example:

```cangjie
let client = ClientBuilder().tlsConfig(tlsConfig).build()
```

# let createBody

## function:

`createBody` 是不可变变量，类型为 `None`，用于保存常量值或不可变引用。

## access:

internal

## usage example:

```cangjie
let createBody = ##"{"title":"Hello Cangjie","content":"Welcome to Cangjie HTTPS web programming!","tags":["cangjie","tutorial"]}"##
```

# let createResp

## function:

`createResp` 是不可变变量，类型为 `None`，用于保存常量值或不可变引用。

## access:

internal

## usage example:

```cangjie
let createResp = client.post("${baseUrl}/api/notes", createBody)
```

# let createResult

## function:

`createResult` 是不可变变量，类型为 `None`，用于保存常量值或不可变引用。

## access:

internal

## usage example:

```cangjie
let createResult = StringReader(createResp.body).readToEnd()
```

# let createBody2

## function:

`createBody2` 是不可变变量，类型为 `None`，用于保存常量值或不可变引用。

## access:

internal

## usage example:

```cangjie
let createBody2 = ##"{"title":"Learning Notes","content":"Studying stdx.net.http and stdx.encoding.json over TLS","tags":["cangjie","study"]}"##
```

# let createResp2

## function:

`createResp2` 是不可变变量，类型为 `None`，用于保存常量值或不可变引用。

## access:

internal

## usage example:

```cangjie
let createResp2 = client.post("${baseUrl}/api/notes", createBody2)
```

# let createResult2

## function:

`createResult2` 是不可变变量，类型为 `None`，用于保存常量值或不可变引用。

## access:

internal

## usage example:

```cangjie
let createResult2 = StringReader(createResp2.body).readToEnd()
```

# let listResp

## function:

`listResp` 是不可变变量，类型为 `None`，用于保存常量值或不可变引用。

## access:

internal

## usage example:

```cangjie
let listResp = client.get("${baseUrl}/api/notes")
```

# let listResult

## function:

`listResult` 是不可变变量，类型为 `None`，用于保存常量值或不可变引用。

## access:

internal

## usage example:

```cangjie
let listResult = StringReader(listResp.body).readToEnd()
```

# let filterResp

## function:

`filterResp` 是不可变变量，类型为 `None`，用于保存常量值或不可变引用。

## access:

internal

## usage example:

```cangjie
let filterResp = client.get("${baseUrl}/api/notes?tag=study")
```

# let filterResult

## function:

`filterResult` 是不可变变量，类型为 `None`，用于保存常量值或不可变引用。

## access:

internal

## usage example:

```cangjie
let filterResult = StringReader(filterResp.body).readToEnd()
```

# let statsResp

## function:

`statsResp` 是不可变变量，类型为 `None`，用于保存常量值或不可变引用。

## access:

internal

## usage example:

```cangjie
let statsResp = client.get("${baseUrl}/api/stats")
```

# let statsResult

## function:

`statsResult` 是不可变变量，类型为 `None`，用于保存常量值或不可变引用。

## access:

internal

## usage example:

```cangjie
let statsResult = StringReader(statsResp.body).readToEnd()
```

# module tests/notebook/project/src/note.cj

## function:

负责测试 `note` 相关功能是否符合预期。

## usage example:

```cangjie
# source: tests/notebook/project/src/note.cj
```

## package:
notebook

## imports:

- `stdx.encoding.json.*`

- `std.collection.*`

# class Note

## function:

封装笔记数据和操作，提供 `Note` 相关的功能。

## kind:

class

## access:

public

## extends:

none

## implements:

none

## properties:

- `internal let id: None`

- `internal let title: None`

- `internal let content: None`

- `internal let tags: None`

- `internal let obj: None`

- `internal let arr: None`

- `internal let jsonTags: None`

## usage example:

```cangjie
public class Note {
    public var id: Int64
    public var title: String
    public var content: String
    public var tags: ArrayList<String>

    public init(id: Int64, title: String, content: String, tags: ArrayList<String>) {
        this.id = id
        this.title = title
        this.content = content
        this.tags = tags
    }

    public func toJsonValue(): JsonValue {
        let obj = JsonObject()
        obj.put("id", JsonInt(id))
        obj.put("title", JsonString(title))
        obj.put("content", JsonString(content))
        let arr = JsonArray()
        for (tag in tags) {
```

# method Note.func toJsonValue(): JsonValue

## function:

实现 `` 中的 `toJsonValue` 逻辑，是该模块中的可调用函数单元。

## access:

public

## is_static:

False

## usage example:

```cangjie
public func toJsonValue(): JsonValue {
        let obj = JsonObject()
        obj.put("id", JsonInt(id))
        obj.put("title", JsonString(title))
        obj.put("content", JsonString(content))
        let arr = JsonArray()
        for (tag in tags) {
            arr.add(JsonString(tag))
        }
        obj.put("tags", arr)
        return obj
```

# method Note.func fromJsonValue(jv: JsonValue): Note

## function:

实现 `` 中的 `fromJsonValue` 逻辑，是该模块中的可调用函数单元。

## access:

public

## is_static:

True

## usage example:

```cangjie
public static func fromJsonValue(jv: JsonValue): Note {
        let obj = jv.asObject()
        let id = obj["id"].asInt().getValue()
        let title = obj["title"].asString().getValue()
        let content = obj["content"].asString().getValue()
        let jsonTags = obj["tags"].asArray()
        let tags = ArrayList<String>()
        for (i in 0..jsonTags.size()) {
            tags.add(jsonTags[i].asString().getValue())
        }
        return Note(id, title, content, tags)
```

# module tests/notebook/project/src/note_server.cj

## function:

负责测试 `note_server` 相关功能是否符合预期。

## usage example:

```cangjie
# source: tests/notebook/project/src/note_server.cj
```

## package:
notebook

## imports:

- `stdx.net.http.*`

- `stdx.net.tls.*`

- `stdx.encoding.json.*`

- `stdx.crypto.x509.`

- `std.collection.*`

- `std.convert.*`

- `std.io.`

- `std.sync.*`

# class NoteServer

## function:

封装笔记数据和操作，提供 `NoteServer` 相关的功能。

## kind:

class

## access:

public

## extends:

none

## implements:

none

## properties:

- `private var service: NoteService`

- `private var server: ?Server`

- `internal let svr: None`

- `internal var tlsConfig: None`

- `internal let ready: None`

- `internal let method: None`

- `internal let body: None`

- `internal let jv: None`

- `internal let obj: None`

- `internal let title: None`

- `internal let content: None`

- `internal let tags: None`

- `internal let note: None`

- `internal let query: None`

- `internal let tagParam: None`

- `internal var notesList: ArrayList<Note>`

- `internal let result: None`

- `internal let arr: None`

- `internal let idStr: None`

- `internal let id: None`

- `internal let errObj: None`

## usage example:

```cangjie
public class NoteServer {
    private var service: NoteService
    private var server: ?Server = None

    public init(service: NoteService) {
        this.service = service
    }

    public func start(addr: String, port: UInt16): Unit {
        let svr = ServerBuilder()
            .addr(addr)
            .port(port)
            .build()
        registerRoutes(svr)
        startServer(svr)
    }

    public func startTls(addr: String, port: UInt16, certPem: String, keyPem: String): Unit {
        var tlsConfig = TlsServerConfig(
            X509Certificate.decodeFromPem(certPem),
```

# method NoteServer.func start(addr: String, port: UInt16): Unit

## function:

实现 `` 中的 `start` 逻辑，是该模块中的可调用函数单元。

## access:

public

## is_static:

False

## usage example:

```cangjie
public func start(addr: String, port: UInt16): Unit {
        let svr = ServerBuilder()
            .addr(addr)
            .port(port)
            .build()
        registerRoutes(svr)
        startServer(svr)
    }

    public func startTls(addr: String, port: UInt16, certPem: String, keyPem: String): Unit {
        var tlsConfig = TlsServerConfig(
```

# method NoteServer.func startTls(addr: String, port: UInt16, certPem: String, keyPem: String): Unit

## function:

实现 `` 中的 `startTls` 逻辑，是该模块中的可调用函数单元。

## access:

public

## is_static:

False

## usage example:

```cangjie
public func startTls(addr: String, port: UInt16, certPem: String, keyPem: String): Unit {
        var tlsConfig = TlsServerConfig(
            X509Certificate.decodeFromPem(certPem),
            PrivateKey.decodeFromPem(keyPem)
        )
        tlsConfig.supportedAlpnProtocols = ["http/1.1"]
        let svr = ServerBuilder()
            .addr(addr)
            .port(port)
            .tlsConfig(tlsConfig)
            .build()
```

# method NoteServer.func registerRoutes(svr: Server): Unit

## function:

实现 `` 中的 `registerRoutes` 逻辑，是该模块中的可调用函数单元。

## access:

private

## is_static:

False

## usage example:

```cangjie
private func registerRoutes(svr: Server): Unit {
        svr.distributor.register("/api/notes", FuncHandler({ ctx =>
            this.handleNotes(ctx)
        }))
        svr.distributor.register("/api/note", FuncHandler({ ctx =>
            this.handleNote(ctx)
        }))
        svr.distributor.register("/api/stats", FuncHandler({ ctx =>
            this.handleStats(ctx)
        }))
    }
```

# method NoteServer.func startServer(svr: Server): Unit

## function:

实现 `` 中的 `startServer` 逻辑，是该模块中的可调用函数单元。

## access:

private

## is_static:

False

## usage example:

```cangjie
private func startServer(svr: Server): Unit {
        let ready = SyncCounter(1)
        svr.afterBind({ => ready.dec() })
        server = svr
        spawn { svr.serve() }
        ready.waitUntilZero()
    }

    public func stop(): Unit {
        if (let Some(svr) <- server) {
            svr.close()
```

# method NoteServer.func stop(): Unit

## function:

实现 `` 中的 `stop` 逻辑，是该模块中的可调用函数单元。

## access:

public

## is_static:

False

## usage example:

```cangjie
public func stop(): Unit {
        if (let Some(svr) <- server) {
            svr.close()
        }
    }

    public func getPort(): UInt16 {
        if (let Some(svr) <- server) {
            return svr.port
        }
        return 0
```

# method NoteServer.func getPort(): UInt16

## function:

获取与 `getPort` 相关的数据或对象，供项目内部逻辑调用。

## access:

public

## is_static:

False

## usage example:

```cangjie
public func getPort(): UInt16 {
        if (let Some(svr) <- server) {
            return svr.port
        }
        return 0
    }

    // --- Route Dispatchers ---

    private func handleNotes(ctx: HttpContext): Unit {
        let method = ctx.request.method
```

# method NoteServer.func handleNotes(ctx: HttpContext): Unit

## function:

--- Route Dispatchers ---。

## access:

private

## is_static:

False

## usage example:

```cangjie
private func handleNotes(ctx: HttpContext): Unit {
        let method = ctx.request.method
        if (method == "POST") {
            handleCreateNote(ctx)
        } else if (method == "GET") {
            handleListNotes(ctx)
        } else {
            respondError(ctx, 405, "Method not allowed")
        }
    }
```

# method NoteServer.func handleNote(ctx: HttpContext): Unit

## function:

实现 `` 中的 `handleNote` 逻辑，是该模块中的可调用函数单元。

## access:

private

## is_static:

False

## usage example:

```cangjie
private func handleNote(ctx: HttpContext): Unit {
        let method = ctx.request.method
        if (method == "GET") {
            handleGetNote(ctx)
        } else if (method == "PUT") {
            handleUpdateNote(ctx)
        } else if (method == "DELETE") {
            handleDeleteNote(ctx)
        } else {
            respondError(ctx, 405, "Method not allowed")
        }
```

# method NoteServer.func handleStats(ctx: HttpContext): Unit

## function:

实现 `` 中的 `handleStats` 逻辑，是该模块中的可调用函数单元。

## access:

private

## is_static:

False

## usage example:

```cangjie
private func handleStats(ctx: HttpContext): Unit {
        respondJson(ctx, 200, service.getStats().toString())
    }

    // --- Individual Handlers ---

    private func handleCreateNote(ctx: HttpContext): Unit {
        try {
            let body = StringReader(ctx.request.body).readToEnd()
            let jv = JsonValue.fromStr(body)
            let obj = jv.asObject()
```

# method NoteServer.func handleCreateNote(ctx: HttpContext): Unit

## function:

--- Individual Handlers ---。

## access:

private

## is_static:

False

## usage example:

```cangjie
private func handleCreateNote(ctx: HttpContext): Unit {
        try {
            let body = StringReader(ctx.request.body).readToEnd()
            let jv = JsonValue.fromStr(body)
            let obj = jv.asObject()
            let title = obj["title"].asString().getValue()
            let content = obj["content"].asString().getValue()
            let tags = parseTagsArray(obj["tags"].asArray())
            let note = service.createNote(title, content, tags)
            respondJson(ctx, 200, note.toJsonValue().toString())
        } catch (e: Exception) {
```

# method NoteServer.func handleListNotes(ctx: HttpContext): Unit

## function:

实现 `` 中的 `handleListNotes` 逻辑，是该模块中的可调用函数单元。

## access:

private

## is_static:

False

## usage example:

```cangjie
private func handleListNotes(ctx: HttpContext): Unit {
        let query = ctx.request.url.rawQuery ?? ""
        let tagParam = getQueryParam(query, "tag")
        var notesList: ArrayList<Note>
        if (let Some(tag) <- tagParam) {
            notesList = service.getNotesByTag(tag)
        } else {
            notesList = service.getAllNotes()
        }
        let result = JsonObject()
        let arr = JsonArray()
```

# method NoteServer.func handleGetNote(ctx: HttpContext): Unit

## function:

实现 `` 中的 `handleGetNote` 逻辑，是该模块中的可调用函数单元。

## access:

private

## is_static:

False

## usage example:

```cangjie
private func handleGetNote(ctx: HttpContext): Unit {
        let query = ctx.request.url.rawQuery ?? ""
        let idStr = getQueryParam(query, "id")
        if (let Some(s) <- idStr) {
            handleGetNoteById(ctx, s)
        } else {
            respondError(ctx, 400, "Missing id parameter")
        }
    }

    private func handleGetNoteById(ctx: HttpContext, idStr: String): Unit {
```

# method NoteServer.func handleGetNoteById(ctx: HttpContext, idStr: String): Unit

## function:

实现 `` 中的 `handleGetNoteById` 逻辑，是该模块中的可调用函数单元。

## access:

private

## is_static:

False

## usage example:

```cangjie
private func handleGetNoteById(ctx: HttpContext, idStr: String): Unit {
        try {
            let id = Int64.parse(idStr)
            if (let Some(note) <- service.getNote(id)) {
                respondJson(ctx, 200, note.toJsonValue().toString())
            } else {
                respondError(ctx, 404, "Note not found")
            }
        } catch (e: Exception) {
            respondError(ctx, 400, "Invalid id parameter")
        }
```

# method NoteServer.func handleUpdateNote(ctx: HttpContext): Unit

## function:

实现 `` 中的 `handleUpdateNote` 逻辑，是该模块中的可调用函数单元。

## access:

private

## is_static:

False

## usage example:

```cangjie
private func handleUpdateNote(ctx: HttpContext): Unit {
        try {
            let body = StringReader(ctx.request.body).readToEnd()
            let jv = JsonValue.fromStr(body)
            let obj = jv.asObject()
            let id = obj["id"].asInt().getValue()
            let title = obj["title"].asString().getValue()
            let content = obj["content"].asString().getValue()
            let tags = parseTagsArray(obj["tags"].asArray())
            if (let Some(note) <- service.updateNote(id, title, content, tags)) {
                respondJson(ctx, 200, note.toJsonValue().toString())
```

# method NoteServer.func handleDeleteNote(ctx: HttpContext): Unit

## function:

实现 `` 中的 `handleDeleteNote` 逻辑，是该模块中的可调用函数单元。

## access:

private

## is_static:

False

## usage example:

```cangjie
private func handleDeleteNote(ctx: HttpContext): Unit {
        let query = ctx.request.url.rawQuery ?? ""
        let idStr = getQueryParam(query, "id")
        if (let Some(s) <- idStr) {
            handleDeleteNoteById(ctx, s)
        } else {
            respondError(ctx, 400, "Missing id parameter")
        }
    }

    private func handleDeleteNoteById(ctx: HttpContext, idStr: String): Unit {
```

# method NoteServer.func handleDeleteNoteById(ctx: HttpContext, idStr: String): Unit

## function:

实现 `` 中的 `handleDeleteNoteById` 逻辑，是该模块中的可调用函数单元。

## access:

private

## is_static:

False

## usage example:

```cangjie
private func handleDeleteNoteById(ctx: HttpContext, idStr: String): Unit {
        try {
            let id = Int64.parse(idStr)
            if (service.deleteNote(id)) {
                respondJson(ctx, 200, ##"{"success":true}"##)
            } else {
                respondError(ctx, 404, "Note not found")
            }
        } catch (e: Exception) {
            respondError(ctx, 400, "Invalid id parameter")
        }
```

# method NoteServer.func respondJson(ctx: HttpContext, status: UInt16, body: String): Unit

## function:

--- Response Helpers ---。

## access:

private

## is_static:

False

## usage example:

```cangjie
private func respondJson(ctx: HttpContext, status: UInt16, body: String): Unit {
        ctx.responseBuilder
            .status(status)
            .header("Content-Type", "application/json")
            .body(body)
    }

    private func respondError(ctx: HttpContext, status: UInt16, message: String): Unit {
        let errObj = JsonObject()
        errObj.put("error", JsonString(message))
        respondJson(ctx, status, errObj.toString())
```

# method NoteServer.func respondError(ctx: HttpContext, status: UInt16, message: String): Unit

## function:

实现 `` 中的 `respondError` 逻辑，是该模块中的可调用函数单元。

## access:

private

## is_static:

False

## usage example:

```cangjie
private func respondError(ctx: HttpContext, status: UInt16, message: String): Unit {
        let errObj = JsonObject()
        errObj.put("error", JsonString(message))
        respondJson(ctx, status, errObj.toString())
    }
}

func getQueryParam(rawQuery: String, name: String): ?String {
    if (rawQuery.isEmpty()) {
        return None
    }
```

# func func getQueryParam(rawQuery: String, name: String): ?String

## function:

获取与 `getQueryParam` 相关的数据或对象，供项目内部逻辑调用。

## access:

internal

## usage example:

```cangjie
func getQueryParam(rawQuery: String, name: String): ?String {
    if (rawQuery.isEmpty()) {
        return None
    }
    let pairs = rawQuery.split("&")
    for (pair in pairs) {
        let parts = pair.split("=")
        if (parts.size >= 2 && parts[0] == name) {
            return parts[1]
        }
    }
```

# func func parseTagsArray(jsonTags: JsonArray): ArrayList<String>

## function:

实现 `` 中的 `parseTagsArray` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## usage example:

```cangjie
func parseTagsArray(jsonTags: JsonArray): ArrayList<String> {
    let tags = ArrayList<String>()
    for (i in 0..jsonTags.size()) {
        tags.add(jsonTags[i].asString().getValue())
    }
    return tags
}
```

# let pairs

## function:

`pairs` 是不可变变量，类型为 `None`，用于保存常量值或不可变引用。

## access:

internal

## usage example:

```cangjie
let pairs = rawQuery.split("&")
```

# let parts

## function:

`parts` 是不可变变量，类型为 `None`，用于保存常量值或不可变引用。

## access:

internal

## usage example:

```cangjie
let parts = pair.split("=")
```

# let tags

## function:

`tags` 是不可变变量，类型为 `None`，用于保存常量值或不可变引用。

## access:

internal

## usage example:

```cangjie
let tags = ArrayList<String>()
```

# module tests/notebook/project/src/note_service.cj

## function:

负责测试 `note_service` 相关功能是否符合预期。

## usage example:

```cangjie
# source: tests/notebook/project/src/note_service.cj
```

## package:
notebook

## imports:

- `stdx.encoding.json.*`

- `std.collection.*`

# class NoteService

## function:

封装业务逻辑，提供 `NoteService` 相关的服务功能。

## kind:

class

## access:

public

## extends:

none

## implements:

none

## properties:

- `private var notes: None`

- `private var nextId: Int64`

- `internal let note: None`

- `internal let result: None`

- `internal let obj: None`

- `internal let tagCounts: None`

- `internal let count: None`

## usage example:

```cangjie
public class NoteService {
    private var notes = ArrayList<Note>()
    private var nextId: Int64 = 1

    public init() {}

    public func createNote(title: String, content: String, tags: ArrayList<String>): Note {
        let note = Note(nextId, title, content, tags)
        nextId += 1
        notes.add(note)
        return note
    }

    public func getNote(id: Int64): ?Note {
        for (note in notes) {
            if (note.id == id) {
                return note
            }
        }
        return None
```

# method NoteService.func createNote(title: String, content: String, tags: ArrayList<String>): Note

## function:

实现 `` 中的 `createNote` 逻辑，是该模块中的可调用函数单元。

## access:

public

## is_static:

False

## usage example:

```cangjie
public func createNote(title: String, content: String, tags: ArrayList<String>): Note {
        let note = Note(nextId, title, content, tags)
        nextId += 1
        notes.add(note)
        return note
    }

    public func getNote(id: Int64): ?Note {
        for (note in notes) {
            if (note.id == id) {
                return note
```

# method NoteService.func getNote(id: Int64): ?Note

## function:

获取与 `getNote` 相关的数据或对象，供项目内部逻辑调用。

## access:

public

## is_static:

False

## usage example:

```cangjie
public func getNote(id: Int64): ?Note {
        for (note in notes) {
            if (note.id == id) {
                return note
            }
        }
        return None
    }

    public func getAllNotes(): ArrayList<Note> {
        return notes
```

# method NoteService.func getAllNotes(): ArrayList<Note>

## function:

获取与 `getAllNotes` 相关的数据或对象，供项目内部逻辑调用。

## access:

public

## is_static:

False

## usage example:

```cangjie
public func getAllNotes(): ArrayList<Note> {
        return notes
    }

    public func getNotesByTag(tag: String): ArrayList<Note> {
        let result = ArrayList<Note>()
        for (note in notes) {
            for (t in note.tags) {
                if (t == tag) {
                    result.add(note)
                    break
```

# method NoteService.func getNotesByTag(tag: String): ArrayList<Note>

## function:

获取与 `getNotesByTag` 相关的数据或对象，供项目内部逻辑调用。

## access:

public

## is_static:

False

## usage example:

```cangjie
public func getNotesByTag(tag: String): ArrayList<Note> {
        let result = ArrayList<Note>()
        for (note in notes) {
            for (t in note.tags) {
                if (t == tag) {
                    result.add(note)
                    break
                }
            }
        }
        return result
```

# method NoteService.func updateNote(id: Int64, title: String, content: String, tags: ArrayList<String>): ?Note

## function:

实现 `` 中的 `updateNote` 逻辑，是该模块中的可调用函数单元。

## access:

public

## is_static:

False

## usage example:

```cangjie
public func updateNote(id: Int64, title: String, content: String, tags: ArrayList<String>): ?Note {
        for (i in 0..notes.size) {
            if (notes[i].id == id) {
                notes[i].title = title
                notes[i].content = content
                notes[i].tags = tags
                return notes[i]
            }
        }
        return None
    }
```

# method NoteService.func deleteNote(id: Int64): Bool

## function:

实现 `` 中的 `deleteNote` 逻辑，是该模块中的可调用函数单元。

## access:

public

## is_static:

False

## usage example:

```cangjie
public func deleteNote(id: Int64): Bool {
        for (i in 0..notes.size) {
            if (notes[i].id == id) {
                notes.remove(i..(i+1))
                return true
            }
        }
        return false
    }

    public func getStats(): JsonValue {
```

# method NoteService.func getStats(): JsonValue

## function:

获取与 `getStats` 相关的数据或对象，供项目内部逻辑调用。

## access:

public

## is_static:

False

## usage example:

```cangjie
public func getStats(): JsonValue {
        let obj = JsonObject()
        obj.put("total_notes", JsonInt(notes.size))
        let tagCounts = JsonObject()
        for (note in notes) {
            for (tag in note.tags) {
                if (tagCounts.containsKey(tag)) {
                    let count = tagCounts[tag].asInt().getValue()
                    tagCounts.put(tag, JsonInt(count + 1))
                } else {
                    tagCounts.put(tag, JsonInt(1))
```

# module tests/notebook/project/src/notebook_test.cj

## function:

负责测试 `notebook_test` 相关功能是否符合预期。

## usage example:

```cangjie
# source: tests/notebook/project/src/notebook_test.cj
```

## package:
notebook

## imports:

- `std.collection.*`

- `std.io.*`

- `std.fs.*`

- `stdx.encoding.json.*`

- `stdx.net.http.*`

- `stdx.net.tls.*`

- `stdx.crypto.x509.X509Certificate`

# class TestNoteModel

## function:

定义数据模型，封装 `TestNoteModel` 相关的数据结构。

## kind:

class

## access:

internal

## extends:

none

## implements:

none

## properties:

- `internal let tags: None`

- `internal let note: None`

- `internal let jv: None`

- `internal let obj: None`

- `internal let jsonTags: None`

- `internal let json: None`

- `internal let jsonStr: None`

- `internal let jv2: None`

- `internal let note2: None`

## usage example:

```cangjie
class TestNoteModel {
    @TestCase
    func testNoteToJson() {
        let tags = ArrayList<String>()
        tags.add("work")
        tags.add("urgent")
        let note = Note(1, "Meeting Notes", "Discuss project plan", tags)
        let jv = note.toJsonValue()
        let obj = jv.asObject()
        @Assert(obj["id"].asInt().getValue(), 1)
        @Assert(obj["title"].asString().getValue(), "Meeting Notes")
        @Assert(obj["content"].asString().getValue(), "Discuss project plan")
        let jsonTags = obj["tags"].asArray()
        @Assert(jsonTags.size(), 2)
        @Assert(jsonTags[0].asString().getValue(), "work")
        @Assert(jsonTags[1].asString().getValue(), "urgent")
    }

    @TestCase
    func testNoteFromJson() {
```

# method TestNoteModel.func testNoteToJson()

## function:

实现 `` 中的 `testNoteToJson` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testNoteToJson() {
        let tags = ArrayList<String>()
        tags.add("work")
        tags.add("urgent")
        let note = Note(1, "Meeting Notes", "Discuss project plan", tags)
        let jv = note.toJsonValue()
        let obj = jv.asObject()
        @Assert(obj["id"].asInt().getValue(), 1)
        @Assert(obj["title"].asString().getValue(), "Meeting Notes")
        @Assert(obj["content"].asString().getValue(), "Discuss project plan")
        let jsonTags = obj["tags"].asArray()
```

# method TestNoteModel.func testNoteFromJson()

## function:

实现 `` 中的 `testNoteFromJson` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testNoteFromJson() {
        let json = ##"{"id":2,"title":"Shopping List","content":"Buy milk and eggs","tags":["personal"]}"##
        let jv = JsonValue.fromStr(json)
        let note = Note.fromJsonValue(jv)
        @Assert(note.id, 2)
        @Assert(note.title, "Shopping List")
        @Assert(note.content, "Buy milk and eggs")
        @Assert(note.tags.size, 1)
        @Assert(note.tags[0], "personal")
    }
```

# method TestNoteModel.func testNoteEmptyTags()

## function:

实现 `` 中的 `testNoteEmptyTags` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testNoteEmptyTags() {
        let tags = ArrayList<String>()
        let note = Note(3, "Empty", "No tags", tags)
        let jv = note.toJsonValue()
        let obj = jv.asObject()
        @Assert(obj["tags"].asArray().size(), 0)
    }

    @TestCase
    func testNoteRoundTrip() {
        let tags = ArrayList<String>()
```

# method TestNoteModel.func testNoteRoundTrip()

## function:

实现 `` 中的 `testNoteRoundTrip` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testNoteRoundTrip() {
        let tags = ArrayList<String>()
        tags.add("a")
        tags.add("b")
        tags.add("c")
        let note = Note(10, "Round Trip", "Test round trip", tags)
        let jv = note.toJsonValue()
        let jsonStr = jv.toString()
        let jv2 = JsonValue.fromStr(jsonStr)
        let note2 = Note.fromJsonValue(jv2)
        @Assert(note2.id, 10)
```

# method TestNoteModel.func testNoteWithSpecialChars()

## function:

实现 `` 中的 `testNoteWithSpecialChars` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testNoteWithSpecialChars() {
        let tags = ArrayList<String>()
        tags.add("special")
        let note = Note(4, "Hello \"World\"", "Line1\nLine2", tags)
        let jv = note.toJsonValue()
        let jsonStr = jv.toString()
        let jv2 = JsonValue.fromStr(jsonStr)
        let note2 = Note.fromJsonValue(jv2)
        @Assert(note2.title, "Hello \"World\"")
        @Assert(note2.content, "Line1\nLine2")
        @Assert(note2.tags[0], "special")
```

# method TestNoteModel.func testNoteWithChineseContent()

## function:

实现 `` 中的 `testNoteWithChineseContent` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testNoteWithChineseContent() {
        let tags = ArrayList<String>()
        tags.add("学习")
        tags.add("仓颉")
        let note = Note(6, "仓颉学习笔记", "今天学习了仓颉语言的基本语法", tags)
        let jv = note.toJsonValue()
        let jsonStr = jv.toString()
        let jv2 = JsonValue.fromStr(jsonStr)
        let note2 = Note.fromJsonValue(jv2)
        @Assert(note2.title, "仓颉学习笔记")
        @Assert(note2.content, "今天学习了仓颉语言的基本语法")
```

# method TestNoteModel.func testNoteMultipleTags()

## function:

实现 `` 中的 `testNoteMultipleTags` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testNoteMultipleTags() {
        let tags = ArrayList<String>()
        tags.add("work")
        tags.add("project")
        tags.add("meeting")
        tags.add("Q1")
        let note = Note(5, "Quarterly Review", "Review Q1 progress", tags)
        let jv = note.toJsonValue()
        let obj = jv.asObject()
        let jsonTags = obj["tags"].asArray()
        @Assert(jsonTags.size(), 4)
```

# method TestNoteModel.func testNoteJsonFieldOrder()

## function:

实现 `` 中的 `testNoteJsonFieldOrder` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testNoteJsonFieldOrder() {
        let tags = ArrayList<String>()
        let note = Note(99, "Order", "Check field order", tags)
        let jv = note.toJsonValue()
        let obj = jv.asObject()
        @Assert(obj.containsKey("id"))
        @Assert(obj.containsKey("title"))
        @Assert(obj.containsKey("content"))
        @Assert(obj.containsKey("tags"))
    }
```

# method TestNoteModel.func testNoteFromJsonPreservesAllFields()

## function:

实现 `` 中的 `testNoteFromJsonPreservesAllFields` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testNoteFromJsonPreservesAllFields() {
        let json = ##"{"id":100,"title":"Full","content":"All fields","tags":["x","y","z"]}"##
        let note = Note.fromJsonValue(JsonValue.fromStr(json))
        @Assert(note.id, 100)
        @Assert(note.title, "Full")
        @Assert(note.content, "All fields")
        @Assert(note.tags.size, 3)
        @Assert(note.tags[2], "z")
    }
}
```

# class TestNoteService

## function:

封装业务逻辑，提供 `TestNoteService` 相关的服务功能。

## kind:

class

## access:

internal

## extends:

none

## implements:

none

## properties:

- `internal let svc: None`

- `internal let tags: None`

- `internal let note: None`

- `internal let n1: None`

- `internal let n2: None`

- `internal let n3: None`

- `internal let created: None`

- `internal let all: None`

- `internal let tags1: None`

- `internal let tags2: None`

- `internal let tags3: None`

- `internal let workNotes: None`

- `internal let personalNotes: None`

- `internal let result: None`

- `internal let newTags: None`

- `internal let stats: None`

- `internal let obj: None`

- `internal let tagCounts: None`

- `internal let origId: None`

## usage example:

```cangjie
class TestNoteService {
    @TestCase
    func testCreateNote() {
        let svc = NoteService()
        let tags = ArrayList<String>()
        tags.add("test")
        let note = svc.createNote("Title", "Content", tags)
        @Assert(note.title, "Title")
        @Assert(note.content, "Content")
        @Assert(note.tags.size, 1)
        @Assert(note.tags[0], "test")
    }

    @TestCase
    func testAutoIncrementId() {
        let svc = NoteService()
        let n1 = svc.createNote("Note 1", "C1", ArrayList<String>())
        let n2 = svc.createNote("Note 2", "C2", ArrayList<String>())
        let n3 = svc.createNote("Note 3", "C3", ArrayList<String>())
        @Assert(n2.id > n1.id)
```

# method TestNoteService.func testCreateNote()

## function:

实现 `` 中的 `testCreateNote` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testCreateNote() {
        let svc = NoteService()
        let tags = ArrayList<String>()
        tags.add("test")
        let note = svc.createNote("Title", "Content", tags)
        @Assert(note.title, "Title")
        @Assert(note.content, "Content")
        @Assert(note.tags.size, 1)
        @Assert(note.tags[0], "test")
    }
```

# method TestNoteService.func testAutoIncrementId()

## function:

实现 `` 中的 `testAutoIncrementId` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testAutoIncrementId() {
        let svc = NoteService()
        let n1 = svc.createNote("Note 1", "C1", ArrayList<String>())
        let n2 = svc.createNote("Note 2", "C2", ArrayList<String>())
        let n3 = svc.createNote("Note 3", "C3", ArrayList<String>())
        @Assert(n2.id > n1.id)
        @Assert(n3.id > n2.id)
    }

    @TestCase
    func testGetNote() {
```

# method TestNoteService.func testGetNote()

## function:

实现 `` 中的 `testGetNote` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testGetNote() {
        let svc = NoteService()
        let tags = ArrayList<String>()
        tags.add("find")
        let created = svc.createNote("Find Me", "Content", tags)
        if (let Some(found) <- svc.getNote(created.id)) {
            @Assert(found.title, "Find Me")
            @Assert(found.content, "Content")
        } else {
            @Fail("Note should be found")
        }
```

# method TestNoteService.func testGetNoteNotFound()

## function:

实现 `` 中的 `testGetNoteNotFound` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testGetNoteNotFound() {
        let svc = NoteService()
        if (let Some(_) <- svc.getNote(999)) {
            @Fail("Note should not exist")
        }
    }

    @TestCase
    func testGetAllNotes() {
        let svc = NoteService()
        svc.createNote("N1", "C1", ArrayList<String>())
```

# method TestNoteService.func testGetAllNotes()

## function:

实现 `` 中的 `testGetAllNotes` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testGetAllNotes() {
        let svc = NoteService()
        svc.createNote("N1", "C1", ArrayList<String>())
        svc.createNote("N2", "C2", ArrayList<String>())
        svc.createNote("N3", "C3", ArrayList<String>())
        let all = svc.getAllNotes()
        @Assert(all.size, 3)
    }

    @TestCase
    func testGetNotesByTag() {
```

# method TestNoteService.func testGetNotesByTag()

## function:

实现 `` 中的 `testGetNotesByTag` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testGetNotesByTag() {
        let svc = NoteService()
        let tags1 = ArrayList<String>()
        tags1.add("work")
        tags1.add("project")
        svc.createNote("Work Note", "Content", tags1)

        let tags2 = ArrayList<String>()
        tags2.add("personal")
        svc.createNote("Personal Note", "Content", tags2)
```

# method TestNoteService.func testGetNotesByTagNoMatch()

## function:

实现 `` 中的 `testGetNotesByTagNoMatch` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testGetNotesByTagNoMatch() {
        let svc = NoteService()
        let tags = ArrayList<String>()
        tags.add("work")
        svc.createNote("Work", "Content", tags)
        let result = svc.getNotesByTag("nonexistent")
        @Assert(result.size, 0)
    }

    @TestCase
    func testUpdateNote() {
```

# method TestNoteService.func testUpdateNote()

## function:

实现 `` 中的 `testUpdateNote` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testUpdateNote() {
        let svc = NoteService()
        let tags = ArrayList<String>()
        tags.add("old")
        let created = svc.createNote("Original", "Old content", tags)

        let newTags = ArrayList<String>()
        newTags.add("updated")
        if (let Some(updated) <- svc.updateNote(created.id, "Updated", "New content", newTags)) {
            @Assert(updated.title, "Updated")
            @Assert(updated.content, "New content")
```

# method TestNoteService.func testUpdateNoteNotFound()

## function:

实现 `` 中的 `testUpdateNoteNotFound` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testUpdateNoteNotFound() {
        let svc = NoteService()
        if (let Some(_) <- svc.updateNote(999, "X", "Y", ArrayList<String>())) {
            @Fail("Update should fail for non-existent note")
        }
    }

    @TestCase
    func testDeleteNote() {
        let svc = NoteService()
        let created = svc.createNote("Delete Me", "Content", ArrayList<String>())
```

# method TestNoteService.func testDeleteNote()

## function:

实现 `` 中的 `testDeleteNote` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testDeleteNote() {
        let svc = NoteService()
        let created = svc.createNote("Delete Me", "Content", ArrayList<String>())
        @Assert(svc.deleteNote(created.id))
        if (let Some(_) <- svc.getNote(created.id)) {
            @Fail("Deleted note should not be found")
        }
        @Assert(svc.getAllNotes().size, 0)
    }

    @TestCase
```

# method TestNoteService.func testDeleteNoteNotFound()

## function:

实现 `` 中的 `testDeleteNoteNotFound` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testDeleteNoteNotFound() {
        let svc = NoteService()
        @Assert(!svc.deleteNote(999))
    }

    @TestCase
    func testGetStats() {
        let svc = NoteService()
        let tags1 = ArrayList<String>()
        tags1.add("work")
        tags1.add("meeting")
```

# method TestNoteService.func testGetStats()

## function:

实现 `` 中的 `testGetStats` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testGetStats() {
        let svc = NoteService()
        let tags1 = ArrayList<String>()
        tags1.add("work")
        tags1.add("meeting")
        svc.createNote("N1", "C1", tags1)

        let tags2 = ArrayList<String>()
        tags2.add("work")
        svc.createNote("N2", "C2", tags2)
```

# method TestNoteService.func testGetStatsEmpty()

## function:

实现 `` 中的 `testGetStatsEmpty` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testGetStatsEmpty() {
        let svc = NoteService()
        let stats = svc.getStats()
        let obj = stats.asObject()
        @Assert(obj["total_notes"].asInt().getValue(), 0)
    }

    @TestCase
    func testCreateAndDeleteMultiple() {
        let svc = NoteService()
        let n1 = svc.createNote("A", "1", ArrayList<String>())
```

# method TestNoteService.func testCreateAndDeleteMultiple()

## function:

实现 `` 中的 `testCreateAndDeleteMultiple` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testCreateAndDeleteMultiple() {
        let svc = NoteService()
        let n1 = svc.createNote("A", "1", ArrayList<String>())
        let n2 = svc.createNote("B", "2", ArrayList<String>())
        let n3 = svc.createNote("C", "3", ArrayList<String>())
        @Assert(svc.getAllNotes().size, 3)
        @Assert(svc.deleteNote(n2.id))
        @Assert(svc.getAllNotes().size, 2)
        if (let Some(a) <- svc.getNote(n1.id)) {
            @Assert(a.title, "A")
        } else {
```

# method TestNoteService.func testUpdatePreservesId()

## function:

实现 `` 中的 `testUpdatePreservesId` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testUpdatePreservesId() {
        let svc = NoteService()
        let tags = ArrayList<String>()
        tags.add("orig")
        let created = svc.createNote("Orig", "Content", tags)
        let origId = created.id

        let newTags = ArrayList<String>()
        newTags.add("new")
        if (let Some(updated) <- svc.updateNote(origId, "New", "New content", newTags)) {
            @Assert(updated.id, origId)
```

# class TestNoteAPI

## function:

封装笔记数据和操作，提供 `TestNoteAPI` 相关的功能。

## kind:

class

## access:

internal

## extends:

none

## implements:

none

## properties:

- `internal var _server: ?NoteServer`

- `internal var _client: ?Client`

- `internal var _baseUrl: String`

- `internal let service: None`

- `internal let server: None`

- `internal let client: None`

- `internal let body: None`

- `internal let resp: None`

- `internal let respBody: None`

- `internal let jv: None`

- `internal let obj: None`

- `internal let createResp: None`

- `internal let createBody: None`

- `internal let created: None`

- `internal let id: None`

- `internal let getResp: None`

- `internal let getBody: None`

- `internal let got: None`

- `internal let listResp: None`

- `internal let listBody: None`

- `internal let total: None`

- `internal let body1: None`

- `internal let r1: None`

- `internal let body2: None`

- `internal let r2: None`

- `internal let filterResp: None`

- `internal let filterBody: None`

- `internal let createRespBody: None`

- `internal let updateBody: None`

- `internal let updateReq: None`

- `internal let updateResp: None`

- `internal let updateRespBody: None`

- `internal let updated: None`

- `internal let deleteResp: None`

- `internal let deleteBody: None`

- `internal let result: None`

- `internal let statsResp: None`

- `internal let statsBody: None`

- `internal let totalNotes: None`

- `internal let getResp2: None`

- `internal let getBody2: None`

- `internal let got2: None`

- `internal let getResp3: None`

## usage example:

```cangjie
class TestNoteAPI {
    var _server: ?NoteServer = None
    var _client: ?Client = None
    var _baseUrl: String = ""

    @BeforeAll
    func setup() {
        let service = NoteService()
        let server = NoteServer(service)
        server.start("127.0.0.1", 0)
        _server = server
        _baseUrl = "http://127.0.0.1:${server.getPort()}"
        _client = ClientBuilder().build()
    }

    @AfterAll
    func teardown() {
        if (let Some(c) <- _client) { c.close() }
        if (let Some(s) <- _server) { s.stop() }
    }
```

# method TestNoteAPI.func setup()

## function:

设置与 `setup` 相关的状态、配置或对象属性。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func setup() {
        let service = NoteService()
        let server = NoteServer(service)
        server.start("127.0.0.1", 0)
        _server = server
        _baseUrl = "http://127.0.0.1:${server.getPort()}"
        _client = ClientBuilder().build()
    }

    @AfterAll
    func teardown() {
```

# method TestNoteAPI.func teardown()

## function:

实现 `` 中的 `teardown` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func teardown() {
        if (let Some(c) <- _client) { c.close() }
        if (let Some(s) <- _server) { s.stop() }
    }

    @TestCase
    func testCreateNoteAPI() {
        let client = _client.getOrThrow()
        let body = ##"{"title":"API Note","content":"Created via API","tags":["api","test"]}"##
        let resp = client.post("${_baseUrl}/api/notes", body)
        let respBody = StringReader(resp.body).readToEnd()
```

# method TestNoteAPI.func testCreateNoteAPI()

## function:

实现 `` 中的 `testCreateNoteAPI` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testCreateNoteAPI() {
        let client = _client.getOrThrow()
        let body = ##"{"title":"API Note","content":"Created via API","tags":["api","test"]}"##
        let resp = client.post("${_baseUrl}/api/notes", body)
        let respBody = StringReader(resp.body).readToEnd()
        @Assert(resp.status == 200)
        let jv = JsonValue.fromStr(respBody)
        let obj = jv.asObject()
        @Assert(obj["title"].asString().getValue(), "API Note")
        @Assert(obj["content"].asString().getValue(), "Created via API")
        @Assert(obj["tags"].asArray().size(), 2)
```

# method TestNoteAPI.func testCreateAndGetNoteAPI()

## function:

实现 `` 中的 `testCreateAndGetNoteAPI` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testCreateAndGetNoteAPI() {
        let client = _client.getOrThrow()
        // Create
        let body = ##"{"title":"Get Test","content":"Test content for get","tags":["gettest"]}"##
        let createResp = client.post("${_baseUrl}/api/notes", body)
        let createBody = StringReader(createResp.body).readToEnd()
        let created = JsonValue.fromStr(createBody).asObject()
        let id = created["id"].asInt().getValue()

        // Get
        let getResp = client.get("${_baseUrl}/api/note?id=${id}")
```

# method TestNoteAPI.func testGetNoteNotFoundAPI()

## function:

实现 `` 中的 `testGetNoteNotFoundAPI` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testGetNoteNotFoundAPI() {
        let client = _client.getOrThrow()
        let resp = client.get("${_baseUrl}/api/note?id=99999")
        let respBody = StringReader(resp.body).readToEnd()
        @Assert(resp.status == 404)
        let obj = JsonValue.fromStr(respBody).asObject()
        @Assert(obj.containsKey("error"))
    }

    @TestCase
    func testListNotesAPI() {
```

# method TestNoteAPI.func testListNotesAPI()

## function:

实现 `` 中的 `testListNotesAPI` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testListNotesAPI() {
        let client = _client.getOrThrow()
        // Create a note with a unique tag
        let body = ##"{"title":"List Test","content":"For listing","tags":["listtest_unique"]}"##
        let createResp = client.post("${_baseUrl}/api/notes", body)
        StringReader(createResp.body).readToEnd()

        // List all
        let listResp = client.get("${_baseUrl}/api/notes")
        let listBody = StringReader(listResp.body).readToEnd()
        @Assert(listResp.status == 200)
```

# method TestNoteAPI.func testFilterByTagAPI()

## function:

实现 `` 中的 `testFilterByTagAPI` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testFilterByTagAPI() {
        let client = _client.getOrThrow()
        // Create two notes with specific tag
        let body1 = ##"{"title":"Filter A","content":"Content A","tags":["filtertag"]}"##
        let r1 = client.post("${_baseUrl}/api/notes", body1)
        StringReader(r1.body).readToEnd()

        let body2 = ##"{"title":"Filter B","content":"Content B","tags":["filtertag"]}"##
        let r2 = client.post("${_baseUrl}/api/notes", body2)
        StringReader(r2.body).readToEnd()
```

# method TestNoteAPI.func testUpdateNoteAPI()

## function:

实现 `` 中的 `testUpdateNoteAPI` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testUpdateNoteAPI() {
        let client = _client.getOrThrow()
        // Create
        let createBody = ##"{"title":"Before Update","content":"Old content","tags":["old"]}"##
        let createResp = client.post("${_baseUrl}/api/notes", createBody)
        let createRespBody = StringReader(createResp.body).readToEnd()
        let created = JsonValue.fromStr(createRespBody).asObject()
        let id = created["id"].asInt().getValue()

        // Update via PUT
        let updateBody = ##"{"id":ID_PLACEHOLDER,"title":"After Update","content":"New content","tags":["new"]}"##
```

# method TestNoteAPI.func testUpdateNoteNotFoundAPI()

## function:

实现 `` 中的 `testUpdateNoteNotFoundAPI` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testUpdateNoteNotFoundAPI() {
        let client = _client.getOrThrow()
        let updateBody = ##"{"id":99999,"title":"Ghost","content":"Phantom","tags":[]}"##
        let updateReq = HttpRequestBuilder()
            .put()
            .url("${_baseUrl}/api/note")
            .header("Content-Type", "application/json")
            .body(updateBody)
            .build()
        let updateResp = client.send(updateReq)
        StringReader(updateResp.body).readToEnd()
```

# method TestNoteAPI.func testDeleteNoteAPI()

## function:

实现 `` 中的 `testDeleteNoteAPI` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testDeleteNoteAPI() {
        let client = _client.getOrThrow()
        // Create
        let createBody = ##"{"title":"To Delete","content":"Will be deleted","tags":["delete"]}"##
        let createResp = client.post("${_baseUrl}/api/notes", createBody)
        let createRespBody = StringReader(createResp.body).readToEnd()
        let created = JsonValue.fromStr(createRespBody).asObject()
        let id = created["id"].asInt().getValue()

        // Delete
        let deleteResp = client.delete("${_baseUrl}/api/note?id=${id}")
```

# method TestNoteAPI.func testDeleteNoteNotFoundAPI()

## function:

实现 `` 中的 `testDeleteNoteNotFoundAPI` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testDeleteNoteNotFoundAPI() {
        let client = _client.getOrThrow()
        let resp = client.delete("${_baseUrl}/api/note?id=99999")
        StringReader(resp.body).readToEnd()
        @Assert(resp.status == 404)
    }

    @TestCase
    func testGetStatsAPI() {
        let client = _client.getOrThrow()
        // Create notes with known tags
```

# method TestNoteAPI.func testGetStatsAPI()

## function:

实现 `` 中的 `testGetStatsAPI` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testGetStatsAPI() {
        let client = _client.getOrThrow()
        // Create notes with known tags
        let body1 = ##"{"title":"Stats A","content":"CA","tags":["statstag1","statstag2"]}"##
        let r1 = client.post("${_baseUrl}/api/notes", body1)
        StringReader(r1.body).readToEnd()

        let body2 = ##"{"title":"Stats B","content":"CB","tags":["statstag1"]}"##
        let r2 = client.post("${_baseUrl}/api/notes", body2)
        StringReader(r2.body).readToEnd()
```

# method TestNoteAPI.func testMissingIdParamAPI()

## function:

实现 `` 中的 `testMissingIdParamAPI` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testMissingIdParamAPI() {
        let client = _client.getOrThrow()
        let resp = client.get("${_baseUrl}/api/note")
        StringReader(resp.body).readToEnd()
        @Assert(resp.status == 400)
    }

    @TestCase
    func testInvalidJsonBodyAPI() {
        let client = _client.getOrThrow()
        let resp = client.post("${_baseUrl}/api/notes", "not json at all")
```

# method TestNoteAPI.func testInvalidJsonBodyAPI()

## function:

实现 `` 中的 `testInvalidJsonBodyAPI` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testInvalidJsonBodyAPI() {
        let client = _client.getOrThrow()
        let resp = client.post("${_baseUrl}/api/notes", "not json at all")
        let respBody = StringReader(resp.body).readToEnd()
        @Assert(resp.status == 400)
        let obj = JsonValue.fromStr(respBody).asObject()
        @Assert(obj.containsKey("error"))
    }

    @TestCase
    func testFullWorkflowAPI() {
```

# method TestNoteAPI.func testFullWorkflowAPI()

## function:

实现 `` 中的 `testFullWorkflowAPI` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testFullWorkflowAPI() {
        let client = _client.getOrThrow()

        // 1. Create a note
        let createBody = ##"{"title":"Workflow Note","content":"Full workflow test","tags":["workflow","e2e"]}"##
        let createResp = client.post("${_baseUrl}/api/notes", createBody)
        let createRespBody = StringReader(createResp.body).readToEnd()
        @Assert(createResp.status == 200)
        let created = JsonValue.fromStr(createRespBody).asObject()
        let id = created["id"].asInt().getValue()
        @Assert(created["title"].asString().getValue(), "Workflow Note")
```

# class TestNoteHTTPSAPI

## function:

封装笔记数据和操作，提供 `TestNoteHTTPSAPI` 相关的功能。

## kind:

class

## access:

internal

## extends:

none

## implements:

none

## properties:

- `internal var _server: ?NoteServer`

- `internal var _client: ?Client`

- `internal var _baseUrl: String`

- `internal let certPem: None`

- `internal let keyPem: None`

- `internal let caPem: None`

- `internal let service: None`

- `internal let server: None`

- `internal var tlsConfig: None`

- `internal let client: None`

- `internal let body: None`

- `internal let resp: None`

- `internal let respBody: None`

- `internal let obj: None`

- `internal let createResp: None`

- `internal let listResp: None`

- `internal let listBody: None`

- `internal let createBody: None`

- `internal let created: None`

- `internal let id: None`

- `internal let getResp: None`

- `internal let getBody: None`

- `internal let got: None`

- `internal let createRespBody: None`

- `internal let updateBody: None`

- `internal let updateReq: None`

- `internal let updateResp: None`

- `internal let updateRespBody: None`

- `internal let updated: None`

- `internal let deleteResp: None`

- `internal let deleteBody: None`

- `internal let result: None`

- `internal let statsResp: None`

- `internal let statsBody: None`

- `internal let getResp2: None`

## usage example:

```cangjie
class TestNoteHTTPSAPI {
    var _server: ?NoteServer = None
    var _client: ?Client = None
    var _baseUrl: String = ""

    @BeforeAll
    func setup() {
        let certPem = String.fromUtf8(readToEnd(File("./certs/server.crt", Read)))
        let keyPem = String.fromUtf8(readToEnd(File("./certs/server.key", Read)))
        let caPem = String.fromUtf8(readToEnd(File("./certs/ca.crt", Read)))

        let service = NoteService()
        let server = NoteServer(service)
        server.startTls("127.0.0.1", 0, certPem, keyPem)
        _server = server
        _baseUrl = "https://127.0.0.1:${server.getPort()}"

        var tlsConfig = TlsClientConfig()
        tlsConfig.verifyMode = CustomCA(X509Certificate.decodeFromPem(caPem))
        _client = ClientBuilder().tlsConfig(tlsConfig).build()
```

# method TestNoteHTTPSAPI.func setup()

## function:

设置与 `setup` 相关的状态、配置或对象属性。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func setup() {
        let certPem = String.fromUtf8(readToEnd(File("./certs/server.crt", Read)))
        let keyPem = String.fromUtf8(readToEnd(File("./certs/server.key", Read)))
        let caPem = String.fromUtf8(readToEnd(File("./certs/ca.crt", Read)))

        let service = NoteService()
        let server = NoteServer(service)
        server.startTls("127.0.0.1", 0, certPem, keyPem)
        _server = server
        _baseUrl = "https://127.0.0.1:${server.getPort()}"
```

# method TestNoteHTTPSAPI.func teardown()

## function:

实现 `` 中的 `teardown` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func teardown() {
        if (let Some(c) <- _client) { c.close() }
        if (let Some(s) <- _server) { s.stop() }
    }

    @TestCase
    func testHttpsCreateNoteAPI() {
        let client = _client.getOrThrow()
        let body = ##"{"title":"HTTPS Note","content":"Created over TLS","tags":["https","secure"]}"##
        let resp = client.post("${_baseUrl}/api/notes", body)
        let respBody = StringReader(resp.body).readToEnd()
```

# method TestNoteHTTPSAPI.func testHttpsCreateNoteAPI()

## function:

实现 `` 中的 `testHttpsCreateNoteAPI` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testHttpsCreateNoteAPI() {
        let client = _client.getOrThrow()
        let body = ##"{"title":"HTTPS Note","content":"Created over TLS","tags":["https","secure"]}"##
        let resp = client.post("${_baseUrl}/api/notes", body)
        let respBody = StringReader(resp.body).readToEnd()
        @Assert(resp.status == 200)
        let obj = JsonValue.fromStr(respBody).asObject()
        @Assert(obj["title"].asString().getValue(), "HTTPS Note")
        @Assert(obj.containsKey("id"))
    }
```

# method TestNoteHTTPSAPI.func testHttpsListNotesAPI()

## function:

实现 `` 中的 `testHttpsListNotesAPI` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testHttpsListNotesAPI() {
        let client = _client.getOrThrow()
        // Create a note first
        let body = ##"{"title":"HTTPS List","content":"List over TLS","tags":["httpslist"]}"##
        let createResp = client.post("${_baseUrl}/api/notes", body)
        StringReader(createResp.body).readToEnd()

        // List
        let listResp = client.get("${_baseUrl}/api/notes")
        let listBody = StringReader(listResp.body).readToEnd()
        @Assert(listResp.status == 200)
```

# method TestNoteHTTPSAPI.func testHttpsGetNoteAPI()

## function:

实现 `` 中的 `testHttpsGetNoteAPI` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testHttpsGetNoteAPI() {
        let client = _client.getOrThrow()
        // Create
        let body = ##"{"title":"HTTPS Get","content":"Get via TLS","tags":["httpsget"]}"##
        let createResp = client.post("${_baseUrl}/api/notes", body)
        let createBody = StringReader(createResp.body).readToEnd()
        let created = JsonValue.fromStr(createBody).asObject()
        let id = created["id"].asInt().getValue()

        // Get
        let getResp = client.get("${_baseUrl}/api/note?id=${id}")
```

# method TestNoteHTTPSAPI.func testHttpsUpdateNoteAPI()

## function:

实现 `` 中的 `testHttpsUpdateNoteAPI` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testHttpsUpdateNoteAPI() {
        let client = _client.getOrThrow()
        // Create
        let createBody = ##"{"title":"HTTPS Update","content":"Old","tags":["httpsupd"]}"##
        let createResp = client.post("${_baseUrl}/api/notes", createBody)
        let createRespBody = StringReader(createResp.body).readToEnd()
        let created = JsonValue.fromStr(createRespBody).asObject()
        let id = created["id"].asInt().getValue()

        // Update
        let updateBody = ##"{"id":ID_PLACEHOLDER,"title":"HTTPS Updated","content":"New","tags":["httpsupd","done"]}"##
```

# method TestNoteHTTPSAPI.func testHttpsDeleteNoteAPI()

## function:

实现 `` 中的 `testHttpsDeleteNoteAPI` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testHttpsDeleteNoteAPI() {
        let client = _client.getOrThrow()
        // Create
        let body = ##"{"title":"HTTPS Del","content":"Delete via TLS","tags":["httpsdel"]}"##
        let createResp = client.post("${_baseUrl}/api/notes", body)
        let createRespBody = StringReader(createResp.body).readToEnd()
        let created = JsonValue.fromStr(createRespBody).asObject()
        let id = created["id"].asInt().getValue()

        // Delete
        let deleteResp = client.delete("${_baseUrl}/api/note?id=${id}")
```

# method TestNoteHTTPSAPI.func testHttpsGetStatsAPI()

## function:

实现 `` 中的 `testHttpsGetStatsAPI` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testHttpsGetStatsAPI() {
        let client = _client.getOrThrow()
        let body = ##"{"title":"HTTPS Stats","content":"Stats via TLS","tags":["httpsstat"]}"##
        let createResp = client.post("${_baseUrl}/api/notes", body)
        StringReader(createResp.body).readToEnd()

        let statsResp = client.get("${_baseUrl}/api/stats")
        let statsBody = StringReader(statsResp.body).readToEnd()
        @Assert(statsResp.status == 200)
        let obj = JsonValue.fromStr(statsBody).asObject()
        @Assert(obj.containsKey("total_notes"))
```

# method TestNoteHTTPSAPI.func testHttpsFullWorkflow()

## function:

实现 `` 中的 `testHttpsFullWorkflow` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testHttpsFullWorkflow() {
        let client = _client.getOrThrow()

        // 1. Create
        let createBody = ##"{"title":"HTTPS Workflow","content":"Full HTTPS test","tags":["https","e2e"]}"##
        let createResp = client.post("${_baseUrl}/api/notes", createBody)
        let createRespBody = StringReader(createResp.body).readToEnd()
        @Assert(createResp.status == 200)
        let created = JsonValue.fromStr(createRespBody).asObject()
        let id = created["id"].asInt().getValue()
```

# module tests/web_framework/project/src/container.cj

## function:

负责测试 `container` 相关功能是否符合预期。

## usage example:

```cangjie
# source: tests/web_framework/project/src/container.cj
```

## package:
web

## imports:

- `std.collection.*`

# class ServiceLifetime

## function:

Service lifetime for IoC container。

## kind:

enum

## access:

public

## extends:

none

## implements:

none

## usage example:

```cangjie
public enum ServiceLifetime {
    Singleton | Transient
}
```

# class ServiceContainer

## function:

IoC dependency injection container。

## kind:

class

## access:

public

## extends:

none

## implements:

none

## properties:

- `private let _factories: None`

- `private let _singletons: None`

- `private let _lifetimes: None`

- `internal let factory: None`

- `internal let instance: None`

- `internal let lifetime: None`

## usage example:

```cangjie
public class ServiceContainer {
    private let _factories = HashMap<String, () -> Object>()
    private let _singletons = HashMap<String, Object>()
    private let _lifetimes = HashMap<String, ServiceLifetime>()

    public init() {}

    // Register a service factory with the given lifetime
    public func register(name: String, factory: () -> Object, lifetime!: ServiceLifetime = Transient): Unit {
        _factories[name] = factory
        _lifetimes[name] = lifetime
        // Clear cached singleton if re-registering
        if (!_singletons.get(name).isNone()) {
            _singletons.remove(name)
        }
    }

    // Resolve a service by name; throws WebException if not registered
    public func resolve(name: String): Object {
        if (_factories.get(name).isNone()) {
```

# method ServiceContainer.func register(name: String, factory: ()

## function:

Register a service factory with the given lifetime。

## access:

public

## is_static:

False

## usage example:

```cangjie
public func register(name: String, factory: () -> Object, lifetime!: ServiceLifetime = Transient): Unit {
        _factories[name] = factory
        _lifetimes[name] = lifetime
        // Clear cached singleton if re-registering
        if (!_singletons.get(name).isNone()) {
            _singletons.remove(name)
        }
    }

    // Resolve a service by name; throws WebException if not registered
    public func resolve(name: String): Object {
```

# method ServiceContainer.func resolve(name: String): Object

## function:

Resolve a service by name; throws WebException if not registered。

## access:

public

## is_static:

False

## usage example:

```cangjie
public func resolve(name: String): Object {
        if (_factories.get(name).isNone()) {
            throw WebException("Service not found: ${name}")
        }
        let factory = _factories.get(name).getOrThrow()
        if (isSingleton(name)) {
            if (let Some(instance) <- _singletons.get(name)) {
                return instance
            }
            let instance = factory()
            _singletons[name] = instance
```

# method ServiceContainer.func resolveOrNone(name: String): ?Object

## function:

Safely resolve a service; returns None if not registered。

## access:

public

## is_static:

False

## usage example:

```cangjie
public func resolveOrNone(name: String): ?Object {
        if (!contains(name)) {
            return None
        }
        return resolve(name)
    }

    // Check if a service is registered
    public func contains(name: String): Bool {
        return !_factories.get(name).isNone()
    }
```

# method ServiceContainer.func contains(name: String): Bool

## function:

Check if a service is registered。

## access:

public

## is_static:

False

## usage example:

```cangjie
public func contains(name: String): Bool {
        return !_factories.get(name).isNone()
    }

    func isSingleton(name: String): Bool {
        let lifetime = _lifetimes.get(name).getOrThrow()
        match (lifetime) {
            case Singleton => true
            case Transient => false
        }
    }
```

# method ServiceContainer.func isSingleton(name: String): Bool

## function:

实现 `` 中的 `isSingleton` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func isSingleton(name: String): Bool {
        let lifetime = _lifetimes.get(name).getOrThrow()
        match (lifetime) {
            case Singleton => true
            case Transient => false
        }
    }
}
```

# module tests/web_framework/project/src/context.cj

## function:

负责测试 `context` 相关功能是否符合预期。

## usage example:

```cangjie
# source: tests/web_framework/project/src/context.cj
```

## package:
web

## imports:

- `std.collection.*`

# class WebException

## function:

Custom exception for web framework errors。

## kind:

class

## access:

public

## extends:

none

## implements:

none

## usage example:

```cangjie
public class WebException <: Exception {
    public init(message: String) {
        super(message)
    }
}
```

# class HttpMethod

## function:

HTTP method enum with string parsing support。

## kind:

enum

## access:

public

## extends:

none

## implements:

none

## properties:

- `internal let upper: None`

## usage example:

```cangjie
public enum HttpMethod <: Equatable<HttpMethod> & ToString {
    GET | POST | PUT | DELETE | PATCH

    public operator func ==(other: HttpMethod): Bool {
        match ((this, other)) {
            case (GET, GET) => true
            case (POST, POST) => true
            case (PUT, PUT) => true
            case (DELETE, DELETE) => true
            case (PATCH, PATCH) => true
            case _ => false
        }
    }

    public operator func !=(other: HttpMethod): Bool {
        return !(this == other)
    }

    public func toString(): String {
        match (this) {
```

# method HttpMethod.func toString(): String

## function:

实现 `` 中的 `toString` 逻辑，是该模块中的可调用函数单元。

## access:

public

## is_static:

False

## usage example:

```cangjie
public func toString(): String {
        match (this) {
            case GET => "GET"
            case POST => "POST"
            case PUT => "PUT"
            case DELETE => "DELETE"
            case PATCH => "PATCH"
        }
    }

    // Parse HTTP method from string (case-insensitive)
```

# method HttpMethod.func fromString(s: String): HttpMethod

## function:

Parse HTTP method from string (case-insensitive)。

## access:

public

## is_static:

True

## usage example:

```cangjie
public static func fromString(s: String): HttpMethod {
        let upper = s.toAsciiUpper()
        if (upper == "GET") { return GET }
        if (upper == "POST") { return POST }
        if (upper == "PUT") { return PUT }
        if (upper == "DELETE") { return DELETE }
        if (upper == "PATCH") { return PATCH }
        throw WebException("Unknown HTTP method: ${s}")
    }
}
```

# class Request

## function:

HTTP request with automatic query string parsing。

## kind:

class

## access:

public

## extends:

none

## implements:

none

## properties:

- `public var method: HttpMethod`

- `public var path: String`

- `public var headers: HashMap<String,`

- `public var body: String`

- `public var pathParams: HashMap<String,`

- `public var queryParams: HashMap<String,`

## usage example:

```cangjie
public class Request {
    public var method: HttpMethod
    public var path: String
    public var headers: HashMap<String, String>
    public var body: String
    public var pathParams: HashMap<String, String>
    public var queryParams: HashMap<String, String>

    public init(method: HttpMethod, path: String) {
        this.method = method
        this.body = ""
        this.headers = HashMap<String, String>()
        this.pathParams = HashMap<String, String>()
        this.queryParams = HashMap<String, String>()
        this.path = extractPath(path, this.queryParams)
    }

    public init(method: HttpMethod, path: String, body: String) {
        this.method = method
        this.body = body
```

# method Request.func param(name: String): ?String

## function:

Convenience: get path parameter by name。

## access:

public

## is_static:

False

## usage example:

```cangjie
public func param(name: String): ?String {
        return pathParams.get(name)
    }

    // Convenience: get query parameter by name
    public func query(name: String): ?String {
        return queryParams.get(name)
    }

    // Convenience: get header by name
    public func header(name: String): ?String {
```

# method Request.func query(name: String): ?String

## function:

Convenience: get query parameter by name。

## access:

public

## is_static:

False

## usage example:

```cangjie
public func query(name: String): ?String {
        return queryParams.get(name)
    }

    // Convenience: get header by name
    public func header(name: String): ?String {
        return headers.get(name)
    }
}

// HTTP response with fluent API and content-type helpers
```

# method Request.func header(name: String): ?String

## function:

Convenience: get header by name。

## access:

public

## is_static:

False

## usage example:

```cangjie
public func header(name: String): ?String {
        return headers.get(name)
    }
}

// HTTP response with fluent API and content-type helpers
public class Response {
    public var statusCode: Int64
    public var headers: HashMap<String, String>
    public var body: String
```

# class Response

## function:

HTTP response with fluent API and content-type helpers。

## kind:

class

## access:

public

## extends:

none

## implements:

none

## properties:

- `public var statusCode: Int64`

- `public var headers: HashMap<String,`

- `public var body: String`

## usage example:

```cangjie
public class Response {
    public var statusCode: Int64
    public var headers: HashMap<String, String>
    public var body: String

    public init() {
        this.statusCode = 200
        this.headers = HashMap<String, String>()
        this.body = ""
    }

    // Set a response header
    public func setHeader(name: String, value: String): Unit {
        headers[name] = value
    }

    // Fluent: set status code and return self for chaining
    public func status(code: Int64): Response {
        this.statusCode = code
        return this
```

# method Response.func setHeader(name: String, value: String): Unit

## function:

Set a response header。

## access:

public

## is_static:

False

## usage example:

```cangjie
public func setHeader(name: String, value: String): Unit {
        headers[name] = value
    }

    // Fluent: set status code and return self for chaining
    public func status(code: Int64): Response {
        this.statusCode = code
        return this
    }

    // Set JSON response body with Content-Type
```

# method Response.func status(code: Int64): Response

## function:

Fluent: set status code and return self for chaining。

## access:

public

## is_static:

False

## usage example:

```cangjie
public func status(code: Int64): Response {
        this.statusCode = code
        return this
    }

    // Set JSON response body with Content-Type
    public func json(data: String): Unit {
        headers["Content-Type"] = "application/json"
        this.body = data
    }
```

# method Response.func json(data: String): Unit

## function:

Set JSON response body with Content-Type。

## access:

public

## is_static:

False

## usage example:

```cangjie
public func json(data: String): Unit {
        headers["Content-Type"] = "application/json"
        this.body = data
    }

    // Set plain text response body with Content-Type
    public func text(data: String): Unit {
        headers["Content-Type"] = "text/plain"
        this.body = data
    }
```

# method Response.func text(data: String): Unit

## function:

Set plain text response body with Content-Type。

## access:

public

## is_static:

False

## usage example:

```cangjie
public func text(data: String): Unit {
        headers["Content-Type"] = "text/plain"
        this.body = data
    }

    // Set HTML response body with Content-Type
    public func html(data: String): Unit {
        headers["Content-Type"] = "text/html"
        this.body = data
    }
}
```

# method Response.func html(data: String): Unit

## function:

Set HTML response body with Content-Type。

## access:

public

## is_static:

False

## usage example:

```cangjie
public func html(data: String): Unit {
        headers["Content-Type"] = "text/html"
        this.body = data
    }
}

// HTTP context wrapping request, response, and services
public class HttpContext {
    public let request: Request
    public let response: Response
    public let services: ServiceContainer
```

# class HttpContext

## function:

HTTP context wrapping request, response, and services。

## kind:

class

## access:

public

## extends:

none

## implements:

none

## properties:

- `public let request: Request`

- `public let response: Response`

- `public let services: ServiceContainer`

## usage example:

```cangjie
public class HttpContext {
    public let request: Request
    public let response: Response
    public let services: ServiceContainer

    public init(request: Request, response: Response, services: ServiceContainer) {
        this.request = request
        this.response = response
        this.services = services
    }
}
```

# func func extractPath(rawPath: String, params: HashMap<String, String>): String

## function:

Parse raw path and extract query parameters into the provided map e.g. "/search?q=hello&page=1" -> returns "/search", fills {q: "hello", page: "1"}。

## access:

internal

## usage example:

```cangjie
func extractPath(rawPath: String, params: HashMap<String, String>): String {
    if (let Some(idx) <- rawPath.indexOf("?")) {
        if (idx + 1 < rawPath.size) {
            parseQueryPairs(rawPath[(idx + 1)..rawPath.size], params)
        }
        return rawPath[0..idx]
    }
    return rawPath
}

// Parse "key1=val1&key2=val2" into the provided map
```

# func func parseQueryPairs(queryStr: String, params: HashMap<String, String>): Unit

## function:

Parse "key1=val1&key2=val2" into the provided map。

## access:

internal

## usage example:

```cangjie
func parseQueryPairs(queryStr: String, params: HashMap<String, String>): Unit {
    for (pair in queryStr.split("&", removeEmpty: true)) {
        if (let Some(eqIdx) <- pair.indexOf("=")) {
            let key = pair[0..eqIdx]
            var value = ""
            if (eqIdx + 1 < pair.size) {
                value = pair[(eqIdx + 1)..pair.size]
            }
            params[key] = value
        } else {
            params[pair] = ""
```

# let key

## function:

`key` 是不可变变量，类型为 `None`，用于保存常量值或不可变引用。

## access:

internal

## usage example:

```cangjie
let key = pair[0..eqIdx]
```

# var value

## function:

`value` 是可变变量，类型为 `None`，用于保存运行时状态或可变数据。

## access:

internal

## usage example:

```cangjie
var value = ""
```

# module tests/web_framework/project/src/main.cj

## function:

负责测试 `main` 相关功能是否符合预期。

## usage example:

```cangjie
# source: tests/web_framework/project/src/main.cj
```

## package:
web

## imports:

- `std.collection.*`

- `std.convert.*`

# class Todo

## function:

===== Domain Model =====。

## kind:

class

## access:

internal

## extends:

none

## implements:

none

## properties:

- `public var id: Int64`

- `public var title: String`

- `public var completed: Bool`

- `internal var status: None`

## usage example:

```cangjie
class Todo {
    public var id: Int64
    public var title: String
    public var completed: Bool

    public init(id: Int64, title: String) {
        this.id = id
        this.title = title
        this.completed = false
    }

    public func toJson(): String {
        var status = "false"
        if (completed) {
            status = "true"
        }
        return "{\"id\":${id},\"title\":\"${title}\",\"completed\":${status}}"
    }
}
```

# method Todo.func toJson(): String

## function:

实现 `` 中的 `toJson` 逻辑，是该模块中的可调用函数单元。

## access:

public

## is_static:

False

## usage example:

```cangjie
public func toJson(): String {
        var status = "false"
        if (completed) {
            status = "true"
        }
        return "{\"id\":${id},\"title\":\"${title}\",\"completed\":${status}}"
    }
}

// ===== Service Layer =====
```

# class TodoService

## function:

===== Service Layer =====。

## kind:

class

## access:

internal

## extends:

none

## implements:

none

## properties:

- `internal let _todos: None`

- `internal var _nextId: Int64`

- `internal let todo: None`

## usage example:

```cangjie
class TodoService {
    let _todos = ArrayList<Todo>()
    var _nextId: Int64 = 1

    public func findAll(): ArrayList<Todo> {
        return _todos
    }

    public func findById(id: Int64): ?Todo {
        for (t in _todos) {
            if (t.id == id) {
                return t
            }
        }
        return None
    }

    public func create(title: String): Todo {
        let todo = Todo(_nextId, title)
        _nextId++
```

# method TodoService.func findAll(): ArrayList<Todo>

## function:

实现 `` 中的 `findAll` 逻辑，是该模块中的可调用函数单元。

## access:

public

## is_static:

False

## usage example:

```cangjie
public func findAll(): ArrayList<Todo> {
        return _todos
    }

    public func findById(id: Int64): ?Todo {
        for (t in _todos) {
            if (t.id == id) {
                return t
            }
        }
        return None
```

# method TodoService.func findById(id: Int64): ?Todo

## function:

实现 `` 中的 `findById` 逻辑，是该模块中的可调用函数单元。

## access:

public

## is_static:

False

## usage example:

```cangjie
public func findById(id: Int64): ?Todo {
        for (t in _todos) {
            if (t.id == id) {
                return t
            }
        }
        return None
    }

    public func create(title: String): Todo {
        let todo = Todo(_nextId, title)
```

# method TodoService.func create(title: String): Todo

## function:

实现 `` 中的 `create` 逻辑，是该模块中的可调用函数单元。

## access:

public

## is_static:

False

## usage example:

```cangjie
public func create(title: String): Todo {
        let todo = Todo(_nextId, title)
        _nextId++
        _todos.add(todo)
        return todo
    }

    public func deleteById(id: Int64): Bool {
        for (i in 0.._todos.size) {
            if (_todos[i].id == id) {
                _todos.remove(i..(i + 1))
```

# method TodoService.func deleteById(id: Int64): Bool

## function:

实现 `` 中的 `deleteById` 逻辑，是该模块中的可调用函数单元。

## access:

public

## is_static:

False

## usage example:

```cangjie
public func deleteById(id: Int64): Bool {
        for (i in 0.._todos.size) {
            if (_todos[i].id == id) {
                _todos.remove(i..(i + 1))
                return true
            }
        }
        return false
    }
}
```

# func func simulate(app: WebApp, method: HttpMethod, path: String, body!: String = ""): Unit

## function:

实现 `` 中的 `simulate` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## usage example:

```cangjie
func simulate(app: WebApp, method: HttpMethod, path: String, body!: String = ""): Unit {
    var req = Request(method, path)
    if (!body.isEmpty()) {
        req = Request(method, path, body)
    }
    let ctx = HttpContext(req, Response(), app.services)
    app.handleRequest(ctx)
    println("  Body: ${ctx.response.body}")
    println()
}
```

# let app

## function:

`app` 是不可变变量，类型为 `None`，用于保存常量值或不可变引用。

## access:

internal

## usage example:

```cangjie
let app = WebApp()
```

# let api

## function:

`api` 是不可变变量，类型为 `None`，用于保存常量值或不可变引用。

## access:

internal

## usage example:

```cangjie
let api = app.group("/api")
```

# let svc

## function:

`svc` 是不可变变量，类型为 `None`，用于保存常量值或不可变引用。

## access:

internal

## usage example:

```cangjie
let svc = (ctx.services.resolve("todoService") as TodoService).getOrThrow()
```

# let todos

## function:

`todos` 是不可变变量，类型为 `None`，用于保存常量值或不可变引用。

## access:

internal

## usage example:

```cangjie
let todos = svc.findAll()
```

# let sb

## function:

`sb` 是不可变变量，类型为 `None`，用于保存常量值或不可变引用。

## access:

internal

## usage example:

```cangjie
let sb = StringBuilder()
```

# let idStr

## function:

`idStr` 是不可变变量，类型为 `None`，用于保存常量值或不可变引用。

## access:

internal

## usage example:

```cangjie
let idStr = ctx.request.param("id").getOrThrow()
```

# let id

## function:

`id` 是不可变变量，类型为 `None`，用于保存常量值或不可变引用。

## access:

internal

## usage example:

```cangjie
let id = Int64.parse(idStr)
```

# let title

## function:

`title` 是不可变变量，类型为 `None`，用于保存常量值或不可变引用。

## access:

internal

## usage example:

```cangjie
let title = ctx.request.body
```

# let todo

## function:

`todo` 是不可变变量，类型为 `None`，用于保存常量值或不可变引用。

## access:

internal

## usage example:

```cangjie
let todo = svc.create(title)
```

# var req

## function:

`req` 是可变变量，类型为 `None`，用于保存运行时状态或可变数据。

## access:

internal

## usage example:

```cangjie
var req = Request(method, path)
```

# let ctx

## function:

`ctx` 是不可变变量，类型为 `None`，用于保存常量值或不可变引用。

## access:

internal

## usage example:

```cangjie
let ctx = HttpContext(req, Response(), app.services)
```

# module tests/web_framework/project/src/router.cj

## function:

负责测试 `router` 相关功能是否符合预期。

## usage example:

```cangjie
# source: tests/web_framework/project/src/router.cj
```

## package:
web

## imports:

- `std.collection.*`

# class RouteMatch

## function:

Result of a route match。

## kind:

class

## access:

public

## extends:

none

## implements:

none

## properties:

- `public let handler: (HttpContext)`

- `public let params: HashMap<String,`

## usage example:

```cangjie
public class RouteMatch {
    public let handler: (HttpContext) -> Unit
    public let params: HashMap<String, String>

    public init(handler: (HttpContext) -> Unit, params: HashMap<String, String>) {
        this.handler = handler
        this.params = params
    }
}
```

# class RouteEntry

## function:

Internal route entry。

## kind:

class

## access:

internal

## extends:

none

## implements:

none

## properties:

- `internal let method: HttpMethod`

- `internal let segments: ArrayList<String>`

- `internal let handler: (HttpContext)`

## usage example:

```cangjie
class RouteEntry {
    let method: HttpMethod
    let segments: ArrayList<String>
    let handler: (HttpContext) -> Unit

    init(method: HttpMethod, pattern: String, handler: (HttpContext) -> Unit) {
        this.method = method
        this.handler = handler
        this.segments = ArrayList<String>()
        for (s in pattern.split("/", removeEmpty: true)) {
            segments.add(s)
        }
    }
}
```

# class Router

## function:

Router with path parameter support。

## kind:

class

## access:

public

## extends:

none

## implements:

none

## properties:

- `internal let _routes: None`

- `internal let pathSegments: None`

- `internal let params: None`

- `internal let rs: None`

- `internal let ps: None`

## usage example:

```cangjie
public class Router {
    let _routes = ArrayList<RouteEntry>()

    public init() {}

    // Register a route
    public func addRoute(method: HttpMethod, pattern: String, handler: (HttpContext) -> Unit): Unit {
        _routes.add(RouteEntry(method, pattern, handler))
    }

    // Find a matching route for the given method and path
    public func findRoute(method: HttpMethod, path: String): ?RouteMatch {
        let pathSegments = ArrayList<String>()
        for (s in path.split("/", removeEmpty: true)) {
            pathSegments.add(s)
        }

        for (route in _routes) {
            if (route.method != method) {
                continue
```

# method Router.func addRoute(method: HttpMethod, pattern: String, handler: (HttpContext)

## function:

Register a route。

## access:

public

## is_static:

False

## usage example:

```cangjie
public func addRoute(method: HttpMethod, pattern: String, handler: (HttpContext) -> Unit): Unit {
        _routes.add(RouteEntry(method, pattern, handler))
    }

    // Find a matching route for the given method and path
    public func findRoute(method: HttpMethod, path: String): ?RouteMatch {
        let pathSegments = ArrayList<String>()
        for (s in path.split("/", removeEmpty: true)) {
            pathSegments.add(s)
        }
```

# method Router.func findRoute(method: HttpMethod, path: String): ?RouteMatch

## function:

Find a matching route for the given method and path。

## access:

public

## is_static:

False

## usage example:

```cangjie
public func findRoute(method: HttpMethod, path: String): ?RouteMatch {
        let pathSegments = ArrayList<String>()
        for (s in path.split("/", removeEmpty: true)) {
            pathSegments.add(s)
        }

        for (route in _routes) {
            if (route.method != method) {
                continue
            }
            if (let Some(params) <- matchSegments(route.segments, pathSegments)) {
```

# method Router.func matchSegments(routeSegs: ArrayList<String>, pathSegs: ArrayList<String>): ?HashMap<String,

## function:

Match route segments against path segments, extracting :param values。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func matchSegments(routeSegs: ArrayList<String>, pathSegs: ArrayList<String>): ?HashMap<String, String> {
        if (routeSegs.size != pathSegs.size) {
            return None
        }
        let params = HashMap<String, String>()
        for (i in 0..routeSegs.size) {
            let rs = routeSegs[i]
            let ps = pathSegs[i]
            if (rs.startsWith(":")) {
                params[rs[1..rs.size]] = ps
            } else if (rs != ps) {
```

# class RouteGroup

## function:

Route group with a shared path prefix。

## kind:

class

## access:

public

## extends:

none

## implements:

none

## properties:

- `internal let _router: Router`

- `internal let _prefix: String`

## usage example:

```cangjie
public class RouteGroup {
    let _router: Router
    let _prefix: String

    init(router: Router, prefix: String) {
        _router = router
        _prefix = prefix
    }

    public func get(pattern: String, handler: (HttpContext) -> Unit): Unit {
        _router.addRoute(HttpMethod.GET, _prefix + pattern, handler)
    }

    public func post(pattern: String, handler: (HttpContext) -> Unit): Unit {
        _router.addRoute(HttpMethod.POST, _prefix + pattern, handler)
    }

    public func put(pattern: String, handler: (HttpContext) -> Unit): Unit {
        _router.addRoute(HttpMethod.PUT, _prefix + pattern, handler)
    }
```

# method RouteGroup.func get(pattern: String, handler: (HttpContext)

## function:

获取与 `get` 相关的数据或对象，供项目内部逻辑调用。

## access:

public

## is_static:

False

## usage example:

```cangjie
public func get(pattern: String, handler: (HttpContext) -> Unit): Unit {
        _router.addRoute(HttpMethod.GET, _prefix + pattern, handler)
    }

    public func post(pattern: String, handler: (HttpContext) -> Unit): Unit {
        _router.addRoute(HttpMethod.POST, _prefix + pattern, handler)
    }

    public func put(pattern: String, handler: (HttpContext) -> Unit): Unit {
        _router.addRoute(HttpMethod.PUT, _prefix + pattern, handler)
    }
```

# method RouteGroup.func post(pattern: String, handler: (HttpContext)

## function:

实现 `` 中的 `post` 逻辑，是该模块中的可调用函数单元。

## access:

public

## is_static:

False

## usage example:

```cangjie
public func post(pattern: String, handler: (HttpContext) -> Unit): Unit {
        _router.addRoute(HttpMethod.POST, _prefix + pattern, handler)
    }

    public func put(pattern: String, handler: (HttpContext) -> Unit): Unit {
        _router.addRoute(HttpMethod.PUT, _prefix + pattern, handler)
    }

    public func delete(pattern: String, handler: (HttpContext) -> Unit): Unit {
        _router.addRoute(HttpMethod.DELETE, _prefix + pattern, handler)
    }
```

# method RouteGroup.func put(pattern: String, handler: (HttpContext)

## function:

实现 `` 中的 `put` 逻辑，是该模块中的可调用函数单元。

## access:

public

## is_static:

False

## usage example:

```cangjie
public func put(pattern: String, handler: (HttpContext) -> Unit): Unit {
        _router.addRoute(HttpMethod.PUT, _prefix + pattern, handler)
    }

    public func delete(pattern: String, handler: (HttpContext) -> Unit): Unit {
        _router.addRoute(HttpMethod.DELETE, _prefix + pattern, handler)
    }
}
```

# method RouteGroup.func delete(pattern: String, handler: (HttpContext)

## function:

实现 `` 中的 `delete` 逻辑，是该模块中的可调用函数单元。

## access:

public

## is_static:

False

## usage example:

```cangjie
public func delete(pattern: String, handler: (HttpContext) -> Unit): Unit {
        _router.addRoute(HttpMethod.DELETE, _prefix + pattern, handler)
    }
}
```

# module tests/web_framework/project/src/web_app.cj

## function:

负责测试 `web_app` 相关功能是否符合预期。

## usage example:

```cangjie
# source: tests/web_framework/project/src/web_app.cj
```

## package:
web

## imports:

- `std.collection.*`

# class WebApp

## function:

WebApp: main application class combining IoC, routing, and middleware。

## kind:

class

## access:

public

## extends:

none

## implements:

none

## properties:

- `public let services: ServiceContainer`

- `internal let _router: Router`

- `internal let _middlewares: None`

- `internal let matchResult: None`

- `internal var handler: (HttpContext)`

- `internal var current: None`

- `internal var i: None`

- `internal let mw: None`

- `internal let next: None`

## usage example:

```cangjie
public class WebApp {
    public let services: ServiceContainer = ServiceContainer()
    let _router: Router = Router()
    let _middlewares = ArrayList<(HttpContext, () -> Unit) -> Unit>()

    public init() {}

    // Register a middleware function
    public func use(middleware: (HttpContext, () -> Unit) -> Unit): Unit {
        _middlewares.add(middleware)
    }

    // Register a route for any HTTP method
    public func route(method: HttpMethod, pattern: String, handler: (HttpContext) -> Unit): Unit {
        _router.addRoute(method, pattern, handler)
    }

    // Convenience methods for common HTTP methods
    public func get(pattern: String, handler: (HttpContext) -> Unit): Unit {
        route(HttpMethod.GET, pattern, handler)
```

# method WebApp.func use(middleware: (HttpContext, ()

## function:

Register a middleware function。

## access:

public

## is_static:

False

## usage example:

```cangjie
public func use(middleware: (HttpContext, () -> Unit) -> Unit): Unit {
        _middlewares.add(middleware)
    }

    // Register a route for any HTTP method
    public func route(method: HttpMethod, pattern: String, handler: (HttpContext) -> Unit): Unit {
        _router.addRoute(method, pattern, handler)
    }

    // Convenience methods for common HTTP methods
    public func get(pattern: String, handler: (HttpContext) -> Unit): Unit {
```

# method WebApp.func route(method: HttpMethod, pattern: String, handler: (HttpContext)

## function:

Register a route for any HTTP method。

## access:

public

## is_static:

False

## usage example:

```cangjie
public func route(method: HttpMethod, pattern: String, handler: (HttpContext) -> Unit): Unit {
        _router.addRoute(method, pattern, handler)
    }

    // Convenience methods for common HTTP methods
    public func get(pattern: String, handler: (HttpContext) -> Unit): Unit {
        route(HttpMethod.GET, pattern, handler)
    }

    public func post(pattern: String, handler: (HttpContext) -> Unit): Unit {
        route(HttpMethod.POST, pattern, handler)
```

# method WebApp.func get(pattern: String, handler: (HttpContext)

## function:

Convenience methods for common HTTP methods。

## access:

public

## is_static:

False

## usage example:

```cangjie
public func get(pattern: String, handler: (HttpContext) -> Unit): Unit {
        route(HttpMethod.GET, pattern, handler)
    }

    public func post(pattern: String, handler: (HttpContext) -> Unit): Unit {
        route(HttpMethod.POST, pattern, handler)
    }

    public func put(pattern: String, handler: (HttpContext) -> Unit): Unit {
        route(HttpMethod.PUT, pattern, handler)
    }
```

# method WebApp.func post(pattern: String, handler: (HttpContext)

## function:

实现 `` 中的 `post` 逻辑，是该模块中的可调用函数单元。

## access:

public

## is_static:

False

## usage example:

```cangjie
public func post(pattern: String, handler: (HttpContext) -> Unit): Unit {
        route(HttpMethod.POST, pattern, handler)
    }

    public func put(pattern: String, handler: (HttpContext) -> Unit): Unit {
        route(HttpMethod.PUT, pattern, handler)
    }

    public func delete(pattern: String, handler: (HttpContext) -> Unit): Unit {
        route(HttpMethod.DELETE, pattern, handler)
    }
```

# method WebApp.func put(pattern: String, handler: (HttpContext)

## function:

实现 `` 中的 `put` 逻辑，是该模块中的可调用函数单元。

## access:

public

## is_static:

False

## usage example:

```cangjie
public func put(pattern: String, handler: (HttpContext) -> Unit): Unit {
        route(HttpMethod.PUT, pattern, handler)
    }

    public func delete(pattern: String, handler: (HttpContext) -> Unit): Unit {
        route(HttpMethod.DELETE, pattern, handler)
    }

    // Create a route group with a shared path prefix
    public func group(prefix: String): RouteGroup {
        return RouteGroup(_router, prefix)
```

# method WebApp.func delete(pattern: String, handler: (HttpContext)

## function:

实现 `` 中的 `delete` 逻辑，是该模块中的可调用函数单元。

## access:

public

## is_static:

False

## usage example:

```cangjie
public func delete(pattern: String, handler: (HttpContext) -> Unit): Unit {
        route(HttpMethod.DELETE, pattern, handler)
    }

    // Create a route group with a shared path prefix
    public func group(prefix: String): RouteGroup {
        return RouteGroup(_router, prefix)
    }

    // Process a request through the middleware pipeline and route handler
    public func handleRequest(ctx: HttpContext): Unit {
```

# method WebApp.func group(prefix: String): RouteGroup

## function:

Create a route group with a shared path prefix。

## access:

public

## is_static:

False

## usage example:

```cangjie
public func group(prefix: String): RouteGroup {
        return RouteGroup(_router, prefix)
    }

    // Process a request through the middleware pipeline and route handler
    public func handleRequest(ctx: HttpContext): Unit {
        let matchResult = _router.findRoute(ctx.request.method, ctx.request.path)

        var handler: (HttpContext) -> Unit = { c: HttpContext =>
            c.response.statusCode = 404
            c.response.body = "Not Found"
```

# method WebApp.func handleRequest(ctx: HttpContext): Unit

## function:

Process a request through the middleware pipeline and route handler。

## access:

public

## is_static:

False

## usage example:

```cangjie
public func handleRequest(ctx: HttpContext): Unit {
        let matchResult = _router.findRoute(ctx.request.method, ctx.request.path)

        var handler: (HttpContext) -> Unit = { c: HttpContext =>
            c.response.statusCode = 404
            c.response.body = "Not Found"
        }

        if (let Some(rm) <- matchResult) {
            for ((k, v) in rm.params) {
                ctx.request.pathParams[k] = v
```

# module tests/web_framework/project/src/web_test.cj

## function:

负责测试 `web_test` 相关功能是否符合预期。

## usage example:

```cangjie
# source: tests/web_framework/project/src/web_test.cj
```

## package:
web

## imports:

- `std.collection.*`

# class CounterService

## function:

===== Test helper services =====。

## kind:

class

## access:

internal

## extends:

none

## implements:

none

## properties:

- `internal var count: Int64`

## usage example:

```cangjie
class CounterService {
    var count: Int64 = 0
    public func increment(): Unit { count++ }
    public func getCount(): Int64 { return count }
}
```

# method CounterService.func increment(): Unit

## function:

实现 `` 中的 `increment` 逻辑，是该模块中的可调用函数单元。

## access:

public

## is_static:

False

## usage example:

```cangjie
public func increment(): Unit { count++ }
    public func getCount(): Int64 { return count }
}

class MessageService {
    let message: String
    public init(msg: String) { message = msg }
    public func getMessage(): String { return message }
}

// ===== IoC Container Tests =====
```

# method CounterService.func getCount(): Int64

## function:

获取与 `getCount` 相关的数据或对象，供项目内部逻辑调用。

## access:

public

## is_static:

False

## usage example:

```cangjie
public func getCount(): Int64 { return count }
}

class MessageService {
    let message: String
    public init(msg: String) { message = msg }
    public func getMessage(): String { return message }
}

// ===== IoC Container Tests =====
```

# class MessageService

## function:

封装业务逻辑，提供 `MessageService` 相关的服务功能。

## kind:

class

## access:

internal

## extends:

none

## implements:

none

## properties:

- `internal let message: String`

## usage example:

```cangjie
class MessageService {
    let message: String
    public init(msg: String) { message = msg }
    public func getMessage(): String { return message }
}
```

# method MessageService.func getMessage(): String

## function:

获取与 `getMessage` 相关的数据或对象，供项目内部逻辑调用。

## access:

public

## is_static:

False

## usage example:

```cangjie
public func getMessage(): String { return message }
}

// ===== IoC Container Tests =====

@Test
class TestServiceContainer {
    @TestCase
    func testRegisterAndResolve() {
        let container = ServiceContainer()
        container.register("counter", { => CounterService() })
```

# class TestServiceContainer

## function:

封装业务逻辑，提供 `TestServiceContainer` 相关的服务功能。

## kind:

class

## access:

internal

## extends:

none

## implements:

none

## properties:

- `internal let container: None`

- `internal let service: None`

- `internal let s1: None`

- `internal let s2: None`

- `internal let counter: None`

## usage example:

```cangjie
class TestServiceContainer {
    @TestCase
    func testRegisterAndResolve() {
        let container = ServiceContainer()
        container.register("counter", { => CounterService() })
        let service = container.resolve("counter")
        @Assert(service is CounterService)
    }

    @TestCase
    func testSingletonReturnsSameInstance() {
        let container = ServiceContainer()
        container.register("counter", { => CounterService() }, lifetime: Singleton)
        let s1 = (container.resolve("counter") as CounterService).getOrThrow()
        s1.increment()
        s1.increment()
        let s2 = (container.resolve("counter") as CounterService).getOrThrow()
        @Assert(s2.getCount(), 2)
    }
```

# method TestServiceContainer.func testRegisterAndResolve()

## function:

实现 `` 中的 `testRegisterAndResolve` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testRegisterAndResolve() {
        let container = ServiceContainer()
        container.register("counter", { => CounterService() })
        let service = container.resolve("counter")
        @Assert(service is CounterService)
    }

    @TestCase
    func testSingletonReturnsSameInstance() {
        let container = ServiceContainer()
        container.register("counter", { => CounterService() }, lifetime: Singleton)
```

# method TestServiceContainer.func testSingletonReturnsSameInstance()

## function:

实现 `` 中的 `testSingletonReturnsSameInstance` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testSingletonReturnsSameInstance() {
        let container = ServiceContainer()
        container.register("counter", { => CounterService() }, lifetime: Singleton)
        let s1 = (container.resolve("counter") as CounterService).getOrThrow()
        s1.increment()
        s1.increment()
        let s2 = (container.resolve("counter") as CounterService).getOrThrow()
        @Assert(s2.getCount(), 2)
    }

    @TestCase
```

# method TestServiceContainer.func testTransientCreatesNewInstance()

## function:

实现 `` 中的 `testTransientCreatesNewInstance` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testTransientCreatesNewInstance() {
        let container = ServiceContainer()
        container.register("counter", { => CounterService() }, lifetime: Transient)
        let s1 = (container.resolve("counter") as CounterService).getOrThrow()
        s1.increment()
        let s2 = (container.resolve("counter") as CounterService).getOrThrow()
        @Assert(s2.getCount(), 0)
    }

    @TestCase
    func testResolveUnknownThrows() {
```

# method TestServiceContainer.func testResolveUnknownThrows()

## function:

实现 `` 中的 `testResolveUnknownThrows` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testResolveUnknownThrows() {
        let container = ServiceContainer()
        try {
            container.resolve("unknown")
            @Fail("Should have thrown")
        } catch (e: WebException) {
            @Assert(true)
        }
    }

    @TestCase
```

# method TestServiceContainer.func testResolveOrNone()

## function:

实现 `` 中的 `testResolveOrNone` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testResolveOrNone() {
        let container = ServiceContainer()
        @Assert(container.resolveOrNone("unknown").isNone())
        container.register("msg", { => MessageService("hi") })
        @Assert(!container.resolveOrNone("msg").isNone())
    }

    @TestCase
    func testContainsRegistered() {
        let container = ServiceContainer()
        container.register("counter", { => CounterService() })
```

# method TestServiceContainer.func testContainsRegistered()

## function:

实现 `` 中的 `testContainsRegistered` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testContainsRegistered() {
        let container = ServiceContainer()
        container.register("counter", { => CounterService() })
        @Assert(container.contains("counter"))
    }

    @TestCase
    func testContainsUnregistered() {
        let container = ServiceContainer()
        @Assert(!container.contains("unknown"))
    }
```

# method TestServiceContainer.func testContainsUnregistered()

## function:

实现 `` 中的 `testContainsUnregistered` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testContainsUnregistered() {
        let container = ServiceContainer()
        @Assert(!container.contains("unknown"))
    }

    @TestCase
    func testOverrideRegistration() {
        let container = ServiceContainer()
        container.register("msg", { => MessageService("old") }, lifetime: Singleton)
        let s1 = (container.resolve("msg") as MessageService).getOrThrow()
        @Assert(s1.getMessage(), "old")
```

# method TestServiceContainer.func testOverrideRegistration()

## function:

实现 `` 中的 `testOverrideRegistration` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testOverrideRegistration() {
        let container = ServiceContainer()
        container.register("msg", { => MessageService("old") }, lifetime: Singleton)
        let s1 = (container.resolve("msg") as MessageService).getOrThrow()
        @Assert(s1.getMessage(), "old")
        container.register("msg", { => MessageService("new") }, lifetime: Singleton)
        let s2 = (container.resolve("msg") as MessageService).getOrThrow()
        @Assert(s2.getMessage(), "new")
    }

    @TestCase
```

# method TestServiceContainer.func testMultipleServices()

## function:

实现 `` 中的 `testMultipleServices` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testMultipleServices() {
        let container = ServiceContainer()
        container.register("counter", { => CounterService() })
        container.register("msg", { => MessageService("hello") })
        @Assert(container.contains("counter"))
        @Assert(container.contains("msg"))
        @Assert(container.resolve("counter") is CounterService)
        @Assert((container.resolve("msg") as MessageService).getOrThrow().getMessage(), "hello")
    }

    @TestCase
```

# method TestServiceContainer.func testSingletonIsLazy()

## function:

实现 `` 中的 `testSingletonIsLazy` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testSingletonIsLazy() {
        let counter = CounterService()
        let container = ServiceContainer()
        container.register("svc", { =>
            counter.increment()
            MessageService("test")
        }, lifetime: Singleton)
        @Assert(counter.getCount(), 0)
        container.resolve("svc")
        @Assert(counter.getCount(), 1)
        container.resolve("svc")
```

# method TestServiceContainer.func testDefaultLifetimeIsTransient()

## function:

实现 `` 中的 `testDefaultLifetimeIsTransient` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testDefaultLifetimeIsTransient() {
        let container = ServiceContainer()
        container.register("counter", { => CounterService() })
        let s1 = (container.resolve("counter") as CounterService).getOrThrow()
        s1.increment()
        let s2 = (container.resolve("counter") as CounterService).getOrThrow()
        @Assert(s2.getCount(), 0)
    }
}

// ===== HttpMethod Tests =====
```

# class TestHttpMethod

## function:

封装 `` 中与 `TestHttpMethod` 相关的数据和行为，是项目中的类级实现单元。

## kind:

class

## access:

internal

## extends:

none

## implements:

none

## usage example:

```cangjie
class TestHttpMethod {
    @TestCase
    func testMethodToString() {
        @Assert(HttpMethod.GET.toString(), "GET")
        @Assert(HttpMethod.POST.toString(), "POST")
        @Assert(HttpMethod.PUT.toString(), "PUT")
        @Assert(HttpMethod.DELETE.toString(), "DELETE")
        @Assert(HttpMethod.PATCH.toString(), "PATCH")
    }

    @TestCase
    func testFromString() {
        @Assert(HttpMethod.fromString("GET") == HttpMethod.GET)
        @Assert(HttpMethod.fromString("POST") == HttpMethod.POST)
        @Assert(HttpMethod.fromString("PUT") == HttpMethod.PUT)
        @Assert(HttpMethod.fromString("DELETE") == HttpMethod.DELETE)
        @Assert(HttpMethod.fromString("PATCH") == HttpMethod.PATCH)
    }

    @TestCase
```

# method TestHttpMethod.func testMethodToString()

## function:

实现 `` 中的 `testMethodToString` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testMethodToString() {
        @Assert(HttpMethod.GET.toString(), "GET")
        @Assert(HttpMethod.POST.toString(), "POST")
        @Assert(HttpMethod.PUT.toString(), "PUT")
        @Assert(HttpMethod.DELETE.toString(), "DELETE")
        @Assert(HttpMethod.PATCH.toString(), "PATCH")
    }

    @TestCase
    func testFromString() {
        @Assert(HttpMethod.fromString("GET") == HttpMethod.GET)
```

# method TestHttpMethod.func testFromString()

## function:

实现 `` 中的 `testFromString` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testFromString() {
        @Assert(HttpMethod.fromString("GET") == HttpMethod.GET)
        @Assert(HttpMethod.fromString("POST") == HttpMethod.POST)
        @Assert(HttpMethod.fromString("PUT") == HttpMethod.PUT)
        @Assert(HttpMethod.fromString("DELETE") == HttpMethod.DELETE)
        @Assert(HttpMethod.fromString("PATCH") == HttpMethod.PATCH)
    }

    @TestCase
    func testFromStringCaseInsensitive() {
        @Assert(HttpMethod.fromString("get") == HttpMethod.GET)
```

# method TestHttpMethod.func testFromStringCaseInsensitive()

## function:

实现 `` 中的 `testFromStringCaseInsensitive` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testFromStringCaseInsensitive() {
        @Assert(HttpMethod.fromString("get") == HttpMethod.GET)
        @Assert(HttpMethod.fromString("Post") == HttpMethod.POST)
        @Assert(HttpMethod.fromString("pUt") == HttpMethod.PUT)
    }

    @TestCase
    func testFromStringInvalid() {
        try {
            HttpMethod.fromString("INVALID")
            @Fail("Should have thrown")
```

# method TestHttpMethod.func testFromStringInvalid()

## function:

实现 `` 中的 `testFromStringInvalid` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testFromStringInvalid() {
        try {
            HttpMethod.fromString("INVALID")
            @Fail("Should have thrown")
        } catch (e: WebException) {
            @Assert(true)
        }
    }
}

// ===== Request Tests =====
```

# class TestRequest

## function:

封装 `` 中与 `TestRequest` 相关的数据和行为，是项目中的类级实现单元。

## kind:

class

## access:

internal

## extends:

none

## implements:

none

## properties:

- `internal let req: None`

## usage example:

```cangjie
class TestRequest {
    @TestCase
    func testCreateGetRequest() {
        let req = Request(HttpMethod.GET, "/hello")
        @Assert(req.method == HttpMethod.GET)
        @Assert(req.path, "/hello")
        @Assert(req.body, "")
    }

    @TestCase
    func testCreatePostRequestWithBody() {
        let req = Request(HttpMethod.POST, "/api", "data")
        @Assert(req.method == HttpMethod.POST)
        @Assert(req.path, "/api")
        @Assert(req.body, "data")
    }

    @TestCase
    func testRequestHeaders() {
        let req = Request(HttpMethod.GET, "/")
```

# method TestRequest.func testCreateGetRequest()

## function:

实现 `` 中的 `testCreateGetRequest` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testCreateGetRequest() {
        let req = Request(HttpMethod.GET, "/hello")
        @Assert(req.method == HttpMethod.GET)
        @Assert(req.path, "/hello")
        @Assert(req.body, "")
    }

    @TestCase
    func testCreatePostRequestWithBody() {
        let req = Request(HttpMethod.POST, "/api", "data")
        @Assert(req.method == HttpMethod.POST)
```

# method TestRequest.func testCreatePostRequestWithBody()

## function:

实现 `` 中的 `testCreatePostRequestWithBody` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testCreatePostRequestWithBody() {
        let req = Request(HttpMethod.POST, "/api", "data")
        @Assert(req.method == HttpMethod.POST)
        @Assert(req.path, "/api")
        @Assert(req.body, "data")
    }

    @TestCase
    func testRequestHeaders() {
        let req = Request(HttpMethod.GET, "/")
        req.headers["Content-Type"] = "application/json"
```

# method TestRequest.func testRequestHeaders()

## function:

实现 `` 中的 `testRequestHeaders` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testRequestHeaders() {
        let req = Request(HttpMethod.GET, "/")
        req.headers["Content-Type"] = "application/json"
        @Assert(req.header("Content-Type").getOrThrow(), "application/json")
    }

    @TestCase
    func testQueryStringParsing() {
        let req = Request(HttpMethod.GET, "/search?q=hello&page=1")
        @Assert(req.path, "/search")
        @Assert(req.query("q").getOrThrow(), "hello")
```

# method TestRequest.func testQueryStringParsing()

## function:

实现 `` 中的 `testQueryStringParsing` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testQueryStringParsing() {
        let req = Request(HttpMethod.GET, "/search?q=hello&page=1")
        @Assert(req.path, "/search")
        @Assert(req.query("q").getOrThrow(), "hello")
        @Assert(req.query("page").getOrThrow(), "1")
    }

    @TestCase
    func testQueryStringMultipleParams() {
        let req = Request(HttpMethod.GET, "/api?a=1&b=2&c=3")
        @Assert(req.path, "/api")
```

# method TestRequest.func testQueryStringMultipleParams()

## function:

实现 `` 中的 `testQueryStringMultipleParams` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testQueryStringMultipleParams() {
        let req = Request(HttpMethod.GET, "/api?a=1&b=2&c=3")
        @Assert(req.path, "/api")
        @Assert(req.query("a").getOrThrow(), "1")
        @Assert(req.query("b").getOrThrow(), "2")
        @Assert(req.query("c").getOrThrow(), "3")
    }

    @TestCase
    func testQueryStringEmptyValue() {
        let req = Request(HttpMethod.GET, "/path?key=")
```

# method TestRequest.func testQueryStringEmptyValue()

## function:

实现 `` 中的 `testQueryStringEmptyValue` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testQueryStringEmptyValue() {
        let req = Request(HttpMethod.GET, "/path?key=")
        @Assert(req.path, "/path")
        @Assert(req.query("key").getOrThrow(), "")
    }

    @TestCase
    func testPathWithoutQueryString() {
        let req = Request(HttpMethod.GET, "/hello")
        @Assert(req.path, "/hello")
        @Assert(req.query("anything").isNone())
```

# method TestRequest.func testPathWithoutQueryString()

## function:

实现 `` 中的 `testPathWithoutQueryString` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testPathWithoutQueryString() {
        let req = Request(HttpMethod.GET, "/hello")
        @Assert(req.path, "/hello")
        @Assert(req.query("anything").isNone())
    }

    @TestCase
    func testConvenienceMethods() {
        let req = Request(HttpMethod.GET, "/users/42?format=json")
        req.pathParams["id"] = "42"
        req.headers["Accept"] = "text/html"
```

# method TestRequest.func testConvenienceMethods()

## function:

实现 `` 中的 `testConvenienceMethods` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testConvenienceMethods() {
        let req = Request(HttpMethod.GET, "/users/42?format=json")
        req.pathParams["id"] = "42"
        req.headers["Accept"] = "text/html"
        @Assert(req.param("id").getOrThrow(), "42")
        @Assert(req.query("format").getOrThrow(), "json")
        @Assert(req.header("Accept").getOrThrow(), "text/html")
        @Assert(req.param("missing").isNone())
    }
}
```

# class TestResponse

## function:

封装 `` 中与 `TestResponse` 相关的数据和行为，是项目中的类级实现单元。

## kind:

class

## access:

internal

## extends:

none

## implements:

none

## properties:

- `internal let resp: None`

- `internal let r: None`

## usage example:

```cangjie
class TestResponse {
    @TestCase
    func testDefaultResponse() {
        let resp = Response()
        @Assert(resp.statusCode, 200)
        @Assert(resp.body, "")
    }

    @TestCase
    func testSetStatusCode() {
        let resp = Response()
        resp.statusCode = 404
        @Assert(resp.statusCode, 404)
    }

    @TestCase
    func testSetBody() {
        let resp = Response()
        resp.body = "Hello"
        @Assert(resp.body, "Hello")
```

# method TestResponse.func testDefaultResponse()

## function:

实现 `` 中的 `testDefaultResponse` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testDefaultResponse() {
        let resp = Response()
        @Assert(resp.statusCode, 200)
        @Assert(resp.body, "")
    }

    @TestCase
    func testSetStatusCode() {
        let resp = Response()
        resp.statusCode = 404
        @Assert(resp.statusCode, 404)
```

# method TestResponse.func testSetStatusCode()

## function:

实现 `` 中的 `testSetStatusCode` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testSetStatusCode() {
        let resp = Response()
        resp.statusCode = 404
        @Assert(resp.statusCode, 404)
    }

    @TestCase
    func testSetBody() {
        let resp = Response()
        resp.body = "Hello"
        @Assert(resp.body, "Hello")
```

# method TestResponse.func testSetBody()

## function:

实现 `` 中的 `testSetBody` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testSetBody() {
        let resp = Response()
        resp.body = "Hello"
        @Assert(resp.body, "Hello")
    }

    @TestCase
    func testSetHeader() {
        let resp = Response()
        resp.setHeader("X-Custom", "value")
        @Assert(resp.headers.get("X-Custom").getOrThrow(), "value")
```

# method TestResponse.func testSetHeader()

## function:

实现 `` 中的 `testSetHeader` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testSetHeader() {
        let resp = Response()
        resp.setHeader("X-Custom", "value")
        @Assert(resp.headers.get("X-Custom").getOrThrow(), "value")
    }

    @TestCase
    func testStatusChaining() {
        let resp = Response()
        let r = resp.status(201)
        @Assert(r.statusCode, 201)
```

# method TestResponse.func testStatusChaining()

## function:

实现 `` 中的 `testStatusChaining` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testStatusChaining() {
        let resp = Response()
        let r = resp.status(201)
        @Assert(r.statusCode, 201)
        r.body = "test"
        @Assert(resp.body, "test")
    }

    @TestCase
    func testJsonHelper() {
        let resp = Response()
```

# method TestResponse.func testJsonHelper()

## function:

实现 `` 中的 `testJsonHelper` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testJsonHelper() {
        let resp = Response()
        resp.json("{\"key\":\"value\"}")
        @Assert(resp.headers.get("Content-Type").getOrThrow(), "application/json")
        @Assert(resp.body, "{\"key\":\"value\"}")
    }

    @TestCase
    func testTextHelper() {
        let resp = Response()
        resp.text("plain text")
```

# method TestResponse.func testTextHelper()

## function:

实现 `` 中的 `testTextHelper` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testTextHelper() {
        let resp = Response()
        resp.text("plain text")
        @Assert(resp.headers.get("Content-Type").getOrThrow(), "text/plain")
        @Assert(resp.body, "plain text")
    }

    @TestCase
    func testHtmlHelper() {
        let resp = Response()
        resp.html("<h1>Hello</h1>")
```

# method TestResponse.func testHtmlHelper()

## function:

实现 `` 中的 `testHtmlHelper` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testHtmlHelper() {
        let resp = Response()
        resp.html("<h1>Hello</h1>")
        @Assert(resp.headers.get("Content-Type").getOrThrow(), "text/html")
        @Assert(resp.body, "<h1>Hello</h1>")
    }
}

// ===== Router Tests =====

@Test
```

# class TestRouter

## function:

路由请求，管理 `TestRouter` 相关的路径映射。

## kind:

class

## access:

internal

## extends:

none

## implements:

none

## properties:

- `internal let router: None`

- `internal let result: None`

- `internal let rm: None`

## usage example:

```cangjie
class TestRouter {
    @TestCase
    func testExactPathMatch() {
        let router = Router()
        router.addRoute(HttpMethod.GET, "/hello", { _: HttpContext => })
        let result = router.findRoute(HttpMethod.GET, "/hello")
        @Assert(!result.isNone())
    }

    @TestCase
    func testSinglePathParam() {
        let router = Router()
        router.addRoute(HttpMethod.GET, "/users/:id", { _: HttpContext => })
        let result = router.findRoute(HttpMethod.GET, "/users/42")
        @Assert(!result.isNone())
        let rm = result.getOrThrow()
        @Assert(rm.params.get("id").getOrThrow(), "42")
    }

    @TestCase
```

# method TestRouter.func testExactPathMatch()

## function:

实现 `` 中的 `testExactPathMatch` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testExactPathMatch() {
        let router = Router()
        router.addRoute(HttpMethod.GET, "/hello", { _: HttpContext => })
        let result = router.findRoute(HttpMethod.GET, "/hello")
        @Assert(!result.isNone())
    }

    @TestCase
    func testSinglePathParam() {
        let router = Router()
        router.addRoute(HttpMethod.GET, "/users/:id", { _: HttpContext => })
```

# method TestRouter.func testSinglePathParam()

## function:

实现 `` 中的 `testSinglePathParam` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testSinglePathParam() {
        let router = Router()
        router.addRoute(HttpMethod.GET, "/users/:id", { _: HttpContext => })
        let result = router.findRoute(HttpMethod.GET, "/users/42")
        @Assert(!result.isNone())
        let rm = result.getOrThrow()
        @Assert(rm.params.get("id").getOrThrow(), "42")
    }

    @TestCase
    func testMultiplePathParams() {
```

# method TestRouter.func testMultiplePathParams()

## function:

实现 `` 中的 `testMultiplePathParams` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testMultiplePathParams() {
        let router = Router()
        router.addRoute(HttpMethod.GET, "/users/:userId/posts/:postId", { _: HttpContext => })
        let result = router.findRoute(HttpMethod.GET, "/users/1/posts/99")
        @Assert(!result.isNone())
        let rm = result.getOrThrow()
        @Assert(rm.params.get("userId").getOrThrow(), "1")
        @Assert(rm.params.get("postId").getOrThrow(), "99")
    }

    @TestCase
```

# method TestRouter.func testNoMatchReturnsNone()

## function:

实现 `` 中的 `testNoMatchReturnsNone` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testNoMatchReturnsNone() {
        let router = Router()
        router.addRoute(HttpMethod.GET, "/hello", { _: HttpContext => })
        let result = router.findRoute(HttpMethod.GET, "/world")
        @Assert(result.isNone())
    }

    @TestCase
    func testWrongMethodReturnsNone() {
        let router = Router()
        router.addRoute(HttpMethod.GET, "/hello", { _: HttpContext => })
```

# method TestRouter.func testWrongMethodReturnsNone()

## function:

实现 `` 中的 `testWrongMethodReturnsNone` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testWrongMethodReturnsNone() {
        let router = Router()
        router.addRoute(HttpMethod.GET, "/hello", { _: HttpContext => })
        let result = router.findRoute(HttpMethod.POST, "/hello")
        @Assert(result.isNone())
    }

    @TestCase
    func testRootPathMatch() {
        let router = Router()
        router.addRoute(HttpMethod.GET, "/", { _: HttpContext => })
```

# method TestRouter.func testRootPathMatch()

## function:

实现 `` 中的 `testRootPathMatch` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testRootPathMatch() {
        let router = Router()
        router.addRoute(HttpMethod.GET, "/", { _: HttpContext => })
        let result = router.findRoute(HttpMethod.GET, "/")
        @Assert(!result.isNone())
    }

    @TestCase
    func testMultipleRoutes() {
        let router = Router()
        router.addRoute(HttpMethod.GET, "/a", { ctx: HttpContext =>
```

# method TestRouter.func testMultipleRoutes()

## function:

实现 `` 中的 `testMultipleRoutes` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testMultipleRoutes() {
        let router = Router()
        router.addRoute(HttpMethod.GET, "/a", { ctx: HttpContext =>
            ctx.response.body = "a"
        })
        router.addRoute(HttpMethod.GET, "/b", { ctx: HttpContext =>
            ctx.response.body = "b"
        })
        @Assert(!router.findRoute(HttpMethod.GET, "/a").isNone())
        @Assert(!router.findRoute(HttpMethod.GET, "/b").isNone())
        @Assert(router.findRoute(HttpMethod.GET, "/c").isNone())
```

# method TestRouter.func testMethodRouting()

## function:

实现 `` 中的 `testMethodRouting` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testMethodRouting() {
        let router = Router()
        router.addRoute(HttpMethod.GET, "/data", { _: HttpContext => })
        router.addRoute(HttpMethod.POST, "/data", { _: HttpContext => })
        @Assert(!router.findRoute(HttpMethod.GET, "/data").isNone())
        @Assert(!router.findRoute(HttpMethod.POST, "/data").isNone())
    }

    @TestCase
    func testStaticAndParamMixed() {
        let router = Router()
```

# method TestRouter.func testStaticAndParamMixed()

## function:

实现 `` 中的 `testStaticAndParamMixed` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testStaticAndParamMixed() {
        let router = Router()
        router.addRoute(HttpMethod.GET, "/api/users/:id/profile", { _: HttpContext => })
        let result = router.findRoute(HttpMethod.GET, "/api/users/5/profile")
        @Assert(!result.isNone())
        @Assert(result.getOrThrow().params.get("id").getOrThrow(), "5")
    }

    @TestCase
    func testNoMatchDifferentDepth() {
        let router = Router()
```

# method TestRouter.func testNoMatchDifferentDepth()

## function:

实现 `` 中的 `testNoMatchDifferentDepth` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testNoMatchDifferentDepth() {
        let router = Router()
        router.addRoute(HttpMethod.GET, "/a/b", { _: HttpContext => })
        @Assert(router.findRoute(HttpMethod.GET, "/a").isNone())
        @Assert(router.findRoute(HttpMethod.GET, "/a/b/c").isNone())
    }
}

// ===== Route Group Tests =====

@Test
```

# class TestRouteGroup

## function:

封装 `` 中与 `TestRouteGroup` 相关的数据和行为，是项目中的类级实现单元。

## kind:

class

## access:

internal

## extends:

none

## implements:

none

## properties:

- `internal let app: None`

- `internal let api: None`

- `internal let ctx: None`

- `internal let ctx1: None`

- `internal let ctx2: None`

- `internal let id: None`

## usage example:

```cangjie
class TestRouteGroup {
    @TestCase
    func testGroupPrefixGet() {
        let app = WebApp()
        let api = app.group("/api")
        api.get("/users", { ctx: HttpContext =>
            ctx.response.body = "user list"
        })
        let ctx = HttpContext(Request(HttpMethod.GET, "/api/users"), Response(), app.services)
        app.handleRequest(ctx)
        @Assert(ctx.response.body, "user list")
    }

    @TestCase
    func testGroupPrefixPost() {
        let app = WebApp()
        let api = app.group("/api")
        api.post("/users", { ctx: HttpContext =>
            ctx.response.body = "created"
        })
```

# method TestRouteGroup.func testGroupPrefixGet()

## function:

实现 `` 中的 `testGroupPrefixGet` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testGroupPrefixGet() {
        let app = WebApp()
        let api = app.group("/api")
        api.get("/users", { ctx: HttpContext =>
            ctx.response.body = "user list"
        })
        let ctx = HttpContext(Request(HttpMethod.GET, "/api/users"), Response(), app.services)
        app.handleRequest(ctx)
        @Assert(ctx.response.body, "user list")
    }
```

# method TestRouteGroup.func testGroupPrefixPost()

## function:

实现 `` 中的 `testGroupPrefixPost` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testGroupPrefixPost() {
        let app = WebApp()
        let api = app.group("/api")
        api.post("/users", { ctx: HttpContext =>
            ctx.response.body = "created"
        })
        let ctx = HttpContext(Request(HttpMethod.POST, "/api/users"), Response(), app.services)
        app.handleRequest(ctx)
        @Assert(ctx.response.body, "created")
    }
```

# method TestRouteGroup.func testGroupMultipleRoutes()

## function:

实现 `` 中的 `testGroupMultipleRoutes` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testGroupMultipleRoutes() {
        let app = WebApp()
        let api = app.group("/api/v1")
        api.get("/items", { ctx: HttpContext => ctx.response.body = "items" })
        api.post("/items", { ctx: HttpContext => ctx.response.body = "item created" })
        api.delete("/items/:id", { ctx: HttpContext => ctx.response.body = "deleted" })

        let ctx1 = HttpContext(Request(HttpMethod.GET, "/api/v1/items"), Response(), app.services)
        app.handleRequest(ctx1)
        @Assert(ctx1.response.body, "items")
```

# method TestRouteGroup.func testGroupWithPathParams()

## function:

实现 `` 中的 `testGroupWithPathParams` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testGroupWithPathParams() {
        let app = WebApp()
        let api = app.group("/api")
        api.get("/users/:id", { ctx: HttpContext =>
            let id = ctx.request.param("id") ?? "none"
            ctx.response.body = "user:${id}"
        })
        let ctx = HttpContext(Request(HttpMethod.GET, "/api/users/42"), Response(), app.services)
        app.handleRequest(ctx)
        @Assert(ctx.response.body, "user:42")
    }
```

# method TestRouteGroup.func testGroupNoMatchWithoutPrefix()

## function:

实现 `` 中的 `testGroupNoMatchWithoutPrefix` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testGroupNoMatchWithoutPrefix() {
        let app = WebApp()
        let api = app.group("/api")
        api.get("/users", { ctx: HttpContext => ctx.response.body = "users" })
        let ctx = HttpContext(Request(HttpMethod.GET, "/users"), Response(), app.services)
        app.handleRequest(ctx)
        @Assert(ctx.response.statusCode, 404)
    }
}

// ===== Middleware Tests =====
```

# class TestMiddleware

## function:

封装 `` 中与 `TestMiddleware` 相关的数据和行为，是项目中的类级实现单元。

## kind:

class

## access:

internal

## extends:

none

## implements:

none

## properties:

- `internal let app: None`

- `internal let ctx: None`

- `internal let order: None`

- `internal let log: None`

## usage example:

```cangjie
class TestMiddleware {
    @TestCase
    func testSingleMiddleware() {
        let app = WebApp()
        app.use({ ctx: HttpContext, next: () -> Unit =>
            ctx.response.setHeader("X-Middleware", "applied")
            next()
        })
        app.get("/test", { ctx: HttpContext =>
            ctx.response.body = "ok"
        })
        let ctx = HttpContext(Request(HttpMethod.GET, "/test"), Response(), app.services)
        app.handleRequest(ctx)
        @Assert(ctx.response.headers.get("X-Middleware").getOrThrow(), "applied")
        @Assert(ctx.response.body, "ok")
    }

    @TestCase
    func testMiddlewareOrder() {
        let app = WebApp()
```

# method TestMiddleware.func testSingleMiddleware()

## function:

实现 `` 中的 `testSingleMiddleware` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testSingleMiddleware() {
        let app = WebApp()
        app.use({ ctx: HttpContext, next: () -> Unit =>
            ctx.response.setHeader("X-Middleware", "applied")
            next()
        })
        app.get("/test", { ctx: HttpContext =>
            ctx.response.body = "ok"
        })
        let ctx = HttpContext(Request(HttpMethod.GET, "/test"), Response(), app.services)
        app.handleRequest(ctx)
```

# method TestMiddleware.func testMiddlewareOrder()

## function:

实现 `` 中的 `testMiddlewareOrder` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testMiddlewareOrder() {
        let app = WebApp()
        let order = ArrayList<String>()
        app.use({ ctx: HttpContext, next: () -> Unit =>
            order.add("first-before")
            next()
            order.add("first-after")
        })
        app.use({ ctx: HttpContext, next: () -> Unit =>
            order.add("second-before")
            next()
```

# method TestMiddleware.func testMiddlewareModifyResponse()

## function:

实现 `` 中的 `testMiddlewareModifyResponse` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testMiddlewareModifyResponse() {
        let app = WebApp()
        app.use({ ctx: HttpContext, next: () -> Unit =>
            next()
            ctx.response.setHeader("X-After", "true")
        })
        app.get("/test", { ctx: HttpContext =>
            ctx.response.body = "ok"
        })
        let ctx = HttpContext(Request(HttpMethod.GET, "/test"), Response(), app.services)
        app.handleRequest(ctx)
```

# method TestMiddleware.func testMiddlewareShortCircuit()

## function:

实现 `` 中的 `testMiddlewareShortCircuit` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testMiddlewareShortCircuit() {
        let app = WebApp()
        app.use({ ctx: HttpContext, _next: () -> Unit =>
            ctx.response.statusCode = 403
            ctx.response.body = "Forbidden"
        })
        app.get("/test", { ctx: HttpContext =>
            ctx.response.body = "should not reach"
        })
        let ctx = HttpContext(Request(HttpMethod.GET, "/test"), Response(), app.services)
        app.handleRequest(ctx)
```

# method TestMiddleware.func testMiddlewareChain()

## function:

实现 `` 中的 `testMiddlewareChain` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testMiddlewareChain() {
        let app = WebApp()
        app.use({ ctx: HttpContext, next: () -> Unit =>
            ctx.response.setHeader("X-1", "a")
            next()
        })
        app.use({ ctx: HttpContext, next: () -> Unit =>
            ctx.response.setHeader("X-2", "b")
            next()
        })
        app.use({ ctx: HttpContext, next: () -> Unit =>
```

# method TestMiddleware.func testNoMiddleware()

## function:

实现 `` 中的 `testNoMiddleware` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testNoMiddleware() {
        let app = WebApp()
        app.get("/test", { ctx: HttpContext =>
            ctx.response.body = "direct"
        })
        let ctx = HttpContext(Request(HttpMethod.GET, "/test"), Response(), app.services)
        app.handleRequest(ctx)
        @Assert(ctx.response.body, "direct")
    }

    @TestCase
```

# method TestMiddleware.func testMiddlewareBeforeAndAfter()

## function:

实现 `` 中的 `testMiddlewareBeforeAndAfter` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testMiddlewareBeforeAndAfter() {
        let app = WebApp()
        let log = ArrayList<String>()
        app.use({ ctx: HttpContext, next: () -> Unit =>
            log.add("before:${ctx.request.path}")
            next()
            log.add("after:${ctx.response.statusCode}")
        })
        app.get("/test", { ctx: HttpContext =>
            ctx.response.statusCode = 201
            ctx.response.body = "created"
```

# method TestMiddleware.func testMiddlewareErrorRecovery()

## function:

实现 `` 中的 `testMiddlewareErrorRecovery` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testMiddlewareErrorRecovery() {
        let app = WebApp()
        app.use({ ctx: HttpContext, next: () -> Unit =>
            try {
                next()
            } catch (_: Exception) {
                ctx.response.statusCode = 500
                ctx.response.body = "Internal Server Error"
            }
        })
        app.get("/fail", { _: HttpContext =>
```

# class TestWebApp

## function:

封装 `` 中与 `TestWebApp` 相关的数据和行为，是项目中的类级实现单元。

## kind:

class

## access:

internal

## extends:

none

## implements:

none

## properties:

- `internal let app: None`

- `internal let ctx: None`

- `internal let id: None`

- `internal let q: None`

- `internal let msg: None`

- `internal let api: None`

- `internal let counter: None`

- `internal let ctx1: None`

- `internal let ctx2: None`

## usage example:

```cangjie
class TestWebApp {
    @TestCase
    func testSimpleGetRequest() {
        let app = WebApp()
        app.get("/hello", { ctx: HttpContext =>
            ctx.response.body = "Hello, World!"
        })
        let ctx = HttpContext(Request(HttpMethod.GET, "/hello"), Response(), app.services)
        app.handleRequest(ctx)
        @Assert(ctx.response.statusCode, 200)
        @Assert(ctx.response.body, "Hello, World!")
    }

    @TestCase
    func testPostWithBody() {
        let app = WebApp()
        app.post("/echo", { ctx: HttpContext =>
            ctx.response.body = ctx.request.body
        })
        let ctx = HttpContext(Request(HttpMethod.POST, "/echo", "test data"), Response(), app.services)
```

# method TestWebApp.func testSimpleGetRequest()

## function:

实现 `` 中的 `testSimpleGetRequest` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testSimpleGetRequest() {
        let app = WebApp()
        app.get("/hello", { ctx: HttpContext =>
            ctx.response.body = "Hello, World!"
        })
        let ctx = HttpContext(Request(HttpMethod.GET, "/hello"), Response(), app.services)
        app.handleRequest(ctx)
        @Assert(ctx.response.statusCode, 200)
        @Assert(ctx.response.body, "Hello, World!")
    }
```

# method TestWebApp.func testPostWithBody()

## function:

实现 `` 中的 `testPostWithBody` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testPostWithBody() {
        let app = WebApp()
        app.post("/echo", { ctx: HttpContext =>
            ctx.response.body = ctx.request.body
        })
        let ctx = HttpContext(Request(HttpMethod.POST, "/echo", "test data"), Response(), app.services)
        app.handleRequest(ctx)
        @Assert(ctx.response.body, "test data")
    }

    @TestCase
```

# method TestWebApp.func testRouteNotFound()

## function:

实现 `` 中的 `testRouteNotFound` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testRouteNotFound() {
        let app = WebApp()
        app.get("/hello", { ctx: HttpContext =>
            ctx.response.body = "Hello"
        })
        let ctx = HttpContext(Request(HttpMethod.GET, "/unknown"), Response(), app.services)
        app.handleRequest(ctx)
        @Assert(ctx.response.statusCode, 404)
        @Assert(ctx.response.body, "Not Found")
    }
```

# method TestWebApp.func testPathParams()

## function:

实现 `` 中的 `testPathParams` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testPathParams() {
        let app = WebApp()
        app.get("/users/:id", { ctx: HttpContext =>
            let id = ctx.request.param("id") ?? "none"
            ctx.response.body = "User ${id}"
        })
        let ctx = HttpContext(Request(HttpMethod.GET, "/users/42"), Response(), app.services)
        app.handleRequest(ctx)
        @Assert(ctx.response.body, "User 42")
    }
```

# method TestWebApp.func testQueryParamsInRoute()

## function:

实现 `` 中的 `testQueryParamsInRoute` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testQueryParamsInRoute() {
        let app = WebApp()
        app.get("/search", { ctx: HttpContext =>
            let q = ctx.request.query("q") ?? ""
            ctx.response.body = "search:${q}"
        })
        let ctx = HttpContext(Request(HttpMethod.GET, "/search?q=hello"), Response(), app.services)
        app.handleRequest(ctx)
        @Assert(ctx.response.body, "search:hello")
    }
```

# method TestWebApp.func testMiddlewareApplied()

## function:

实现 `` 中的 `testMiddlewareApplied` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testMiddlewareApplied() {
        let app = WebApp()
        app.use({ ctx: HttpContext, next: () -> Unit =>
            ctx.response.setHeader("X-Powered-By", "WebFramework")
            next()
        })
        app.get("/test", { ctx: HttpContext =>
            ctx.response.body = "ok"
        })
        let ctx = HttpContext(Request(HttpMethod.GET, "/test"), Response(), app.services)
        app.handleRequest(ctx)
```

# method TestWebApp.func testServiceInjection()

## function:

实现 `` 中的 `testServiceInjection` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testServiceInjection() {
        let app = WebApp()
        app.services.register("msg", { => MessageService("hello") }, lifetime: Singleton)
        app.get("/msg", { ctx: HttpContext =>
            let msg = (ctx.services.resolve("msg") as MessageService).getOrThrow()
            ctx.response.body = msg.getMessage()
        })
        let ctx = HttpContext(Request(HttpMethod.GET, "/msg"), Response(), app.services)
        app.handleRequest(ctx)
        @Assert(ctx.response.body, "hello")
    }
```

# method TestWebApp.func testGroupRouting()

## function:

实现 `` 中的 `testGroupRouting` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testGroupRouting() {
        let app = WebApp()
        let api = app.group("/api/v1")
        api.get("/status", { ctx: HttpContext =>
            ctx.response.json("{\"ok\":true}")
        })
        let ctx = HttpContext(Request(HttpMethod.GET, "/api/v1/status"), Response(), app.services)
        app.handleRequest(ctx)
        @Assert(ctx.response.body, "{\"ok\":true}")
        @Assert(ctx.response.headers.get("Content-Type").getOrThrow(), "application/json")
    }
```

# method TestWebApp.func testFullRestPipeline()

## function:

实现 `` 中的 `testFullRestPipeline` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testFullRestPipeline() {
        let app = WebApp()
        app.services.register("counter", { => CounterService() }, lifetime: Singleton)

        app.use({ ctx: HttpContext, next: () -> Unit =>
            let counter = (ctx.services.resolve("counter") as CounterService).getOrThrow()
            counter.increment()
            next()
            ctx.response.setHeader("X-Request-Count", "${counter.getCount()}")
        })
```

# method TestWebApp.func testPutAndDelete()

## function:

实现 `` 中的 `testPutAndDelete` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testPutAndDelete() {
        let app = WebApp()
        app.put("/items/:id", { ctx: HttpContext =>
            let id = ctx.request.param("id") ?? "none"
            ctx.response.body = "Updated ${id}"
        })
        app.delete("/items/:id", { ctx: HttpContext =>
            let id = ctx.request.param("id") ?? "none"
            ctx.response.body = "Deleted ${id}"
        })
```

# module tests/web_framework/web_test.cj

## function:

负责测试 `web_test` 相关功能是否符合预期。

## usage example:

```cangjie
# source: tests/web_framework/web_test.cj
```

## package:
web

## imports:

- `std.collection.*`

# class CounterService

## function:

===== Test helper services =====。

## kind:

class

## access:

internal

## extends:

none

## implements:

none

## properties:

- `internal var count: Int64`

## usage example:

```cangjie
class CounterService {
    var count: Int64 = 0
    public func increment(): Unit { count++ }
    public func getCount(): Int64 { return count }
}
```

# method CounterService.func increment(): Unit

## function:

实现 `` 中的 `increment` 逻辑，是该模块中的可调用函数单元。

## access:

public

## is_static:

False

## usage example:

```cangjie
public func increment(): Unit { count++ }
    public func getCount(): Int64 { return count }
}

class MessageService {
    let message: String
    public init(msg: String) { message = msg }
    public func getMessage(): String { return message }
}

// ===== IoC Container Tests =====
```

# method CounterService.func getCount(): Int64

## function:

获取与 `getCount` 相关的数据或对象，供项目内部逻辑调用。

## access:

public

## is_static:

False

## usage example:

```cangjie
public func getCount(): Int64 { return count }
}

class MessageService {
    let message: String
    public init(msg: String) { message = msg }
    public func getMessage(): String { return message }
}

// ===== IoC Container Tests =====
```

# class MessageService

## function:

封装业务逻辑，提供 `MessageService` 相关的服务功能。

## kind:

class

## access:

internal

## extends:

none

## implements:

none

## properties:

- `internal let message: String`

## usage example:

```cangjie
class MessageService {
    let message: String
    public init(msg: String) { message = msg }
    public func getMessage(): String { return message }
}
```

# method MessageService.func getMessage(): String

## function:

获取与 `getMessage` 相关的数据或对象，供项目内部逻辑调用。

## access:

public

## is_static:

False

## usage example:

```cangjie
public func getMessage(): String { return message }
}

// ===== IoC Container Tests =====

@Test
class TestServiceContainer {
    @TestCase
    func testRegisterAndResolve() {
        let container = ServiceContainer()
        container.register("counter", { => CounterService() })
```

# class TestServiceContainer

## function:

封装业务逻辑，提供 `TestServiceContainer` 相关的服务功能。

## kind:

class

## access:

internal

## extends:

none

## implements:

none

## properties:

- `internal let container: None`

- `internal let service: None`

- `internal let s1: None`

- `internal let s2: None`

- `internal let counter: None`

## usage example:

```cangjie
class TestServiceContainer {
    @TestCase
    func testRegisterAndResolve() {
        let container = ServiceContainer()
        container.register("counter", { => CounterService() })
        let service = container.resolve("counter")
        @Assert(service is CounterService)
    }

    @TestCase
    func testSingletonReturnsSameInstance() {
        let container = ServiceContainer()
        container.register("counter", { => CounterService() }, lifetime: Singleton)
        let s1 = (container.resolve("counter") as CounterService).getOrThrow()
        s1.increment()
        s1.increment()
        let s2 = (container.resolve("counter") as CounterService).getOrThrow()
        @Assert(s2.getCount(), 2)
    }
```

# method TestServiceContainer.func testRegisterAndResolve()

## function:

实现 `` 中的 `testRegisterAndResolve` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testRegisterAndResolve() {
        let container = ServiceContainer()
        container.register("counter", { => CounterService() })
        let service = container.resolve("counter")
        @Assert(service is CounterService)
    }

    @TestCase
    func testSingletonReturnsSameInstance() {
        let container = ServiceContainer()
        container.register("counter", { => CounterService() }, lifetime: Singleton)
```

# method TestServiceContainer.func testSingletonReturnsSameInstance()

## function:

实现 `` 中的 `testSingletonReturnsSameInstance` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testSingletonReturnsSameInstance() {
        let container = ServiceContainer()
        container.register("counter", { => CounterService() }, lifetime: Singleton)
        let s1 = (container.resolve("counter") as CounterService).getOrThrow()
        s1.increment()
        s1.increment()
        let s2 = (container.resolve("counter") as CounterService).getOrThrow()
        @Assert(s2.getCount(), 2)
    }

    @TestCase
```

# method TestServiceContainer.func testTransientCreatesNewInstance()

## function:

实现 `` 中的 `testTransientCreatesNewInstance` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testTransientCreatesNewInstance() {
        let container = ServiceContainer()
        container.register("counter", { => CounterService() }, lifetime: Transient)
        let s1 = (container.resolve("counter") as CounterService).getOrThrow()
        s1.increment()
        let s2 = (container.resolve("counter") as CounterService).getOrThrow()
        @Assert(s2.getCount(), 0)
    }

    @TestCase
    func testResolveUnknownThrows() {
```

# method TestServiceContainer.func testResolveUnknownThrows()

## function:

实现 `` 中的 `testResolveUnknownThrows` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testResolveUnknownThrows() {
        let container = ServiceContainer()
        try {
            container.resolve("unknown")
            @Fail("Should have thrown")
        } catch (e: WebException) {
            @Assert(true)
        }
    }

    @TestCase
```

# method TestServiceContainer.func testResolveOrNone()

## function:

实现 `` 中的 `testResolveOrNone` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testResolveOrNone() {
        let container = ServiceContainer()
        @Assert(container.resolveOrNone("unknown").isNone())
        container.register("msg", { => MessageService("hi") })
        @Assert(!container.resolveOrNone("msg").isNone())
    }

    @TestCase
    func testContainsRegistered() {
        let container = ServiceContainer()
        container.register("counter", { => CounterService() })
```

# method TestServiceContainer.func testContainsRegistered()

## function:

实现 `` 中的 `testContainsRegistered` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testContainsRegistered() {
        let container = ServiceContainer()
        container.register("counter", { => CounterService() })
        @Assert(container.contains("counter"))
    }

    @TestCase
    func testContainsUnregistered() {
        let container = ServiceContainer()
        @Assert(!container.contains("unknown"))
    }
```

# method TestServiceContainer.func testContainsUnregistered()

## function:

实现 `` 中的 `testContainsUnregistered` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testContainsUnregistered() {
        let container = ServiceContainer()
        @Assert(!container.contains("unknown"))
    }

    @TestCase
    func testOverrideRegistration() {
        let container = ServiceContainer()
        container.register("msg", { => MessageService("old") }, lifetime: Singleton)
        let s1 = (container.resolve("msg") as MessageService).getOrThrow()
        @Assert(s1.getMessage(), "old")
```

# method TestServiceContainer.func testOverrideRegistration()

## function:

实现 `` 中的 `testOverrideRegistration` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testOverrideRegistration() {
        let container = ServiceContainer()
        container.register("msg", { => MessageService("old") }, lifetime: Singleton)
        let s1 = (container.resolve("msg") as MessageService).getOrThrow()
        @Assert(s1.getMessage(), "old")
        container.register("msg", { => MessageService("new") }, lifetime: Singleton)
        let s2 = (container.resolve("msg") as MessageService).getOrThrow()
        @Assert(s2.getMessage(), "new")
    }

    @TestCase
```

# method TestServiceContainer.func testMultipleServices()

## function:

实现 `` 中的 `testMultipleServices` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testMultipleServices() {
        let container = ServiceContainer()
        container.register("counter", { => CounterService() })
        container.register("msg", { => MessageService("hello") })
        @Assert(container.contains("counter"))
        @Assert(container.contains("msg"))
        @Assert(container.resolve("counter") is CounterService)
        @Assert((container.resolve("msg") as MessageService).getOrThrow().getMessage(), "hello")
    }

    @TestCase
```

# method TestServiceContainer.func testSingletonIsLazy()

## function:

实现 `` 中的 `testSingletonIsLazy` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testSingletonIsLazy() {
        let counter = CounterService()
        let container = ServiceContainer()
        container.register("svc", { =>
            counter.increment()
            MessageService("test")
        }, lifetime: Singleton)
        @Assert(counter.getCount(), 0)
        container.resolve("svc")
        @Assert(counter.getCount(), 1)
        container.resolve("svc")
```

# method TestServiceContainer.func testDefaultLifetimeIsTransient()

## function:

实现 `` 中的 `testDefaultLifetimeIsTransient` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testDefaultLifetimeIsTransient() {
        let container = ServiceContainer()
        container.register("counter", { => CounterService() })
        let s1 = (container.resolve("counter") as CounterService).getOrThrow()
        s1.increment()
        let s2 = (container.resolve("counter") as CounterService).getOrThrow()
        @Assert(s2.getCount(), 0)
    }
}

// ===== HttpMethod Tests =====
```

# class TestHttpMethod

## function:

封装 `` 中与 `TestHttpMethod` 相关的数据和行为，是项目中的类级实现单元。

## kind:

class

## access:

internal

## extends:

none

## implements:

none

## usage example:

```cangjie
class TestHttpMethod {
    @TestCase
    func testMethodToString() {
        @Assert(HttpMethod.GET.toString(), "GET")
        @Assert(HttpMethod.POST.toString(), "POST")
        @Assert(HttpMethod.PUT.toString(), "PUT")
        @Assert(HttpMethod.DELETE.toString(), "DELETE")
        @Assert(HttpMethod.PATCH.toString(), "PATCH")
    }

    @TestCase
    func testFromString() {
        @Assert(HttpMethod.fromString("GET") == HttpMethod.GET)
        @Assert(HttpMethod.fromString("POST") == HttpMethod.POST)
        @Assert(HttpMethod.fromString("PUT") == HttpMethod.PUT)
        @Assert(HttpMethod.fromString("DELETE") == HttpMethod.DELETE)
        @Assert(HttpMethod.fromString("PATCH") == HttpMethod.PATCH)
    }

    @TestCase
```

# method TestHttpMethod.func testMethodToString()

## function:

实现 `` 中的 `testMethodToString` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testMethodToString() {
        @Assert(HttpMethod.GET.toString(), "GET")
        @Assert(HttpMethod.POST.toString(), "POST")
        @Assert(HttpMethod.PUT.toString(), "PUT")
        @Assert(HttpMethod.DELETE.toString(), "DELETE")
        @Assert(HttpMethod.PATCH.toString(), "PATCH")
    }

    @TestCase
    func testFromString() {
        @Assert(HttpMethod.fromString("GET") == HttpMethod.GET)
```

# method TestHttpMethod.func testFromString()

## function:

实现 `` 中的 `testFromString` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testFromString() {
        @Assert(HttpMethod.fromString("GET") == HttpMethod.GET)
        @Assert(HttpMethod.fromString("POST") == HttpMethod.POST)
        @Assert(HttpMethod.fromString("PUT") == HttpMethod.PUT)
        @Assert(HttpMethod.fromString("DELETE") == HttpMethod.DELETE)
        @Assert(HttpMethod.fromString("PATCH") == HttpMethod.PATCH)
    }

    @TestCase
    func testFromStringCaseInsensitive() {
        @Assert(HttpMethod.fromString("get") == HttpMethod.GET)
```

# method TestHttpMethod.func testFromStringCaseInsensitive()

## function:

实现 `` 中的 `testFromStringCaseInsensitive` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testFromStringCaseInsensitive() {
        @Assert(HttpMethod.fromString("get") == HttpMethod.GET)
        @Assert(HttpMethod.fromString("Post") == HttpMethod.POST)
        @Assert(HttpMethod.fromString("pUt") == HttpMethod.PUT)
    }

    @TestCase
    func testFromStringInvalid() {
        try {
            HttpMethod.fromString("INVALID")
            @Fail("Should have thrown")
```

# method TestHttpMethod.func testFromStringInvalid()

## function:

实现 `` 中的 `testFromStringInvalid` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testFromStringInvalid() {
        try {
            HttpMethod.fromString("INVALID")
            @Fail("Should have thrown")
        } catch (e: WebException) {
            @Assert(true)
        }
    }
}

// ===== Request Tests =====
```

# class TestRequest

## function:

封装 `` 中与 `TestRequest` 相关的数据和行为，是项目中的类级实现单元。

## kind:

class

## access:

internal

## extends:

none

## implements:

none

## properties:

- `internal let req: None`

## usage example:

```cangjie
class TestRequest {
    @TestCase
    func testCreateGetRequest() {
        let req = Request(HttpMethod.GET, "/hello")
        @Assert(req.method == HttpMethod.GET)
        @Assert(req.path, "/hello")
        @Assert(req.body, "")
    }

    @TestCase
    func testCreatePostRequestWithBody() {
        let req = Request(HttpMethod.POST, "/api", "data")
        @Assert(req.method == HttpMethod.POST)
        @Assert(req.path, "/api")
        @Assert(req.body, "data")
    }

    @TestCase
    func testRequestHeaders() {
        let req = Request(HttpMethod.GET, "/")
```

# method TestRequest.func testCreateGetRequest()

## function:

实现 `` 中的 `testCreateGetRequest` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testCreateGetRequest() {
        let req = Request(HttpMethod.GET, "/hello")
        @Assert(req.method == HttpMethod.GET)
        @Assert(req.path, "/hello")
        @Assert(req.body, "")
    }

    @TestCase
    func testCreatePostRequestWithBody() {
        let req = Request(HttpMethod.POST, "/api", "data")
        @Assert(req.method == HttpMethod.POST)
```

# method TestRequest.func testCreatePostRequestWithBody()

## function:

实现 `` 中的 `testCreatePostRequestWithBody` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testCreatePostRequestWithBody() {
        let req = Request(HttpMethod.POST, "/api", "data")
        @Assert(req.method == HttpMethod.POST)
        @Assert(req.path, "/api")
        @Assert(req.body, "data")
    }

    @TestCase
    func testRequestHeaders() {
        let req = Request(HttpMethod.GET, "/")
        req.headers["Content-Type"] = "application/json"
```

# method TestRequest.func testRequestHeaders()

## function:

实现 `` 中的 `testRequestHeaders` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testRequestHeaders() {
        let req = Request(HttpMethod.GET, "/")
        req.headers["Content-Type"] = "application/json"
        @Assert(req.header("Content-Type").getOrThrow(), "application/json")
    }

    @TestCase
    func testQueryStringParsing() {
        let req = Request(HttpMethod.GET, "/search?q=hello&page=1")
        @Assert(req.path, "/search")
        @Assert(req.query("q").getOrThrow(), "hello")
```

# method TestRequest.func testQueryStringParsing()

## function:

实现 `` 中的 `testQueryStringParsing` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testQueryStringParsing() {
        let req = Request(HttpMethod.GET, "/search?q=hello&page=1")
        @Assert(req.path, "/search")
        @Assert(req.query("q").getOrThrow(), "hello")
        @Assert(req.query("page").getOrThrow(), "1")
    }

    @TestCase
    func testQueryStringMultipleParams() {
        let req = Request(HttpMethod.GET, "/api?a=1&b=2&c=3")
        @Assert(req.path, "/api")
```

# method TestRequest.func testQueryStringMultipleParams()

## function:

实现 `` 中的 `testQueryStringMultipleParams` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testQueryStringMultipleParams() {
        let req = Request(HttpMethod.GET, "/api?a=1&b=2&c=3")
        @Assert(req.path, "/api")
        @Assert(req.query("a").getOrThrow(), "1")
        @Assert(req.query("b").getOrThrow(), "2")
        @Assert(req.query("c").getOrThrow(), "3")
    }

    @TestCase
    func testQueryStringEmptyValue() {
        let req = Request(HttpMethod.GET, "/path?key=")
```

# method TestRequest.func testQueryStringEmptyValue()

## function:

实现 `` 中的 `testQueryStringEmptyValue` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testQueryStringEmptyValue() {
        let req = Request(HttpMethod.GET, "/path?key=")
        @Assert(req.path, "/path")
        @Assert(req.query("key").getOrThrow(), "")
    }

    @TestCase
    func testPathWithoutQueryString() {
        let req = Request(HttpMethod.GET, "/hello")
        @Assert(req.path, "/hello")
        @Assert(req.query("anything").isNone())
```

# method TestRequest.func testPathWithoutQueryString()

## function:

实现 `` 中的 `testPathWithoutQueryString` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testPathWithoutQueryString() {
        let req = Request(HttpMethod.GET, "/hello")
        @Assert(req.path, "/hello")
        @Assert(req.query("anything").isNone())
    }

    @TestCase
    func testConvenienceMethods() {
        let req = Request(HttpMethod.GET, "/users/42?format=json")
        req.pathParams["id"] = "42"
        req.headers["Accept"] = "text/html"
```

# method TestRequest.func testConvenienceMethods()

## function:

实现 `` 中的 `testConvenienceMethods` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testConvenienceMethods() {
        let req = Request(HttpMethod.GET, "/users/42?format=json")
        req.pathParams["id"] = "42"
        req.headers["Accept"] = "text/html"
        @Assert(req.param("id").getOrThrow(), "42")
        @Assert(req.query("format").getOrThrow(), "json")
        @Assert(req.header("Accept").getOrThrow(), "text/html")
        @Assert(req.param("missing").isNone())
    }
}
```

# class TestResponse

## function:

封装 `` 中与 `TestResponse` 相关的数据和行为，是项目中的类级实现单元。

## kind:

class

## access:

internal

## extends:

none

## implements:

none

## properties:

- `internal let resp: None`

- `internal let r: None`

## usage example:

```cangjie
class TestResponse {
    @TestCase
    func testDefaultResponse() {
        let resp = Response()
        @Assert(resp.statusCode, 200)
        @Assert(resp.body, "")
    }

    @TestCase
    func testSetStatusCode() {
        let resp = Response()
        resp.statusCode = 404
        @Assert(resp.statusCode, 404)
    }

    @TestCase
    func testSetBody() {
        let resp = Response()
        resp.body = "Hello"
        @Assert(resp.body, "Hello")
```

# method TestResponse.func testDefaultResponse()

## function:

实现 `` 中的 `testDefaultResponse` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testDefaultResponse() {
        let resp = Response()
        @Assert(resp.statusCode, 200)
        @Assert(resp.body, "")
    }

    @TestCase
    func testSetStatusCode() {
        let resp = Response()
        resp.statusCode = 404
        @Assert(resp.statusCode, 404)
```

# method TestResponse.func testSetStatusCode()

## function:

实现 `` 中的 `testSetStatusCode` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testSetStatusCode() {
        let resp = Response()
        resp.statusCode = 404
        @Assert(resp.statusCode, 404)
    }

    @TestCase
    func testSetBody() {
        let resp = Response()
        resp.body = "Hello"
        @Assert(resp.body, "Hello")
```

# method TestResponse.func testSetBody()

## function:

实现 `` 中的 `testSetBody` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testSetBody() {
        let resp = Response()
        resp.body = "Hello"
        @Assert(resp.body, "Hello")
    }

    @TestCase
    func testSetHeader() {
        let resp = Response()
        resp.setHeader("X-Custom", "value")
        @Assert(resp.headers.get("X-Custom").getOrThrow(), "value")
```

# method TestResponse.func testSetHeader()

## function:

实现 `` 中的 `testSetHeader` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testSetHeader() {
        let resp = Response()
        resp.setHeader("X-Custom", "value")
        @Assert(resp.headers.get("X-Custom").getOrThrow(), "value")
    }

    @TestCase
    func testStatusChaining() {
        let resp = Response()
        let r = resp.status(201)
        @Assert(r.statusCode, 201)
```

# method TestResponse.func testStatusChaining()

## function:

实现 `` 中的 `testStatusChaining` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testStatusChaining() {
        let resp = Response()
        let r = resp.status(201)
        @Assert(r.statusCode, 201)
        r.body = "test"
        @Assert(resp.body, "test")
    }

    @TestCase
    func testJsonHelper() {
        let resp = Response()
```

# method TestResponse.func testJsonHelper()

## function:

实现 `` 中的 `testJsonHelper` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testJsonHelper() {
        let resp = Response()
        resp.json("{\"key\":\"value\"}")
        @Assert(resp.headers.get("Content-Type").getOrThrow(), "application/json")
        @Assert(resp.body, "{\"key\":\"value\"}")
    }

    @TestCase
    func testTextHelper() {
        let resp = Response()
        resp.text("plain text")
```

# method TestResponse.func testTextHelper()

## function:

实现 `` 中的 `testTextHelper` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testTextHelper() {
        let resp = Response()
        resp.text("plain text")
        @Assert(resp.headers.get("Content-Type").getOrThrow(), "text/plain")
        @Assert(resp.body, "plain text")
    }

    @TestCase
    func testHtmlHelper() {
        let resp = Response()
        resp.html("<h1>Hello</h1>")
```

# method TestResponse.func testHtmlHelper()

## function:

实现 `` 中的 `testHtmlHelper` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testHtmlHelper() {
        let resp = Response()
        resp.html("<h1>Hello</h1>")
        @Assert(resp.headers.get("Content-Type").getOrThrow(), "text/html")
        @Assert(resp.body, "<h1>Hello</h1>")
    }
}

// ===== Router Tests =====

@Test
```

# class TestRouter

## function:

路由请求，管理 `TestRouter` 相关的路径映射。

## kind:

class

## access:

internal

## extends:

none

## implements:

none

## properties:

- `internal let router: None`

- `internal let result: None`

- `internal let rm: None`

## usage example:

```cangjie
class TestRouter {
    @TestCase
    func testExactPathMatch() {
        let router = Router()
        router.addRoute(HttpMethod.GET, "/hello", { _: HttpContext => })
        let result = router.findRoute(HttpMethod.GET, "/hello")
        @Assert(!result.isNone())
    }

    @TestCase
    func testSinglePathParam() {
        let router = Router()
        router.addRoute(HttpMethod.GET, "/users/:id", { _: HttpContext => })
        let result = router.findRoute(HttpMethod.GET, "/users/42")
        @Assert(!result.isNone())
        let rm = result.getOrThrow()
        @Assert(rm.params.get("id").getOrThrow(), "42")
    }

    @TestCase
```

# method TestRouter.func testExactPathMatch()

## function:

实现 `` 中的 `testExactPathMatch` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testExactPathMatch() {
        let router = Router()
        router.addRoute(HttpMethod.GET, "/hello", { _: HttpContext => })
        let result = router.findRoute(HttpMethod.GET, "/hello")
        @Assert(!result.isNone())
    }

    @TestCase
    func testSinglePathParam() {
        let router = Router()
        router.addRoute(HttpMethod.GET, "/users/:id", { _: HttpContext => })
```

# method TestRouter.func testSinglePathParam()

## function:

实现 `` 中的 `testSinglePathParam` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testSinglePathParam() {
        let router = Router()
        router.addRoute(HttpMethod.GET, "/users/:id", { _: HttpContext => })
        let result = router.findRoute(HttpMethod.GET, "/users/42")
        @Assert(!result.isNone())
        let rm = result.getOrThrow()
        @Assert(rm.params.get("id").getOrThrow(), "42")
    }

    @TestCase
    func testMultiplePathParams() {
```

# method TestRouter.func testMultiplePathParams()

## function:

实现 `` 中的 `testMultiplePathParams` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testMultiplePathParams() {
        let router = Router()
        router.addRoute(HttpMethod.GET, "/users/:userId/posts/:postId", { _: HttpContext => })
        let result = router.findRoute(HttpMethod.GET, "/users/1/posts/99")
        @Assert(!result.isNone())
        let rm = result.getOrThrow()
        @Assert(rm.params.get("userId").getOrThrow(), "1")
        @Assert(rm.params.get("postId").getOrThrow(), "99")
    }

    @TestCase
```

# method TestRouter.func testNoMatchReturnsNone()

## function:

实现 `` 中的 `testNoMatchReturnsNone` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testNoMatchReturnsNone() {
        let router = Router()
        router.addRoute(HttpMethod.GET, "/hello", { _: HttpContext => })
        let result = router.findRoute(HttpMethod.GET, "/world")
        @Assert(result.isNone())
    }

    @TestCase
    func testWrongMethodReturnsNone() {
        let router = Router()
        router.addRoute(HttpMethod.GET, "/hello", { _: HttpContext => })
```

# method TestRouter.func testWrongMethodReturnsNone()

## function:

实现 `` 中的 `testWrongMethodReturnsNone` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testWrongMethodReturnsNone() {
        let router = Router()
        router.addRoute(HttpMethod.GET, "/hello", { _: HttpContext => })
        let result = router.findRoute(HttpMethod.POST, "/hello")
        @Assert(result.isNone())
    }

    @TestCase
    func testRootPathMatch() {
        let router = Router()
        router.addRoute(HttpMethod.GET, "/", { _: HttpContext => })
```

# method TestRouter.func testRootPathMatch()

## function:

实现 `` 中的 `testRootPathMatch` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testRootPathMatch() {
        let router = Router()
        router.addRoute(HttpMethod.GET, "/", { _: HttpContext => })
        let result = router.findRoute(HttpMethod.GET, "/")
        @Assert(!result.isNone())
    }

    @TestCase
    func testMultipleRoutes() {
        let router = Router()
        router.addRoute(HttpMethod.GET, "/a", { ctx: HttpContext =>
```

# method TestRouter.func testMultipleRoutes()

## function:

实现 `` 中的 `testMultipleRoutes` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testMultipleRoutes() {
        let router = Router()
        router.addRoute(HttpMethod.GET, "/a", { ctx: HttpContext =>
            ctx.response.body = "a"
        })
        router.addRoute(HttpMethod.GET, "/b", { ctx: HttpContext =>
            ctx.response.body = "b"
        })
        @Assert(!router.findRoute(HttpMethod.GET, "/a").isNone())
        @Assert(!router.findRoute(HttpMethod.GET, "/b").isNone())
        @Assert(router.findRoute(HttpMethod.GET, "/c").isNone())
```

# method TestRouter.func testMethodRouting()

## function:

实现 `` 中的 `testMethodRouting` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testMethodRouting() {
        let router = Router()
        router.addRoute(HttpMethod.GET, "/data", { _: HttpContext => })
        router.addRoute(HttpMethod.POST, "/data", { _: HttpContext => })
        @Assert(!router.findRoute(HttpMethod.GET, "/data").isNone())
        @Assert(!router.findRoute(HttpMethod.POST, "/data").isNone())
    }

    @TestCase
    func testStaticAndParamMixed() {
        let router = Router()
```

# method TestRouter.func testStaticAndParamMixed()

## function:

实现 `` 中的 `testStaticAndParamMixed` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testStaticAndParamMixed() {
        let router = Router()
        router.addRoute(HttpMethod.GET, "/api/users/:id/profile", { _: HttpContext => })
        let result = router.findRoute(HttpMethod.GET, "/api/users/5/profile")
        @Assert(!result.isNone())
        @Assert(result.getOrThrow().params.get("id").getOrThrow(), "5")
    }

    @TestCase
    func testNoMatchDifferentDepth() {
        let router = Router()
```

# method TestRouter.func testNoMatchDifferentDepth()

## function:

实现 `` 中的 `testNoMatchDifferentDepth` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testNoMatchDifferentDepth() {
        let router = Router()
        router.addRoute(HttpMethod.GET, "/a/b", { _: HttpContext => })
        @Assert(router.findRoute(HttpMethod.GET, "/a").isNone())
        @Assert(router.findRoute(HttpMethod.GET, "/a/b/c").isNone())
    }
}

// ===== Route Group Tests =====

@Test
```

# class TestRouteGroup

## function:

封装 `` 中与 `TestRouteGroup` 相关的数据和行为，是项目中的类级实现单元。

## kind:

class

## access:

internal

## extends:

none

## implements:

none

## properties:

- `internal let app: None`

- `internal let api: None`

- `internal let ctx: None`

- `internal let ctx1: None`

- `internal let ctx2: None`

- `internal let id: None`

## usage example:

```cangjie
class TestRouteGroup {
    @TestCase
    func testGroupPrefixGet() {
        let app = WebApp()
        let api = app.group("/api")
        api.get("/users", { ctx: HttpContext =>
            ctx.response.body = "user list"
        })
        let ctx = HttpContext(Request(HttpMethod.GET, "/api/users"), Response(), app.services)
        app.handleRequest(ctx)
        @Assert(ctx.response.body, "user list")
    }

    @TestCase
    func testGroupPrefixPost() {
        let app = WebApp()
        let api = app.group("/api")
        api.post("/users", { ctx: HttpContext =>
            ctx.response.body = "created"
        })
```

# method TestRouteGroup.func testGroupPrefixGet()

## function:

实现 `` 中的 `testGroupPrefixGet` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testGroupPrefixGet() {
        let app = WebApp()
        let api = app.group("/api")
        api.get("/users", { ctx: HttpContext =>
            ctx.response.body = "user list"
        })
        let ctx = HttpContext(Request(HttpMethod.GET, "/api/users"), Response(), app.services)
        app.handleRequest(ctx)
        @Assert(ctx.response.body, "user list")
    }
```

# method TestRouteGroup.func testGroupPrefixPost()

## function:

实现 `` 中的 `testGroupPrefixPost` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testGroupPrefixPost() {
        let app = WebApp()
        let api = app.group("/api")
        api.post("/users", { ctx: HttpContext =>
            ctx.response.body = "created"
        })
        let ctx = HttpContext(Request(HttpMethod.POST, "/api/users"), Response(), app.services)
        app.handleRequest(ctx)
        @Assert(ctx.response.body, "created")
    }
```

# method TestRouteGroup.func testGroupMultipleRoutes()

## function:

实现 `` 中的 `testGroupMultipleRoutes` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testGroupMultipleRoutes() {
        let app = WebApp()
        let api = app.group("/api/v1")
        api.get("/items", { ctx: HttpContext => ctx.response.body = "items" })
        api.post("/items", { ctx: HttpContext => ctx.response.body = "item created" })
        api.delete("/items/:id", { ctx: HttpContext => ctx.response.body = "deleted" })

        let ctx1 = HttpContext(Request(HttpMethod.GET, "/api/v1/items"), Response(), app.services)
        app.handleRequest(ctx1)
        @Assert(ctx1.response.body, "items")
```

# method TestRouteGroup.func testGroupWithPathParams()

## function:

实现 `` 中的 `testGroupWithPathParams` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testGroupWithPathParams() {
        let app = WebApp()
        let api = app.group("/api")
        api.get("/users/:id", { ctx: HttpContext =>
            let id = ctx.request.param("id") ?? "none"
            ctx.response.body = "user:${id}"
        })
        let ctx = HttpContext(Request(HttpMethod.GET, "/api/users/42"), Response(), app.services)
        app.handleRequest(ctx)
        @Assert(ctx.response.body, "user:42")
    }
```

# method TestRouteGroup.func testGroupNoMatchWithoutPrefix()

## function:

实现 `` 中的 `testGroupNoMatchWithoutPrefix` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testGroupNoMatchWithoutPrefix() {
        let app = WebApp()
        let api = app.group("/api")
        api.get("/users", { ctx: HttpContext => ctx.response.body = "users" })
        let ctx = HttpContext(Request(HttpMethod.GET, "/users"), Response(), app.services)
        app.handleRequest(ctx)
        @Assert(ctx.response.statusCode, 404)
    }
}

// ===== Middleware Tests =====
```

# class TestMiddleware

## function:

封装 `` 中与 `TestMiddleware` 相关的数据和行为，是项目中的类级实现单元。

## kind:

class

## access:

internal

## extends:

none

## implements:

none

## properties:

- `internal let app: None`

- `internal let ctx: None`

- `internal let order: None`

- `internal let log: None`

## usage example:

```cangjie
class TestMiddleware {
    @TestCase
    func testSingleMiddleware() {
        let app = WebApp()
        app.use({ ctx: HttpContext, next: () -> Unit =>
            ctx.response.setHeader("X-Middleware", "applied")
            next()
        })
        app.get("/test", { ctx: HttpContext =>
            ctx.response.body = "ok"
        })
        let ctx = HttpContext(Request(HttpMethod.GET, "/test"), Response(), app.services)
        app.handleRequest(ctx)
        @Assert(ctx.response.headers.get("X-Middleware").getOrThrow(), "applied")
        @Assert(ctx.response.body, "ok")
    }

    @TestCase
    func testMiddlewareOrder() {
        let app = WebApp()
```

# method TestMiddleware.func testSingleMiddleware()

## function:

实现 `` 中的 `testSingleMiddleware` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testSingleMiddleware() {
        let app = WebApp()
        app.use({ ctx: HttpContext, next: () -> Unit =>
            ctx.response.setHeader("X-Middleware", "applied")
            next()
        })
        app.get("/test", { ctx: HttpContext =>
            ctx.response.body = "ok"
        })
        let ctx = HttpContext(Request(HttpMethod.GET, "/test"), Response(), app.services)
        app.handleRequest(ctx)
```

# method TestMiddleware.func testMiddlewareOrder()

## function:

实现 `` 中的 `testMiddlewareOrder` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testMiddlewareOrder() {
        let app = WebApp()
        let order = ArrayList<String>()
        app.use({ ctx: HttpContext, next: () -> Unit =>
            order.add("first-before")
            next()
            order.add("first-after")
        })
        app.use({ ctx: HttpContext, next: () -> Unit =>
            order.add("second-before")
            next()
```

# method TestMiddleware.func testMiddlewareModifyResponse()

## function:

实现 `` 中的 `testMiddlewareModifyResponse` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testMiddlewareModifyResponse() {
        let app = WebApp()
        app.use({ ctx: HttpContext, next: () -> Unit =>
            next()
            ctx.response.setHeader("X-After", "true")
        })
        app.get("/test", { ctx: HttpContext =>
            ctx.response.body = "ok"
        })
        let ctx = HttpContext(Request(HttpMethod.GET, "/test"), Response(), app.services)
        app.handleRequest(ctx)
```

# method TestMiddleware.func testMiddlewareShortCircuit()

## function:

实现 `` 中的 `testMiddlewareShortCircuit` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testMiddlewareShortCircuit() {
        let app = WebApp()
        app.use({ ctx: HttpContext, _next: () -> Unit =>
            ctx.response.statusCode = 403
            ctx.response.body = "Forbidden"
        })
        app.get("/test", { ctx: HttpContext =>
            ctx.response.body = "should not reach"
        })
        let ctx = HttpContext(Request(HttpMethod.GET, "/test"), Response(), app.services)
        app.handleRequest(ctx)
```

# method TestMiddleware.func testMiddlewareChain()

## function:

实现 `` 中的 `testMiddlewareChain` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testMiddlewareChain() {
        let app = WebApp()
        app.use({ ctx: HttpContext, next: () -> Unit =>
            ctx.response.setHeader("X-1", "a")
            next()
        })
        app.use({ ctx: HttpContext, next: () -> Unit =>
            ctx.response.setHeader("X-2", "b")
            next()
        })
        app.use({ ctx: HttpContext, next: () -> Unit =>
```

# method TestMiddleware.func testNoMiddleware()

## function:

实现 `` 中的 `testNoMiddleware` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testNoMiddleware() {
        let app = WebApp()
        app.get("/test", { ctx: HttpContext =>
            ctx.response.body = "direct"
        })
        let ctx = HttpContext(Request(HttpMethod.GET, "/test"), Response(), app.services)
        app.handleRequest(ctx)
        @Assert(ctx.response.body, "direct")
    }

    @TestCase
```

# method TestMiddleware.func testMiddlewareBeforeAndAfter()

## function:

实现 `` 中的 `testMiddlewareBeforeAndAfter` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testMiddlewareBeforeAndAfter() {
        let app = WebApp()
        let log = ArrayList<String>()
        app.use({ ctx: HttpContext, next: () -> Unit =>
            log.add("before:${ctx.request.path}")
            next()
            log.add("after:${ctx.response.statusCode}")
        })
        app.get("/test", { ctx: HttpContext =>
            ctx.response.statusCode = 201
            ctx.response.body = "created"
```

# method TestMiddleware.func testMiddlewareErrorRecovery()

## function:

实现 `` 中的 `testMiddlewareErrorRecovery` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testMiddlewareErrorRecovery() {
        let app = WebApp()
        app.use({ ctx: HttpContext, next: () -> Unit =>
            try {
                next()
            } catch (_: Exception) {
                ctx.response.statusCode = 500
                ctx.response.body = "Internal Server Error"
            }
        })
        app.get("/fail", { _: HttpContext =>
```

# class TestWebApp

## function:

封装 `` 中与 `TestWebApp` 相关的数据和行为，是项目中的类级实现单元。

## kind:

class

## access:

internal

## extends:

none

## implements:

none

## properties:

- `internal let app: None`

- `internal let ctx: None`

- `internal let id: None`

- `internal let q: None`

- `internal let msg: None`

- `internal let api: None`

- `internal let counter: None`

- `internal let ctx1: None`

- `internal let ctx2: None`

## usage example:

```cangjie
class TestWebApp {
    @TestCase
    func testSimpleGetRequest() {
        let app = WebApp()
        app.get("/hello", { ctx: HttpContext =>
            ctx.response.body = "Hello, World!"
        })
        let ctx = HttpContext(Request(HttpMethod.GET, "/hello"), Response(), app.services)
        app.handleRequest(ctx)
        @Assert(ctx.response.statusCode, 200)
        @Assert(ctx.response.body, "Hello, World!")
    }

    @TestCase
    func testPostWithBody() {
        let app = WebApp()
        app.post("/echo", { ctx: HttpContext =>
            ctx.response.body = ctx.request.body
        })
        let ctx = HttpContext(Request(HttpMethod.POST, "/echo", "test data"), Response(), app.services)
```

# method TestWebApp.func testSimpleGetRequest()

## function:

实现 `` 中的 `testSimpleGetRequest` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testSimpleGetRequest() {
        let app = WebApp()
        app.get("/hello", { ctx: HttpContext =>
            ctx.response.body = "Hello, World!"
        })
        let ctx = HttpContext(Request(HttpMethod.GET, "/hello"), Response(), app.services)
        app.handleRequest(ctx)
        @Assert(ctx.response.statusCode, 200)
        @Assert(ctx.response.body, "Hello, World!")
    }
```

# method TestWebApp.func testPostWithBody()

## function:

实现 `` 中的 `testPostWithBody` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testPostWithBody() {
        let app = WebApp()
        app.post("/echo", { ctx: HttpContext =>
            ctx.response.body = ctx.request.body
        })
        let ctx = HttpContext(Request(HttpMethod.POST, "/echo", "test data"), Response(), app.services)
        app.handleRequest(ctx)
        @Assert(ctx.response.body, "test data")
    }

    @TestCase
```

# method TestWebApp.func testRouteNotFound()

## function:

实现 `` 中的 `testRouteNotFound` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testRouteNotFound() {
        let app = WebApp()
        app.get("/hello", { ctx: HttpContext =>
            ctx.response.body = "Hello"
        })
        let ctx = HttpContext(Request(HttpMethod.GET, "/unknown"), Response(), app.services)
        app.handleRequest(ctx)
        @Assert(ctx.response.statusCode, 404)
        @Assert(ctx.response.body, "Not Found")
    }
```

# method TestWebApp.func testPathParams()

## function:

实现 `` 中的 `testPathParams` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testPathParams() {
        let app = WebApp()
        app.get("/users/:id", { ctx: HttpContext =>
            let id = ctx.request.param("id") ?? "none"
            ctx.response.body = "User ${id}"
        })
        let ctx = HttpContext(Request(HttpMethod.GET, "/users/42"), Response(), app.services)
        app.handleRequest(ctx)
        @Assert(ctx.response.body, "User 42")
    }
```

# method TestWebApp.func testQueryParamsInRoute()

## function:

实现 `` 中的 `testQueryParamsInRoute` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testQueryParamsInRoute() {
        let app = WebApp()
        app.get("/search", { ctx: HttpContext =>
            let q = ctx.request.query("q") ?? ""
            ctx.response.body = "search:${q}"
        })
        let ctx = HttpContext(Request(HttpMethod.GET, "/search?q=hello"), Response(), app.services)
        app.handleRequest(ctx)
        @Assert(ctx.response.body, "search:hello")
    }
```

# method TestWebApp.func testMiddlewareApplied()

## function:

实现 `` 中的 `testMiddlewareApplied` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testMiddlewareApplied() {
        let app = WebApp()
        app.use({ ctx: HttpContext, next: () -> Unit =>
            ctx.response.setHeader("X-Powered-By", "WebFramework")
            next()
        })
        app.get("/test", { ctx: HttpContext =>
            ctx.response.body = "ok"
        })
        let ctx = HttpContext(Request(HttpMethod.GET, "/test"), Response(), app.services)
        app.handleRequest(ctx)
```

# method TestWebApp.func testServiceInjection()

## function:

实现 `` 中的 `testServiceInjection` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testServiceInjection() {
        let app = WebApp()
        app.services.register("msg", { => MessageService("hello") }, lifetime: Singleton)
        app.get("/msg", { ctx: HttpContext =>
            let msg = (ctx.services.resolve("msg") as MessageService).getOrThrow()
            ctx.response.body = msg.getMessage()
        })
        let ctx = HttpContext(Request(HttpMethod.GET, "/msg"), Response(), app.services)
        app.handleRequest(ctx)
        @Assert(ctx.response.body, "hello")
    }
```

# method TestWebApp.func testGroupRouting()

## function:

实现 `` 中的 `testGroupRouting` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testGroupRouting() {
        let app = WebApp()
        let api = app.group("/api/v1")
        api.get("/status", { ctx: HttpContext =>
            ctx.response.json("{\"ok\":true}")
        })
        let ctx = HttpContext(Request(HttpMethod.GET, "/api/v1/status"), Response(), app.services)
        app.handleRequest(ctx)
        @Assert(ctx.response.body, "{\"ok\":true}")
        @Assert(ctx.response.headers.get("Content-Type").getOrThrow(), "application/json")
    }
```

# method TestWebApp.func testFullRestPipeline()

## function:

实现 `` 中的 `testFullRestPipeline` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testFullRestPipeline() {
        let app = WebApp()
        app.services.register("counter", { => CounterService() }, lifetime: Singleton)

        app.use({ ctx: HttpContext, next: () -> Unit =>
            let counter = (ctx.services.resolve("counter") as CounterService).getOrThrow()
            counter.increment()
            next()
            ctx.response.setHeader("X-Request-Count", "${counter.getCount()}")
        })
```

# method TestWebApp.func testPutAndDelete()

## function:

实现 `` 中的 `testPutAndDelete` 逻辑，是该模块中的可调用函数单元。

## access:

internal

## is_static:

False

## usage example:

```cangjie
func testPutAndDelete() {
        let app = WebApp()
        app.put("/items/:id", { ctx: HttpContext =>
            let id = ctx.request.param("id") ?? "none"
            ctx.response.body = "Updated ${id}"
        })
        app.delete("/items/:id", { ctx: HttpContext =>
            let id = ctx.request.param("id") ?? "none"
            ctx.response.body = "Deleted ${id}"
        })
```
