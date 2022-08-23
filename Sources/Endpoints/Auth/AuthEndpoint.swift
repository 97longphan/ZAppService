//
//  AuthEndpoint.swift
//  ZAppService
//
//  Created by phlong on 22/08/2022.
//

import Foundation
import Alamofire

enum AuthEndpoint {
    case login(AuthLoginParam)
}

extension AuthEndpoint: URLRequestConvertible {
    private var path: String? {
        switch self {
        case .login:
            return "customers/login"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .login:
            return .post
        }
    }
    
    var parameters: Parameters? {
        switch self {
        case .login(let param):
            return param.toDict()
        }
    }
    
    var headers: HTTPHeaders {
        switch self {
        case .login:
            return [HTTPHeader(name: "Accept", value: "application/json")]
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let baseURL = try ZAppServiceConstant.baseUrl.asURL()
        
        var urlRequest = URLRequest(url: baseURL.appendingPathComponent(path ?? ""))

        urlRequest.httpMethod = method.rawValue
        
        urlRequest.allHTTPHeaderFields = headers.dictionary
        
        if let parameters = parameters {
            urlRequest = try! URLEncoding.default.encode(urlRequest, with: parameters)
        }
        
        return urlRequest
    }
}




