<!-- source: kit-mcp-site\app\docs\configuration\page.tsx -->

# `kit-mcp-site\app\docs\configuration\page.tsx`

---

## function:

这个配置文件用于展示如何配置kit-dev-mcp开发环境的环境变量，特别是LLM API密钥的集成。关键配置项包括OPENAI_API_KEY和ANTHROPIC_API_KEY，用于提供LLM API访问权限以启用get_code_summary工具。这些配置影响项目的运行，确保依赖LLM的功能能正常工作，但缺少密钥会导致相关工具无法使用。

## declaration:

```ts
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import { Tabs, TabsContent, TabsList, TabsTrigger } from "@/components/ui/tabs";
import { Settings, Key, Database, Globe, Folder } from "lucide-react";

export default function ConfigurationPage() {
  return (
    <div className="prose prose-slate max-w-none">
      <div className="not-prose mb-8">
        <Badge variant="secondary" className="neo-badge bg-yellow-300 text-black mb-4">
          Configuration
        </Badge>
        <h1 className="text-4xl font-bold mb-4">Configuration Guide</h1>
        <p className="text-xl text-muted-foreground">
          Configure kit-dev-mcp for your development environment
        </p>
      </div>

      <div className="my-8">
        <h2 className="text-2xl font-bold mb-4">Environment Variables</h2>
        <div className="not-prose space-y-4">
          <Card className="neo-card">
            <CardHeader>
              <CardTitle className="flex items-center gap-2">
                <Key className="h-5 w-5 text-primary" />
                LLM API Keys (Required for get_code_summary)
              </CardTitle>
            </CardHeader>
            <CardContent>
              <p className="text-sm text-muted-foreground mb-3">
```
