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

import std.collection.HashMap
import ohos.business_exception.{BusinessException, getUniversalErrorMsg, ERR_PARAMETER_ERROR}

const ERR_MSG_BUNDLE_NOT_EXIST: String = "The specified bundle is not found."
const ERR_MSG_MODULE_NOT_EXIST: String = "The specified module is not found."
const ERR_MSG_ABILITY_NOT_EXIST: String = "The specified ability is not found."
const ERR_MSG_INVALID_USER_ID: String = "The specified user id is not found."
const ERR_MSG_APPID_NOT_EXIST: String = "The specified appId is empty string."
const ERR_MSG_PERMISSION_NOT_EXIST: String = "The specified permission is not found."
const ERR_MSG_DEVICE_ID_NOT_EXIST: String = "The specified deviceId is not found."
const ERR_MSG_INSTALL_PARSE_FAILED: String = "Failed to install the hap since the hap fails to be parsed."
const ERR_MSG_INSTALL_VERIFY_SIGNATURE_FAILED: String = "Failed to install the hap since the hap signature fails to be verified."
const ERR_MSG_INSTALL_HAP_FILEPATH_INVALID: String = "Failed to install the hap since the path of the hap is invalid or too large size."
const ERR_MSG_INSTALL_MULTIPLE_HAP_INFO_INCONSISTENT: String = "Failed to install haps since the configuration information of multi haps is inconsistent."
const ERR_MSG_INSTALL_NO_DISK_SPACE_LEFT: String = "Failed to install the hap since the system disk space is insufficient."
const ERR_MSG_INSTALL_VERSION_DOWNGRADE: String = "Failed to install the hap since the version of the newly installed hap is too early."
const ERR_MSG_INSTALL_DEPENDENT_MODULE_NOT_EXIST: String = "Failed to install because the dependent module does not exist."
const ERR_MSG_INSTALL_SHARE_APP_LIBRARY_NOT_ALLOWED: String = "Failed to install because not allowed to share app library"
const ERR_MSG_UNINSTALL_PREINSTALL_APP_FAILED: String = "The preinstalled app cannot be uninstalled."
const ERR_MSG_BUNDLE_SERVICE_EXCEPTION: String = "Bundle manager service exception."
const ERROR_MSG_BUNDLE_IS_DISABLED: String = "The specified bundle is disabled."
const ERROR_MSG_ABILITY_IS_DISABLED: String = "The specified ability is disabled."
const ERROR_MSG_PROFILE_NOT_EXIST: String = "The specified profile is not found in the HAP."
const ERROR_INVALID_UID_MSG: String = "The specified uid is invalid."
const ERROR_INVALID_HAP_PATH_MSG: String = "The input source file is invalid."
const ERROR_DEFAULT_APP_NOT_EXIST_MSG: String = "The specified default app does not exist."
const ERROR_INVALID_TYPE_MSG: String = "The specified type is invalid."
const ERROR_MSG_DISTRIBUTED_SERVICE_NOT_RUNNING: String = "The distributed service is not running."
const ERROR_ABILITY_AND_TYPE_MISMATCH_MSG: String = "The specified ability and type do not match."
const ERROR_MSG_CLEAR_CACHE_FILES_UNSUPPORTED: String = "The specified bundle does not support clearing cache files."
const ERROR_MSG_INSTALL_HAP_OVERLAY_CHECK_FAILED: String = "Failed to install the HAP because the overlay check of the HAP is failed"
const ERROR_MSG_SPECIFIED_BUNDLE_NOT_OVERLAY_BUNDLE: String = "The specified bundleName is not overlay bundle."
const ERROR_MSG_SPECIFIED_MODULE_NOT_OVERLAY_MODULE: String = "The specified moduleName is not overlay module."
const ERROR_MSG_SPECIFIED_MODULE_IS_OVERLAY_MODULE: String = "The specified moduleName is overlay module."
const ERROR_MSG_SPECIFIED_BUNDLE_IS_OVERLAY_BUNDLE: String = "The specified bundle is overlay bundle."
const ERROR_MSG_SHARE_APP_LIBRARY_IS_RELIED: String = "The specified shared library is dependened."
const ERROR_MSG_SHARE_APP_LIBRARY_IS_NOT_EXIST: String = "The specified shared library is not exist"
const ERR_MSG_UNINSTALL_SHARED_LIBRARY: String = "The specified bundle is shared library"
const ERR_MSG_DISALLOW_INSTALL: String = "Failed to install because enterprise device management disallow install"
const ERR_MSG_WRONG_PROXY_DATA_URI: String = "The uri in data proxy is wrong"
const ERR_MSG_WRONG_PROXY_DATA_PERMISSION: String = "The apl of required permission in non-system data proxy should be system_basic or system_core"
const ERR_MSG_WRONG_MODE_ISOLATION: String = "Failed to install the HAP because the isolationMode configured is not supported"
const ERR_MSG_DISALLOW_UNINSTALL: String = "Failed to uninstall because enterprise device management disallow uninstall"
const ERR_MSG_ALREADY_EXIST: String = "Failed to install the HAP because the VersionCode to be updated is not greater than the current VersionCode"
const ERR_MSG_CODE_SIGNATURE_FAILED: String = "The specified code-signature file or corresponding module are incorrect."
const ERR_MSG_SELF_UPDATE_NOT_MDM: String = "Failed to install the HAP because the distribution type of caller application is not enterprise_mdm."
const ERR_MSG_SELF_UPDATE_BUNDLENAME_NOT_SAME: String = "Failed to install the HAP because the bundleName is different from the bundleName of the caller application."
const ERR_MSG_ENTERPRISE_BUNDLE_NOT_ALLOWED: String = "Failed to install the HAP because enterprise normal/mdm bundle cannot be installed on non-enterprise device."
const ERR_MSG_DEBUG_BUNDLE_NOT_ALLOWED: String = "Failed to install the HAP because debug bundle cannot be installed under non-developer mode."
const ERR_MSG_ERROR_VERIFY_ABC: String = "Failed to verify abc."
const ERR_MSG_ERROR_DELETE_ABC: String = "Failed to delete abc."
const ERROR_MSG_NOT_APP_GALLERY_CALL: String = "Not app gallery call."
const ERROR_MSG_INVALID_LINK: String = "The specified link is invalid."
const ERROR_MSG_SCHEME_NOT_IN_QUERYSCHEMES: String = "The scheme of the specified link is not in the querySchemes."
let ERROR_CODE_MAP: HashMap<Int32, String> = HashMap<Int32, String>(
    [
        (ERROR_BUNDLE_NOT_EXIST, ERR_MSG_BUNDLE_NOT_EXIST),
        (ERROR_MODULE_NOT_EXIST, ERR_MSG_MODULE_NOT_EXIST),
        (ERROR_ABILITY_NOT_EXIST, ERR_MSG_ABILITY_NOT_EXIST),
        (ERROR_INVALID_USER_ID, ERR_MSG_INVALID_USER_ID),
        (ERROR_INVALID_APPID, ERR_MSG_APPID_NOT_EXIST),
        (ERROR_PERMISSION_NOT_EXIST, ERR_MSG_PERMISSION_NOT_EXIST),
        (ERROR_DEVICE_ID_NOT_EXIST, ERR_MSG_DEVICE_ID_NOT_EXIST),
        (ERROR_INSTALL_PARSE_FAILED, ERR_MSG_INSTALL_PARSE_FAILED),
        (ERROR_INSTALL_VERIFY_SIGNATURE_FAILED, ERR_MSG_INSTALL_VERIFY_SIGNATURE_FAILED),
        (ERROR_INSTALL_HAP_FILEPATH_INVALID, ERR_MSG_INSTALL_HAP_FILEPATH_INVALID),
        (ERROR_INSTALL_MULTIPLE_HAP_INFO_INCONSISTENT, ERR_MSG_INSTALL_MULTIPLE_HAP_INFO_INCONSISTENT),
        (ERROR_INSTALL_NO_DISK_SPACE_LEFT, ERR_MSG_INSTALL_NO_DISK_SPACE_LEFT),
        (ERROR_INSTALL_VERSION_DOWNGRADE, ERR_MSG_INSTALL_VERSION_DOWNGRADE),
        (ERROR_INSTALL_DEPENDENT_MODULE_NOT_EXIST, ERR_MSG_INSTALL_DEPENDENT_MODULE_NOT_EXIST),
        (ERROR_INSTALL_SHARE_APP_LIBRARY_NOT_ALLOWED, ERR_MSG_INSTALL_SHARE_APP_LIBRARY_NOT_ALLOWED),
        (ERROR_UNINSTALL_PREINSTALL_APP_FAILED, ERR_MSG_UNINSTALL_PREINSTALL_APP_FAILED),
        (ERROR_BUNDLE_SERVICE_EXCEPTION, ERR_MSG_BUNDLE_SERVICE_EXCEPTION),
        (ERROR_BUNDLE_IS_DISABLED, ERROR_MSG_BUNDLE_IS_DISABLED),
        (ERROR_ABILITY_IS_DISABLED, ERROR_MSG_ABILITY_IS_DISABLED),
        (ERROR_PROFILE_NOT_EXIST, ERROR_MSG_PROFILE_NOT_EXIST),
        (ERROR_INVALID_UID, ERROR_INVALID_UID_MSG),
        (ERROR_INVALID_HAP_PATH, ERROR_INVALID_HAP_PATH_MSG),
        (ERROR_DEFAULT_APP_NOT_EXIST, ERROR_DEFAULT_APP_NOT_EXIST_MSG),
        (ERROR_INVALID_TYPE, ERROR_INVALID_TYPE_MSG),
        (ERROR_DISTRIBUTED_SERVICE_NOT_RUNNING, ERROR_MSG_DISTRIBUTED_SERVICE_NOT_RUNNING),
        (ERROR_ABILITY_AND_TYPE_MISMATCH, ERROR_ABILITY_AND_TYPE_MISMATCH_MSG),
        (ERROR_CLEAR_CACHE_FILES_UNSUPPORTED, ERROR_MSG_CLEAR_CACHE_FILES_UNSUPPORTED),
        (ERROR_INSTALL_HAP_OVERLAY_CHECK_FAILED, ERROR_MSG_INSTALL_HAP_OVERLAY_CHECK_FAILED),
        (ERROR_SPECIFIED_MODULE_NOT_OVERLAY_MODULE, ERROR_MSG_SPECIFIED_MODULE_NOT_OVERLAY_MODULE),
        (ERROR_SPECIFIED_BUNDLE_NOT_OVERLAY_BUNDLE, ERROR_MSG_SPECIFIED_BUNDLE_NOT_OVERLAY_BUNDLE),
        (ERROR_SPECIFIED_MODULE_IS_OVERLAY_MODULE, ERROR_MSG_SPECIFIED_MODULE_IS_OVERLAY_MODULE),
        (ERROR_SPECIFIED_BUNDLE_IS_OVERLAY_BUNDLE, ERROR_MSG_SPECIFIED_BUNDLE_IS_OVERLAY_BUNDLE),
        (ERROR_UNINSTALL_SHARE_APP_LIBRARY_IS_RELIED, ERROR_MSG_SHARE_APP_LIBRARY_IS_RELIED),
        (ERROR_UNINSTALL_SHARE_APP_LIBRARY_IS_NOT_EXIST, ERROR_MSG_SHARE_APP_LIBRARY_IS_NOT_EXIST),
        (ERROR_UNINSTALL_BUNDLE_IS_SHARED_BUNDLE, ERR_MSG_UNINSTALL_SHARED_LIBRARY),
        (ERROR_DISALLOW_INSTALL, ERR_MSG_DISALLOW_INSTALL),
        (ERROR_INSTALL_WRONG_DATA_PROXY_URI, ERR_MSG_WRONG_PROXY_DATA_URI),
        (ERROR_INSTALL_WRONG_DATA_PROXY_PERMISSION, ERR_MSG_WRONG_PROXY_DATA_PERMISSION),
        (ERROR_INSTALL_WRONG_MODE_ISOLATION, ERR_MSG_WRONG_MODE_ISOLATION),
        (ERROR_DISALLOW_UNINSTALL, ERR_MSG_DISALLOW_UNINSTALL),
        (ERROR_INSTALL_ALREADY_EXIST, ERR_MSG_ALREADY_EXIST),
        (ERROR_INSTALL_CODE_SIGNATURE_FAILED, ERR_MSG_CODE_SIGNATURE_FAILED),
        (ERROR_INSTALL_SELF_UPDATE_NOT_MDM, ERR_MSG_SELF_UPDATE_NOT_MDM),
        (ERROR_INSTALL_SELF_UPDATE_BUNDLENAME_NOT_SAME, ERR_MSG_SELF_UPDATE_BUNDLENAME_NOT_SAME),
        (ERROR_INSTALL_ENTERPRISE_BUNDLE_NOT_ALLOWED, ERR_MSG_ENTERPRISE_BUNDLE_NOT_ALLOWED),
        (ERROR_INSTALL_DEBUG_BUNDLE_NOT_ALLOWED, ERR_MSG_DEBUG_BUNDLE_NOT_ALLOWED),
        (ERROR_VERIFY_ABC, ERR_MSG_ERROR_VERIFY_ABC),
        (ERROR_NOT_APP_GALLERY_CALL, ERROR_MSG_NOT_APP_GALLERY_CALL),
        (ERROR_DELETE_ABC, ERR_MSG_ERROR_DELETE_ABC),
        (ERROR_INVALID_LINK, ERROR_MSG_INVALID_LINK),
        (ERROR_SCHEME_NOT_IN_QUERYSCHEMES, ERROR_MSG_SCHEME_NOT_IN_QUERYSCHEMES)
    ]
)

func getErrorMsg(code: Int32): String {
    if (let Some(v) <- getUniversalErrorMsg(code)) {
        return v
    } else if (ERROR_CODE_MAP.contains(code)) {
        return ERROR_CODE_MAP[code]
    } else {
        return "Unknown error code ${code}"
    }
}

func checkCodeAndThrow(code: Int32): Unit {
    if (code != 0) {
        throw BusinessException(code, getErrorMsg(code))
    }
}
