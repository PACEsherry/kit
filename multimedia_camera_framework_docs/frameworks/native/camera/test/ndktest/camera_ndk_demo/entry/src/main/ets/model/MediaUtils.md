<!-- source: frameworks\native\camera\test\ndktest\camera_ndk_demo\entry\src\main\ets\model\MediaUtils.ts -->

# `frameworks\native\camera\test\ndktest\camera_ndk_demo\entry\src\main\ets\model\MediaUtils.ts`

---

## function:

该文件是媒体文件操作的工具类，主要用于管理多媒体文件的创建和获取。关键配置包括单例模式的实例管理、媒体类型参数化以及基于时间戳的文件名生成策略，确保文件唯一性和可追溯性。对项目的影响是提供统一的媒体文件处理接口，简化相机测试中的资源管理逻辑，提升代码复用性和可维护性。

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

// @ts-nocheck

import mediaLibrary from '@ohos.multimedia.mediaLibrary'
import DateTimeUtil from '../model/DateTimeUtil'
import Logger from '../model/Logger'

export default class MediaUtils {
    private tag: string = 'zyk MediaUtils'
    private mediaTest: mediaLibrary.MediaLibrary = mediaLibrary.getMediaLibrary(globalThis.abilityContext)
    private static instance: MediaUtils = new MediaUtils()
    private num: number = 0

    public static getInstance() {
        if (this.instance === undefined) {
            this.instance = new MediaUtils()
```
