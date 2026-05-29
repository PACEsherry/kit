<!-- source: kit-mcp-site\components\ui\card.tsx -->

# `kit-mcp-site\components\ui\card.tsx`

---

## function:

该文件是React卡片组件的UI实现，控制卡片及其子组件的视觉结构和样式。它包含Card、CardHeader和CardTitle等关键组件，均通过`cn()`函数动态合并基础样式与自定义`className`，以确保样式可扩展性。此文件作为基础UI组件，不影响项目构建，但为项目提供了标准化的卡片布局元素，开发者可直接引用或通过属性覆盖样式。

## declaration:

```ts
import * as React from "react"

import { cn } from "@/lib/utils"

const Card = React.forwardRef<
  HTMLDivElement,
  React.HTMLAttributes<HTMLDivElement>
>(({ className, ...props }, ref) => (
  <div
    ref={ref}
    className={cn(
      "rounded-lg border bg-card text-card-foreground shadow-sm",
      className
    )}
    {...props}
  />
))
Card.displayName = "Card"

const CardHeader = React.forwardRef<
  HTMLDivElement,
  React.HTMLAttributes<HTMLDivElement>
>(({ className, ...props }, ref) => (
  <div
    ref={ref}
    className={cn("flex flex-col space-y-1.5 p-6", className)}
    {...props}
  />
))
CardHeader.displayName = "CardHeader"
```
