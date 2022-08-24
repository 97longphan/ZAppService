//
//  ZAppClient.swift
//  ZAppService
//
//  Created by phlong on 22/08/2022.
//

import RxSwift
import Alamofire
import RxCocoa

public typealias ZAppServiceResponse<T> = Result<T, ZAppServiceError>

protocol ClientEndPointType {
    var auth: AuthEnpointType { get }
}

public final class ZAppClient: ClientEndPointType {
    var auth: AuthEnpointType { self }
    
    public static let shared = ZAppClient()
    public init() {}
}

extension ZAppClient {
    internal func requestAPICommon<T: Decodable>(request: URLRequestConvertible, type: T.Type) -> Single<T> {
        return URLSession.shared.rx.data(request: request.urlRequest!)
            .observe(on: MainScheduler.instance)
            .map{ try JSONDecoder().decode(T.self, from: $0) }
            .asSingle()
    }
}
