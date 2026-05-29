<!-- source: frameworks\native\camera\test\ndktest\camera_ndk_demo\entry\hvigorfile.ts -->

# `frameworks\native\camera\test\ndktest\camera_ndk_demo\entry\hvigorfile.ts`

---

## function:

该配置文件用于控制HarmonyOS项目中HAP（HarmonyOS Ability Package）的构建编译行为，通过导入hvigor-ohos-plugin插件来管理构建任务。关键配置项是导出hapTasks，作用是将构建插件的核心功能集成到项目中，确保编译和打包流程的执行。由于它是内置的且不可修改，对项目构建的影响是提供标准化的构建行为，但限制了自定义调整。

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
export { hapTasks } from '@ohos/hvigor-ohos-plugin';
```
