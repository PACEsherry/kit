<!-- source: kit-mcp-site\app\docs\repository\page.tsx -->

# `kit-mcp-site\app\docs\repository\page.tsx`

---

## function:

这是一个展示仓库管理功能的文档页面组件，而非传统配置文件。它定义了用户界面结构，用于呈现Kit MCP的核心功能模块，本身不包含可配置项。该文件作为页面路由的一部分，会被Next.js编译为静态页面输出，对项目构建输出有贡献，但不影响应用运行时配置。

## declaration:

```ts
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import { Tabs, TabsContent, TabsList, TabsTrigger } from "@/components/ui/tabs";
import { FileCode2, GitBranch, Folder, Globe } from "lucide-react";

export default function RepositoryPage() {
  return (
    <div className="prose prose-slate max-w-none">
      <div className="not-prose mb-8">
        <Badge variant="secondary" className="neo-badge bg-yellow-300 text-black mb-4">
          Core Feature
        </Badge>
        <h1 className="text-4xl font-bold mb-4">Repository Management</h1>
        <p className="text-xl text-muted-foreground">
          Open and analyze local or remote repositories with Kit's powerful tools
        </p>
      </div>

      <div className="my-8">
        <h2 className="text-2xl font-bold mb-4">Overview</h2>
        <p className="text-muted-foreground mb-6">
          Repository management is the foundation of Kit MCP. Once you open a repository, 
          you get access to all of Kit's code intelligence features: symbol extraction, 
          dependency analysis, code search, and more.
        </p>
      </div>

      <Card className="neo-card my-8">
        <CardHeader>
          <CardTitle>Available Tools</CardTitle>
```
