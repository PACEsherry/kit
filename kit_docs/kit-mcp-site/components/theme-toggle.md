<!-- source: kit-mcp-site\components\theme-toggle.tsx -->

# `kit-mcp-site\components\theme-toggle.tsx`

---

## function:

这个组件是一个客户端主题切换器，控制项目的明暗模式切换功能。它包含`useTheme`钩子用于获取和设置主题，通过点击按钮在`light`和`dark`模式间切换，并利用CSS过渡动画实现图标旋转和缩放效果。作为客户端组件，它会增加客户端JavaScript包大小，且依赖`next-themes`库和项目的UI组件，运行时会动态应用`dark`类名影响全局样式。

## declaration:

```ts
"use client"

import * as React from "react"
import { Moon, Sun } from "lucide-react"
import { useTheme } from "next-themes"

import { Button } from "@/components/ui/button"

export function ThemeToggle() {
  const { theme, setTheme } = useTheme()

  return (
    <Button
      variant="ghost"
      size="icon"
      onClick={() => setTheme(theme === "light" ? "dark" : "light")}
    >
      <Sun className="h-[1.2rem] w-[1.2rem] rotate-0 scale-100 transition-all dark:-rotate-90 dark:scale-0" />
      <Moon className="absolute h-[1.2rem] w-[1.2rem] rotate-90 scale-0 transition-all dark:rotate-0 dark:scale-100" />
      <span className="sr-only">Toggle theme</span>
    </Button>
  )
}
```
