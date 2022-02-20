//
//  MovieInteractor.swift
//  bnc-ios-latihan
//
//  Created by Muhamad Taufiq Ramadhan on 19/02/22.
//

import Foundation

class MovieInteractor {
    
    func loadData(body: Body, _ callback: Callback<[MovieModel]>) {
        RemoteDataSource.shared().request(
            parameters: body,
            route: .kRouteMovies,
            pathURL: "",
            method: .get,
            hasBody: false,
            success: { (result) in
                let output = MovieModel.data(value: result)
                callback?(output, "")
            }) { (errorMessage) in
                callback?(nil, errorMessage)
            }
    }
    
}
