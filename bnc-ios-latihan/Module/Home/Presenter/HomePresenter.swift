//
//  HomePresenter.swift
//  bnc-ios-latihan
//
//  Created by Muhamad Taufiq Ramadhan on 19/02/22.
//

import Foundation

protocol HomePresenterProtocol: BasePresenterProtocol {
    func whenSuccess(_ data: [MovieModel])
}

class HomePresenter: BasePresenter<HomePresenterProtocol> {
    
    func retrieveData() {
        MovieInteractor().loadData(
            body: [:],
            { (result, error) in
                if let value = result {
                    self.view?.whenSuccess(value)
                } else {
                    self.view?.setErrorMessage(error)
                }
            })
    }
    
}
