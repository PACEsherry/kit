<!-- source: frameworks\native\camera\test\ndktest\camera_ndk_demo\entry\src\main\ets\entryability\EntryAbility.ts -->

# `frameworks\native\camera\test\ndktest\camera_ndk_demo\entry\src\main\ets\entryability\EntryAbility.ts`

---

## function:

这个文件控制应用的EntryAbility生命周期管理，负责能力创建和销毁时的日志记录及上下文初始化。关键配置项包括`onCreate`和`onDestroy`生命周期方法，前者记录日志并保存能力上下文到全局变量，后者记录销毁日志。对项目构建无直接影响，但运行时确保能力正确初始化和销毁，便于调试和状态管理。

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

import UIAbility from '@ohos.app.ability.UIAbility';
import prompt from '@system.prompt'
import window from '@ohos.window';
import abilityAccessCtrl from '@ohos.abilityAccessCtrl';
import { Permissions } from '@ohos.abilityAccessCtrl';
import hilog from '@ohos.hilog';

const TAG: string = "EntryAbility";

export default class EntryAbility extends UIAbility {

  onCreate(want, launchParam) {
    hilog.isLoggable(0x0000, 'testTag', hilog.LogLevel.INFO);
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onCreate');
    hilog.info(0x0000, 'testTag', '%{public}s', 'want param:' + JSON.stringify(want) ?? '');
```
