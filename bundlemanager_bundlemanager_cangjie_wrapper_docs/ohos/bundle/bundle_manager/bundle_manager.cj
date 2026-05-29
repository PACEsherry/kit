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

import ohos.ffi.{CArrString, RetDataCArrString, SUCCESS_CODE}
import ohos.business_exception.BusinessException
import std.sync.Mutex
import ohos.labels.APILevel
import std.collection.HashMap

foreign {
    func FfiOHOSGetCallingUid(): Int32

    func FfiOHOSGetBundleInfoForSelfV2(bundleFlags: Int32): RetBundleInfoV2

    func FfiOHOSVerifyAbc(abcPaths: CArrString, deleteOriginalFiles: Bool): Int32

    func FfiGetProfileByExtensionAbility(moduleName: CString, extensionAbilityName: CString, metadataName: CString): RetDataCArrString

    func FfiGetProfileByAbility(moduleName: CString, extensionAbilityName: CString, metadataName: CString): RetDataCArrString

    func FfiBundleManagerCanOpenLink(cLink: CString, code: CPointer<Int32>): Bool

    func FfiOHOSGetBundleInfo(cBundleName: CString, bundleFlags: Int32, userId: Int32, errorCode: CPointer<Int32>): RetBundleInfoV2

    func FfiOHOSFreeRetBundleInfoV2(ret: CPointer<RetBundleInfoV2>): Unit

    func FfiOHOSGetBundleNameByUid(userId: Int32, errorCode: CPointer<Int32>): CString

    func FfiOHOSFreeCString(retCString: CString): Unit
}

var cache = HashMap<BMQuery, BundleInfo>()
let MTX = Mutex()

func checkToCache(uid: Int32, callingUid: Int32, query: BMQuery, bundleInfo: BundleInfo): Unit {
    if (uid != callingUid) {
        return
    }
    synchronized(MTX) {
        cache[query] = bundleInfo
    }
}

/**
 * This module is used to obtain package information of various applications installed on the current device.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.BundleManager.BundleFramework.Core"
]
public class BundleManager {
    protected init() {}
    /**
     * Obtains own bundleInfo.
     *
     * @param { Int32 } bundleFlags - Indicates the flag used to specify information contained in the BundleInfo
     * objects that will be returned.
     * @returns { BundleInfo } The result of getting the bundle info.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core",
        workerthread: true
    ]
    public static func getBundleInfoForSelf(bundleFlags: Int32): BundleInfo {
        let uid = unsafe { FfiOHOSGetCallingUid() }
        let bundleName: String = uid.toString()
        let userId = uid / BASE_USER_RANGE
        var info: BundleInfo
        let query = BMQuery(bundleName, GET_BUNDLE_INFO, bundleFlags, userId: userId)
        synchronized(MTX) {
            if (cache.contains(query)) {
                info = cache[BMQuery(bundleName, GET_BUNDLE_INFO, bundleFlags, userId: userId)]
            } else {
                let ret = unsafe { FfiOHOSGetBundleInfoForSelfV2(bundleFlags) }
                info = BundleInfo(ret)
                unsafe { ret.free() }
                checkToCache(info.uid, unsafe { FfiOHOSGetCallingUid() }, query, info)
            }
        }
        return info
    }

    /**
     * Obtains the profile designated by metadata name, abilityName and moduleName from the current application.
     *
     * @param { String } moduleName - Indicates the moduleName of the application.
     * @param { String } abilityName - Indicates the abilityName of the application.
     * @param { String } [metadataName] - Indicates the name of metadata in ability.
     * @returns { Array<String> } Returns string in json-format of the corresponding config file.
     * @throws { BusinessException } 17700002 - The specified moduleName is not existed.
     * @throws { BusinessException } 17700003 - The specified abilityName is not existed.
     * @throws { BusinessException } 17700024 - Failed to get the profile because there is no profile in the HAP.
     * @throws { BusinessException } 17700029 - The specified ability is disabled.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core",
        throwexception: true,
        workerthread: true
    ]
    public static func getProfileByAbility(moduleName: String, abilityName: String, metadataName!: String = ""): Array<String> {
        unsafe {
            var res: Array<String> = []
            try (
                cModuleName = LibC.mallocCString(moduleName).asResource(),
                cAbilityName = LibC.mallocCString(abilityName).asResource(),
                cMetadataName = LibC.mallocCString(metadataName).asResource()
            ) {
                let cValue: RetDataCArrString = FfiGetProfileByAbility(cModuleName.value, cAbilityName.value,
                    cMetadataName.value)
                if (cValue.code != 0) {
                    throw BusinessException(cValue.code, getErrorMsg(cValue.code))
                }
                res = readArrStr(cValue.data)
                cValue.data.free()
            }
            return res
        }
    }

    /**
     * Check whether the link can be opened.
     *
     * @param { String } link - Indicates the link to be opened.
     * @returns { Bool } Returns true if the link can be opened; returns false otherwise.
     * @throws { BusinessException } 17700055 - The specified link is invalid.
     * @throws { BusinessException } 17700056 - The scheme of the specified link is not in the querySchemes.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core",
        throwexception: true
    ]
    public static func canOpenLink(link: String): Bool {
        unsafe {
            let cLink = LibC.mallocCString(link)
            var code = 0i32
            let ret = FfiBundleManagerCanOpenLink(cLink, inout code)
            LibC.free(cLink)
            if (code != SUCCESS_CODE) {
                throw BusinessException(code, getErrorMsg(code))
            }
            return ret
        }
    }
}
