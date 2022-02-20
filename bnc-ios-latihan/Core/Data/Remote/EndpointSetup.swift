//
//  EndpointSetup.swift
//  bnc-ios-latihan
//
//  Created by Muhamad Taufiq Ramadhan on 18/02/22.
//

import Foundation
import Alamofire

struct EndpointSetup {
    static let development = "https://private-anon-ae5d0c352c-bncfetest.apiary-mock.com"
    static let production = ""
    static let version = ""
}

extension EndpointSetup {
    static let headers: HTTPHeaders = [
        "Authorization": "Basic \(UserDefault.token.value ?? "")",
        "Content-Type":"application/json"
    ]
}

extension EndpointSetup {
    static let environment: NetworkEnvironment = .dev
}
