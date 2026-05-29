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

package ohos.zlib

import ohos.hilog.HilogChannel
import std.collection.HashMap
import ohos.business_exception.{BusinessException, getUniversalErrorMsg}

let ZlibLog = HilogChannel(0, 0xD001100, "CJ-BundleMgrService")
const SUCCESS_CODE: Int32 = 0

// zlib errCode
const ERR_ZLIB_SRC_FILE_INVALID: Int32 = 900001
const ERR_ZLIB_DEST_FILE_INVALID: Int32 = 900002
const ERR_ZLIB_SRC_FILE_FORMAT_ERROR_OR_DAMAGED: Int32 = 900003
const ERR_ZLIB_NO_SUCH_FILE_OR_ACCESS_MODE_ERR: Int32 = 17800002
const ERR_ZLIB_ZSTREAM_ERR: Int32 = 17800004
const ERR_ZLIB_DATA_ERR: Int32 = 17800005
const ERR_ZLIB_MEMORY_ALLOC_FAILED: Int32 = 17800006
const ERR_ZLIB_BUFFER_ERR: Int32 = 17800007
const ERR_INTERNAL_STRUCT_ERR: Int32 = 17800009
const ERR_ZLIB_SRC_FILE_INVALID_MSG: String = "The Input source file is invalid."
const ERR_ZLIB_DEST_FILE_INVALID_MSG: String = "The Input destination file is invalid."
const ERR_ZLIB_SRC_FILE_FORMAT_ERROR_OR_DAMAGED_MSG: String = "The input source file is not ZIP format or damaged."
const ERR_ZLIB_NO_SUCH_FILE_OR_ACCESS_MODE_ERR_MSG: String = "No such file or access mode error."
const ERR_ZLIB_ZSTREAM_ERR_MSG: String = "ZStream error."
const ERR_ZLIB_DATA_ERR_MSG: String = "Data error."
const ERR_ZLIB_MEMORY_ALLOC_FAILED_MSG: String = "Memory allocation failed."
const ERR_ZLIB_BUFFER_ERR_MSG: String = "Buffer error."
const ERR_INTERNAL_STRUCT_ERR_MSG: String = "Internal structure error."
let ERROR_CODE_MAP: HashMap<Int32, String> = HashMap<Int32, String>(
    [
        (ERR_ZLIB_SRC_FILE_INVALID, ERR_ZLIB_SRC_FILE_INVALID_MSG),
        (ERR_ZLIB_DEST_FILE_INVALID, ERR_ZLIB_DEST_FILE_INVALID_MSG),
        (ERR_ZLIB_SRC_FILE_FORMAT_ERROR_OR_DAMAGED, ERR_ZLIB_SRC_FILE_FORMAT_ERROR_OR_DAMAGED_MSG),
        (ERR_ZLIB_NO_SUCH_FILE_OR_ACCESS_MODE_ERR, ERR_ZLIB_NO_SUCH_FILE_OR_ACCESS_MODE_ERR_MSG),
        (ERR_ZLIB_ZSTREAM_ERR, ERR_ZLIB_ZSTREAM_ERR_MSG),
        (ERR_ZLIB_DATA_ERR, ERR_ZLIB_DATA_ERR_MSG),
        (ERR_ZLIB_MEMORY_ALLOC_FAILED, ERR_ZLIB_MEMORY_ALLOC_FAILED_MSG),
        (ERR_ZLIB_BUFFER_ERR, ERR_ZLIB_BUFFER_ERR_MSG),
        (ERR_INTERNAL_STRUCT_ERR, ERR_INTERNAL_STRUCT_ERR_MSG)
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

func checkAndThrow(code: Int32): Unit {
    if (code == SUCCESS_CODE) {
        return
    }
    throw BusinessException(code, getErrorMsg(code))
}
