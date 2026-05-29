<!-- source: kit-mcp-site\app\docs\search\page.tsx -->

# `kit-mcp-site\app\docs\search\page.tsx`

---

## function:

这个文件控制搜索功能文档页面的显示，展示kit-dev-mcp提供的文本搜索和AST-based代码模式匹配能力。关键配置项包括导入的UI组件（如Badge、Card）和静态内容，如grep_code工具的示例，用于构建交互式文档界面。作为React前端组件，它影响用户界面渲染，构建时被编译到客户端代码中，运行时展示功能文档，对项目核心逻辑无直接影响。

## declaration:

```ts
import { Badge } from "@/components/ui/badge";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { Tabs, TabsContent, TabsList, TabsTrigger } from "@/components/ui/tabs";
import { Search, Zap, Code2, Activity } from "lucide-react";

export default function SearchPage() {
  return (
    <div className="prose prose-slate max-w-none px-4 sm:px-0">
      <div className="not-prose mb-8">
        <Badge variant="secondary" className="neo-badge bg-yellow-300 text-black mb-4">
          Core Feature
        </Badge>
        <h1 className="text-2xl sm:text-4xl font-bold mb-4">Code Search</h1>
        <p className="text-sm sm:text-xl text-muted-foreground">
          Powerful text search and AST-based code pattern matching
        </p>
      </div>

      <div className="my-8">
        <h2 className="text-xl sm:text-2xl font-bold mb-4">Overview</h2>
        <p className="text-sm sm:text-base text-muted-foreground mb-6">
          kit-dev-mcp provides two powerful search capabilities: fast literal string search with grep,
          and AST-based pattern matching for finding code by structure using tree-sitter.
        </p>
      </div>

      <Card className="my-8 neo-card border-2 border-black shadow-[4px_4px_0px_0px_rgba(0,0,0,1)]">
        <CardHeader>
          <CardTitle>Search Tools</CardTitle>
        </CardHeader>
```
