//
//  AuthEnpointType.swift
//  ZAppService
//
//  Created by phlong on 22/08/2022.
//

import Foundation
import RxSwift

public protocol AuthEnpointType {
    func login(_ param: AuthLoginParam) -> Single<CustomerWrapper>
}

