//
//  MoreInfoTableViewCell.swift
//  MovieFinder
//
//  Created by Zankhna Gohil on 19/04/17.
//  Copyright © 2017 Zankhna. All rights reserved.
//

import UIKit
import Kingfisher

class MoreInfoTableViewCell: UITableViewCell {

    @IBOutlet weak var imageViewMovie: UIImageView!
    @IBOutlet weak var labelReleaseDate: UILabel!
    @IBOutlet weak var labelVoteCount: UILabel!
    @IBOutlet weak var labelRating: UILabel!
    @IBOutlet weak var labelGenre: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUpCell(movie: Movie) {
    
        if let rating = movie.voteAverage {
            self.labelRating.text = String(describing: rating) + "/ 10"
        }
        
        if let voteCount = movie.voteCount {
            self.labelVoteCount.text = String(describing: voteCount)
        }
       
        if let releaseDate = movie.releaseDate {
            if  movie.releaseDate?.characters.count != 0 {
                self.labelReleaseDate.text = releaseDate
            }
        } else {
            self.labelReleaseDate.text = movie.first_air_date
        }
        
        if let path = movie.posterPath {
            let url = R.imageBaseUrl + R.ImageSize.thumbnail + path
            let urlString = URL(string: url)
            self.imageViewMovie.kf.setImage(with: urlString)
        }
        
        if let genres = movie.genreIDS {
            let genreManager = GenreManager.sharedInstance
            let genreString = genreManager.getGenreStringFromGenreIDs(array: genres)
            self.labelGenre.text = genreString
        }
    }
    
}
