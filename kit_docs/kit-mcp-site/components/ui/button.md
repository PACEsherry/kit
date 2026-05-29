<!-- source: kit-mcp-site\components\ui\button.tsx -->

# `kit-mcp-site\components\ui\button.tsx`

---

## function:

该配置文件定义了一个可复用的 React 按钮组件，控制按钮的样式变体和尺寸，提供默认、破坏性、轮廓等多种视觉样式及小、中、大等尺寸选项。关键配置项包括 variant（控制颜色、背景等外观）和 size（控制高度、内边距等尺寸），通过 class-variance-authority 动态管理 CSS 类；asChild 属性允许按钮作为子元素渲染以提高灵活性。对项目构建无直接影响，但运行时能根据 props 动态应用样式，提升 UI 一致性和可维护性。

## declaration:

```ts
import * as React from "react"
import { Slot } from "@radix-ui/react-slot"
import { cva, type VariantProps } from "class-variance-authority"

import { cn } from "@/lib/utils"

const buttonVariants = cva(
  "inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 [&_svg]:pointer-events-none [&_svg]:size-4 [&_svg]:shrink-0",
  {
    variants: {
      variant: {
        default: "bg-primary text-primary-foreground hover:bg-primary/90",
        destructive:
          "bg-destructive text-destructive-foreground hover:bg-destructive/90",
        outline:
          "border border-input bg-background hover:bg-accent hover:text-accent-foreground",
        secondary:
          "bg-secondary text-secondary-foreground hover:bg-secondary/80",
        ghost: "hover:bg-accent hover:text-accent-foreground",
        link: "text-primary underline-offset-4 hover:underline",
      },
      size: {
        default: "h-10 px-4 py-2",
        sm: "h-9 rounded-md px-3",
        lg: "h-11 rounded-md px-8",
        icon: "h-10 w-10",
      },
    },
    defaultVariants: {
      variant: "default",
```
