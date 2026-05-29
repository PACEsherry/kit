<!-- source: kit-mcp-site\components\ui\separator.tsx -->

# `kit-mcp-site\components\ui\separator.tsx`

---

## function:

该组件是一个基于 Radix UI 的分隔线封装，用于在界面中创建水平或垂直的分隔条。

1. 功能范围：控制UI中的视觉分隔元素，支持水平/垂直方向及可访问性语义设置。
2. 关键配置项：`orientation`（方向，默认为水平）、`decorative`（是否纯装饰性，默认为真，影响可访问性）、`className`（自定义样式类名）。
3. 构建运行影响：作为客户端组件依赖 Radix UI 库，会增加少量客户端 JavaScript 体积，但使用标准接口不影响构建配置。

## declaration:

```ts
"use client"

import * as React from "react"
import * as SeparatorPrimitive from "@radix-ui/react-separator"

import { cn } from "@/lib/utils"

const Separator = React.forwardRef<
  React.ElementRef<typeof SeparatorPrimitive.Root>,
  React.ComponentPropsWithoutRef<typeof SeparatorPrimitive.Root>
>(
  (
    { className, orientation = "horizontal", decorative = true, ...props },
    ref
  ) => (
    <SeparatorPrimitive.Root
      ref={ref}
      decorative={decorative}
      orientation={orientation}
      className={cn(
        "shrink-0 bg-border",
        orientation === "horizontal" ? "h-[1px] w-full" : "h-full w-[1px]",
        className
      )}
      {...props}
    />
  )
)
Separator.displayName = SeparatorPrimitive.Root.displayName
```
