<!-- source: frameworks\native\camera\test\ndktest\camera_ndk_demo\hvigorfile.ts -->

# `frameworks\native\camera\test\ndktest\camera_ndk_demo\hvigorfile.ts`

---

## function:

该配置文件为应用模块提供了标准构建任务配置，主要功能是定义并导出应用编译所需的构建任务流。关键配置项为从 `@ohos/hvigor-ohos-plugin` 插件导出的 `appTasks` 对象，它封装了应用编译、打包等构建流程的标准任务。这确保了项目在使用 HarmonyOS 应用构建系统时能自动应用标准构建流程，简化了构建配置。

## declaration:

```ts
/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

// Script for compiling build behavior. It is built in the build plug-in and cannot be modified currently.
export { appTasks } from '@ohos/hvigor-ohos-plugin';
```
