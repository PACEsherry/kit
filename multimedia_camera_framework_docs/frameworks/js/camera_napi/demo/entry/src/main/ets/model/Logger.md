<!-- source: frameworks\js\camera_napi\demo\entry\src\main\ets\model\Logger.ts -->

# `frameworks\js\camera_napi\demo\entry\src\main\ets\model\Logger.ts`

---

## function:

这个日志工具类主要用于统一管理项目中的日志输出，通过封装鸿蒙系统的hiLog模块实现标准化日志记录。它包含日志域标识（domain）、前缀（prefix）和格式字符串（format）等关键配置项，用于规范日志的输出格式和分类。该类的正确使用有助于项目调试和运行时问题追踪，但若配置不当可能影响日志的可读性和性能。

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

import hiLog from '@ohos.hilog';

const TAG = 'cameraSample';

class Logger {
  private domain: number;
  private prefix: string;
  private format: string = '%{public}s, %{public}s';

  constructor(prefix: string) {
    this.prefix = prefix;
    this.domain = 0xFF00;
  }

  debug(...args: any[]): void {
```
