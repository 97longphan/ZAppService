//
//  ZAppErrorModel.swift
//  ZAppService
//
//  Created by phlong on 23/08/2022.
//

import Foundation
public struct ZAppErrorModel: Decodable {
    var errorCode: Int
    var errorInfo: String
    
    enum CodingKeys: String, CodingKey {
        case errorCode = "error_code"
        case errorInfo = "error_info"
    }
}
