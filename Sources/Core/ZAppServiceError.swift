//
//  ZAppServiceError.swift
//  ZAppService
//
//  Created by phlong on 22/08/2022.
//

import Foundation


public enum ZAppServiceError: Error {
    case unknow
    case decodeError
    case errorFromBE(ZAppErrorModel)
    
    var message: String {
        switch self {
        case .unknow:
            return "unknow error"
        case .errorFromBE(let model):
            return model.errorInfo
        case .decodeError:
            return "decode error"
        }
    }
}




