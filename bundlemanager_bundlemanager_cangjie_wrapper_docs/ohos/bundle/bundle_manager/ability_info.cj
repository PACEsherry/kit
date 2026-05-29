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

// The Cangjie API is in Beta. For details on its capabilities and limitations, please refer to the README file.

package ohos.bundle.bundle_manager

import ohos.labels.{APILevel, Hide}
import ohos.skill.{Skill, readArrSkill}
import ohos.metadata.{Metadata, readArrMetadata}

/**
 * Obtains configuration information about an ability.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.BundleManager.BundleFramework.Core"
]
public class AbilityInfo {
    /**
     * Indicates the name of the bundle containing the ability.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let bundleName: String
    /**
     * Indicates the module name of the package to which the capability belongs.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let moduleName: String
    /**
     * Ability simplified class name.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let name: String
    /**
     * Indicates the label of the ability.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let label: String
    /**
     * Indicates the label id of the ability.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let labelId: Int32
    /**
     * Indicates the ability.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let description: String
    /**
     * Indicates the description id of the ability.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let descriptionId: Int32
    /**
     * Indicates the icon of the ability.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let icon: String
    /**
     * Indicates the icon id of the ability.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let iconId: Int32
    /**
     * Process of ability, if user do not set it, the value equal application process.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let process: String
    /**
     * Indicates whether this ability can be called by other abilities.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let exported: Bool
    /**
    * Enumerates types of templates that can be used by an ability
    */
    /**
     * Enumerates ability display orientations.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let orientation: DisplayOrientation
    /**
     * Enumerates ability launch type.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let launchType: LaunchType
    /**
     * The permissions that others need to launch this ability.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let permissions: Array<String>
    /**
     * The device types that this ability can run on.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let deviceTypes: Array<String>
    /**
     * Obtains configuration information about an application.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let applicationInfo: ApplicationInfo
    /**
     * Indicates the metadata of ability.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let metadata: Array<Metadata>
    /**
     * Indicates whether the ability is enabled.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let enabled: Bool
    /**
     * Indicates which window mode is supported.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let supportedWindowModes: Array<SupportedWindowMode>
    /**
     * Indicates window size.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let windowSize: WindowSize
    /**
     * Indicates whether to hide the application icon from the dock area.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let excludeFromDock: Bool
    /**
     * Indicates skills of the ability.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let skills: Array<Skill>
    /**
     * Indicates the appIndex of application, only work in clone app mode.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let appIndex: Int32
    /**
    * Indicates the orientation id of the ability
    */
    @!Hide
    internal let orientationId: Int64 = 0

    protected init(ret: RetAbilityInfoV2) {
        this.bundleName = ret.bundleName.toString()
        this.moduleName = ret.moduleName.toString()
        this.name = ret.name.toString()
        this.label = ret.label.toString()
        this.labelId = ret.labelId
        this.description = ret.description.toString()
        this.descriptionId = ret.descriptionId
        this.icon = ret.icon.toString()
        this.iconId = ret.iconId
        this.process = ret.process.toString()
        this.exported = ret.exported
        this.orientation = DisplayOrientation.parse(ret.orientation)
        this.launchType = LaunchType.parse(ret.launchType)
        this.permissions = readArrStr(ret.permissions)
        this.deviceTypes = readArrStr(ret.deviceTypes)
        this.applicationInfo = ApplicationInfo(ret.applicationInfo)
        this.metadata = readArrMetadata(ret.metadata)
        this.enabled = ret.enabled
        this.supportedWindowModes = readArrInt32(ret.supportWindowModes)
        this.windowSize = WindowSize(ret.windowSize)
        this.excludeFromDock = ret.excludeFromDock
        this.skills = readArrSkill(ret.skills)
        this.appIndex = ret.appIndex
    }
}

/**
 * Indicates the window size.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.BundleManager.BundleFramework.Core"
]
public class WindowSize {
    /**
     * Indicates maximum ratio of width over height of window under free window status.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let maxWindowRatio: Float64
    /**
     * Indicates minimum ratio of width over height of window under free window status.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let minWindowRatio: Float64
    /**
     * Indicates maximum width of window under free window status.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let maxWindowWidth: UInt32
    /**
     * Indicates minimum width of window under free window status.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let minWindowWidth: UInt32
    /**
     * Indicates maximum height of window under free window status.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let maxWindowHeight: UInt32
    /**
     * Indicates minimum height of window under free window status.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let minWindowHeight: UInt32

    init(ret: RetWindowSize) {
        this.maxWindowRatio = ret.maxWindowRatio
        this.minWindowRatio = ret.minWindowRatio
        this.maxWindowWidth = ret.maxWindowWidth
        this.minWindowWidth = ret.minWindowWidth
        this.maxWindowHeight = ret.maxWindowHeight
        this.minWindowHeight = ret.minWindowHeight
    }
}