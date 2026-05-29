<!-- source: frameworks\js\camera_napi\cameraAnimSample\entry\src\main\ets\common\utils\BlurAnimateUtil.ts -->

# `frameworks\js\camera_napi\cameraAnimSample\entry\src\main\ets\common\utils\BlurAnimateUtil.ts`

---

## function:

此配置文件控制相机应用中模糊动画的效果，包括模糊显示/隐藏、旋转和翻转动画的时长、延迟、角度及缩放比例。它包含多个静态常量如动画持续时间、旋转角度和图像缩放值，用于精确控制动画参数。修改这些配置项会直接影响应用的视觉流畅度和用户体验，但对项目构建无直接影响，仅在运行时调整动画行为。

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
import { image } from '@kit.ImageKit';
import Logger from './Logger';
import { Constants } from '../Constants';

const TAG: string = 'BlurAnimateUtil';

export class BlurAnimateUtil {
  public static surfaceShot: image.PixelMap;
  public static readonly SHOW_BLUR_DURATION: number = 200;
  public static readonly HIDE_BLUR_DURATION: number = 200;
  public static readonly ROTATION_DURATION: number = 200;
  public static readonly FLIP_DELAY: number = 50;
  public static readonly ROTATE_AXIS: number = 0.5;
  public static readonly IMG_ROTATE_ANGLE_90: number = 90;
  public static readonly IMG_ROTATE_ANGLE_270: number = 270;
  public static readonly IMG_FLIP_ANGLE_0: number = 0;
```
