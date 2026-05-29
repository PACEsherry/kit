<!-- source: kit-mcp-site\components\ui\sheet.tsx -->

# `kit-mcp-site\components\ui\sheet.tsx`

---

## function:

该文件是一个侧边栏弹窗组件的源码，而非传统配置文件。它定义了一个基于Radix UI的可交互侧边栏，主要用于从屏幕边缘（如右侧或左侧）滑出内容面板。

关键配置项包括：1) 使用 `cva` 定义 `sheetVariants`，通过 `side` 属性配置面板出现方向（如 top、bottom）的样式与动画；2) 定义了 `SheetOverlay` 作为遮罩层，并配置了淡入淡出的过渡动画；3) 通过导出 `SheetTrigger`、`SheetClose` 等子组件来组合控制面板的触发与关闭。

该文件标记为 `"use client"`，表示这是一个客户端组件，对项目的客户端渲染和打包体积有直接影响。它通过封装提供了开箱即用的侧边栏功能，开发者无需重复实现基础逻辑，但需确保项目已安装并正确配置了 `@radix-ui/react-dialog` 等依赖库。

## declaration:

```ts
"use client"

import * as React from "react"
import * as SheetPrimitive from "@radix-ui/react-dialog"
import { cva, type VariantProps } from "class-variance-authority"
import { X } from "lucide-react"

import { cn } from "@/lib/utils"

const Sheet = SheetPrimitive.Root

const SheetTrigger = SheetPrimitive.Trigger

const SheetClose = SheetPrimitive.Close

const SheetPortal = SheetPrimitive.Portal

const SheetOverlay = React.forwardRef<
  React.ElementRef<typeof SheetPrimitive.Overlay>,
  React.ComponentPropsWithoutRef<typeof SheetPrimitive.Overlay>
>(({ className, ...props }, ref) => (
  <SheetPrimitive.Overlay
    className={cn(
      "fixed inset-0 z-50 bg-black/80  data-[state=open]:animate-in data-[state=closed]:animate-out data-[state=closed]:fade-out-0 data-[state=open]:fade-in-0",
      className
    )}
    {...props}
    ref={ref}
  />
))
```
