<!-- source: clients\typescript\src\types.ts -->

# `clients\typescript\src\types.ts`

---

## function:

这个配置文件为Kit CLI工具包装器定义了TypeScript类型接口，用于控制代码分析和搜索功能。它提供了配置选项、符号信息、文件结构和搜索结果的结构化定义，以支持工具的灵活交互。

`KitOptions`接口包含可选配置如工具路径和工作目录，用于定制命令行环境；其他接口如`Symbol`和`SearchResult`定义了代码元素和搜索输出的数据结构，确保数据处理的一致性。

作为类型定义文件，它增强了项目的类型安全和开发体验，不直接影响构建或运行；它为与CLI工具交互的模块提供了标准化模型，辅助开发时的代码检查和集成。

## declaration:

```ts
/**
 * Type definitions for Kit CLI wrapper
 */

export interface KitOptions {
  /** Path to the kit executable. Defaults to 'kit' */
  kitPath?: string;
  /** Path to Python executable. Defaults to 'python3' */
  pythonPath?: string;
  /** Working directory for commands */
  cwd?: string;
  /** Environment variables */
  env?: Record<string, string>;
}

export interface Symbol {
  name: string;
  type: string;
  line: number;
  end_line?: number;
  file?: string;
}

export interface FileNode {
  path: string;
  is_dir: boolean;
  size?: number;
}

export interface SearchResult {
```
