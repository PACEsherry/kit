<!-- source: test\bundle_manager\test\hvigorfile.ts -->

# `test\bundle_manager\test\hvigorfile.ts`

---

## function:

该配置文件控制测试模块的构建流程，定义了构建系统的任务和可扩展点。关键配置项 `system: appTasks` 指定了使用Hvigor的内置应用构建插件来处理构建任务；`plugins:[]` 数组用于挂载自定义插件以扩展构建能力。它直接影响测试模块的编译、打包和资源处理等构建步骤，若配置错误可能导致构建失败。

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

import { appTasks } from '@ohos/hvigor-ohos-plugin';

export default {
    system: appTasks,  /* Built-in plugin of Hvigor. It cannot be modified. */
    plugins:[]         /* Custom plugin to extend the functionality of Hvigor. */
}
```
