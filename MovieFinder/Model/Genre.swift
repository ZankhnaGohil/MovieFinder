//
//  Genre.swift
//  MovieFinder
//
//  Created by Zankhna Gohil on 19/04/17.
//  Copyright © 2017 Zankhna. All rights reserved.
//
import UIKit
import ObjectMapper

class Genre: Mappable{
    
    var id: Int!
    var name: String!

    func mapping(map: Map) {
        self.id <- map["id"]
        self.name <- map["name"]
    }
    
    required init?(map: Map) {
        
    }
    
}
