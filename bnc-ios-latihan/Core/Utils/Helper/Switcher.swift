//
//  Switcher.swift
//  bnc-ios-latihan
//
//  Created by Muhamad Taufiq Ramadhan on 18/02/22.
//

import Foundation
import UIKit

class Switcher {
    
    public static func setupRoot() {
        var rootVC: UIViewController = UIViewController()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let hasLoggedIn: Bool = UserDefault.loggedIn.value ?? false
        
        if !hasLoggedIn {
            rootVC = LoginVC()
        } else {
            rootVC = BottomNavigationVC()
        }

        rootVC.modalPresentationStyle = .fullScreen
        
        appDelegate.window?.rootViewController = UINavigationController(rootViewController: rootVC)
        appDelegate.window?.makeKeyAndVisible()
    }
    
}
