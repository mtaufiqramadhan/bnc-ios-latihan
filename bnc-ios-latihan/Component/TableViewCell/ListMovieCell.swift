//
//  ListMovieCell.swift
//  bnc-ios-latihan
//
//  Created by Muhamad Taufiq Ramadhan on 19/02/22.
//

import Foundation
import UIKit

enum MovieCell {
    static let Identifiers = "ListMovieCell"
}

class ListMovieCell: UITableViewCell {
    
    @IBOutlet weak var imageBanner: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelYear: UILabel!
    @IBOutlet weak var buttonLike: UIButton!
    
    func item(_ item: MovieEntity) {
        imageBanner.downloaded(from: item.imageUrl)
        imageBanner.layer.cornerRadius = imageBanner.frame.size.height / 2
        labelTitle.text = item.title
        labelYear.text = "Release Date: \(item.year)"
        if item.like == true {
            buttonLike.setImage(UIImage(named: "favorite"), for: .normal)
        } else {
            buttonLike.setImage(UIImage(named: "favorite inactive"), for: .normal)
        }
    }
    
}
