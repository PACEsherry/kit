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

import ohos.resource.CResource
import ohos.ffi.{CArrString, CArrI32, toArrayCString}
import ohos.skill.{CArrSkill, freeCArrSkill}
import ohos.metadata.{CArrMetadata, freeCArrMetadata}
import ohos.business_exception.BusinessException

@C
protected struct RetModuleMetadata {
    protected RetModuleMetadata(
        let moduleName: CString,
        let metadata: CArrMetadata
    ) {}

    func free(): Unit {
        unsafe {
            LibC.free(this.moduleName)
            freeCArrMetadata(this.metadata)
        }
    }
}

@C
protected struct CArrModuleMetadata {
    protected CArrModuleMetadata(
        let head: CPointer<RetModuleMetadata>,
        let size: Int64
    ) {}
}

@C
struct RetUsedScene {
    var abilities: CArrString
    var when: CString

    /**
    * @throws { BusinessException } 17700101 - Bundle manager service exception.
    */
    init(usedScene: UsedScene) {
        unsafe {
            this.when = LibC.mallocCString(usedScene.when)
            try {
                this.abilities = toArrayCString(usedScene.abilities)
            } catch (e: Exception) {
                LibC.free(this.when)
                throw BusinessException(ERROR_BUNDLE_SERVICE_EXCEPTION, getErrorMsg(ERROR_BUNDLE_SERVICE_EXCEPTION))
            }
        }
    }

    func free(): Unit {
        unsafe {
            LibC.free(this.when)
            this.abilities.free()
        }
    }
}

@C
struct RetReqPermissionDetail {
    RetReqPermissionDetail(
        var name: CString,
        var moduleName: CString,
        var reason: CString,
        var reasonId: Int32,
        var usedScene: RetUsedScene
    ) {}

    func free(): Unit {
        unsafe {
            LibC.free(this.name)
            LibC.free(this.moduleName)
            LibC.free(this.reason)
            this.usedScene.free()
        }
    }
}

@C
protected struct RetSignatureInfo {
    protected RetSignatureInfo(
        let appId: CString,
        let fingerprint: CString,
        let appIdentifier: CString
    ) {}

    func free(): Unit {
        unsafe {
            LibC.free(this.appId)
            LibC.free(this.fingerprint)
            LibC.free(this.appIdentifier)
        }
    }
}

@C
protected struct RetMultiAppMode {
    protected RetMultiAppMode(
        var multiAppModeType: UInt8,
        var count: Int32
    ) {}
}

@C
protected struct RetApplicationInfoV2 {
    protected RetApplicationInfoV2(
        var name: CString,
        var description: CString,
        var descriptionId: Int32,
        var enabled: Bool,
        var label: CString,
        var labelId: Int32,
        var icon: CString,
        var iconId: Int32,
        var process: CString,
        var permissions: CArrString,
        var codePath: CString,
        var metadataArray: CArrModuleMetadata,
        var removable: Bool,
        var accessTokenId: UInt32,
        var uid: Int32,
        var iconResource: CResource,
        var labelResource: CResource,
        var descriptionResource: CResource,
        var appDistributionType: CString,
        var appProvisionType: CString,
        var systemApp: Bool,
        var bundleType: Int32,
        var debug: Bool,
        var dataUnclearable: Bool,
        var cloudFileSyncEnabled: Bool,
        var nativeLibraryPath: CString,
        var multiAppMode: RetMultiAppMode,
        var appIndex: Int32,
        var installSource: CString,
        var releaseType: CString
    ) {}

    protected func free(): Unit {
        unsafe {
            LibC.free(this.name)
            LibC.free(this.description)
            LibC.free(this.label)
            LibC.free(this.icon)
            LibC.free(this.process)
            this.permissions.free()
            LibC.free(this.codePath)
            freeCArrModuleMetadata(this.metadataArray)
            this.iconResource.free()
            this.labelResource.free()
            this.descriptionResource.free()
            LibC.free(appDistributionType)
            LibC.free(appProvisionType)
            LibC.free(nativeLibraryPath)
            LibC.free(installSource)
            LibC.free(releaseType)
        }
    }
}

@C
protected struct RetWindowSize {
    protected RetWindowSize(
        var maxWindowRatio: Float64,
        var minWindowRatio: Float64,
        var maxWindowWidth: UInt32,
        var minWindowWidth: UInt32,
        var maxWindowHeight: UInt32,
        var minWindowHeight: UInt32
    ) {}
}



@C
protected struct RetAbilityInfoV2 {
    protected RetAbilityInfoV2(
        var bundleName: CString,
        var moduleName: CString,
        var name: CString,
        var label: CString,
        var labelId: Int32,
        var description: CString,
        var descriptionId: Int32,
        var icon: CString,
        var iconId: Int32,
        var process: CString,
        var exported: Bool,
        var orientation: Int32,
        var launchType: Int32,
        var permissions: CArrString,
        var deviceTypes: CArrString,
        var applicationInfo: RetApplicationInfoV2,
        var metadata: CArrMetadata,
        var enabled: Bool,
        var supportWindowModes: CArrI32,
        var windowSize: RetWindowSize,
        var excludeFromDock: Bool,
        var skills: CArrSkill,
        var appIndex: Int32
    ) {}

    protected func free() {
        unsafe {
            LibC.free(this.bundleName)
            LibC.free(this.moduleName)
            LibC.free(this.name)
            LibC.free(this.label)
            LibC.free(this.description)
            LibC.free(this.icon)
            LibC.free(this.process)
            this.permissions.free()
            this.deviceTypes.free()
            this.applicationInfo.free()
            freeCArrMetadata(this.metadata)
            LibC.free<Int32>(supportWindowModes.head)
            freeCArrSkill(this.skills)
        }
    }
}

@C
protected struct CArrRetAbilityInfoV2 {
    protected CArrRetAbilityInfoV2(
        let head: CPointer<RetAbilityInfoV2>,
        let size: Int64
    ) {}
}

@C
protected struct RetExtensionAbilityInfoV2 {
    protected RetExtensionAbilityInfoV2(
        var bundleName: CString,
        var moduleName: CString,
        var name: CString,
        var labelId: Int32,
        var descriptionId: Int32,
        var iconId: Int32,
        var exported: Bool,
        var extensionAbilityType: Int32,
        var permissions: CArrString,
        var applicationInfo: RetApplicationInfoV2,
        var metadata: CArrMetadata,
        var enabled: Bool,
        var readPermission: CString,
        var writePermission: CString,
        var extensionAbilityTypeName: CString,
        var skills: CArrSkill,
        var appIndex: Int32
    ) {}

    protected func free() {
        unsafe {
            LibC.free(this.bundleName)
            LibC.free(this.moduleName)
            LibC.free(this.name)
            this.permissions.free()
            this.applicationInfo.free()
            freeCArrMetadata(this.metadata)
            LibC.free(this.readPermission)
            LibC.free(this.writePermission)
            LibC.free(this.extensionAbilityTypeName)
            freeCArrSkill(this.skills)
        }
    }
}

@C
protected struct CArrRetExtensionAbilityInfoV2 {
    protected CArrRetExtensionAbilityInfoV2(
        let head: CPointer<RetExtensionAbilityInfoV2>,
        let size: Int64
    ) {}
}

@C
protected struct RetPreloadItem {
    protected RetPreloadItem(protected var moduleName: CString) {}

    protected func free() {
        unsafe { LibC.free(this.moduleName) }
    }
}

@C
protected struct CArrRetPreloadItem {
    protected CArrRetPreloadItem(
        let head: CPointer<RetPreloadItem>,
        let size: Int64
    ) {}
}

@C
protected struct RetDependency {
    protected RetDependency(
        var bundleName: CString,
        var moduleName: CString,
        var versionCode: UInt32
    ) {}

    func free() {
        unsafe {
            LibC.free(this.bundleName)
            LibC.free(this.moduleName)
        }
    }
}

@C
protected struct CArrRetDependency {
    protected CArrRetDependency(
        let head: CPointer<RetDependency>,
        let size: Int64
    ) {}
}

@C
protected struct RetHapModuleInfoV2 {
    protected RetHapModuleInfoV2(
        var name: CString,
        var icon: CString,
        var iconId: Int32,
        var label: CString,
        var labelId: Int32,
        var description: CString,
        var descriptionId: Int32,
        var mainElementName: CString,
        var abilitiesInfo: CArrRetAbilityInfoV2,
        var extensionAbilitiesInfo: CArrRetExtensionAbilityInfoV2,
        var metadata: CArrMetadata,
        var deviceTypes: CArrString,
        var installationFree: Bool,
        var hashValue: CString,
        var moduleType: Int32,
        var preloads: CArrRetPreloadItem,
        var dependencies: CArrRetDependency,
        var fileContextMenuConfig: CString,
        var routerMap: CArrRetRouterItem,
        var codePath: CString,
        var nativeLibraryPath: CString
    ) {}

    protected func free() {
        unsafe {
            LibC.free(this.name)
            LibC.free(this.icon)
            LibC.free(this.label)
            LibC.free(this.description)
            LibC.free(this.mainElementName)

            freeCArrRetAbilityInfoV2(this.abilitiesInfo)
            freeCArrRetExtensionAbilityInfoV2(this.extensionAbilitiesInfo)
            freeCArrMetadata(this.metadata)
            this.deviceTypes.free()
            LibC.free(this.hashValue)
            freeCArrRetPreloadItem(this.preloads)
            freeCArrRetDependency(this.dependencies)
            LibC.free(this.fileContextMenuConfig)
            freeRetCArrRetRouterItem(this.routerMap)
            LibC.free(this.codePath)
            LibC.free(this.nativeLibraryPath)
        }
    }
}

@C
struct CArrRetHapModuleInfoV2 {
    CArrRetHapModuleInfoV2(
        let head: CPointer<RetHapModuleInfoV2>,
        let size: Int64
    ) {}
}

@C
struct CArrRetReqPermissionDetail {
    CArrRetReqPermissionDetail(
        let head: CPointer<RetReqPermissionDetail>,
        let size: Int64
    ) {}
}

@C
struct RetBundleInfoV2 {
    RetBundleInfoV2(
        var name: CString,
        var vendor: CString,
        var versionCode: UInt32,
        var versionName: CString,
        var minCompatibleVersionCode: UInt32,
        var targetVersion: UInt32,
        var appInfo: RetApplicationInfoV2,
        var hapInfo: CArrRetHapModuleInfoV2,
        var perDetail: CArrRetReqPermissionDetail,
        var state: CArrI32,
        var signInfo: RetSignatureInfo,
        var installTime: Int64,
        var updateTime: Int64,
        var uid: Int32,
        var routerMap: CArrRetRouterItem,
        var appIndex: Int32
    ) {}

    func free() {
        unsafe {
            LibC.free(this.name)
            LibC.free(this.vendor)
            LibC.free(versionName)
            this.appInfo.free()
            freeCArrRetHapModuleInfoV2(this.hapInfo)
            freeCArrRetReqPermissionDetail(this.perDetail)
            LibC.free<Int32>(state.head)
            this.signInfo.free()
            freeRetCArrRetRouterItem(this.routerMap)
        }
    }
}

func freeCArrModuleMetadata(cArr: CArrModuleMetadata) {
    if (cArr.head.isNotNull()) {
        unsafe {
            for (i in 0..cArr.size) {
                cArr.head.read(i).free()
            }
            LibC.free<RetModuleMetadata>(cArr.head)
        }
    }
}

func freeCArrRetHapModuleInfoV2(cArr: CArrRetHapModuleInfoV2) {
    if (cArr.head.isNotNull() && cArr.size != 0) {
        unsafe {
            for (i in 0..cArr.size) {
                cArr.head.read(i).free()
            }
            LibC.free<RetHapModuleInfoV2>(cArr.head)
        }
    }
}

func freeCArrRetReqPermissionDetail(cArr: CArrRetReqPermissionDetail) {
    if (cArr.head.isNotNull()) {
        unsafe {
            for (i in 0..cArr.size) {
                cArr.head.read(i).free()
            }
            LibC.free<RetReqPermissionDetail>(cArr.head)
        }
    }
}

func freeCArrRetAbilityInfoV2(cArr: CArrRetAbilityInfoV2) {
    if (cArr.head.isNotNull()) {
        unsafe {
            for (i in 0..cArr.size) {
                cArr.head.read(i).free()
            }
            LibC.free<RetAbilityInfoV2>(cArr.head)
        }
    }
}

func freeCArrRetExtensionAbilityInfoV2(cArr: CArrRetExtensionAbilityInfoV2) {
    if (cArr.head.isNotNull()) {
        unsafe {
            for (i in 0..cArr.size) {
                cArr.head.read(i).free()
            }
            LibC.free<RetExtensionAbilityInfoV2>(cArr.head)
        }
    }
}

func freeCArrRetPreloadItem(cArr: CArrRetPreloadItem) {
    if (cArr.head.isNotNull()) {
        unsafe {
            for (i in 0..cArr.size) {
                cArr.head.read(i).free()
            }
            LibC.free<RetPreloadItem>(cArr.head)
        }
    }
}

func freeCArrRetDependency(cArr: CArrRetDependency) {
    if (cArr.head.isNotNull()) {
        unsafe {
            for (i in 0..cArr.size) {
                cArr.head.read(i).free()
            }
            LibC.free<RetDependency>(cArr.head)
        }
    }
}



@C
protected struct RetDataItem {
    protected RetDataItem(
        let key: CString,
        let value: CString
    ) {}

    func free() {
        unsafe {
            LibC.free(this.key)
            LibC.free(this.value)
        }
    }
}

@C
protected struct CArrRetDataItem {
    protected CArrRetDataItem(
        let head: CPointer<RetDataItem>,
        let size: Int64
    ) {}
}

@C
protected struct RetRouterItem {
    protected RetRouterItem(
        let name: CString,
        let pageSourceFile: CString,
        let buildFunction: CString,
        let data: CArrRetDataItem,
        let customData: CString
    ) {}

    func free() {
        unsafe {
            LibC.free(this.name)
            LibC.free(this.pageSourceFile)
            LibC.free(this.buildFunction)
            freeRetCArrRetDataItem(this.data)
            LibC.free(this.customData)
        }
    }
}

@C
protected struct CArrRetRouterItem {
    protected CArrRetRouterItem(
        let head: CPointer<RetRouterItem>,
        let size: Int64
    ) {}
}

func freeRetCArrRetDataItem(cArr: CArrRetDataItem) {
    if (cArr.head.isNotNull()) {
        unsafe {
            for (i in 0..cArr.size) {
                cArr.head.read(i).free()
            }
            LibC.free<RetDataItem>(cArr.head)
        }
    }
}

func freeRetCArrRetRouterItem(cArr: CArrRetRouterItem) {
    if (cArr.head.isNotNull()) {
        unsafe {
            for (i in 0..cArr.size) {
                cArr.head.read(i).free()
            }
            LibC.free<RetRouterItem>(cArr.head)
        }
    }
}
