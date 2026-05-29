<!-- source: kit-mcp-site\app\layout.tsx -->

# `kit-mcp-site\app\layout.tsx`

---

## function:

1. 该文件是Next.js应用的根布局，控制全局HTML结构、字体加载和网页元数据，定义所有页面共享的底层容器和样式。
2. 关键配置包括：引入并配置了Geist和Geist_Mono两种字体作为CSS变量；设置了全局的网页标题、描述和图标；布局函数将子组件注入到<body>中。
3. 它决定了项目的全局样式基础和搜索引擎优化信息，所有页面都继承此布局，字体配置会影响整体加载性能和视觉呈现。

## declaration:

```ts
import type { Metadata } from "next";
import { Geist, Geist_Mono } from "next/font/google";
import "./globals.css";

const geistSans = Geist({
  variable: "--font-geist-sans",
  subsets: ["latin"],
});

const geistMono = Geist_Mono({
  variable: "--font-geist-mono",
  subsets: ["latin"],
});

export const metadata: Metadata = {
  title: "kit-dev MCP - the best MCP server for coding with AI agents",
  description: "Supercharge your AI assistant with real-time file watching, deep documentation research, and smart context building. 100% local, private, and free. From Cased.",
  icons: {
    icon: '/favicon.svg',
    shortcut: '/favicon.svg',
    apple: '/favicon.svg',
  },
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
```
