<!-- source: kit-mcp-site\app\docs\layout.tsx -->

# `kit-mcp-site\app\docs\layout.tsx`

---

## function:

该文件是 Next.js 应用中文档页面的布局组件，控制文档页面的整体结构与导航。它通过 `sidebarItems` 数组定义了左侧边栏的菜单配置，包含分组标题、导航链接及其图标，为文档部分提供统一的导航框架。作为布局组件，它在路由导航时自动应用，不影响项目的构建配置或运行时性能，仅决定文档页面的视图结构。

## declaration:

```ts
import Link from "next/link";
import { Button } from "@/components/ui/button";
import { Terminal, ChevronRight, Home, Book, Wrench, Zap, Shield, FileCode, Search } from "lucide-react";

const sidebarItems = [
  {
    title: "Getting Started",
    items: [
      { href: "/docs", label: "Introduction", icon: Home },
      { href: "/docs/quickstart", label: "Quick Start", icon: Zap },
      { href: "/docs/configuration", label: "Configuration", icon: Wrench },
    ]
  },
  {
    title: "Core Features",
    items: [
      { href: "/docs/repository", label: "Repository Management", icon: FileCode },
      { href: "/docs/symbols", label: "Symbol Extraction", icon: Zap },
      { href: "/docs/search", label: "Code Search", icon: Search },
      { href: "/docs/package-search", label: "Package Search", icon: Search },
      { href: "/docs/research", label: "Documentation Research", icon: Book },
    ]
  },
  {
    title: "Reference",
    items: [
      { href: "/docs/api", label: "API Reference", icon: Book },
      { href: "/docs/tools", label: "Available Tools", icon: Wrench },
      { href: "/docs/examples", label: "Examples", icon: FileCode },
      { href: "/docs/system-prompts", label: "System Prompts", icon: Zap },
```
