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

import ohos.labels.APILevel
import ohos.skill.{Skill, readArrSkill}
import ohos.metadata.{Metadata, readArrMetadata}

/**
* Extension information about a bundle.
*/
@!APILevel[
    since: "22",
    syscap: "SystemCapability.BundleManager.BundleFramework.Core"
]
public class ExtensionAbilityInfo {
    /**
     * Indicates the name of the bundle.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let bundleName: String
    /**
     * Indicates the name of the module.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let moduleName: String
    /**
     * Indicates the name of the extension ability info.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let name: String
    /**
     * Indicates the label id of the extension ability info.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let labelId: Int32
    /**
     * Indicates the description id of the extension ability info.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let descriptionId: Int32
    /**
     * Indicates the icon id of the extension ability info.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let iconId: Int32
    /**
     * Indicates whether this ability can be called by other abilities.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let exported: Bool
    /**
     * Enumerates types of the extension ability info.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let extensionAbilityType: ExtensionAbilityType
    /**
     * Indicates type name of the extension ability.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let extensionAbilityTypeName: String
    /**
     * The permissions that others need to use this extension ability info.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let permissions: Array<String>
    /**
     * Obtains configuration information about an application.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let applicationInfo: ApplicationInfo
    /**
     * Indicates the metadata of bundle.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let metadata: Array<Metadata>
    /**
     * Indicates the src language to express extension ability info.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let enabled: Bool
    /**
     * Indicates the read permission extension ability info.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let readPermission: String
    /**
     * Indicates the write permission of extension ability info.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let writePermission: String
    /**
     * Indicates skills of the extension ability.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let skills: Array<Skill>
    /**
     * Indicates the appIndex of extension ability, only work in clone app mode.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let appIndex: Int32

    protected init(ret: RetExtensionAbilityInfoV2) {
        this.bundleName = ret.bundleName.toString()
        this.moduleName = ret.moduleName.toString()
        this.name = ret.name.toString()
        this.labelId = ret.labelId
        this.descriptionId = ret.descriptionId
        this.iconId = ret.iconId
        this.exported = ret.exported
        this.extensionAbilityType = try {
            ExtensionAbilityType.parse(ret.extensionAbilityType)
        } catch (_: IllegalArgumentException) {
            Unspecified
        }
        this.permissions = readArrStr(ret.permissions)
        this.applicationInfo = ApplicationInfo(ret.applicationInfo)
        this.metadata = readArrMetadata(ret.metadata)
        this.enabled = ret.enabled
        this.readPermission = ret.readPermission.toString()
        this.writePermission = ret.writePermission.toString()
        this.extensionAbilityTypeName = ret.extensionAbilityTypeName.toString()
        this.skills = readArrSkill(ret.skills)
        this.appIndex = ret.appIndex
    }
}
