//
//  GenreManager.swift
//  MovieFinder
//
//  Created by Zankhna Gohil on 19/04/17.
//  Copyright © 2017 Zankhna. All rights reserved.
//

import UIKit

class GenreManager {

    static let sharedInstance = GenreManager()
    var genre: [Genre] = []
     init() {
        let networkManager: NetworkManager = NetworkManager()
        networkManager.fetchGenres { (genreData, error) in
            if let err = error {
                print(err.localizedDescription)
            }
            else {
                self.genre = genreData!
            }
        }
    }
    
    func getGenreStringFromGenreIDs(array: [Int]) -> String {
        var selectedGenres: [String] = []
        
        for genre in self.genre {
            for generId in array {
                if genre.id == generId {
                    selectedGenres.append(genre.name)
                }
            }
        }
        
        return selectedGenres.joined(separator: ",")
    }
}
