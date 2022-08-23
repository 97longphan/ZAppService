//
//  ZAppParameter.swift
//  ZAppService
//
//  Created by phlong on 22/08/2022.
//

import Foundation

public protocol Parameter {
    func toDict() -> [String: Any]
}

extension Parameter {
    public func toDict() -> [String: Any] {
        var dict = [String:Any]()
        let otherSelf = Mirror(reflecting: self)
        for child in otherSelf.children {
            var isNilValue = false
            if case Optional<Any>.none = child.value {
                isNilValue = true
            }
            if let key = child.label, !isNilValue {
                dict[key] = child.value
            }
        }
        return dict
    }
}
