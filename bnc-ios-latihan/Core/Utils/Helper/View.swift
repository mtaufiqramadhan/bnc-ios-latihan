//
//  View.swift
//  bnc-ios-latihan
//
//  Created by Muhamad Taufiq Ramadhan on 18/02/22.
//

import Foundation
import UIKit

class View {
    static var instance: View = {
        return View()
    }()
}

extension View {
    //MARK: showViewController
    func pushViewController<V: UIViewController>(_ this: UIViewController, to: V, _ action: (() -> Void)? = nil, style: UIModalPresentationStyle? = nil) {
        let navController = UINavigationController(rootViewController: to)
        if #available(iOS 13.0, *) {
            navController.modalPresentationStyle = style ?? UIModalPresentationStyle.automatic
        } else {
            // Fallback on earlier versions
        }
        this.present(navController, animated: false, completion: {
            if let actions = action {
                actions()
            }
        })
    }
    
    //MARK: showAlert
    func showAlert(_ vc: UIViewController, _ title: String? = "", message:String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: { (action: UIAlertAction!) in
            alert.dismiss(animated: true, completion: nil)
        })
        
        alert.addAction(okAction)
         
        vc.present(alert, animated: true, completion: nil)
    }
}
