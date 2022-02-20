//
//  DetailVC.swift
//  bnc-ios-latihan
//
//  Created by Muhamad Taufiq Ramadhan on 18/02/22.
//

import Foundation
import UIKit

class DetailVC: BaseViewController {
    
    @IBOutlet weak var imageBanner: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelYear: UILabel!
    @IBOutlet weak var labelRatings: UILabel!
    @IBOutlet weak var labelGenre: UILabel!
    @IBOutlet weak var labelDescription: UILabel!
    @IBOutlet weak var labelStarring: UILabel!
    
    private var presenter: DetailPresenter!
    public var movieId = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configurePresenter()
    }
    
    private func configurePresenter() {
        presenter = DetailPresenter(view: self)
        presenter.retrieveData("/\(movieId)")
    }
    
    private func retrieveData(_ item: DetailMovieModel) {
        imageBanner.downloaded(from: item.imageUrl)
        labelTitle.text = item.title
        labelYear.text = "Release Date: \(item.year)"
        labelRatings.text = "\(item.rating)"
        labelGenre.text = "\(item.genre) - \(item.duration)"
        labelDescription.text = item.desc.isEmpty ? "-" : item.desc
        
        let starringData = item.starring.map { (data) -> String in
            return String("\(data) \n")
        }.joined()
        labelStarring.text = starringData
        
        imageBanner.tapGesture(action: {
            let detail = ImagePreview(nibName: "ImagePreview", bundle: nil)
            detail.image = item.imageLargeUrl
            self.navigationController?.pushViewController(detail, animated: true)
        })
    }
    
}

//MARK: - Callback
extension DetailVC: DetailPresenterProtocol {
    func setErrorMessage(_ message: String) {
        View.instance.showAlert(self, message: message)
    }
    
    func whenSuccess(_ data: DetailMovieModel) {
        retrieveData(data)
    }
}
