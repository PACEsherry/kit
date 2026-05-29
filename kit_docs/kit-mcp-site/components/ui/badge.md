<!-- source: kit-mcp-site\components\ui\badge.tsx -->

# `kit-mcp-site\components\ui\badge.tsx`

---

## function:

这是一个React Badge（徽章）组件，用于显示标签、状态或分类信息。它控制了徽章的视觉样式和变体，支持默认、次要、破坏性和轮廓四种样式，通过class-variance-authority库管理样式变体。关键配置包括`badgeVariants`定义的基础样式和四种变体颜色方案，以及`cn`工具函数用于合并类名。该组件作为项目UI的基础元素，影响所有使用Badge的地方的显示效果，若修改可能导致样式错误。

## declaration:

```ts
import * as React from "react"
import { cva, type VariantProps } from "class-variance-authority"

import { cn } from "@/lib/utils"

const badgeVariants = cva(
  "inline-flex items-center rounded-full border px-2.5 py-0.5 text-xs font-semibold transition-colors focus:outline-none focus:ring-2 focus:ring-ring focus:ring-offset-2",
  {
    variants: {
      variant: {
        default:
          "border-transparent bg-primary text-primary-foreground hover:bg-primary/80",
        secondary:
          "border-transparent bg-secondary text-secondary-foreground hover:bg-secondary/80",
        destructive:
          "border-transparent bg-destructive text-destructive-foreground hover:bg-destructive/80",
        outline: "text-foreground",
      },
    },
    defaultVariants: {
      variant: "default",
    },
  }
)

export interface BadgeProps
  extends React.HTMLAttributes<HTMLDivElement>,
    VariantProps<typeof badgeVariants> {}

function Badge({ className, variant, ...props }: BadgeProps) {
```
