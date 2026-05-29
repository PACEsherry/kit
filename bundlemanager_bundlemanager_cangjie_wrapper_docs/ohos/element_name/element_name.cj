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

package ohos.element_name

import ohos.labels.{APILevel, Hide}

internal type ElementNameHandle = UIntNative

@C
struct ElementNameParams {
    ElementNameParams(
        let deviceId: CString,
        let bundleName: CString,
        let abilityName: CString,
        let moduleName: CString
    ) {}
}

foreign func FFICJElementNameCreateWithContent(
    deviceId: CString,
    bundleName: CString,
    abilityName: CString,
    moduleName: CString
): ElementNameHandle

foreign func FFICJElementNameDelete(elementName: ElementNameHandle): Unit

// The return variable needs to delete by `FFICJElementNameParamsDelete`.
foreign func FFICJElementNameGetElementNameInfo(elementName: ElementNameHandle): CPointer<ElementNameParams>

foreign func FFICJElementNameParamsDelete(elementNameParams: CPointer<ElementNameParams>): Unit

/**
 * Contains basic Ability information, which uniquely identifies an ability.
 * You can use this class to obtain values of the fields set in an element,
 * such as the device ID, bundle name, and ability name.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.BundleManager.BundleFramework.Core"
]
public class ElementName {
    /**
     * Indicates device id.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public var deviceId: String

    /**
     * Indicates bundle name.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public var bundleName: String

    /**
     * Indicates module name.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public var moduleName: String

    /**
     * Indicates ability name.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public var abilityName: String

    /**
    * Indicates uri
    */
    @!Hide
    internal var uri: Option<String> = Option.None
    /**
    * Indicates short name
    */
    @!Hide
    internal var shortName: Option<String> = Option.None

    private var shortName_: String

    /**
     * ElementName constructor.
     *
     * @param { String } bundleName - Indicates bundle name.
     * @param { String } abilityName - Indicates ability name.
     * @param { String } [deviceId] - Indicates device id. The default value is "".
     * @param { String } [moduleName] - Indicates module name. The default value is "".
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public init(bundleName: String, abilityName: String, deviceId!: String = "", moduleName!: String = "") {
        this.bundleName = bundleName
        this.abilityName = abilityName
        this.deviceId = deviceId
        this.moduleName = moduleName
        this.shortName_ = ""
    }

    // protected function: available only for this package.
    protected init(elementNameHandle: ElementNameHandle) {
        var paramsHandle = unsafe { FFICJElementNameGetElementNameInfo(elementNameHandle) }
        let params = unsafe { paramsHandle.read() }

        this.deviceId = params.deviceId.toString()
        this.bundleName = params.bundleName.toString()
        this.abilityName = params.abilityName.toString()
        this.moduleName = params.moduleName.toString()
        this.shortName_ = ""
        unsafe { FFICJElementNameParamsDelete(paramsHandle) }
    }

    // protected function: available only for this package.
    protected static func release(elementNameHandle: ElementNameHandle): Unit {
        unsafe { FFICJElementNameDelete(elementNameHandle) }
    }

    // protected function: available only for this package.
    protected func createElementNameHandle(): ElementNameHandle {
        unsafe {
            var handle: ElementNameHandle = 0
            try (
                id = LibC.mallocCString(this.deviceId).asResource(),
                bundle = LibC.mallocCString(this.bundleName).asResource(),
                ability = LibC.mallocCString(this.abilityName).asResource(),
                module = LibC.mallocCString(this.moduleName).asResource()
            ) {
                handle = FFICJElementNameCreateWithContent(id.value, bundle.value, ability.value, module.value)
            }
            return handle
        }
    }
}
