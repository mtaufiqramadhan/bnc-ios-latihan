//
//  DetailMovieModel.swift
//  bnc-ios-latihan
//
//  Created by Muhamad Taufiq Ramadhan on 20/02/22.
//

import Foundation
import SwiftyJSON

struct DetailMovieModel {
    
    var id: Int
    var title: String
    var year: Int
    var rating: Int
    var imageUrl: String
    var imageLargeUrl: String
    var starring: [String]
    var desc: String
    var releaseDate: String
    var duration: String
    var genre: String
       
    static func data(value: AnyObject) -> DetailMovieModel {
        let json = JSON(value)
        return DetailMovieModel(
            id: json["data"]["id"].intValue,
            title: json["data"]["title"].stringValue,
            year: json["data"]["year"].intValue,
            rating: json["data"]["rating"].intValue,
            imageUrl: json["data"]["imageUrl"].stringValue,
            imageLargeUrl: json["data"]["imageLargeUrl"].stringValue,
            starring: json["data"]["starring"].arrayValue.map { $0.stringValue },
            desc: json["data"]["desc"].stringValue,
            releaseDate: json["data"]["releaseDate"].stringValue,
            duration: json["data"]["duration"].stringValue,
            genre: json["data"]["genre"].stringValue
        )
    }
    
}
