//
//  UserDefault.swift
//  bnc-ios-latihan
//
//  Created by Muhamad Taufiq Ramadhan on 18/02/22.
//

import Foundation

enum UserDefaultKey: String {
    case kHasLoggedIn
    case kBearerToken
}

class UserDefault {
    static var loggedIn = DataManager<Bool>(key: .kHasLoggedIn)
    static var token = DataManager<String>(key: .kBearerToken)
}
