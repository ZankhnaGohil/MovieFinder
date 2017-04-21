//
//  MovieCollectionViewCell.swift
//  MovieFinder
//
//  Created by Zankhna Gohil on 14/04/17.
//  Copyright © 2017 Zankhna. All rights reserved.
//

import UIKit
import Kingfisher

class MovieCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageViewMovie: UIImageView!
    @IBOutlet weak var labelMovieTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    public func setUpCellResult(movie:Movie , sortType:sortBy){
        
        if let title = movie.title {
            if  movie.title.characters.count != 0 {
                self.labelMovieTitle.text = title
            }
        } else {
            self.labelMovieTitle.text = movie.name
        }
        //
        //        if sortType == .movie {
        //
        //        self.labelMovieTitle.text = movie.title
        //
        //        }
        //        else {
        //            self.labelMovieTitle.text = movie.name
        //        }
        if let path = movie.posterPath {
            let url = R.imageBaseUrl + R.ImageSize.thumbnail + path
            let urlString = URL(string: url)
            self.imageViewMovie.kf.setImage(with: urlString)
        }
        
    }
    
    public func setUpCell(movie:Movie) {
        
        if let title = movie.title {
            if  movie.title.characters.count != 0 {
                self.labelMovieTitle.text = title
            }
        } else {
            self.labelMovieTitle.text = movie.name
        }
        
        if let path = movie.posterPath {
            let url = R.imageBaseUrl + R.ImageSize.thumbnail + path
            let urlString = URL(string: url)
            self.imageViewMovie.kf.setImage(with: urlString)
            
        }
    }
}

//extension String {
//
//    func getImageURLfor(width:String) -> String {
//        return R.imageBaseUrl + width + self
//    }
//    
//}
