//
//  GenreList.swift
//  MovieFinder
//
//  Created by Zankhna Gohil on 20/04/17.
//  Copyright © 2017 Zankhna. All rights reserved.
//

import UIKit
import ObjectMapper

class GenreList:Mappable  {
    var genres:[Genre]!
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        self.genres <- map["genres"]
    }
}
