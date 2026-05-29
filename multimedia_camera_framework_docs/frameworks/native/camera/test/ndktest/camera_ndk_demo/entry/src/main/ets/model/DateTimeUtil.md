<!-- source: frameworks\native\camera\test\ndktest\camera_ndk_demo\entry\src\main\ets\model\DateTimeUtil.ts -->

# `frameworks\native\camera\test\ndktest\camera_ndk_demo\entry\src\main\ets\model\DateTimeUtil.ts`

---

## function:

这个文件是一个TypeScript工具类，用于格式化日期和时间。它提供获取当前时间（时分秒）和日期（年月日）的公共方法，并包含内部方法用于拼接和格式化这些数值。它作为辅助模块被项目中的其他部分导入使用，主要影响日期时间数据的显示格式，不涉及项目构建或运行的核心配置。

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
    getTime() {
        const DATETIME = new Date()
        return this.concatTime(DATETIME.getHours(), DATETIME.getMinutes(), DATETIME.getSeconds())
    }

    /**
     * 年月日
```
