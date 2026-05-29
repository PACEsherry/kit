<!-- source: frameworks\native\camera\test\ndktest\camera_ndk_demo\entry\src\main\cpp\types\libentry\package.json -->

# `frameworks\native\camera\test\ndktest\camera_ndk_demo\entry\src\main\cpp\types\libentry\package.json`

---

## function:

这个配置文件用于定义本地共享库libentry.so的模块类型接口，便于TypeScript类型集成。关键配置项"name"指定库名称，"types"关联类型定义文件index.d.ts以提供类型检查。它确保构建工具正确解析类型，提升开发体验并避免编译错误。

## declaration:

```json
{
  "name": "libentry.so",
  "types": "./index.d.ts"
}
```
