<!-- source: clients\typescript\src\kit.ts -->

# `clients\typescript\src\kit.ts`

---

## function:

该配置文件是一个 TypeScript 客户端模块，用于封装对 `kit` 命令行工具的调用，提供代码搜索、符号查找、依赖分析等高级功能。它通过 `kitPath` 和 `pythonPath` 配置项来指定 `kit` 工具及 Python 解释器的路径，支持跨平台运行。在项目运行时，它依赖这些外部工具正确配置，任何路径错误将导致命令执行失败，并通过 `KitCommandError` 提供详细的错误信息。

## declaration:

```ts
import { spawn, SpawnOptions } from "child_process";
import {
  KitOptions,
  KitError,
  Symbol,
  FileNode,
  SearchResult,
  SemanticSearchResult,
  PRReviewOptions,
  ExportOptions,
  SearchOptions,
  SemanticSearchOptions,
  SymbolOptions,
  UsagesOptions,
  DependenciesOptions,
  GitInfo,
} from "./types";
import os from "os";
import path from "path";

class KitCommandError extends Error implements KitError {
  code: string;
  exitCode: number;
  stderr: string;
  constructor(message: string, exitCode: number, stderr: string) {
    super(message);
    this.name = "KitCommandError";
    this.code = "KIT_COMMAND_FAILED";
    this.exitCode = exitCode;
    this.stderr = stderr;
```
