<!-- source: frameworks\js\camera_napi\demo\entry\src\main\ets\Application\MyAbilityStage.ts -->

# `frameworks\js\camera_napi\demo\entry\src\main\ets\Application\MyAbilityStage.ts`

---

## function:

这个文件控制HarmonyOS应用AbilityStage的生命周期，主要用于在应用组件初始化时记录日志。它包含自定义MyAbilityStage类和onCreate方法，通过Logger输出应用创建事件以便调试。构建时会被编译，运行时在应用启动时触发日志记录，不影响构建过程但辅助运行时监控。

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

import AbilityStage from '@ohos.app.ability.AbilityStage';
import Logger from '../model/Logger';

const TAG: string = 'MyAbilityStage';

export default class MyAbilityStage extends AbilityStage {
  async onCreate(): Promise<void> {
    Logger.info(TAG, 'AbilityStage onCreate');
  }
}
```
