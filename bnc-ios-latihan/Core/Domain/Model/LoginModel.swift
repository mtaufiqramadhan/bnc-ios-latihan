//
//  LoginModel.swift
//  bnc-ios-latihan
//
//  Created by Muhamad Taufiq Ramadhan on 18/02/22.
//

import Foundation
import SwiftyJSON

struct LoginModel: Codable {
    
    var token: String
       
    static func data(value: AnyObject) -> LoginModel {
        let json = JSON(value)
        return LoginModel(token: json["data"]["token"].stringValue)
    }
    
}
