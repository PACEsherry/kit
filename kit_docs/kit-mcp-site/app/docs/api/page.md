<!-- source: kit-mcp-site\app\docs\api\page.tsx -->

# `kit-mcp-site\app\docs\api\page.tsx`

---

## function:

该文件是一个React页面组件，用于展示API参考文档，具体控制kit-dev-mcp工具的参数和功能说明的显示范围。关键配置项包括UI组件（如Card、Badge、Tabs）的导入和结构化布局，以及示例API工具（如open_repository）的参数定义，如path、github_token和ref，用于文档化和交互展示。作为Next.js路由页面，它在项目构建时被编译，运行时渲染前端界面，不影响核心后端逻辑或构建流程。

## declaration:

```ts
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import { Tabs, TabsContent, TabsList, TabsTrigger } from "@/components/ui/tabs";
import { Code2, FileJson, Package } from "lucide-react";

export default function ApiPage() {
  return (
    <div className="prose prose-slate max-w-none">
      <div className="not-prose mb-8">
        <Badge variant="secondary" className="neo-badge bg-yellow-300 text-black mb-4">
          API Reference
        </Badge>
        <h1 className="text-4xl font-bold mb-4">API Reference</h1>
        <p className="text-xl text-muted-foreground">
          Complete reference for kit-dev-mcp tools and responses
        </p>
      </div>

      <div className="my-8">
        <h2 className="text-2xl font-bold mb-4">Repository Operations</h2>
        
        <Card className="neo-card not-prose mb-6">
          <CardHeader>
            <CardTitle className="font-mono">open_repository</CardTitle>
          </CardHeader>
          <CardContent>
            <div className="space-y-4">
              <div>
                <h4 className="font-semibold mb-2">Parameters</h4>
                <div className="border-2 border-black bg-black rounded-lg p-3 font-mono text-sm">
```
