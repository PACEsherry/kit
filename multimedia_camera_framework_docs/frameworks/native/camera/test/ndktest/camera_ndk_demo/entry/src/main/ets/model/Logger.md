<!-- source: frameworks\native\camera\test\ndktest\camera_ndk_demo\entry\src\main\ets\model\Logger.ts -->

# `frameworks\native\camera\test\ndktest\camera_ndk_demo\entry\src\main\ets\model\Logger.ts`

---

## function:

这个配置文件控制日志记录功能，提供Logger类用于输出不同级别的日志（调试、信息、警告、错误），使用华为HiLog系统。关键配置项包括domain（日志域，默认0xFF00）、prefix（日志前缀，用于标识模块）和format（日志格式字符串），用于自定义日志输出。对项目运行有影响，它作为日志工具类，依赖@ohos.hilog模块，便于调试和监控应用程序。

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

import hiLog from '@ohos.hilog'

class Logger {
    private domain: number
    private prefix: string
    private format: string = "%{public}s, %{public}s"

    constructor(prefix: string) {
        this.prefix = prefix
        this.domain = 0xFF00
    }

    debug(...args: any[]) {
        hiLog.debug(this.domain, this.prefix, this.format, args)
    }
```
