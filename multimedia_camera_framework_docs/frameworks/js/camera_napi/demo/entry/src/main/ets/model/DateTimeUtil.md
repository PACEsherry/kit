<!-- source: frameworks\js\camera_napi\demo\entry\src\main\ets\model\DateTimeUtil.ts -->

# `frameworks\js\camera_napi\demo\entry\src\main\ets\model\DateTimeUtil.ts`

---

## function:

该文件是一个TypeScript工具类，而非配置文件，主要功能是提供标准化的日期时间格式化方法。它包含两个核心公开方法：`getTime()`用于获取当前时间的"时:分:秒"格式字符串，`getDate()`用于获取当前日期的"年-月-日"格式字符串，两者内部都使用私有方法进行数字补零和拼接。作为工具模块，它为项目其他部分（如日志记录、UI展示）提供统一的日期时间格式化服务，对构建无直接影响，但若被引用则其代码会被包含在最终产物中。

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

/**
 * @file 日期工具
 */
export default class DateTimeUtil {

  /**
   * 时分秒
   */
  getTime(): string {
    const DATETIME = new Date();
    return this.concatTime(DATETIME.getHours(), DATETIME.getMinutes(), DATETIME.getSeconds());
  }

  /**
   * 年月日
```
