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

import ohos.ffi.CArrString
import std.collection.ArrayList

@C
protected struct RetSkill {
    protected RetSkill(
        let actions: CArrString,
        let entities: CArrString,
        let uris: CArrSkillUri,
        let domainVerify: Bool
    ) {}

    func free() {
        this.actions.free()
        this.entities.free()
        freeRetArrSkillUri(this.uris)
    }
}

@C
protected struct RetSkillUri {
    protected RetSkillUri(
        let scheme: CString,
        let host: CString,
        let port: CString,
        let path: CString,
        let pathStartWith: CString,
        let pathRegex: CString,
        let uriType: CString,
        let utd: CString,
        let maxFileSupported: Int32,
        let linkFeature: CString
    ) {}

    func free() {
        unsafe {
            LibC.free(this.scheme)
            LibC.free(this.host)
            LibC.free(this.port)
            LibC.free(this.path)
            LibC.free(this.pathStartWith)
            LibC.free(this.pathRegex)
            LibC.free(this.uriType)
            LibC.free(this.utd)
            LibC.free(this.linkFeature)
        }
    }
}

@C
protected struct CArrSkillUri {
    protected CArrSkillUri(
        let head: CPointer<RetSkillUri>,
        let size: Int64
    ) {}
}

@C
protected struct CArrSkill {
    protected CArrSkill(
        let head: CPointer<RetSkill>,
        let size: Int64
    ) {}
}

protected func readArrSkillUri(cArr: CArrSkillUri): Array<SkillUri> {
    let result = ArrayList<SkillUri>()
    if (cArr.head.isNotNull()) {
        for (i in 0..cArr.size) {
            unsafe { result.add(SkillUri(cArr.head.read(i))) }
        }
    }
    return result.toArray()
}

protected func readArrSkill(cArr: CArrSkill): Array<Skill> {
    let result = ArrayList<Skill>()
    if (cArr.head.isNotNull()) {
        for (i in 0..cArr.size) {
            unsafe { result.add(Skill(cArr.head.read(i))) }
        }
    }
    return result.toArray()
}

protected func freeRetArrSkillUri(cArr: CArrSkillUri) {
    if (cArr.head.isNotNull() && cArr.size != 0) {
        unsafe {
            for (i in 0..cArr.size) {
                cArr.head.read(i).free()
            }
            LibC.free<RetSkillUri>(cArr.head)
        }
    }
}

protected func freeCArrSkill(cArr: CArrSkill) {
    if (cArr.head.isNotNull() && cArr.size != 0) {
        unsafe {
            for (i in 0..cArr.size) {
                cArr.head.read(i).free()
            }
            LibC.free<RetSkill>(cArr.head)
        }
    }
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
