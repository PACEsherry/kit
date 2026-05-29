<!-- source: frameworks\js\camera_napi\cameraAnimSample\entry\src\main\ets\common\utils\Logger.ts -->

# `frameworks\js\camera_napi\cameraAnimSample\entry\src\main\ets\common\utils\Logger.ts`

---

## function:

该文件定义了一个日志工具类，主要用于为相机动画示例项目提供统一的日志输出功能。它封装了系统日志接口，提供了 `debug`、`info`、`warn` 等方法，便于在开发中记录调试信息。

关键部分是 `Logger` 类，它通过 `hilog` 系统接口输出日志，并使用了固定的日志域（`domain`）和前缀（`TAG`），同时支持格式化输出，确保日志输出规范且易于识别。

在项目中，该工具类能帮助开发者快速定位运行时问题，统一日志格式便于阅读和过滤。其结构清晰，但使用时需注意日志级别，避免在生产环境中输出过多调试信息影响性能。

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

import { hilog } from '@kit.PerformanceAnalysisKit';

const TAG = 'cameraDemo';

class Logger {
  private domain: number;
  private prefix: string;
  private format: string = '%{public}s, %{public}s';

  constructor(prefix: string) {
    this.prefix = prefix;
    this.domain = 0xFF00;
  }

  debug(...args: string[]): void {
```
