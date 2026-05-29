<!-- source: kit-mcp-site\components\ui\dialog.tsx -->

# `kit-mcp-site\components\ui\dialog.tsx`

---

## function:

这个文件是一个React模态对话框UI组件的实现。它基于Radix UI的对话框原语进行封装，提供了对话框的结构、遮罩层和内容容器，并集成了平滑的进入/退出动画。

关键配置包括`DialogOverlay`，它通过`bg-black/80`设置半透明黑色遮罩，并使用`data-[state=open/closed]`属性配合Tailwind CSS的animate-in/out类控制显示/隐藏动画；`DialogContent`是主内容容器，同样支持自定义样式和动画。

作为标记了`"use client"`的客户端组件，它会影响客户端的渲染和交互。使用了`forwardRef`以支持ref转发，便于父组件控制焦点或访问DOM，而`displayName`的设置则有助于React DevTools中的调试。

## declaration:

```ts
"use client"

import * as React from "react"
import * as DialogPrimitive from "@radix-ui/react-dialog"
import { X } from "lucide-react"

import { cn } from "@/lib/utils"

const Dialog = DialogPrimitive.Root

const DialogTrigger = DialogPrimitive.Trigger

const DialogPortal = DialogPrimitive.Portal

const DialogClose = DialogPrimitive.Close

const DialogOverlay = React.forwardRef<
  React.ElementRef<typeof DialogPrimitive.Overlay>,
  React.ComponentPropsWithoutRef<typeof DialogPrimitive.Overlay>
>(({ className, ...props }, ref) => (
  <DialogPrimitive.Overlay
    ref={ref}
    className={cn(
      "fixed inset-0 z-50 bg-black/80 data-[state=open]:animate-in data-[state=closed]:animate-out data-[state=closed]:fade-out-0 data-[state=open]:fade-in-0",
      className
    )}
    {...props}
  />
))
DialogOverlay.displayName = DialogPrimitive.Overlay.displayName
```
