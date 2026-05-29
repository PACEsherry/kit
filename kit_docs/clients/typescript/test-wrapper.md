<!-- source: clients\typescript\test-wrapper.js -->

# `clients\typescript\test-wrapper.js`

---

## function:

这个文件是一个测试脚本，用于验证 TypeScript 包装器（Kit）的核心功能，包括仓库初始化、Git 信息获取、文件遍历和符号解析。关键配置项主要是 `Kit` 类和 `repository()` 方法，通过传入相对路径（如 `"../.."`）指定目标仓库根目录。运行该脚本不会影响项目构建，但能验证包装器是否正常工作，确保依赖此包装器的其他开发功能（如代码分析、工具集成）的基础能力。

## declaration:

```js
const { Kit } = require("./dist/index");

async function test() {
  console.log("Testing Kit TypeScript wrapper...\n");

  try {
    // Initialize Kit
    const kit = new Kit();
    console.log("✅ Kit initialized");

    // Create repository instance for current directory
    const repo = kit.repository("../.."); // Point to kit root
    console.log("✅ Repository created");

    // Test 1: Get git info
    console.log("\n📊 Git Info:");
    const gitInfo = await repo.gitInfo();
    console.log(`  Branch: ${gitInfo.currentBranch}`);
    console.log(`  SHA: ${gitInfo.currentSha?.substring(0, 8)}...`);
    console.log(`  Dirty: ${gitInfo.isDirty}`);

    // Test 2: Get some Python files
    console.log("\n📁 Python files:");
    const files = await repo.fileTree();
    const pyFiles = files
      .filter((f) => !f.is_dir && f.path.endsWith(".py"))
      .slice(0, 5);
    pyFiles.forEach((f) => console.log(`  - ${f.path}`));

    // Test 3: Extract symbols from a file
```
