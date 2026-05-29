<!-- source: frameworks\js\camera_napi\cameraAnimSample\hvigorfile.ts -->

# `frameworks\js\camera_napi\cameraAnimSample\hvigorfile.ts`

---

## function:

该配置文件控制项目构建任务与插件机制。它通过 `system: appTasks` 调用鸿蒙系统内置构建插件，`plugins:[]` 数组则预留自定义插件扩展功能。内置插件决定标准构建流程，自定义插件可添加编译、打包等特定任务，直接影响构建过程与产物。

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

import { appTasks } from '@ohos/hvigor-ohos-plugin';

export default {
    system: appTasks,  /* Built-in plugin of Hvigor. It cannot be modified. */
    plugins:[]         /* Custom plugin to extend the functionality of Hvigor. */
}
```
