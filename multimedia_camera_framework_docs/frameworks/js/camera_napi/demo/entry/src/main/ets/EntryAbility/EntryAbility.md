<!-- source: frameworks\js\camera_napi\demo\entry\src\main\ets\EntryAbility\EntryAbility.ts -->

# `frameworks\js\camera_napi\demo\entry\src\main\ets\EntryAbility\EntryAbility.ts`

---

## function:

该文件是HarmonyOS应用的UIAbility入口实现文件，主要控制应用生命周期管理和核心上下文初始化。  
它包含onCreate、onDestroy等生命周期钩子，用于初始化相机模块的全局上下文和记录调试日志。  
作为应用启动入口，它会影响应用初始化流程和相机功能的依赖注入，缺失或错误将导致应用无法正常启动或相机模块失效。

## declaration:

```ts
/*
 * Copyright (c) 2023-2024 Huawei Device Co., Ltd.
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

import type window from '@ohos.window';
import deviceInfo from '@ohos.deviceInfo';
import abilityAccessCtrl from '@ohos.abilityAccessCtrl';
import type Want from '@ohos.app.ability.Want';
import type AbilityConstant from '@ohos.app.ability.AbilityConstant';
import { BusinessError } from '@ohos.base';
import Logger from '../model/Logger';
import { Constants } from '../common/Constants';
import UIAbility from '@ohos.app.ability.UIAbility';
import { GlobalContext } from '../common/GlobalContext';

const TAG: string = 'EntryAbility';

export default class EntryAbility extends UIAbility {
```
