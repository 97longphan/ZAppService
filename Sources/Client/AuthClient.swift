//
//  AuthClient.swift
//  ZAppService
//
//  Created by phlong on 23/08/2022.
//

import Foundation
import RxSwift

extension ZAppClient: AuthEnpointType {
    public func login(_ param: AuthLoginParam) -> Observable<CustomerResult> {
        requestAPICommon(request: AuthEndpoint.login(param), type: CustomerWrapper.self)
    }
}
