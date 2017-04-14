//
//  MoviePageResponse.swift
//  MovieFinder
//
//  Created by Zankhna Gohil on 14/04/17.
//  Copyright © 2017 Zankhna. All rights reserved.
//

import UIKit
import ObjectMapper

class MoviePageResponse: Mappable {

    var page:Int?
    var totalResults:Int?
    var totaPage:Int?
    var movies:[Movie]?
    
    func mapping(map: Map) {
        
        self.page <- map["page"]
        self.totaPage <- map["total_pages"]
        self.totalResults <- map["total_results"]
        self.movies <- map["results"]
        
    }
    
    required init?(map:Map) {
        
    }
    
}
