/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

package ohos_app_cangjie_entry

import kit.AbilityKit.{UIAbility, AbilityStage, Want, LaunchParam, LaunchReason}
import kit.ArkUI.{WindowStage}
import ohos.arkui.state_management.AppStorage
import kit.AbilityKit.UIAbilityContext
import kit.PerformanceAnalysisKit.Hilog

class MainAbility <: UIAbility {
    public init() {
        super()
        registerSelf()
    }

    public override func onCreate(want: Want, launchParam: LaunchParam): Unit {
        Hilog.info(0, "cangjie", "MainAbility OnCreated.${want.abilityName}")
        match (launchParam.launchReason) {
            case LaunchReason.StartAbility => Hilog.info(0, "cangjie", "START_ABILITY")
            case _ => throw Exception("unsupported enum constructor")
        }
    }

    public override func onWindowStageCreate(windowStage: WindowStage): Unit {
        Hilog.info(0, "cangjie", "MainAbility onWindowStageCreate.")
        AppStorage.setOrCreate<UIAbilityContext>("abilityContext", this.context)
        AppStorage.setOrCreate<WindowStage>("windowStage", windowStage)
        windowStage.loadContent("EntryView")
    }
}
