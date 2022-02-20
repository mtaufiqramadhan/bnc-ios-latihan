//
//  RemoteDataSource.swift
//  bnc-ios-latihan
//
//  Created by Muhamad Taufiq Ramadhan on 18/02/22.
//

import Foundation
import Alamofire

typealias Body = [String:Any]
typealias Callback<T> = ((T?, String)->Void)?

typealias OnSuccess = (_ result: AnyObject) -> Void
typealias OnFailure = (_ error: String) -> Void

//MARK: - Network Environment
enum NetworkEnvironment {
    case dev
    case prod
}

class RemoteDataSource {
    
    static var instance: RemoteDataSource?
    var networkEnvironment: NetworkEnvironment = EndpointSetup.environment
    
    //MARK: - Instance Network Manager
    static func shared() -> RemoteDataSource {
        if self.instance == nil {
            self.instance = RemoteDataSource()
        }
        return self.instance!
    }
    
    //MARK: - Setup BaseURL
    var baseURL: String {
        switch networkEnvironment {
        case .dev:
            return EndpointSetup.development + version
        case .prod:
            return EndpointSetup.production + version
        }
    }
    var version: String {
        return EndpointSetup.version
    }
    var basicHeader: HTTPHeaders = EndpointSetup.headers
    
}

//MARK: - Request
extension RemoteDataSource {
    func request(customHeader: HTTPHeaders? = nil, parameters: [String: Any], route: RouteKey, pathURL: String, method: HTTPMethod, hasBody: Bool, success: @escaping OnSuccess, failure: @escaping OnFailure) {
        switch checkInternetConnection() {
        case .Available:
            #if DEBUG
                print("URL: ", self.baseURL+RouteSetup(route)+pathURL)
                print("Auth Token: ", UserDefault.token.value ?? "")
                print("Body: ", parameters)
            #endif
            AF.request(baseURL+RouteSetup(route)+pathURL,
                       method: method,
                       parameters: parameters,
                       encoding: hasBody ? URLEncoding.httpBody : URLEncoding.default,
                       headers: (customHeader != nil) ? customHeader : basicHeader)
            .validate(statusCode: 200...299)
            .responseJSON(completionHandler: { (response) in
                switch response.result {
                case .success(let value):
                    #if DEBUG
                        print("Response: ", value)
                    #endif
                    success(value as AnyObject)
                case .failure(let error):
                    var message = ""
                    if let httpStatusCode = response.response?.statusCode {
                        switch(httpStatusCode) {
                        case 401:
                            message = NetworkAlert.SessionExpired
                        case 500...599:
                            message = NetworkAlert.ServerError
                        default:
                            message = error.localizedDescription
                        }
                    } else {
                        message = error.localizedDescription
                    }
                    #if DEBUG
                        print("Failed: ", message)
                    #endif
                    failure(message)
                }
            })
        case .NotAvailable:
            failure(NetworkAlert.NoInternetConnection)
        }
    }
}
