<!-- source: kit-mcp-site\app\docs\page.tsx -->

# `kit-mcp-site\app\docs\page.tsx`

---

## function:

1. 这个文件控制文档页面的渲染和展示，作为Next.js页面组件定义kit-dev-mcp工具的交互式文档界面，展示其功能如仓库索引、依赖分析等。
2. 关键配置项包括导入UI组件（如Badge、Card、Tabs）和图标，用于构建页面布局和样式；内容部分定义标题、描述和工具列表，突出工具的核心特性和使用场景。
3. 对项目构建或运行的影响：作为路由页面，影响Next.js的页面生成和渲染；依赖React组件和Tailwind CSS，需确保UI库和样式支持；运行时展示静态文档内容，不涉及后端交互，主要影响前端展示和用户体验。

## declaration:

```ts
import { Badge } from "@/components/ui/badge";
import { Card, CardContent } from "@/components/ui/card";
import { Tabs, TabsContent, TabsList, TabsTrigger } from "@/components/ui/tabs";
import { Terminal, Sparkles, CheckCircle } from "lucide-react";
import Link from "next/link";

export default function DocsPage() {
  return (
    <div className="prose prose-slate max-w-none px-4 sm:px-0">
      <div className="not-prose mb-8">
        <Badge variant="secondary" className="mb-4 neo-badge bg-yellow-300 text-black">
          Version 2.0
        </Badge>
        <h1 className="text-2xl sm:text-4xl font-bold mb-4 break-words">kit-dev-mcp Documentation</h1>
        <p className="text-sm sm:text-xl text-muted-foreground break-words">
          The most comprehensive MCP server with Kit's production-grade code intelligence
        </p>
      </div>

      <div className="my-8">
        <h2 className="text-xl sm:text-2xl font-bold mb-4">What is kit-dev-mcp?</h2>
        <p className="text-sm sm:text-base text-muted-foreground mb-6 break-words">
          kit-dev-mcp provides your AI assistant with <strong>comprehensive development tools</strong>: repository indexing, 
          file trees, fast cached symbol extraction, dependency analysis, semantic search, and deep documentation 
          research using powerful LLMs. All running locally, privately, and for free (just pay for tokens).
        </p>
      </div>

      <Card className="my-8 neo-card">
        <CardContent className="p-4 sm:p-6">
```
