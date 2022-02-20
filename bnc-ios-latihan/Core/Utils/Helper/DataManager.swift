//
//  DataManager.swift
//  bnc-ios-latihan
//
//  Created by Muhamad Taufiq Ramadhan on 18/02/22.
//

import Foundation

struct DataManager<T> {
    let key: UserDefaultKey
    
    var value: T? {
        set {
            if let safeValue = newValue {
                UserDefaults.standard.set(safeValue, forKey: key.rawValue)
            } else {
                UserDefaults.standard.removeObject(forKey: key.rawValue)
            }
        }
        get {
            return UserDefaults.standard.object(forKey: key.rawValue) as? T
        }
    }
}
