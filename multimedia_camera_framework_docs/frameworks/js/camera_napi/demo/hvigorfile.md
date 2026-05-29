<!-- source: frameworks\js\camera_napi\demo\hvigorfile.js -->

# `frameworks\js\camera_napi\demo\hvigorfile.js`

---

## function:

这个配置文件控制了鸿蒙OS项目的构建任务范围，通过导出插件应用任务来定义构建流程。它的关键配置项是引用并导出了 `@ohos/hvigor-ohos-plugin` 的 `appTasks`，用于自动化编译和打包过程。这直接影响项目的构建行为，确保按照标准进行构建。

## declaration:

```js
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
module.exports = require('@ohos/hvigor-ohos-plugin').appTasks
```
