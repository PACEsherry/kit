<!-- source: frameworks\native\camera\test\ndktest\camera_ndk_demo\entry\src\main\cpp\types\libentry\index.d.ts -->

# `frameworks\native\camera\test\ndktest\camera_ndk_demo\entry\src\main\cpp\types\libentry\index.d.ts`

---

## function:

该文件是一个TypeScript类型声明文件，用于定义摄像机控制模块（可能是通过NDK实现的）对外暴露的Native函数接口。它控制了项目前端（如ArkTS/JS）能够调用的所有底层摄像机功能，包括初始化、拍照、录像、变焦及各项参数（如曝光、对焦、防抖）的查询与设置。关键配置项是导出的一系列函数签名和一个`Capture_Setting`接口，前者明确了每个API的参数与返回值类型（均返回数字代码），后者规定了拍照时需要的设置参数。此文件不影响运行时逻辑，但对项目构建至关重要：它确保了TypeScript/ArkTS层在调用Native函数时拥有正确的类型提示和编译检查，是实现跨层调用的类型桥梁。

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

export const initCamera:(surfaceId: string, focusMode: number, cameraDeviceIndex: number) => number;
export const startPhotoOrVideo: (modeFlag: string, videoId: string, photoId: string) => number;
export const videoOutputStart: () => number;
export const setZoomRatio: (a: number) => number;
export const takePicture: () => number;
export const takePictureWithSettings: (setting: Capture_Setting) => number;
export const hasFlash: (a: number) => number;
export const isVideoStabilizationModeSupported: (a: number) => number;
export const isExposureModeSupported:(a: number) => number;
export const isMeteringPoint: (a: number, b: number) => number;
export const isExposureBiasRange: (a: number) => number;
export const isFocusModeSupported: (a: number) => number;
export const isFocusPoint: (a: number, b: number) => number;
export const getVideoFrameWidth: () => number;
export const getVideoFrameHeight: () => number;
```
