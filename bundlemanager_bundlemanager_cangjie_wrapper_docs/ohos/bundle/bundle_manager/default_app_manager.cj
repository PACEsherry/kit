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

import ohos.ffi.RetDataBool
import ohos.labels.APILevel
import ohos.business_exception.BusinessException

/**
 * The constant for application type.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.BundleManager.BundleFramework.DefaultApp"
]
public enum ApplicationType {
    /**
     * Default browser identifier.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.DefaultApp"
    ]
    Browser
    |
    /**
     * Default image identifier.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.DefaultApp"
    ]
    Image
    |
    /**
     * Default audio identifier.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.DefaultApp"
    ]
    Audio
    |
    /**
     * Default video identifier.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.DefaultApp"
    ]
    Video
    |
    /**
     * Default PDF identifier.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.DefaultApp"
    ]
    Pdf
    |
    /**
     * Default word identifier.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.DefaultApp"
    ]
    Word
    |
    /**
     * Default excel identifier.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.DefaultApp"
    ]
    Excel
    |
    /**
     * Default PPT identifier.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.DefaultApp"
    ]
    Ppt
    |
    /**
     * Default email identifier.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.DefaultApp"
    ]
    Email
    | ...

    /**
     * Get the application type value.
     *
     * @returns { String } Returns the string representation of the application type.
     */
    func getValue(): String {
        match (this) {
            case Browser => "Web Browser"
            case Image => "Image Gallery"
            case Audio => "Audio Player"
            case Video => "Video Player"
            case Pdf => "PDF Viewer"
            case Word => "Word Viewer"
            case Excel => "Excel Viewer"
            case Ppt => "PPT Viewer"
            case Email => "Email"
            case _ => throw BusinessException(17700101, "Bundle manager service exception.")
        }
    }
}

foreign func FfiBundleManagerIsDefaultApplication(appType: CString): RetDataBool

/**
 * Default application manager.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.BundleManager.BundleFramework.DefaultApp"
]
public class DefaultAppManager {
    protected init() {}
    /**
     * Query whether the caller is default application based on type.
     *
     * @param { ApplicationType } appType - Indicates the application type to query.
     * @returns { Bool } Returns true if the caller is the default application for the specified type; false otherwise.
     * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left
     * unspecified; 2. Incorrect parameter types.
     * @throws { BusinessException } 801 - Capability not supported.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.DefaultApp",
        throwexception: true,
        workerthread: true
    ]
    public static func isDefaultApplication(appType: ApplicationType): Bool {
        let cAppType = unsafe { LibC.mallocCString(appType.getValue()) }
        let cValue = unsafe { FfiBundleManagerIsDefaultApplication(cAppType) }
        unsafe { LibC.free(cAppType) }
        if (cValue.code != 0) {
            throw BusinessException(cValue.code, getErrorMsg(cValue.code))
        }
        return cValue.data
    }
}
