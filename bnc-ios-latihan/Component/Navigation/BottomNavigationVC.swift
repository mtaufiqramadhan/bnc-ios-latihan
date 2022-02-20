//
//  BottomNavigationVC.swift
//  bnc-ios-latihan
//
//  Created by Muhamad Taufiq Ramadhan on 18/02/22.
//

import Foundation
import UIKit

class BottomNavigationVC: UITabBarController {
    
    override func viewDidLoad() {
        let firstViewController = HomeVC()
        firstViewController.tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: ""), tag: 0)

        let secondViewController = WishlistVC()
        secondViewController.tabBarItem = UITabBarItem(title: "Wishlist", image: UIImage(named: ""), tag: 1)
        
        let tabBarList = [firstViewController, secondViewController]
        viewControllers = tabBarList
    }
    
}
