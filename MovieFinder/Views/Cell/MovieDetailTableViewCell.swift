//
//  MovieDetailTableViewCell.swift
//  MovieFinder
//
//  Created by Zankhna Gohil on 18/04/17.
//  Copyright © 2017 Zankhna. All rights reserved.
//

import UIKit

class MovieDetailTableViewCell: UITableViewCell {

    @IBOutlet weak var imageViewMovie: UIImageView!
    @IBOutlet weak var labelMovieTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUpCellMovie(movie: Movie) {
        
        if let title = movie.title {
            if  movie.title.characters.count != 0 {
                self.labelMovieTitle.text = title
            }
        }
        else {
            self.labelMovieTitle.text = movie.name
        }

        if let path = movie.backdropPath {
            let url = R.imageBaseUrl + R.ImageSize.backdrop + path
            let urlString = URL(string: url)
            self.imageViewMovie.kf.setImage(with: urlString, placeholder: UIImage(named: "placeholder"), options: nil, progressBlock: nil, completionHandler: nil)
            
        }
    }
    
    
}
