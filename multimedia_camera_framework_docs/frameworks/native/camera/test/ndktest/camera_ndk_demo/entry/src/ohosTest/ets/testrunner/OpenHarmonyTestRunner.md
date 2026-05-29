<!-- source: frameworks\native\camera\test\ndktest\camera_ndk_demo\entry\src\ohosTest\ets\testrunner\OpenHarmonyTestRunner.ts -->

# `frameworks\native\camera\test\ndktest\camera_ndk_demo\entry\src\ohosTest\ets\testrunner\OpenHarmonyTestRunner.ts`

---

## function:

这个配置文件控制OpenHarmony测试框架的测试运行器功能，负责测试的准备和运行阶段。它包含TestRunner接口的实现，关键配置项有onPrepare()和onRun()方法，用于测试准备和运行时的日志记录。对项目构建，它被编译到测试模块；对运行，它控制测试生命周期，但仅记录日志。

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
import TestRunner from '@ohos.application.testRunner';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

var abilityDelegator = undefined
var abilityDelegatorArguments = undefined

async function onAbilityCreateCallback() {
    hilog.info(0x0000, 'testTag', '%{public}s', 'onAbilityCreateCallback');
}

async function addAbilityMonitorCallback(err: any) {
    hilog.info(0x0000, 'testTag', 'addAbilityMonitorCallback : %{public}s', JSON.stringify(err) ?? '');
}
```
