<!-- source: frameworks\native\camera\test\ndktest\camera_ndk_demo\entry\package.json -->

# `frameworks\native\camera\test\ndktest\camera_ndk_demo\entry\package.json`

---

## function:

该配置文件是OpenHarmony相机NDK演示的入口模块配置，控制模块的元数据、依赖和构建设置，适用于华为生态的模块化项目。关键配置项包括模块名称（"entry"）、OpenHarmony构建参数（指定使用hvigor工具和模块级别），以及开发依赖（C++库的类型定义以支持类型检查）。这些设置决定了项目使用hvigor进行标准化构建，并影响开发时的依赖管理和编译流程。

## declaration:

```json
{
  "license": "ISC",
  "devDependencies": {
    "@types/libentry.so": "file:./src/main/cpp/types/libentry"
  },
  "name": "entry",
  "ohos": {
    "org": "huawei",
    "directoryLevel": "module",
    "buildTool": "hvigor"
  },
  "description": "example description",
  "repository": {},
  "version": "1.0.0",
  "dependencies": {}
}
```
