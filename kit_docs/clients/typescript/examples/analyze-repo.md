<!-- source: clients\typescript\examples\analyze-repo.ts -->

# `clients\typescript\examples\analyze-repo.ts`

---

## function:

此 TypeScript 文件是一个独立的代码仓库分析示例脚本，其核心功能是利用 `@runcased/kit` 库来读取并解析本地 Git 仓库的关键信息。它会从命令行参数获取仓库路径，依次提取并打印 Git 信息（当前分支、提交哈希、工作区状态）、过滤出特定类型（如 `.ts`, `.js`, `.py`）的源代码文件，并尝试从文件中提取函数、类等代码符号。

它包含的主要“配置”是通过代码逻辑实现的：指定了要分析的文件类型后缀（`.ts`, `.js`, `.py`），并设置了仅分析前3个文件来展示符号提取功能。其关键依赖是外部的 `@runcased/kit` 包，该库提供了仓库实例化、文件树遍历和符号解析等能力。

此脚本是一个开发或分析阶段的辅助工具，不参与项目的实际构建或生产运行流程。它主要用于帮助开发者理解代码仓库的结构、依赖状态和代码组成，对项目的构建产物或运行时行为没有直接影响。

## declaration:

```ts
import { Kit } from "@runcased/kit";

async function main() {
  // Initialize Kit
  const kit = new Kit();

  // Get the repository path from command line or use current directory
  const repoPath = process.argv[2] || ".";

  console.log(`Analyzing repository: ${repoPath}\n`);

  // Create repository instance
  const repo = kit.repository(repoPath);

  // Get git info
  const gitInfo = await repo.gitInfo();
  console.log("Git Information:");
  console.log(`- Branch: ${gitInfo.currentBranch}`);
  console.log(`- SHA: ${gitInfo.currentSha}`);
  console.log(`- Dirty: ${gitInfo.isDirty}`);
  console.log();

  // Get file tree
  const files = await repo.fileTree();
  const sourceFiles = files.filter(
    (f) =>
      !f.is_dir &&
      (f.path.endsWith(".ts") ||
        f.path.endsWith(".js") ||
        f.path.endsWith(".py")),
```
