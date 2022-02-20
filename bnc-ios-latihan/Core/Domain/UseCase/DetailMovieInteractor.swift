//
//  DetailMovieInteractor.swift
//  bnc-ios-latihan
//
//  Created by Muhamad Taufiq Ramadhan on 20/02/22.
//

import Foundation

class DetailMovieInteractor {
    
    func loadData(body: Body, path: String, _ callback: Callback<DetailMovieModel>) {
        RemoteDataSource.shared().request(
            parameters: body,
            route: .kRouteMovies,
            pathURL: path,
            method: .get,
            hasBody: false,
            success: { (result) in
                let output = DetailMovieModel.data(value: result)
                callback?(output, "")
            }) { (errorMessage) in
                callback?(nil, errorMessage)
            }
    }
    
}
