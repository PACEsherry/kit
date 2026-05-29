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

import ohos.labels.{APILevel, Hide}
import ohos.business_exception.BusinessException

/**
 * Indicates bundle type.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.BundleManager.BundleFramework.Core"
]
public enum BundleType {
    /**
     * Indicates app.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    App
    |
    /**
     * Indicates atomic service
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    AtomicService
    | ...

    /**
     * @throws { BusinessException } 17700101 - Parameter error.
     */
    protected static func parse(val: Int32): BundleType {
        match (val) {
            case 0 => App
            case 1 => AtomicService
            case _ => throw BusinessException(17700101, "Parameter error.")
        }
    }
}

/**
 * PermissionGrantState
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.BundleManager.BundleFramework.Core"
]
public enum PermissionGrantState {
    /**
     * PERMISSION_DENIED
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    PermissionDenied
    |
    /**
     * PERMISSION_GRANTED
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    PermissionGranted
    | ...

    /**
     * @throws { BusinessException } 17700101 - Parameter error.
     */
    static func parse(val: Int32): PermissionGrantState {
        match (val) {
            case -1 => PermissionDenied
            case 0 => PermissionGranted
            case _ => throw BusinessException(17700101, "Parameter error.")
        }
    }
}

/**
 * Display orientation.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.BundleManager.BundleFramework.Core"
]
public enum DisplayOrientation {
    /**
     * Indicates that the system automatically determines the display orientation.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    Unspecified
    |
    /**
     * Indicates the landscape orientation.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    Landscape
    |
    /**
     * Indicates the portrait orientation.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    Portrait
    |
    /**
     * Indicates the page ability orientation is the same as that of the nearest ability in the stack.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    FollowRecent
    |
    /**
     * Indicates the inverted landscape orientation.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    LandscapeInverted
    |
    /**
     * Indicates the inverted portrait orientation.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    PortraitInverted
    |
    /**
     * Indicates the orientation can be auto-rotated.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    AutoRotation
    |
    /**
     * Indicates the landscape orientation rotated with sensor.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    AutoRotationLandscape
    |
    /**
     * Indicates the portrait orientation rotated with sensor.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    AutoRotationPortrait
    |
    /**
     * Indicates the sensor restricted mode.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    AutoRotationRestricted
    |
    /**
     * Indicates the sensor landscape restricted mode.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    AutoRotationLandscapeRestricted
    |
    /**
     * Indicates the sensor portrait restricted mode.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    AutoRotationPortraitRestricted
    |
    /**
     * Indicates the locked orientation mode.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    Locked
    |
    /**
     * Indicates the system automatically determines the sensor restricted mode.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    AutoRotationUnspecified
    |
    /**
     * Indicates the orientation follow the desktop rotate mode.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    FollowDesktop
    | ...

    /**
     * @throws { BusinessException } 17700101 - Parameter error.
     */
    static func parse(val: Int32): DisplayOrientation {
        match (val) {
            case 0 => Unspecified
            case 1 => Landscape
            case 2 => Portrait
            case 3 => FollowRecent
            case 4 => LandscapeInverted
            case 5 => PortraitInverted
            case 6 => AutoRotation
            case 7 => AutoRotationLandscape
            case 8 => AutoRotationPortrait
            case 9 => AutoRotationRestricted
            case 10 => AutoRotationLandscapeRestricted
            case 11 => AutoRotationPortraitRestricted
            case 12 => Locked
            case 13 => AutoRotationUnspecified
            case 14 => FollowDesktop
            case _ => throw BusinessException(17700101, "Parameter error.")
        }
    }
}

/**
 * Support window mode.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.BundleManager.BundleFramework.Core"
]
public enum SupportedWindowMode {
    /**
     * Indicates supported window mode of full screen mode.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    FullScreen
    |
    /**
     * Indicates supported window mode of split mode.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    Split
    |
    /**
     * Indicates supported window mode of floating mode.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    Floating
    | ...

    /**
     * @throws { BusinessException } 17700101 - Parameter error.
     */
    static func parse(val: Int32): SupportedWindowMode {
        match (val) {
            case 0 => FullScreen
            case 1 => Split
            case 2 => Floating
            case _ => throw BusinessException(17700101, "Parameter error.")
        }
    }
}

/**
 * Launch type.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.BundleManager.BundleFramework.Core"
]
public enum LaunchType {
    /**
     * Indicates that the ability has only one instance.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    Singleton
    |
    /**
     * Indicates that the ability can have multiple instances.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    Multiton
    |
    /**
     * Indicates that the ability can have specified instances.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    Specified
    | ...

    /**
     * @throws { BusinessException } 17700101 - Parameter error.
     */
    static func parse(val: Int32): LaunchType {
        match (val) {
            case 0 => Singleton
            case 1 => Multiton
            case 2 => Specified
            case _ => throw BusinessException(17700101, "Parameter error.")
        }
    }
}

/**
 * This enumeration value is used to identify various types of extension ability.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.BundleManager.BundleFramework.Core"
]
public enum ExtensionAbilityType {
    /**
     * Indicates extension info with type of form.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    Form
    |
    /**
     * Indicates extension info with type of work schedule.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    WorkScheduler
    |
    /**
     * Indicates extension info with type of input method.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    InputMethod
    |
    /**
     * Indicates extension info with type of service.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    Service
    |
    /**
     * Indicates extension info with type of accessibility.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    Accessibility
    |
    /**
     * Indicates extension info with type of dataShare.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    DataShare
    |
    /**
     * Indicates extension info with type of filesShare.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    FileShare
    |
    /**
     * Indicates extension info with type of staticSubscriber.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    StaticSubscriber
    |
    /**
     * Indicates extension info with type of wallpaper.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    Wallpaper
    |
    /**
     * Indicates extension info with type of backup.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    Backup
    |
    /**
     * Indicates extension info with type of window.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    Window
    |
    /**
     * Indicates extension info with type of enterprise admin.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    EnterpriseAdmin
    |
    /**
     * Indicates extension info with type of thumbnail.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    Thumbnail
    |
    /**
     * Indicates extension info with type of preview.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    Preview
    |
    /**
     * Indicates extension info with type of print.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    Print
    |
    /**
     * Indicates extension info with type of share.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    Share
    |
    /**
     * Indicates extension info with type of push.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    Push
    |
    /**
     * Indicates extension info with type of driver.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    Driver
    |
    /**
     * Indicates extension info with type of action.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    Action
    |
    /**
     * Indicates extension info with type of ads service.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    AdsService
    |
    /**
     * Indicates extension info with type of embedded UI.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    EmbeddedUI
    |
    /**
     * Indicates extension info with type of insight intent UI.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    InsightIntentUI
    |
    @!Hide
    Fence
    |
    @!Hide
    CallerInfoQuery
    |
    @!Hide
    AssetAcceleration
    |
    @!Hide
    FormEdit
    |
    @!Hide
    Distributed
    |
    @!Hide
    AppService
    |
    @!Hide
    LiveForm
    |
    @!Hide
    WebNativeMessaging
    |
    @!Hide
    FaultLog
    |
    @!Hide
    NotificationSubscriber
    |
    /**
     * Indicates extension info with type of unspecified.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    Unspecified
    | ...

    /**
     * @throws { BusinessException } 17700101 - Parameter error.
     */
    static func parse(val: Int32): ExtensionAbilityType {
        match (val) {
            case 0 => Form
            case 1 => WorkScheduler
            case 2 => InputMethod
            case 3 => Service
            case 4 => Accessibility
            case 5 => DataShare
            case 6 => FileShare
            case 7 => StaticSubscriber
            case 8 => Wallpaper
            case 9 => Backup
            case 10 => Window
            case 11 => EnterpriseAdmin
            case 13 => Thumbnail
            case 14 => Preview
            case 15 => Print
            case 16 => Share
            case 17 => Push
            case 18 => Driver
            case 19 => Action
            case 20 => AdsService
            case 21 => EmbeddedUI
            case 22 => InsightIntentUI
            case 255 => Unspecified
            case _ => throw BusinessException(17700101, "Parameter error.")
        }
    }
}

/**
 * Indicates module type.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.BundleManager.BundleFramework.Core"
]
public enum ModuleType {
    /**
     * Indicates entry type.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    Entry
    |
    /**
     * Indicates feature type.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    Feature
    |
    /**
     * Indicates shared type.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    Shared
    | ...

    /**
     * @throws { BusinessException } 17700101 - Parameter error.
     */
    static func parse(val: Int32): ModuleType {
        match (val) {
            case 1 => Entry
            case 2 => Feature
            case 3 => Shared
            case _ => throw BusinessException(17700101, "Parameter error.")
        }
    }
}

/**
 * This enumeration value is used to identify various types of extension ability.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.BundleManager.BundleFramework.Core"
]
public enum MultiAppModeType {
    /**
     * Indicates multi app mode with type of unspecified.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    Unspecified
    |
    /**
     * Indicates multi app mode with type of multiInstance.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    MultiInstance
    |
    /**
     * Indicates multi app mode with type of appClone.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    AppClone
    | ...

    /**
     * @throws { BusinessException } 17700101 - Parameter error.
     */
    static func parse(val: UInt8): MultiAppModeType {
        match (val) {
            case 0 => Unspecified
            case 1 => MultiInstance
            case 2 => AppClone
            case _ => throw BusinessException(17700101, "Parameter error.")
        }
    }
}

/**
 * Indicates ability type
 */
@!Hide
internal enum AbilityType {
    /**
     * Indicates that the ability has a UI
     */
    @!Hide
    Page
    |
    /**
     * Indicates that the ability does not have a UI
     */
    @!Hide
    Service
    |
    /**
     * Indicates that the ability is used to provide data access services
     */
    @!Hide
    Data
    | ...
}