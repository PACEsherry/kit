<!-- source: kit-mcp-site\components\ui\tabs.tsx -->

# `kit-mcp-site\components\ui\tabs.tsx`

---

## function:

这是一个基于 Radix UI 的标签页组件封装文件，用于构建前端页面的选项卡导航和内容切换功能。它通过 forwardRef 和 cn 工具函数扩展了原生组件的样式和引用能力，主要配置项包括列表容器、触发按钮和内容面板的样式覆盖。该文件作为 UI 依赖会被打包进前端资源，影响页面渲染和组件复用。

## declaration:

```ts
"use client"

import * as React from "react"
import * as TabsPrimitive from "@radix-ui/react-tabs"

import { cn } from "@/lib/utils"

const Tabs = TabsPrimitive.Root

const TabsList = React.forwardRef<
  React.ElementRef<typeof TabsPrimitive.List>,
  React.ComponentPropsWithoutRef<typeof TabsPrimitive.List>
>(({ className, ...props }, ref) => (
  <TabsPrimitive.List
    ref={ref}
    className={cn(
      "inline-flex h-10 items-center justify-center rounded-md bg-muted p-1 text-muted-foreground",
      className
    )}
    {...props}
  />
))
TabsList.displayName = TabsPrimitive.List.displayName

const TabsTrigger = React.forwardRef<
  React.ElementRef<typeof TabsPrimitive.Trigger>,
  React.ComponentPropsWithoutRef<typeof TabsPrimitive.Trigger>
>(({ className, ...props }, ref) => (
  <TabsPrimitive.Trigger
    ref={ref}
```
