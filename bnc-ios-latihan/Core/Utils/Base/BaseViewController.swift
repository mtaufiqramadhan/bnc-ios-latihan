//
//  BaseViewController.swift
//  bnc-ios-latihan
//
//  Created by Muhamad Taufiq Ramadhan on 20/02/22.
//

import Foundation
import UIKit

class BaseViewController: UIViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        view.initializeHideKeyboard()
    }
    
}
