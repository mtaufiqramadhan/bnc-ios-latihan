//
//  DetailPresenter.swift
//  bnc-ios-latihan
//
//  Created by Muhamad Taufiq Ramadhan on 20/02/22.
//

import Foundation

protocol DetailPresenterProtocol: BasePresenterProtocol {
    func whenSuccess(_ data: DetailMovieModel)
}

class DetailPresenter: BasePresenter<DetailPresenterProtocol> {
    
    func retrieveData(_ path: String) {
        DetailMovieInteractor().loadData(
            body: [:], path: path,
            { (result, error) in
                if let value = result {
                    self.view?.whenSuccess(value)
                } else {
                    self.view?.setErrorMessage(error)
                }
            })
    }
    
}
