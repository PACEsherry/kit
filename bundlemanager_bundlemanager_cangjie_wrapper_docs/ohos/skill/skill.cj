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

package ohos.skill

import std.convert.Parsable
import ohos.labels.APILevel

/**
 * Obtains configuration information about an skill.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.BundleManager.BundleFramework.Core"
]
public class Skill {
    /**
     * Indicates the actions of the skill.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let actions: Array<String>
    /**
     * Indicates the entities of the skill.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let entities: Array<String>
    /**
     * Indicates the uris of the skill.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let uris: Array<SkillUri>
    /**
     * Indicates the domainVerify of the skill.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let domainVerify: Bool

    init(ret: RetSkill) {
        this.actions = readArrStr(ret.actions)
        this.entities = readArrStr(ret.entities)
        this.uris = readArrSkillUri(ret.uris)
        this.domainVerify = ret.domainVerify
    }
}

/**
 * Obtains configuration information about an skillUri.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.BundleManager.BundleFramework.Core"
]
public class SkillUri {
    /**
     * Indicates the scheme of the skillUri.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let scheme: String
    /**
     * Indicates the host of the skillUri.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let host: String
    /**
     * Indicates the port of the skillUri.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let port: Int32
    /**
     * Indicates the path of the skillUri.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let path: String
    /**
     * Indicates the pathStartWith of the skillUri.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let pathStartWith: String
    /**
     * Indicates the pathRegex of the skillUri.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let pathRegex: String
    /**
     * Indicates the type of the skillUri.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let uriType: String
    /**
     * Indicates the utd of the skillUri.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let utd: String
    /**
     * Indicates the maxFileSupported of the skillUri.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let maxFilesSupported: Int32
    /**
     * Indicates the linkFeature of the skillUri.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let linkFeature: String

    init(ret: RetSkillUri) {
        this.scheme = ret.scheme.toString()
        this.host = ret.host.toString()
        this.port = Int32.tryParse(ret.port.toString()) ?? 0
        this.path = ret.path.toString()
        this.pathStartWith = ret.pathStartWith.toString()
        this.pathRegex = ret.pathRegex.toString()
        this.uriType = ret.uriType.toString()
        this.utd = ret.utd.toString()
        this.maxFilesSupported = ret.maxFileSupported
        this.linkFeature = ret.linkFeature.toString()
    }
}