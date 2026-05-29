# 包管理仓颉封装（beta特性）

## 简介

包管理仓颉封装负责应用安装包的管理，提供安装包的信息查询能力以及ElementName信息、元数据对象和Skill标签对象的定义。当前开放的包管理仓颉接口仅支持standard设备。

## 系统架构

**图 1** 包管理仓颉架构图

![包管理仓颉架构图](figures/bundlemanager_cangjie_wrapper_architecture.png)

如架构图所示：

接口层：

- 应用程序包管理模块：包含面向开发者提供的用于应用信息查询的API能力；应用组件结构体、元数据对象和Skill标签对象的定义。
  - 应用信息查询能力：面向开发者提供的用于应用信息查询的API能力。提供UIAbility组件信息、ExtensionAbility组件信息的查询能力，返回json格式字符串。提供查询给定的链接是否可以打开的能力。
  - 应用组件结构体: 面向开发者提供的应用组件结构体的定义。包含bundleName、moduleName和abilityName等。通常用于组件启动回调函数中。
  - 元数据对象: 面向开发者提供的元数据对象的定义。包含元数据名称、元数据值和元数据资源。可通过BundleInfo获取。
  - Skill标签对象：面向开发者提供的Skill标签对象的定义。包含Skill接收的actions、entities、uris、domainVerify集合。可通过BundleInfo获取。

框架层：

- 应用程序包管理模块封装：为应用信息查询能力封装、ElementName信息封装、元数据对象封装和Skill对象封装。
  - 应用信息查询能力封装：仓颉应用信息查询能力封装。通过BundleManager类实现仓颉的应用信息查询能力。
  - 应用组件结构体封装：通过提供ElementName类来提供应用组件结构体。
  - 元数据对象封装：提供仓颉Metadata类的定义。
  - Skill对象封装：提供仓颉Skill类的定义。

架构图中的依赖部件引入说明：

- 包管理子系统：负责提供包管理基础功能，封装C语言接口提供给仓颉进行互操作。
- 元能力运行时部件：ElementName信息依赖其封装的ElementName的C语言定义。
- cangjie_ark_interop：负责提供仓颉注解类定义和BusinessException异常类定义。包管理仓颉封装依赖此部件用于对API进行标注，及在错误分支向用户抛出异常。
- hiviewdfx_cangjie_wrapper：负责提供日志接口。包管理仓颉封装依赖此部件用于在关键路径处打印日志。
- global_cangjie_wrapper：提供应用资源获取的能力。应用信息查询能力依赖其中的AppResource的定义。

## 目录

```
foundation/bundlemanager/bundlemanager_cangjie_wrapper
├── figures                 # 存放README中的架构图
├── ohos                    # 仓颉包管理接口实现
│   ├── bundle              # 仓颉包管理基础功能实现
│   │   └── bundle_manager  # 仓颉应用信息查询能力实现
│   ├── element_name        # 包管理依赖元素ElementName类的实现
│   ├── metadata            # 包管理依赖元素Metadata类的实现
│   └── skill               # 包管理依赖元素Skill类的实现
└── test                    # 仓颉测试代码
    └── bundle_manager      # 仓颉包管理测试用例
```

## 使用说明

包管理仓颉接口提供以下功能，开发者可以根据使用诉求使用：

  - 提供当前应用包信息的查询能力。相关示例请参见请参见[获取当前应用包信息](https://gitcode.com/openharmony-sig/arkcompiler_cangjie_ark_interop/blob/master/doc/Dev_Guide/source_zh_cn/cj-start/basic-knowledge/common_problem_of_application.md)。
  - 提供自身相应配置文件的json格式字符串的获取能力。相关示例请参见请参见[获取自身相应配置文件信息](https://gitcode.com/openharmony-sig/arkcompiler_cangjie_ark_interop/blob/master/doc/API_Reference/source_zh_cn/apis/AbilityKit/cj-apis-bundle_manager.md#static-func-getprofilebyabilitystring-string-string)。
  - 提供给定的链接是否可以打开的查询能力。相关示例请参见请参见[查询链接是否可以打开](https://gitcode.com/openharmony-sig/arkcompiler_cangjie_ark_interop/blob/master/doc/API_Reference/source_zh_cn/apis/AbilityKit/cj-apis-bundle_manager.md#static-func-canopenlinkstring)。
  - 提供应用组件结构体、元数据对象和Skill标签对象的定义。

包管理相关API请参见[仓颉包管理API文档](https://gitcode.com/openharmony-sig/arkcompiler_cangjie_ark_interop/blob/master/doc/API_Reference/source_zh_cn/apis/AbilityKit/cj-apis-bundle_manager.md)。

## 约束

与ArkTS提供的API能力相比，暂不支持以下功能：

  - 暂不支持获取其他应用包的BundleInfo信息。
  - 暂不支持根据给定的uid获取对应应用的bundleName的能力

## 参与贡献

欢迎广大开发者代码，文档等，具体的贡献流程和方式请参见[参与贡献](https://gitcode.com/openharmony/docs/blob/master/zh-cn/contribute/%E5%8F%82%E4%B8%8E%E8%B4%A1%E7%8C%AE.md)。

## 相关仓

[bundlemanager_bundle_framework](https://gitcode.com/openharmony/bundlemanager_bundle_framework)

[ability_ability_runtime](https://gitcode.com/openharmony/ability_ability_runtime)

[arkcompiler_cangjie_ark_interop](https://gitcode.com/openharmony-sig/arkcompiler_cangjie_ark_interop)

[hiviewdfx_hiviewdfx_cangjie_wrapper](https://gitcode.com/openharmony-sig/hiviewdfx_hiviewdfx_cangjie_wrapper)

[global_global_cangjie_wrapper](https://gitcode.com/openharmony-sig/global_global_cangjie_wrapper)
