<!-- source: frameworks\js\camera_napi\demo\entry\src\main\ets\model\CameraService.ts -->

# `frameworks\js\camera_napi\demo\entry\src\main\ets\model\CameraService.ts`

---

## function:

该文件是HarmonyOS摄像头服务的核心实现模块，控制摄像头的初始化、预览、拍照、录像及资源管理等全部功能。关键配置包括默认摄像头分辨率（1280x720）、照片方向枚举（PhotoOrientation）和拍摄模式枚举（CaptureMode），用于定义拍摄行为和图像处理方式。它为应用提供了完整的摄像头操作接口，直接决定了拍照/录像功能的可用性与运行时性能。

## declaration:

```ts
/*
 * Copyright (c) 2023-2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
// @ts-nocheck
import camera from '@ohos.multimedia.camera';
import image from '@ohos.multimedia.image';
import media from '@ohos.multimedia.media';
import { BusinessError } from '@ohos.base';
import Logger from '../model/Logger';
import { Constants } from '../common/Constants';
import photoAccessHelper from '@ohos.file.photoAccessHelper';
import fs from '@ohos.file.fs';
import { GlobalContext } from '../common/GlobalContext';
import type { CameraConfig } from '../common/CameraConfig';
import colorSpaceManager from '@ohos.graphics.colorSpaceManager';

const cameraSize = {
  width: 1280,
  height: 720
```
