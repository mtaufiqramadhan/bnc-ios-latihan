//
//  MovieModel.swift
//  bnc-ios-latihan
//
//  Created by Muhamad Taufiq Ramadhan on 19/02/22.
//

import Foundation
import SwiftyJSON

struct MovieModel {
    
    var id: Int
    var title: String
    var year: Int
    var rating: Int
    var imageUrl: String
       
    static func data(value: AnyObject) -> [MovieModel]  {
        let json = JSON(value)
        var list: [MovieModel] = []
        for (_, object) in json["data"] {
            list.append(
                MovieModel(
                    id: object["id"].intValue,
                    title: object["title"].stringValue,
                    year: object["year"].intValue,
                    rating: object["rating"].intValue,
                    imageUrl: object["imageUrl"].stringValue))
        }
        return list
    }
    
}
