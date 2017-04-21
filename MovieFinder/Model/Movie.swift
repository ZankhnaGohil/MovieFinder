//
//  Movie.swift
//  MovieFinder
//
//  Created by Zankhna Gohil on 14/04/17.
//  Copyright © 2017 Zankhna. All rights reserved.
//

import UIKit
import ObjectMapper

class Movie: Mappable {

    var id:Int?
    var posterPath:String?
    var title:String!
    var originalTitle:String?
    var backdropPath:String?
    var voteAverage:Float?
    var releaseDate:String?
    var overview:String?
    var voteCount:Int?
    var name:String!
    var genreIDS:[Int]?
    var first_air_date:String?
    
    func mapping(map: Map) {
        
        self.id <- map["id"]
        self.posterPath <- map["poster_path"]
        self.title <- map["title"]
        self.backdropPath <- map["backdrop_path"]
        self.voteAverage <- map["vote_average"]
        self.originalTitle <- map["original_title"]
        self.releaseDate <- map["release_date"]
        self.overview <- map["overview"]
        self.voteCount <- map["vote_count"]
        self.name <- map["name"]
        self.genreIDS <- map["genre_ids"]
        self.first_air_date <- map["first_air_date"]
    }
  
    required init?(map: Map) {
        
    }
    
}
