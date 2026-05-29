<!-- source: clients\typescript\src\__tests__\integration.test.ts -->

# `clients\typescript\src\__tests__\integration.test.ts`

---

## function:

这个配置文件是一个集成测试脚本，用于验证TypeScript客户端的完整构建和手动测试脚本能否成功执行。它通过环境变量SKIP_INTEGRATION控制是否跳过测试，并设置了5分钟的超时以应对CI环境。该测试是项目质量保证的关键环节，确保客户端在构建后能够正确运行核心功能脚本。

## declaration:

```ts
import { execSync } from "child_process";
import path from "path";

// Skip integration test if environment variable set (e.g., CI debug)
const maybeDescribe = process.env.SKIP_INTEGRATION ? describe.skip : describe;

maybeDescribe("Kit TypeScript wrapper – integration", () => {
  it("should execute test-wrapper script successfully", () => {
    const repoRoot = path.resolve(__dirname, "../../../../");

    // Build the TypeScript client (dist/) – quiet if already built
    execSync("npm run build", {
      cwd: path.join(repoRoot, "clients/typescript"),
      stdio: "inherit",
    });

    // Run the manual wrapper test script; will throw if non-zero exit
    execSync("node clients/typescript/test-wrapper.js", {
      cwd: repoRoot,
      stdio: "inherit",
    });
  }, 300_000); // allow up to 5 min in CI
});
```
