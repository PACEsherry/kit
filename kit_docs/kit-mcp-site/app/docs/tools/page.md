<!-- source: kit-mcp-site\app\docs\tools\page.tsx -->

# `kit-mcp-site\app\docs\tools\page.tsx`

---

## function:

1. 这个文件是一个 Next.js 页面组件，用于展示和浏览文档工具（MCP工具）列表。它提供了搜索功能和按分类（如“文档研究”、“包搜索”）浏览工具的界面，包含工具名称、描述、参数和使用示例。

2. 关键配置项是 `tools` 数组，每个对象定义了一个工具类别（category）、图标、以及该类别下的具体工具列表。每个工具包含名称（name）、描述（description）、参数列表（parameters）和示例代码（example），用于结构化展示工具信息。

3. 该文件是一个客户端组件（"use client"），使用了React状态管理（useState）和UI组件库。它主要影响前端渲染，定义了静态工具数据，对项目构建无特殊影响，但会作为客户端JavaScript被发送到浏览器，增加了初始加载的包大小。

## declaration:

```ts
"use client";

import { useState } from "react";
import { Button } from "@/components/ui/button";
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import { Input } from "@/components/ui/input";
import { Tabs, TabsContent, TabsList, TabsTrigger } from "@/components/ui/tabs";
import { 
  Search,
  BookOpen,
  FileCode2,
  GitBranch,
  Code2
} from "lucide-react";

const tools = [
  {
    category: "Documentation Research",
    icon: <BookOpen className="h-5 w-5" />,
    tools: [
      {
        name: "deep_research_package",
        description: "Get comprehensive package documentation using multiple sources (Chroma + Context7)",
        parameters: ["package_name", "query"],
        naturalLanguage: "Using Kit, research the documentation for React hooks",
        example: `deep_research_package({
  "package_name": "react",
  "query": "How do hooks work?"  // optional specific question
})`
```
