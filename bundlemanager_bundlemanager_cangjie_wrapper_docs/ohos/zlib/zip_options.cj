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

/**
 * Defines compress or decompress options.
 */
@!APILevel[
    since: "24",
    syscap: "SystemCapability.BundleManager.Zlib"
]
public class Options {
    /**
     * Indicates the compress level.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.BundleManager.Zlib"
    ]
    public var level: CompressLevel

    /**
     * Indicates the memory level.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.BundleManager.Zlib"
    ]
    public var memLevel: MemLevel

    /**
     * Indicates the compress strategy.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.BundleManager.Zlib"
    ]
    public var strategy: CompressStrategy

    /**
    * VibratePreset constructor.
    *
    * @param { CompressLevel } [ level ] - Indicates the compress level. The default value
    * is CompressLevelDefaultCompression.
    * @param { MemLevel } [ memLevel ] - Indicates the memory level. The default value is MemLevelDefault.
    * @param { CompressStrategy } [ strategy ] - Indicates the compress strategy. The default value
    * is CompressStrategyDefaultStrategy.
    */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.BundleManager.Zlib"
    ]
    public init(level!: CompressLevel = CompressLevelDefaultCompression, memLevel!: MemLevel = MemLevelDefault,
        strategy!: CompressStrategy = CompressStrategyDefaultStrategy) {
        this.level = level
        this.memLevel = memLevel
        this.strategy = strategy
    }
}

@C
struct RetOptions {
    let level: Int32
    let memLevel: Int32
    let strategy: Int32

    init(options: Options) {
        this.level = options.level.getValue()
        this.memLevel = options.memLevel.getValue()
        this.strategy = options.strategy.getValue()
    }
}
