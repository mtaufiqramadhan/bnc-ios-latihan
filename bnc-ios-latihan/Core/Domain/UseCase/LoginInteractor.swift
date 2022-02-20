//
//  LoginInteractor.swift
//  bnc-ios-latihan
//
//  Created by Muhamad Taufiq Ramadhan on 19/02/22.
//

import Foundation

class LoginInteractor {
    
    func loadData(body: Body, _ callback: Callback<LoginModel>) {
        RemoteDataSource.shared().request(
            parameters: body,
            route: .kRouteLogin,
            pathURL: "",
            method: .post,
            hasBody: true,
            success: { (result) in
                let output = LoginModel.data(value: result)
                callback?(output, "")
            }) { (errorMessage) in
                callback?(nil, errorMessage)
            }
    }
    
}
