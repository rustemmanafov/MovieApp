//
//  MovieListCell.swift
//  MovieApp
//
//  Created by Rustem Manafov on 05.09.22.
//

import UIKit
import SDWebImage

protocol MovieProtocol {
    var imageURL: String { get }
    var titleText: String { get }
    var genreText: String { get }
    var releaseText: String { get }

}

class MovieListCell: UITableViewCell {
    
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieGenres: UILabel!
    @IBOutlet weak var movieRelease: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    func configure(data: MovieProtocol) {
        movieTitle.text = data.titleText
        movieGenres.text = data.genreText
        movieRelease.text = data.releaseText
        movieImage.loadURL(url: data.imageURL)
    }

}

extension UIImageView {
    func loadURL(url: String) {
        if let url = URL(string: url) {
            sd_setImage(with: url,
                        placeholderImage: UIImage(named: ""))
        }
    }
}
