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

public import ohos.skill.*
public import ohos.metadata.*
public import ohos.element_name.*
import ohos.ffi.{CArrString, CArrI32}
import std.collection.ArrayList

const BASE_USER_RANGE = 200000i32
const GET_BUNDLE_INFO = "GetBundleInfo"

func readArrHapModuleInfo(cArr: CArrRetHapModuleInfoV2): Array<HapModuleInfo> {
    let result = ArrayList<HapModuleInfo>()
    if (cArr.head.isNotNull()) {
        for (i in 0..cArr.size) {
            unsafe { result.add(HapModuleInfo(cArr.head.read(i))) }
        }
    }
    return result.toArray()
}

func readReqPermissionDetail(cArr: CArrRetReqPermissionDetail): Array<ReqPermissionDetail> {
    let result = ArrayList<ReqPermissionDetail>()
    if (cArr.head.isNotNull()) {
        for (i in 0..cArr.size) {
            unsafe { result.add(ReqPermissionDetail(cArr.head.read(i))) }
        }
    }
    return result.toArray()
}

func readPermissionGrantState(cArr: CArrI32): Array<PermissionGrantState> {
    let result = ArrayList<PermissionGrantState>()
    if (cArr.head.isNotNull()) {
        for (i in 0..cArr.size) {
            unsafe { result.add(PermissionGrantState.parse(cArr.head.read(i))) }
        }
    }
    return result.toArray()
}

func readArrStr(cArr: CArrString): Array<String> {
    let result = ArrayList<String>()
    if (cArr.head.isNotNull()) {
        for (i in 0..cArr.size) {
            unsafe { result.add(cArr.head.read(i).toString()) }
        }
    }
    return result.toArray()
}

func readArrModuleMetadata(cArr: CArrModuleMetadata): Array<ModuleMetadata> {
    let result = ArrayList<ModuleMetadata>()
    if (cArr.head.isNotNull()) {
        for (i in 0..cArr.size) {
            unsafe { result.add(ModuleMetadata(cArr.head.read(i))) }
        }
    }
    return result.toArray()
}

func readArrInt32(cArr: CArrI32): Array<SupportedWindowMode> {
    let result = ArrayList<SupportedWindowMode>()
    if (cArr.head.isNotNull()) {
        for (i in 0..cArr.size) {
            unsafe { result.add(SupportedWindowMode.parse(cArr.head.read(i))) }
        }
    }
    return result.toArray()
}

func readArrAbilityInfo(cArr: CArrRetAbilityInfoV2): Array<AbilityInfo> {
    let result = ArrayList<AbilityInfo>()
    if (cArr.head.isNotNull()) {
        for (i in 0..cArr.size) {
            unsafe { result.add(AbilityInfo(cArr.head.read(i))) }
        }
    }
    return result.toArray()
}

func readArrExtensionAbilityInfo(cArr: CArrRetExtensionAbilityInfoV2): Array<ExtensionAbilityInfo> {
    let result = ArrayList<ExtensionAbilityInfo>()
    if (cArr.head.isNotNull()) {
        for (i in 0..cArr.size) {
            unsafe { result.add(ExtensionAbilityInfo(cArr.head.read(i))) }
        }
    }
    return result.toArray()
}

func readArrPreloadItem(cArr: CArrRetPreloadItem): Array<PreloadItem> {
    let result = ArrayList<PreloadItem>()
    if (cArr.head.isNotNull()) {
        for (i in 0..cArr.size) {
            unsafe { result.add(PreloadItem(cArr.head.read(i))) }
        }
    }
    return result.toArray()
}

func readArrDependency(cArr: CArrRetDependency): Array<Dependency> {
    let result = ArrayList<Dependency>()
    if (cArr.head.isNotNull()) {
        for (i in 0..cArr.size) {
            unsafe { result.add(Dependency(cArr.head.read(i))) }
        }
    }
    return result.toArray()
}

func readArrDataItem(cArr: CArrRetDataItem): Array<DataItem> {
    let result = ArrayList<DataItem>()
    if (cArr.head.isNotNull()) {
        for (i in 0..cArr.size) {
            unsafe { result.add(DataItem(cArr.head.read(i))) }
        }
    }
    return result.toArray()
}

func readArrRouterItem(cArr: CArrRetRouterItem): Array<RouterItem> {
    let result = ArrayList<RouterItem>()
    if (cArr.head.isNotNull()) {
        for (i in 0..cArr.size) {
            unsafe { result.add(RouterItem(cArr.head.read(i))) }
        }
    }
    return result.toArray()
}

struct BMQuery <: Equatable<BMQuery> & Hashable {
    private static const UNSPECIFIED_USERID = -2i32
    var nBundleName: String
    var nInterfaceType: String
    var nFlags: Int32
    var nUserId: Int32

    init(bundleName: String, interfaceType: String, flags: Int32, userId!: Int32 = UNSPECIFIED_USERID) {
        this.nBundleName = bundleName
        this.nInterfaceType = interfaceType
        this.nFlags = flags
        this.nUserId = userId
    }

    public operator override func ==(query: BMQuery): Bool {
        return nBundleName == query.nBundleName && nInterfaceType == query.nInterfaceType && nFlags == query.nFlags &&
            nUserId == query.nUserId
    }

    public operator override func !=(other: BMQuery): Bool {
        !(this == other)
    }

    @OverflowWrapping
    public override func hashCode(): Int64 {
        this.nBundleName.hashCode() ^ this.nInterfaceType.hashCode() ^ this.nFlags.hashCode() ^ this.nUserId.hashCode()
    }
}
