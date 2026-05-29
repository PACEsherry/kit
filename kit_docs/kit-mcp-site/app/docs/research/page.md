<!-- source: kit-mcp-site\app\docs\research\page.tsx -->

# `kit-mcp-site\app\docs\research\page.tsx`

---

## function:

该文件控制深度包研究功能文档页面的展示与用户界面布局。其关键配置项包括页面结构定义、Badge状态标签的样式变体以及功能模块卡片（如Multi-Source Documentation Research）的视觉呈现。作为项目路由页面之一，它参与静态页面构建过程，不影响核心业务逻辑，但在构建时需正确编译并集成至文档站点。

## declaration:

```ts
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import { BookOpen, Brain, Sparkles, AlertCircle, CheckCircle } from "lucide-react";

export default function ResearchPage() {
  return (
    <div className="prose prose-slate max-w-none">
      <div className="not-prose mb-8">
        <Badge variant="secondary" className="neo-badge bg-yellow-300 text-black mb-4">
          Core Feature
        </Badge>
        <h1 className="text-4xl font-bold mb-4">Deep Package Research</h1>
        <p className="text-xl text-muted-foreground">
          AI-powered comprehensive package documentation using LLM knowledge
        </p>
      </div>

      <div className="my-8">
        <h2 className="text-2xl font-bold mb-4">How It Works</h2>
        <p className="text-muted-foreground mb-6">
          The deep research feature leverages LLM knowledge to provide comprehensive documentation
          about any package, library, or framework. It uses a single, powerful prompt to extract
          detailed information from the model's training data.
        </p>
        
        <Card className="neo-card border-2 border-purple-500">
          <CardHeader>
            <div className="flex items-center justify-between">
              <CardTitle className="flex items-center gap-2">
                <Brain className="h-5 w-5 text-purple-500" />
```
