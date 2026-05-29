<!-- source: frameworks\js\camera_napi\demo\entry\src\main\ets\common\CameraConfig.ts -->

# `frameworks\js\camera_napi\demo\entry\src\main\ets\common\CameraConfig.ts`

---

## function:

该配置文件用于控制相机的核心拍摄参数与功能开关，涵盖视频防抖、曝光对焦模式、照片视频质量设置（如分辨率、帧率、格式）以及HDR、镜像等辅助功能。它通过定义 TypeScript 接口 `CameraConfig`，为相机模块的初始化与运行提供了结构化、可配置的参数依据。若配置不当或缺失，将直接影响相机功能的正常初始化、拍摄效果及资源管理，可能导致预览异常、拍照录像失败或性能问题。

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

export interface CameraConfig {
  mirrorBol: boolean, // 镜像使能
  videoStabilizationMode: number, // 视频防抖
  exposureMode: number, // 曝光模式
  focusMode: number, // 对焦模式
  photoQuality: number, // 拍照质量
  locationBol: boolean, // 显示地理位置
  photoFormat: number, // 照片格式
  photoOrientation: number, // 照片方向
  photoResolution: number, // 照片分辨率
  videoResolution: number, // 照片分辨率
  videoFrame: number, // 录像帧率
  referenceLineBol: boolean, // 分割线
  hdrPhotoBol: boolean, // HDR 拍摄
  hdrVideoBol: boolean, // HDR 录制
```
