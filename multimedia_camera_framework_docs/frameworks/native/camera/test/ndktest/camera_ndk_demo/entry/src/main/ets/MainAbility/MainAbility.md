<!-- source: frameworks\native\camera\test\ndktest\camera_ndk_demo\entry\src\main\ets\MainAbility\MainAbility.ts -->

# `frameworks\native\camera\test\ndktest\camera_ndk_demo\entry\src\main\ets\MainAbility\MainAbility.ts`

---

## function:

这个文件定义了一个UIAbility类，控制应用的主能力生命周期，包括创建、销毁和窗口阶段的事件处理与状态管理。它包含关键方法如onCreate用于初始化上下文和记录日志，onWindowStageCreate用于设置全屏布局，这些方法处理应用启动和窗口配置。对项目运行有直接影响，作为应用的入口点，它影响启动流程、日志输出以及UI显示设置。

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

import hilog from '@ohos.hilog';
import Ability from '@ohos.app.ability.UIAbility'
import Window from '@ohos.window'

import deviceInfo from '@ohos.deviceInfo'

export default class MainAbility extends Ability {
    onCreate(want, launchParam) {
        hilog.isLoggable(0x0000, 'testTag', hilog.LogLevel.INFO);
        hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onCreate');
        hilog.info(0x0000, 'testTag', '%{public}s', 'want param:' + JSON.stringify(want) ?? '');
        hilog.info(0x0000, 'testTag', '%{public}s', 'launchParam:' + JSON.stringify(launchParam) ?? '');
        globalThis.abilityContext = this.context
    }
```
