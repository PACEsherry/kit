<!-- source: frameworks\native\camera\test\ndktest\camera_ndk_demo\entry\src\main\ets\common\DisplayCalculator.ts -->

# `frameworks\native\camera\test\ndktest\camera_ndk_demo\entry\src\main\ets\common\DisplayCalculator.ts`

---

## function:

控制相机应用中显示表面尺寸的计算功能，根据屏幕尺寸、宽高比和设备类型自适应调整预览显示。关键配置项包括屏幕宽度、高度、默认宽高比，以及从AppStorage获取的设备类型（如平板），用于在不同设备和屏幕方向下优化显示布局。在运行时动态计算显示尺寸，影响相机预览的UI适配和渲染性能，但不直接参与项目构建过程。

## declaration:

```ts
/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import { Constants } from '../common/Constants';

export default class DisplayCalculator {
  public static calcSurfaceDisplaySize(screenWidth: number, screenHeight: number, defaultAspectRatio: number): {
    width: number,
    height: number
  } {
    const displaySize = {
      width: 1920, height: 1080
    };
    // @ts-ignore
    if (AppStorage.get<string>('deviceType') === Constants.TABLET || screenWidth > screenHeight) {
      if (screenWidth / screenHeight > defaultAspectRatio) {
        displaySize.width = Math.floor(screenHeight * defaultAspectRatio);
        displaySize.height = Math.floor(screenHeight);
```
