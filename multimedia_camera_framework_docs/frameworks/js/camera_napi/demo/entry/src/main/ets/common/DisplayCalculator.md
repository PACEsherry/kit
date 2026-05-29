<!-- source: frameworks\js\camera_napi\demo\entry\src\main\ets\common\DisplayCalculator.ts -->

# `frameworks\js\camera_napi\demo\entry\src\main\ets\common\DisplayCalculator.ts`

---

## function:

该文件用于计算摄像头预览或显示区域的适配尺寸。它根据输入的屏幕尺寸和默认宽高比，通过静态方法`calcSurfaceDisplaySize`动态计算出适合当前设备（特别是平板或横屏）的显示尺寸。计算过程会区分设备类型和屏幕方向，确保输出尺寸符合指定的宽高比，避免画面变形。此配置直接影响应用中视频或预览窗口的布局和显示效果，对构建无影响，但决定运行时UI的适配性。

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
    if (AppStorage.get<string>('deviceType') === Constants.TABLET || screenWidth > screenHeight) {
      if (screenWidth / screenHeight > defaultAspectRatio) {
        displaySize.width = Math.floor(screenHeight * defaultAspectRatio);
        displaySize.height = Math.floor(screenHeight);
      } else {
```
