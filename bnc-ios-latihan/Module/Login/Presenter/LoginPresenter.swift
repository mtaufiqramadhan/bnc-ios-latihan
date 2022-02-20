//
//  LoginPresenter.swift
//  bnc-ios-latihan
//
//  Created by Muhamad Taufiq Ramadhan on 19/02/22.
//

import Foundation

protocol LoginPresenterProtocol: BasePresenterProtocol {
    func startLoading()
    func finishLoading()
    func whenSuccess(_ data: LoginModel)
}

class LoginPresenter: BasePresenter<LoginPresenterProtocol> {
    
    func retrieveData(email: String, password: String) {
        self.view?.startLoading()
        LoginInteractor().loadData(
            body: [
                "email": email,
                "password": password
            ], { (result, error) in
                if let value = result {
                    self.view?.whenSuccess(value)
                    self.view?.finishLoading()
                } else {
                    self.view?.setErrorMessage(error)
                    self.view?.finishLoading()
                }
            })
    }
    
}
