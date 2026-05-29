<!-- source: kit-mcp-site\app\docs\package-search\page.tsx -->

# `kit-mcp-site\app\docs\package-search\page.tsx`

---

## function:

这个文件控制着一个文档页面的展示，用于介绍和演示Chroma Package Search功能，包括搜索工具的使用说明和交互界面。它使用UI组件（如Card、Badge）和图标库构建卡片布局，展示不同搜索工具的描述和功能，帮助用户理解如何通过MCP进行源代码探索。作为Next.js页面，它参与路由生成和前端渲染，依赖项目中的UI组件和图标资源，影响用户界面和文档内容的展示。

## declaration:

```ts
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import { Search, Code, FileText, FileSearch, Key, Sparkles } from "lucide-react";

export default function PackageSearchPage() {
  return (
    <div className="prose prose-slate max-w-none">
      <div className="not-prose mb-8">
        <Badge variant="secondary" className="neo-badge bg-blue-300 text-black mb-4">
          New Feature
        </Badge>
        <h1 className="text-4xl font-bold mb-4">Chroma Package Search</h1>
        <p className="text-xl text-muted-foreground">
          Search and explore source code from popular packages directly through MCP
        </p>
      </div>

      <div className="my-8">
        <h2 className="text-2xl font-bold mb-4">Overview</h2>
        <p className="text-muted-foreground mb-6">
          kit-dev-mcp now integrates with Chroma's Package Search API to provide powerful source code
          exploration capabilities. Search through the actual source code of popular packages using
          regex patterns, semantic search, or read specific files directly.
        </p>

        <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
          <Card className="neo-card border-2 border-blue-500">
            <CardHeader>
              <CardTitle className="flex items-center gap-2 text-lg">
                <Search className="h-5 w-5 text-blue-500" />
```
