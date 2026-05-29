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

/**
 * Obtains configuration information about a bundle.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.BundleManager.BundleFramework.Core"
]
public class BundleInfo {
    let uid: Int32
    /**
     * Indicates the name of this bundle.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let name: String
    /**
     * Indicates the bundle vendor.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let vendor: String
    /**
     * Indicates the version code of the bundle.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let versionCode: UInt32
    /**
     * Indicates the version name of the bundle.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let versionName: String
    /**
     * Indicates the **minimum ** version compatible with the bundle.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let minCompatibleVersionCode: UInt32
    /**
     * Indicates the target version number of the bundle.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let targetVersion: UInt32
    /**
     * Obtains configuration information about an application.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let appInfo: ApplicationInfo
    /**
     * Obtains configuration information about a module.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let hapModulesInfo: Array<HapModuleInfo>
    /**
     * Indicates the required permissions details defined in the bundle.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let reqPermissionDetails: Array<ReqPermissionDetail>
    /**
     * Indicates the grant state of required permissions.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let permissionGrantStates: Array<PermissionGrantState>
    /**
     * Indicates the SignatureInfo of the bundle.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let signatureInfo: SignatureInfo
    /**
     * Indicates the hap install time.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let installTime: Int64
    /**
     * Indicates the hap update time.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let updateTime: Int64

    /**
     * Indicates the router information of the application.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let routerMap: Array<RouterItem>
    /**
     * Indicates the appIndex of application, only work in appClone mode.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let appIndex: Int32
    /**
    * Indicates the hap first install time
    */
    @!Hide
    internal let firstInstallTime: Option<Int64> = Option.None

    init(ret: RetBundleInfoV2) {
        this.name = ret.name.toString()
        this.vendor = ret.vendor.toString()
        this.versionCode = ret.versionCode
        this.versionName = ret.versionName.toString()
        this.minCompatibleVersionCode = ret.minCompatibleVersionCode
        this.targetVersion = ret.targetVersion
        this.appInfo = ApplicationInfo(ret.appInfo)
        this.hapModulesInfo = readArrHapModuleInfo(ret.hapInfo)
        this.reqPermissionDetails = readReqPermissionDetail(ret.perDetail)
        this.permissionGrantStates = readPermissionGrantState(ret.state)
        this.signatureInfo = SignatureInfo(ret.signInfo)
        this.installTime = ret.installTime
        this.updateTime = ret.updateTime
        this.uid = ret.uid
        this.routerMap = readArrRouterItem(ret.routerMap)
        this.appIndex = ret.appIndex
    }
}

/**
 * Indicates the required permissions details defined in configuration file.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.BundleManager.BundleFramework.Core"
]
public class ReqPermissionDetail {
    /**
     * Indicates the name of this required permissions.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public var name: String
    /**
     * Indicates the module name which the request permission belongs.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public var moduleName: String
    /**
     * Indicates the reason of this required permissions.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public var reason: String
    /**
     * Indicates the reason id of this required permissions.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public var reasonId: Int32
    /**
     * Indicates the used scene of this required permissions.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public var usedScene: UsedScene

    protected init(name: String, moduleName: String, reason: String, reasonId: Int32, usedScene: UsedScene) {
        this.name = name
        this.moduleName = moduleName
        this.reason = reason
        this.reasonId = reasonId
        this.usedScene = usedScene
    }

    init(ret: RetReqPermissionDetail) {
        this.name = ret.name.toString()
        this.moduleName = ret.moduleName.toString()
        this.reason = ret.reason.toString()
        this.reasonId = ret.reasonId
        this.usedScene = UsedScene(ret.usedScene)
    }
}

/**
 * The scene which is used.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.BundleManager.BundleFramework.Core"
]
public class UsedScene {
    /**
     * Indicates the abilities that need the permission.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public var abilities: Array<String>
    /**
     * Indicates the time when the permission is used.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public var when: String

    protected init(abilities: Array<String>, when: String) {
        this.abilities = abilities
        this.when = when
    }

    init(ret: RetUsedScene) {
        this.abilities = readArrStr(ret.abilities)
        this.when = ret.when.toString()
    }
}

/**
 * Indicates SignatureInfo.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.BundleManager.BundleFramework.Core"
]
public class SignatureInfo {
    /**
     * Indicates the ID of the application to which this bundle belongs
     * The application ID uniquely identifies an application. It is determined by the bundle name and signature.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let appId: String
    /**
     * Indicates the fingerprint of the certificate.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let fingerprint: String
    /**
     * Globally unique identifier of an application, which is allocated by the cloud.
     * AppIdentifier does not change along the application lifecycle, including version updates, certificate changes,
     * public and private key changes, and application transfer.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let appIdentifier: String
    /**
     * Indicates the certificate
     */
    @!Hide
    internal let certificate: Option<String> = Option.None

    init(ret: RetSignatureInfo) {
        this.appId = ret.appId.toString()
        this.fingerprint = ret.fingerprint.toString()
        this.appIdentifier = ret.appIdentifier.toString()
    }
}
