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
import ohos.resource.AppResource
import ohos.metadata.Metadata
import ohos.business_exception.BusinessException

/**
 * Obtains configuration information about an application.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.BundleManager.BundleFramework.Core"
]
public class ApplicationInfo {
    /**
     * Indicates the application name, which is the same as bundleName.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let name: String
    /**
     * Description of application.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let description: String
    /**
     * Indicates the description id of the application.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let descriptionId: Int32
    /**
     * Indicates whether or not this application may be instantiated.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let enabled: Bool
    /**
     * Indicates the label of the application.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let label: String
    /**
     * Indicates the label id of the application.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let labelId: Int32
    /**
     * Indicates the icon of the application.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let icon: String
    /**
     * Indicates the icon id of the application.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let iconId: Int32
    /**
     * Process of application, if user do not set it, the value equal bundleName.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let process: String
    /**
     * Indicates the permissions required for accessing the application.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let permissions: Array<String>
    /**
     * Indicates the application source code path.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let codePath: String
    /**
     * Indicates the metadata of the application.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let metadataArray: Array<ModuleMetadata>
    /**
     * Indicates whether or not this application may be removable.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let removable: Bool
    /**
     * Indicates the access token of the application.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let accessTokenId: UInt32
    /**
     * Indicates the uid of the application.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let uid: Int32
    /**
     * Indicates icon resource of the application.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let iconResource: AppResource
    /**
     * Indicates label resource of the application.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let labelResource: AppResource
    /**
     * Indicates description resource of the application.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let descriptionResource: AppResource
    /**
     * Indicates the appDistributionType of the application.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let appDistributionType: String
    /**
     * Indicates the appProvisionType of the application.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let appProvisionType: String
    /**
     * Indicates whether the application is a system application.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let systemApp: Bool
    /**
     * Indicates the type of application is APP.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let bundleType: BundleType
    /**
     * Indicates whether the application is in debug mode.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let debug: Bool
    /**
     * Indicates whether the application data is unclearable, that is, whether the application data cannot be cleared.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let dataUnclearable: Bool
    /**
     * Indicates native library path.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let nativeLibraryPath: String
    /**
     * Indicates the MultiAppMode object of the bundle.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let multiAppMode: MultiAppMode
    /**
     * Indicates the index of the bundle.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let appIndex: Int32
    /**
     * Indicates sources to install the app.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let installSource: String
    /**
     * Indicates the release type of the app.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let releaseType: String
    /**
     * Indicates whether the application enables cloud file sync.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let cloudFileSyncEnabled: Bool
    /**
    * Indicates whether the application enables cloud structured data sync.
    */
    @!Hide
    internal let cloudStructuredDataSyncEnabled: Option<Bool> = Option.None
    /**
    * Indicates the flags of the application.
    */
    @!Hide
    internal let flags: Option<Int32> = Option.None;

    protected init(ret: RetApplicationInfoV2) {
        this.name = ret.name.toString()
        this.description = ret.description.toString()
        this.descriptionId = ret.descriptionId
        this.enabled = ret.enabled
        this.label = ret.label.toString()
        this.labelId = ret.labelId
        this.icon = ret.icon.toString()
        this.iconId = ret.iconId
        this.process = ret.process.toString()
        this.permissions = readArrStr(ret.permissions)
        this.codePath = ret.codePath.toString()
        this.metadataArray = readArrModuleMetadata(ret.metadataArray)
        this.removable = ret.removable
        this.accessTokenId = ret.accessTokenId
        this.uid = ret.uid
        this.iconResource = AppResource(ret.iconResource)
        this.labelResource = AppResource(ret.labelResource)
        this.descriptionResource = AppResource(ret.descriptionResource)
        this.appDistributionType = ret.appDistributionType.toString()
        this.appProvisionType = ret.appProvisionType.toString()
        this.systemApp = ret.systemApp
        this.bundleType = BundleType.parse(ret.bundleType)
        this.debug = ret.debug
        this.dataUnclearable = ret.dataUnclearable
        this.cloudFileSyncEnabled = ret.cloudFileSyncEnabled
        this.nativeLibraryPath = ret.nativeLibraryPath.toString()
        this.multiAppMode = MultiAppMode(ret.multiAppMode)
        this.appIndex = ret.appIndex
        this.installSource = ret.installSource.toString()
        this.releaseType = ret.releaseType.toString()
    }
}

/**
 * Indicates the ModuleMetadata.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.BundleManager.BundleFramework.Core"
]
public class ModuleMetadata {
    /**
     * Indicates the name of this hap module.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let moduleName: String
    /**
     * Indicates the metadata of this hap module.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let metadata: Array<Metadata>

    /**
     * @throws { BusinessException } 17700101 - Out of Memory!
     */
    init(ret: RetModuleMetadata) {
        this.moduleName = ret.moduleName.toString()
        let ptr = ret.metadata.head
        let size = ret.metadata.size
        if (ptr.isNotNull()) {
            this.metadata = unsafe { Array<Metadata>(size, {i => Metadata(ptr.read(i))}) }
        } else {
            throw BusinessException(17700101, "Out of Memory!")
        }
    }
}

/**
 * Indicates MultiAppMode.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.BundleManager.BundleFramework.Core"
]
public class MultiAppMode {
    /**
     * Indicates the multiAppModeType of the bundle.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let multiAppModeType: MultiAppModeType
    /**
     * Indicates the max count of the bundle.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let maxCount: Int32

    init(ret: RetMultiAppMode) {
        this.multiAppModeType = MultiAppModeType.parse(ret.multiAppModeType)
        this.maxCount = ret.count
    }
}