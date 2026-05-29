<!-- source: frameworks\js\camera_napi\cameraAnimSample\entry\src\main\ets\common\Constants.ts -->

# `frameworks\js\camera_napi\cameraAnimSample\entry\src\main\ets\common\Constants.ts`

---

## function:

该配置文件主要控制相机示例应用中UI组件的视觉样式和布局尺寸。它包含的关键配置项有：X组件表面的分辨率（1920x1080）、X组件的边框宽度（0.5）、拍照按钮的边框宽度（3）及其圆角半径（70），这些共同决定了预览界面和拍照按钮的具体外观。这些常量在编译时被固定，直接决定应用界面的渲染效果，修改它们可以调整UI元素的尺寸和样式，但不会影响核心功能逻辑。

## declaration:

```ts
/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

export class Constants {
  /**
   * Surface width in xComponent.
   */
  static readonly X_COMPONENT_SURFACE_WIDTH = 1920;

  /**
   * Surface height in xComponent.
   */
  static readonly X_COMPONENT_SURFACE_HEIGHT = 1080;

  /**
   * Border width in xComponent.
   */
  static readonly X_COMPONENT_BORDER_WIDTH = 0.5;
```
