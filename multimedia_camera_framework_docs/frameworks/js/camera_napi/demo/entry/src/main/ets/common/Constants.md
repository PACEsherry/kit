<!-- source: frameworks\js\camera_napi\demo\entry\src\main\ets\common\Constants.ts -->

# `frameworks\js\camera_napi\demo\entry\src\main\ets\common\Constants.ts`

---

## function:

该文件定义了相机应用的核心常量参数，用于控制预览画面比例、媒体质量、设备适配和视频录制规格。它包含了宽高比、最大分辨率、设备类型及帧率等关键配置，确保相机功能在不同场景下的规范性和一致性。这些常量被项目代码直接引用，修改会直接影响整个相机功能的显示布局、性能表现和设备兼容性。

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

export class Constants {
  // aspect ratio: width/height
  static readonly MIN_ASPECT_RATIO = 4 / 3;
  static readonly MAX_ASPECT_RATIO = 16 / 9;

  static readonly VIDEO_MAX_WIDTH = 2048;
  static readonly PHOTO_MAX_WIDTH = 2048;
  static readonly SURFACE_BOTTOM_MARGIN = 50;

  // device type
  static readonly TABLET = 'tablet';
  static readonly DEFAULT = 'default';
  static readonly PHONE = 'phone';

  // video frame
```
