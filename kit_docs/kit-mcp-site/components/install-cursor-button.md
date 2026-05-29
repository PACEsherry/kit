<!-- source: kit-mcp-site\components\install-cursor-button.tsx -->

# `kit-mcp-site\components\install-cursor-button.tsx`

---

## function:

这个组件文件控制在Cursor IDE中一键安装kit-dev MCP服务器的功能，通过深度链接触发客户端安装流程。关键配置项包括定义MCP服务的启动命令`uvx`、运行参数`cased-kit`包，以及`OPENAI_API_KEY`和`KIT_GITHUB_TOKEN`等必需环境变量。对项目构建无直接影响，但作为前端交互组件，点击按钮会调用系统级协议启动Cursor并传入加密配置，实现开发工具链的快速集成。

## declaration:

```ts
"use client";

import { Button } from "@/components/ui/button";
import { Download } from "lucide-react";

export function InstallCursorButton() {
  const handleInstall = () => {
    const config = {
      "kit-dev": {
        "command": "uvx",
        "args": ["--from", "cased-kit", "kit-dev-mcp"],
        "env": {
          "OPENAI_API_KEY": "sk-...",
          "KIT_GITHUB_TOKEN": "ghp_..."
        }
      }
    };
    
    const encodedConfig = btoa(JSON.stringify(config));
    const deepLink = `cursor://anysphere.cursor-deeplink/mcp/install?name=kit-dev&config=${encodedConfig}`;
    
    window.location.href = deepLink;
  };

  return (
    <Button 
      onClick={handleInstall}
      className="neo-button bg-blue-600 hover:bg-blue-700 text-white"
      size="sm"
    >
```
