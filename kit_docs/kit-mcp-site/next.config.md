<!-- source: kit-mcp-site\next.config.ts -->

# `kit-mcp-site\next.config.ts`

---

## function:

这个配置文件控制Next.js项目在构建阶段的ESLint检查行为。关键配置项是`eslint.ignoreDuringBuilds`，设置为`true`以忽略构建时的ESLint检查。这会导致构建过程跳过代码质量验证，可能加快构建速度但增加运行时代码错误的风险。

## declaration:

```ts
import type { NextConfig } from "next";

const nextConfig: NextConfig = {
  eslint: {
    ignoreDuringBuilds: true,
  },
};

export default nextConfig;
```
