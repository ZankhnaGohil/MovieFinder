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
    
    private init() {
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
    
    func getGenreStringFromGenreIDs(arrayOfGenerIds: [Int]?) -> String {
        if let inputArray = arrayOfGenerIds, inputArray.count > 0 {
            var selectedGenres: [String] = []
            
            for genre in self.genre {
                for generId in inputArray {
                    if genre.id == generId {
                        selectedGenres.append(genre.name)
                    }
                }
            }
            return selectedGenres.joined(separator: ",")
        } else {
            return ""
        }
    }
}
