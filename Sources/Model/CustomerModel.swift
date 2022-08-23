//
//  CustomerModel.swift
//  ZAppService
//
//  Created by phlong on 22/08/2022.
//

import Foundation
public struct CustomerWrapper: Codable {
    public let customer: CustomerModel
    
    enum CodingKeys: String, CodingKey {
        case customer = "data"
    }
}

public struct CustomerModel: Codable {
    public let customerId: String
    public let gender: String
    
    enum CodingKeys: String, CodingKey {
        case customerId = "Id"
        case gender = "Gender"
    }
}

