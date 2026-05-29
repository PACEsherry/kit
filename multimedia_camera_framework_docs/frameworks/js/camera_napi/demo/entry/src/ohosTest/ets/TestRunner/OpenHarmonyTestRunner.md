<!-- source: frameworks\js\camera_napi\demo\entry\src\ohosTest\ets\TestRunner\OpenHarmonyTestRunner.ts -->

# `frameworks\js\camera_napi\demo\entry\src\ohosTest\ets\TestRunner\OpenHarmonyTestRunner.ts`

---

## function:

1. 此配置文件负责OpenHarmony测试框架的测试运行器初始化，主要控制测试用例的筛选参数处理和测试能力的创建回调。

2. 关键配置项包括测试参数转换函数（translateParamsToString）用于将类名、测试套件等筛选参数转为字符串命令，以及测试能力创建回调（onAbilityCreateCallback）用于初始化日志并记录能力创建事件。

3. 该文件直接影响测试执行流程，确保测试参数正确传递至测试框架，并通过日志记录测试运行状态，是项目测试阶段的核心运行配置。

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
import AbilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry';

let abilityDelegator = undefined;
let abilityDelegatorArguments = undefined;

function translateParamsToString(parameters): string {
  const keySet = new Set([
    '-s class', '-s notClass', '-s suite', '-s it',
    '-s level', '-s testType', '-s size', '-s timeout',
    '-s dryRun'
  ]);
  let targetParams = '';
  for (const key in parameters) {
```
