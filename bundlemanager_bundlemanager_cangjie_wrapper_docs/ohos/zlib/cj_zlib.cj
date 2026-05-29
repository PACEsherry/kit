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

import ohos.labels.APILevel
import ohos.ffi.{SUCCESS_CODE}
import ohos.business_exception.BusinessException
import std.deriving.Derive

foreign {
    func FfiBundleManagerCompressFile(inFile: CString, outFile: CString, options: RetOptions): Int32

    func FfiBundleManagerDeCompressFileOptions(inFile: CString, outFile: CString, options: RetOptions): Int32

    func FfiBundleManagerDeCompressFile(inFile: CString, outFile: CString): Int32
}

/**
 * CompressLevel
 */
@!APILevel[
    since: "24",
    syscap: "SystemCapability.BundleManager.Zlib"
]
public enum CompressLevel {
    /**
     * Indicates the no compression mode.
     */
    | @!APILevel[
        since: "24",
        syscap: "SystemCapability.BundleManager.Zlib"
    ]
    CompressLevelNoCompression

    /**
     * Indicates the best speed mode.
     */
    | @!APILevel[
        since: "24",
        syscap: "SystemCapability.BundleManager.Zlib"
    ]
    CompressLevelBestSpeed

    /**
     * Indicates the best compression mode.
     */
    | @!APILevel[
        since: "24",
        syscap: "SystemCapability.BundleManager.Zlib"
    ]
    CompressLevelBestCompression

    /**
     * Indicates the default compression mode.
     */
    | @!APILevel[
        since: "24",
        syscap: "SystemCapability.BundleManager.Zlib"
    ]
    CompressLevelDefaultCompression
    | ...

    func getValue(): Int32 {
        match (this) {
            case CompressLevelNoCompression => 0
            case CompressLevelBestSpeed => 1
            case CompressLevelBestCompression => 9
            case CompressLevelDefaultCompression => -1
            case _ => throw BusinessException(ERR_ZLIB_DATA_ERR, getErrorMsg(ERR_ZLIB_DATA_ERR))
        }
    }
}

/**
 * MemLevel
 */
@!APILevel[
    since: "24",
    syscap: "SystemCapability.BundleManager.Zlib"
]
public enum MemLevel {
    /**
     * Uses the least amount of memory.
     */
    | @!APILevel[
        since: "24",
        syscap: "SystemCapability.BundleManager.Zlib"
    ]
    MemLevelMin

    /**
     * Uses the default amount of memory.
     */
    | @!APILevel[
        since: "24",
        syscap: "SystemCapability.BundleManager.Zlib"
    ]
    MemLevelDefault

    /**
     * Uses the maximum amount of memory.
     */
    | @!APILevel[
        since: "24",
        syscap: "SystemCapability.BundleManager.Zlib"
    ]
    MemLevelMax
    | ...

    func getValue(): Int32 {
        match (this) {
            case MemLevelMin => 1
            case MemLevelDefault => 8
            case MemLevelMax => 9
            case _ => throw BusinessException(ERR_ZLIB_DATA_ERR, getErrorMsg(ERR_ZLIB_DATA_ERR))
        }
    }
}

/**
 * CompressStrategy
 */
@!APILevel[
    since: "24",
    syscap: "SystemCapability.BundleManager.Zlib"
]
public enum CompressStrategy {
    /**
     * Indicates the default strategy.
     */
    | @!APILevel[
        since: "24",
        syscap: "SystemCapability.BundleManager.Zlib"
    ]
    CompressStrategyDefaultStrategy

    /**
     * Indicates the filtered strategy.
     */
    | @!APILevel[
        since: "24",
        syscap: "SystemCapability.BundleManager.Zlib"
    ]
    CompressStrategyFiltered

    /**
     * Indicates the huffman-only strategy.
     */
    | @!APILevel[
        since: "24",
        syscap: "SystemCapability.BundleManager.Zlib"
    ]
    CompressStrategyHuffmanOnly

    /**
     * Indicates the RLE strategy.
     */
    | @!APILevel[
        since: "24",
        syscap: "SystemCapability.BundleManager.Zlib"
    ]
    CompressStrategyRle

    /**
     * Indicates the fixed strategy.
     */
    | @!APILevel[
        since: "24",
        syscap: "SystemCapability.BundleManager.Zlib"
    ]
    CompressStrategyFixed
    | ...

    func getValue(): Int32 {
        match (this) {
            case CompressStrategyDefaultStrategy => 0
            case CompressStrategyFiltered => 1
            case CompressStrategyHuffmanOnly => 2
            case CompressStrategyRle => 3
            case CompressStrategyFixed => 4
            case _ => throw BusinessException(ERR_ZLIB_DATA_ERR, getErrorMsg(ERR_ZLIB_DATA_ERR))
        }
    }
}

/**
 * Compress the specified file.
 *
 * @param { String } inFile - Indicates the path of the file to be compressed.
 * @param { String } outFile - Indicates the path of the output compressed file.
 * @param { Options } options - Indicates the options of compressing file.
 * @throws { BusinessException } 900001 - The input source file is invalid.
 * @throws { BusinessException } 900002 - The input destination file is invalid.
 */
@!APILevel[
    since: "24",
    syscap: "SystemCapability.BundleManager.Zlib",
    throwexception: true,
    workerthread: true
]
public func compressFile(inFile: String, outFile: String, options: Options): Unit {
    unsafe {
        try (
            cInFile = LibC.mallocCString(inFile).asResource(),
            cOutFile = LibC.mallocCString(outFile).asResource()
        ) {
            let cOptions = RetOptions(options)
            let code = FfiBundleManagerCompressFile(cInFile.value, cOutFile.value, cOptions)

            if (code != SUCCESS_CODE) {
                throw BusinessException(code, getErrorMsg(code))
            }
        }
    }
}

/**
 * Decompress the specified file.
 *
 * @param { String } inFile - Indicates the path of the file to be decompressed.
 * @param { String } outFile - Indicates the path of the output decompressed file.
 * @param { Options } [ options ] - Indicates the options of decompressing file.
 * @throws { BusinessException } 900001 - The input source file is invalid.
 * @throws { BusinessException } 900002 - The input destination file is invalid.
 * @throws { BusinessException } 900003 - The input source file is not in ZIP format or is damaged.
 */
@!APILevel[
    since: "24",
    syscap: "SystemCapability.BundleManager.Zlib",
    throwexception: true,
    workerthread: true
]
public func decompressFile(inFile: String, outFile: String, options!: Options = Options()): Unit {
    unsafe {
        try (
            cInFile = LibC.mallocCString(inFile).asResource(),
            cOutFile = LibC.mallocCString(outFile).asResource()
        ) {
            let cOptions = RetOptions(options)
            let code = FfiBundleManagerDeCompressFileOptions(cInFile.value, cOutFile.value, cOptions)
            if (code != SUCCESS_CODE) {
                throw BusinessException(code, getErrorMsg(code))
            }
        }
    }
}