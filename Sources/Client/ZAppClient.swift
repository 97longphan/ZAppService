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
    internal func requestAPICommon<T: Decodable>(request: URLRequestConvertible, type: T.Type) -> Observable<ZAppServiceResponse<T>> {
        guard let urlRequest = request.urlRequest else {
            return Observable.just(ZAppServiceResponse<T>.failure(.unknow))
        }
        
        return Observable.create { obs in
            let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
                if let data = data, let response = response as? HTTPURLResponse {
                    if 200 ..< 300 ~= response.statusCode {
                        do {
                            let dataModel = try JSONDecoder().decode(T.self, from: data)
                            obs.onNext(.success(dataModel))
                        } catch {
                            obs.onNext(.failure(.decodeError))
                        }
                    } else {
                        do {
                            let errorModel = try JSONDecoder().decode(ZAppErrorModel.self, from: data)
                            obs.onNext(.failure(.errorFromBE(errorModel)))
                        } catch {
                            obs.onNext(.failure(.decodeError))
                        }
                    }
                } else {
                    obs.onNext(.failure(.unknow))
                }
            }
            task.resume()
            
            return Disposables.create()
        }
    }
}
