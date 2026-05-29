<!-- source: frameworks\js\camera_napi\demo\entry\src\ohosTest\ets\Application\TestAbilityStage.ts -->

# `frameworks\js\camera_napi\demo\entry\src\ohosTest\ets\Application\TestAbilityStage.ts`

---

## function:

该文件定义了一个用于测试环境的 AbilityStage，主要用于在测试应用启动时执行初始化操作并输出日志，以验证应用能力舞台的生命周期管理。

它包含一个继承自 AbilityStage 的 TestAbilityStage 类，关键配置是重写了 `onCreate` 方法，在其中调用 hilog 日志接口记录一条信息，作用是监控测试应用的创建过程。

作为测试代码，它主要影响测试应用的运行行为，在测试时会触发并输出日志，但不会影响正式应用的构建和发布流程。

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
import AbilityStage from '@ohos.app.ability.AbilityStage';

export default class TestAbilityStage extends AbilityStage {
  onCreate(): void {
    hilog.isLoggable(0x0000, 'testTag', hilog.LogLevel.INFO);
    hilog.info(0x0000, 'testTag', '%{public}s', 'TestAbilityStage onCreate');
  }
}
```
