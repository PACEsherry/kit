<!-- source: frameworks\js\camera_napi\demo\entry\src\main\ets\common\GlobalContext.ts -->

# `frameworks\js\camera_napi\demo\entry\src\main\ets\common\GlobalContext.ts`

---

## function:

该配置文件控制相机应用的全局状态和上下文管理，负责统一存储和管理应用运行期间的核心资源与配置信息。关键配置项包括单例实例、对象映射表、屏幕显示信息、相机能力上下文、窗口阶段及事件等，用于集中访问应用层共用的数据和状态。它对项目构建无直接影响，但运行时作为全局状态容器，确保各组件能协调一致地访问相机硬件和窗口系统资源。

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

import display from '@ohos.display';
import type common from '@ohos.app.ability.common';
import type Want from '@ohos.app.ability.Want';
import type window from '@ohos.window';
import type { PromptAction } from '@ohos.arkui.UIContext';

const TAG: string = 'GlobalContext';

export class GlobalContext {

  private constructor() {
  }

  private static instance: GlobalContext;
  private _objects = new Map<string, Object>();
```
