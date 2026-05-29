<!-- source: kit-mcp-site\tailwind.config.ts -->

# `kit-mcp-site\tailwind.config.ts`

---

## function:

这个Tailwind CSS配置文件负责管理项目的样式系统，指定了深色模式通过CSS类启用，并确定需要扫描生成工具类的文件路径范围。关键配置包括使用CSS变量定义主题颜色（如primary、destructive等语义化颜色），以及容器居中和响应式断点设置，使得组件样式能自动适配主题切换。它直接影响构建时的CSS生成效率与最终产物大小，未正确配置会导致类名未被提取或样式失效。

## declaration:

```ts
import type { Config } from "tailwindcss";

const config: Config = {
  darkMode: ["class"],
  content: [
    "./pages/**/*.{js,ts,jsx,tsx,mdx}",
    "./components/**/*.{js,ts,jsx,tsx,mdx}",
    "./app/**/*.{js,ts,jsx,tsx,mdx}",
  ],
  theme: {
    container: {
      center: true,
      padding: "2rem",
      screens: {
        "2xl": "1400px",
      },
    },
    extend: {
      colors: {
        border: "hsl(var(--border))",
        input: "hsl(var(--input))",
        ring: "hsl(var(--ring))",
        background: "hsl(var(--background))",
        foreground: "hsl(var(--foreground))",
        primary: {
          DEFAULT: "hsl(var(--primary))",
          foreground: "hsl(var(--primary-foreground))",
        },
        secondary: {
          DEFAULT: "hsl(var(--secondary))",
```
