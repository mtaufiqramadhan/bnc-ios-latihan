//
//  UITableView.swift
//  bnc-ios-latihan
//
//  Created by Muhamad Taufiq Ramadhan on 20/02/22.
//

import Foundation
import UIKit

extension UITableView {
    func setEmptyView(images: String, title: String) {
        let emptyView = UIView(frame: CGRect(x: self.center.x, y: self.center.y, width: self.bounds.size.width, height: self.bounds.size.height))
        
        let image = UIImage(named: images)!
        let bgImage = UIImageView(image: image)
        let titleLabel = UILabel()
        let messageLabel = UILabel()
        
        bgImage.frame = CGRect(x: 0,y: 0,width: 100,height: 200)
        
        titleLabel.text = title
        titleLabel.textAlignment = .center
        titleLabel.textColor = UIColor.black
        titleLabel.font = UIFont(name:"HelveticaNeue-Bold", size: 16.0) 
        
        bgImage.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        
        emptyView.addSubview(bgImage)
        emptyView.addSubview(titleLabel)
        
        bgImage.centerYAnchor.constraint(equalTo: emptyView.centerYAnchor).isActive = true
        bgImage.centerXAnchor.constraint(equalTo: emptyView.centerXAnchor).isActive = true
        
        titleLabel.topAnchor.constraint(equalTo: bgImage.bottomAnchor, constant: 28).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: emptyView.leftAnchor, constant: 20).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: emptyView.rightAnchor, constant: -20).isActive = true
       
        self.backgroundView = emptyView
        self.separatorStyle = .none
    }
    func restore() {
        self.backgroundView = nil
        self.separatorStyle = .none
    }
}
