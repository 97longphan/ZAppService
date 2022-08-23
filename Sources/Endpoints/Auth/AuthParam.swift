//
//  AuthParam.swift
//  ZAppService
//
//  Created by phlong on 22/08/2022.
//

import Foundation

public struct AuthLoginParam: Parameter {
    public let email: String
    public let password: String
    
    public init(email: String, password: String) {
        self.email = email
        self.password = password
    }
}
