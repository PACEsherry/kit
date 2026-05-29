<!-- source: frameworks\js\camera_napi\demo\entry\src\main\ets\MainAbility\MainAbility.ts -->

# `frameworks\js\camera_napi\demo\entry\src\main\ets\MainAbility\MainAbility.ts`

---

## function:

该文件是主Ability（UIAbility）的实现，控制主页面的生命周期管理和窗口显示配置。关键配置项包括`onCreate`中记录启动参数、`onWindowStageCreate`中设置主窗口全屏及系统导航栏显示。它直接决定应用主页面的初始化和界面展示方式，影响应用启动后的用户交互体验。

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

import Ability from '@ohos.app.ability.UIAbility';
import type Want from '@ohos.app.ability.Want';
import type AbilityConstant from '@ohos.app.ability.AbilityConstant';
import type Window from '@ohos.window';
import Logger from '../model/Logger';

const TAG: string = 'MainAbility';

export default class MainAbility extends Ability {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    Logger.info(TAG, 'Ability onCreate');
    Logger.debug(TAG, `want param: ${JSON.stringify(want)}`);
    Logger.debug(TAG, `launchParam: ${JSON.stringify(launchParam)}`);
  }
```
