//
//  WishlistVC.swift
//  bnc-ios-latihan
//
//  Created by Muhamad Taufiq Ramadhan on 18/02/22.
//

import Foundation
import UIKit

class WishlistVC: BaseViewController {
    
    @IBOutlet weak var tableMovie: UITableView!
    
    private var localeData: [MovieEntity] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.parent?.navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "Logout", style: .plain, target: self, action: #selector(logoutButtonTouched))
        self.parent?.title = "Wishlist"
        
        refreshData()
    }
    
    private func configureTableView() {
        tableMovie.delegate = self
        tableMovie.dataSource = self
        tableMovie.register(UINib(nibName: MovieCell.Identifiers, bundle: nil), forCellReuseIdentifier: MovieCell.Identifiers)
        tableMovie.reloadData()
               
        tableMovie.separatorStyle = .none
        tableMovie.keyboardDismissMode = .onDrag
    }
    
    private func retrieveData() {
        retrieveMovieData().forEach{ (output) in
            if output.like {
                localeData.append(
                    MovieEntity(
                        id: output.id,
                        imageUrl: output.imageUrl,
                        rating: output.rating,
                        title: output.title,
                        year: output.year,
                        like: output.like
                    ))
                
            }
        }
    }
    
    private func refreshData() {
        localeData.removeAll()
        retrieveData()
        tableMovie.reloadData()
    }
    
}

extension WishlistVC {
    @objc private func logoutButtonTouched() {
        View.instance.pushViewController(self, to: LoginVC(), {
            UserDefault.token.value = nil
            UserDefault.loggedIn.value = false
        }, style: .fullScreen)
    }
}

//MARK: - TableView
extension WishlistVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if localeData.count == 0 {
            tableView.setEmptyView(images: "empty", title: "Your favorite movie still empty")
        } else {
            tableView.restore()
        }
        return localeData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MovieCell.Identifiers, for: indexPath) as? ListMovieCell else {return UITableViewCell()}
        let item = localeData[indexPath.row]
        cell.item(item)
        cell.buttonLike.tag = indexPath.row
        cell.buttonLike.addTarget(self, action: #selector(like(sender:)), for: .touchUpInside)
        return cell
    }
    
    @objc func like(sender: UIButton){
        if localeData[sender.tag].like == true {
            sender.setImage(UIImage(named: "favorite inactive"), for: .normal)
            updateMovieData(localeData[sender.tag].id, localeData[sender.tag].imageUrl, localeData[sender.tag].rating, localeData[sender.tag].title, localeData[sender.tag].year, false)
        } else {
            sender.setImage(UIImage(named: "favorite"), for: .normal)
            updateMovieData(localeData[sender.tag].id, localeData[sender.tag].imageUrl, localeData[sender.tag].rating, localeData[sender.tag].title, localeData[sender.tag].year, true)
        }
        refreshData()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detail = DetailVC(nibName: "DetailVC", bundle: nil)
        detail.movieId = localeData[indexPath.row].id
        self.navigationController?.pushViewController(detail, animated: true)
    }
}
