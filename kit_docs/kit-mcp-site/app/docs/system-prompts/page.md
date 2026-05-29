<!-- source: kit-mcp-site\app\docs\system-prompts\page.tsx -->

# `kit-mcp-site\app\docs\system-prompts\page.tsx`

---

## function:

该配置文件控制文档系统中关于“系统提示词优化指南”页面的展示与交互。它负责向用户展示如何为不同AI助手（如Claude、Cursor等）配置系统提示词，以引导AI更好地使用Kit工具进行代码分析和上下文构建。

关键配置项包括Tabs组件，用于切换不同AI平台的提示词示例；Badge组件用于标识内容分类；Card组件用于结构化展示推荐提示词。这些配置项主要影响文档页面的用户界面和用户体验，不直接参与项目的核心构建或运行逻辑，属于纯前端展示层文档。

## declaration:

```ts
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import { Button } from "@/components/ui/button";
import { Tabs, TabsContent, TabsList, TabsTrigger } from "@/components/ui/tabs";
import { Copy, CheckCircle, Terminal, Sparkles } from "lucide-react";

export default function SystemPromptsPage() {
  return (
    <div className="prose prose-slate max-w-none">
      <div className="not-prose mb-8">
        <Badge variant="secondary" className="neo-badge bg-yellow-300 text-black mb-4">
          Power User Guide
        </Badge>
        <h1 className="text-4xl font-bold mb-4">Optimizing Your AI with System Prompts</h1>
        <p className="text-xl text-muted-foreground">
          Configure your AI assistant to automatically leverage Kit's powerful tools for better code understanding
        </p>
      </div>

      <div className="my-8">
        <h2 className="text-2xl font-bold mb-4">Why System Prompts Matter</h2>
        <p className="text-muted-foreground mb-6">
          System prompts guide your AI assistant's behavior. By adding Kit-specific instructions, you ensure your AI 
          automatically uses the right tools for code analysis, documentation research, and context building - 
          resulting in more accurate and helpful responses.
        </p>
      </div>

      <Card className="neo-card my-8 border-2 border-black shadow-[4px_4px_0px_0px_rgba(0,0,0,1)]">
        <CardHeader>
```
