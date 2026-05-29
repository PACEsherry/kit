<!-- source: test\bundle_manager\test\entry\hvigorfile.ts -->

# `test\bundle_manager\test\entry\hvigorfile.ts`

---

## function:

此配置文件是Hvigor构建工具的插件配置入口，用于管理鸿蒙应用（HAP模块）的构建流程。关键配置项包括`system`（绑定内置的`hapTasks`插件，处理标准构建任务）和`plugins`（可扩展自定义插件）。它决定了构建时加载的核心功能与可选扩展，直接影响项目的编译、打包和运行时资源处理。

## declaration:

```ts
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { hapTasks } from '@ohos/cangjie-build-support';

export default {
    system: hapTasks,  /* Built-in plugin of Hvigor. It cannot be modified. */
    plugins:[]         /* Custom plugin to extend the functionality of Hvigor. */
}
```
