<!-- source: frameworks\native\camera\test\ndktest\camera_ndk_demo\entry\src\main\ets\common\Constants.ts -->

# `frameworks\native\camera\test\ndktest\camera_ndk_demo\entry\src\main\ets\common\Constants.ts`

---

## function:

该配置文件控制相机应用的配置参数，包括宽高比、分辨率、设备类型和视频帧率等功能范围。关键配置项有宽高比的最小最大值（如4/3到16/9）、视频和照片的最大宽度（2048）、设备类型标识（如tablet、phone）以及视频帧率选项（30fps和15fps）。这些常量影响应用的运行时行为，例如画面比例和视频质量，但通常不直接改变项目构建过程。

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
