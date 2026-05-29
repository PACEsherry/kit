<!-- source: kit-mcp-site\app\docs\quickstart\page.tsx -->

# `kit-mcp-site\app\docs\quickstart\page.tsx`

---

## function:

这个文件控制项目的快速入门文档页面，负责展示安装前置条件和步骤引导。它使用UI组件如Card、Badge、Tabs构建交互式布局，并导入图标以增强视觉效果。作为Next.js页面组件，它在构建时生成文档页面，为用户提供指南访问，不影响核心功能但提升项目可用性。

## declaration:

```ts
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import Link from "next/link";
import { Badge } from "@/components/ui/badge";
import { Tabs, TabsContent, TabsList, TabsTrigger } from "@/components/ui/tabs";
import { Terminal, CheckCircle, Copy, ArrowRight } from "lucide-react";
import { InstallCursorButton } from "@/components/install-cursor-button";

export default function QuickstartPage() {
  return (
    <div className="prose prose-slate max-w-none">
      <div className="not-prose mb-8">
        <Badge variant="secondary" className="neo-badge bg-yellow-300 text-black mb-4">
          Getting Started
        </Badge>
        <h1 className="text-4xl font-bold mb-4">Quick Start Guide</h1>
        <p className="text-xl text-muted-foreground">
          Get kit-dev-mcp running in under 2 minutes
        </p>
      </div>

      <div className="my-8">
        <h2 className="text-2xl font-bold mb-4">Prerequisites</h2>
        <ul className="space-y-2 text-muted-foreground">
          <li className="flex items-start">
            <CheckCircle className="h-5 w-5 text-green-500 mr-2 mt-0.5 flex-shrink-0" />
            <span>Python 3.8+ installed</span>
          </li>
          <li className="flex items-start">
            <CheckCircle className="h-5 w-5 text-green-500 mr-2 mt-0.5 flex-shrink-0" />
            <span>MCP-compatible AI assistant (Cursor, Windsurf, Claude Code, VS Code)</span>
```
