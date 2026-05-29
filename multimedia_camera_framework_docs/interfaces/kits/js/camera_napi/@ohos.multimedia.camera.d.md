<!-- source: interfaces\kits\js\camera_napi\@ohos.multimedia.camera.d.ts -->

# `interfaces\kits\js\camera_napi\@ohos.multimedia.camera.d.ts`

---

## function:

这个配置文件控制OpenHarmony系统中多媒体相机核心功能，包括相机设备管理、拍摄和图像处理等操作。它包含关键配置项如CameraManager实例创建方法，并导入图像处理和文件访问模块，以提供完整的相机API接口。该文件作为TypeScript声明文件，在项目构建时提供类型检查和API定义，确保代码正确性并辅助功能集成，不影响运行时行为。

## declaration:

```ts
/*
* Copyright (C) 2024 Huawei Device Co., Ltd.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
* http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

/**
* @file
* @kit CameraKit
*/

import { ErrorCallback, AsyncCallback, Callback } from './@ohos.base';
import type Context from './application/BaseContext';
import image from './@ohos.multimedia.image';
import type colorSpaceManager from './@ohos.graphics.colorSpaceManager';
import photoAccessHelper from './@ohos.file.photoAccessHelper';

/**
* @namespace camera
* @syscap SystemCapability.Multimedia.Camera.Core
* @since 10
```
