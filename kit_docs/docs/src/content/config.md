<!-- source: docs\src\content\config.ts -->

# `docs\src\content\config.ts`

---

## function:

该配置文件用于定义 Astro 项目的 Starlight 文档内容集合，主要管理 Markdown 文档的数据结构。它通过 `defineCollection` 创建一个名为 `docs` 的集合，并应用 `docsSchema` 来验证和规范所有文档文件的 frontmatter 字段。在项目构建时，该配置会强制校验文档格式，确保数据一致性，从而保障站点的正常生成和导航等功能的可靠性。

## declaration:

```ts
import { defineCollection } from 'astro:content';
import { docsSchema } from '@astrojs/starlight/schema';

export const collections = {
	docs: defineCollection({ schema: docsSchema() }),
};
```
