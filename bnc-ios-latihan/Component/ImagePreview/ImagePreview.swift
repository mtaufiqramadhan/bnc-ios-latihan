//
//  ImagePreview.swift
//  bnc-ios-latihan
//
//  Created by Muhamad Taufiq Ramadhan on 20/02/22.
//

import Foundation
import UIKit

class ImagePreview: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    var image: String?
    
    override func viewDidLoad() {
        imageView.downloaded(from: image ?? "")
    }
    
}
