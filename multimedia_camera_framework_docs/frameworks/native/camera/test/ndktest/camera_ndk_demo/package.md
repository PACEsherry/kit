<!-- source: frameworks\native\camera\test\ndktest\camera_ndk_demo\package.json -->

# `frameworks\native\camera\test\ndktest\camera_ndk_demo\package.json`

---

## function:

这个配置文件控制HarmonyOS（OHOS）项目中相机NDK测试示例的构建和依赖管理，使用hvigor作为构建工具，定义了项目的基本信息和组织结构。关键配置项包括项目名称"ndk_camera"、版本"1.0.0"，ohos部分指定华为组织和构建工具hvigor，dependencies列出了hypium（测试框架）、hvigor及其插件等运行时依赖。这些配置确保项目能通过hvigor工具正确构建、打包和测试，依赖项管理构建流程和单元测试的执行。

## declaration:

```json
{
  "license": "ISC",
  "devDependencies": {},
  "name": "ndk_camera",
  "ohos": {
    "org": "huawei",
    "directoryLevel": "project",
    "buildTool": "hvigor"
  },
  "description": "example description",
  "repository": {},
  "version": "1.0.0",
  "dependencies": {
    "@ohos/hypium": "1.0.5",
    "@ohos/hvigor-ohos-plugin": "1.4.1",
    "@ohos/hvigor": "1.4.0"
  }
}
```
