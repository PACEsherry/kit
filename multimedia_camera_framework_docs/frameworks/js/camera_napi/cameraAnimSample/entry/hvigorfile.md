<!-- source: frameworks\js\camera_napi\cameraAnimSample\entry\hvigorfile.ts -->

# `frameworks\js\camera_napi\cameraAnimSample\entry\hvigorfile.ts`

---

## function:

该配置文件是 HarmonyOS 项目中 Hvigor 构建系统的任务配置文件，主要用于定义和控制 HAP（HarmonyOS Ability Package）模块的构建流程。它通过指定 `system` 为内置的 `hapTasks` 插件来启用标准构建任务，并预留 `plugins` 数组供扩展自定义插件。其配置直接决定了模块如何被编译、打包和运行，未添加自定义插件时使用默认构建行为。

## declaration:

```ts
/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { hapTasks } from '@ohos/hvigor-ohos-plugin';

export default {
    system: hapTasks,  /* Built-in plugin of Hvigor. It cannot be modified. */
    plugins:[]         /* Custom plugin to extend the functionality of Hvigor. */
}
```
