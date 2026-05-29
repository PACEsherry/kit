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

/**
 * Used to query the enumeration value of bundleInfo. Multiple values can be passed in the form.
 * Multiple value input, such as GET_BUNDLE_INFO_DEFAULT | GET_BUNDLE_INFO_WITH_APPLICATION.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.BundleManager.BundleFramework.Core"
]
public class BundleFlag {
    /**
     * Used to obtain the default bundleInfo. The obtained bundleInfo does not contain information of
     * signatureInfo, applicationInfo, hapModuleInfo, ability, extensionAbility and permission.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public static const GET_BUNDLE_INFO_DEFAULT: Int32 = 0x00000000
    /**
     * Used to obtain the bundleInfo containing applicationInfo. The obtained bundleInfo does not
     * contain the information of signatureInfo, hapModuleInfo, ability, extensionAbility and permission.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public static const GET_BUNDLE_INFO_WITH_APPLICATION: Int32 = 0x00000001
    /**
     * Used to obtain the bundleInfo containing hapModuleInfo. The obtained bundleInfo does not
     * contain the information of signatureInfo, applicationInfo, ability, extensionAbility and permission.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public static const GET_BUNDLE_INFO_WITH_HAP_MODULE: Int32 = 0x00000002
    /**
     * Used to obtain the bundleInfo containing ability. The obtained bundleInfo does not
     * contain the information of signatureInfo, applicationInfo, extensionAbility and permission.
     * It can't be used alone, it needs to be used with GET_BUNDLE_INFO_WITH_HAP_MODULE.
     * such as GET_BUNDLE_INFO_WITH_ABILITY | GET_BUNDLE_INFO_WITH_HAP_MODULE.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public static const GET_BUNDLE_INFO_WITH_ABILITY: Int32 = 0x00000004
    /**
     * Used to obtain the bundleInfo containing extensionAbility. The obtained bundleInfo does not
     * contain the information of signatureInfo, applicationInfo, ability and permission.
     * It can't be used alone, it needs to be used with GET_BUNDLE_INFO_WITH_HAP_MODULE,
     * such as GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY | GET_BUNDLE_INFO_WITH_HAP_MODULE.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public static const GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY: Int32 = 0x00000008
    /**
     * Used to obtain the bundleInfo containing permission. The obtained bundleInfo does not
     * contain the information of signatureInfo, applicationInfo, hapModuleInfo, extensionAbility and ability.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public static const GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION: Int32 = 0x00000010
    /**
     * Used to obtain the metadata contained in applicationInfo, moduleInfo and abilityInfo.
     * It can't be used alone, it needs to be used with GET_BUNDLE_INFO_WITH_APPLICATION,
     * GET_BUNDLE_INFO_WITH_HAP_MODULE, GET_BUNDLE_INFO_WITH_ABILITY, GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY,
     * such as GET_BUNDLE_INFO_WITH_APPLICATION | GET_BUNDLE_INFO_WITH_METADATA
     * or GET_BUNDLE_INFO_WITH_HAP_MODULE | GET_BUNDLE_INFO_WITH_ABILITY | GET_BUNDLE_INFO_WITH_METADATA
     * or GET_BUNDLE_INFO_WITH_HAP_MODULE | GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY | GET_BUNDLE_INFO_WITH_METADATA.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public static const GET_BUNDLE_INFO_WITH_METADATA: Int32 = 0x00000020
    /**
     * Used to obtain the default bundleInfo containing disabled application and ability.
     * The obtained bundleInfo does not contain information of signatureInfo, applicationInfo,
     * hapModuleInfo, ability, extensionAbility and permission.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public static const GET_BUNDLE_INFO_WITH_DISABLE: Int32 = 0x00000040
    /**
     * Used to obtain the bundleInfo containing signatureInfo. The obtained bundleInfo does not
     * contain the information of applicationInfo, hapModuleInfo, extensionAbility, ability and permission.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public static const GET_BUNDLE_INFO_WITH_SIGNATURE_INFO: Int32 = 0x00000080
    /**
     * Used to obtain the bundleInfo containing menu configuration in hapModuleInfo.
     * The obtained bundleInfo does not contain the information of applicationInfo, extensionAbility, ability and permission.
     * It can't be used alone, it needs to be used with GET_BUNDLE_INFO_WITH_HAP_MODULE,
     * such as GET_BUNDLE_INFO_WITH_MENU | GET_BUNDLE_INFO_WITH_HAP_MODULE
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public static const GET_BUNDLE_INFO_WITH_MENU: Int32 = 0x00000100
    /**
     * Used to obtain the bundleInfo containing router map configuration in hapModuleInfo.
     * The obtained bundleInfo does not contain the information of applicationInfo, extensionAbility, ability and permission.
     * It can't be used alone, it needs to be used with GET_BUNDLE_INFO_WITH_HAP_MODULE,
     * such as GET_BUNDLE_INFO_WITH_ROUTER_MAP | GET_BUNDLE_INFO_WITH_HAP_MODULE
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public static const GET_BUNDLE_INFO_WITH_ROUTER_MAP: Int32 = 0x00000200
    /**
     * Used to obtain the skillInfo contained in abilityInfo and extensionInfo.
     * It can't be used alone, it needs to be used with GET_BUNDLE_INFO_WITH_HAP_MODULE,
     * GET_BUNDLE_INFO_WITH_ABILITY, GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY,
     * such as GET_BUNDLE_INFO_WITH_SKILL | GET_BUNDLE_INFO_WITH_HAP_MODULE | GET_BUNDLE_INFO_WITH_ABILITY
     * or GET_BUNDLE_INFO_WITH_SKILL | GET_BUNDLE_INFO_WITH_HAP_MODULE | GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public static const GET_BUNDLE_INFO_WITH_SKILL: Int32 = 0x00000800
}