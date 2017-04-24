//
//  R.swift
//  MovieFinder
//
//  Created by Zankhna Gohil on 14/04/17.
//  Copyright © 2017 Zankhna. All rights reserved.
//

import UIKit

//Resource Constant File

struct R {
    
    struct ViewControllerID {
        
        static let movieList =  "MovieListViewController"
        static let movieDetail = "MovieDetailViewController"
        
    }
    
    struct CellId {
        
        static let movieListCellID = "MovieCollectionViewCell"
        static let movieDetailHeader = "MovieHeaderTableViewCell"
        static let movieDetail = "MovieDetailTableViewCell"
        static let movieOverview = "OverviewTableViewCell"
        static let moreInfo = "MoreInfoTableViewCell"
        
    }
    
    static let apiBaseUrl = "https://api.themoviedb.org/3"
    static let imageBaseUrl = "https://image.tmdb.org/t/p/"
    
    struct ImageSize {
        
        static let thumbnail = "w154"
        static let small = "w92"
        static let backdrop = "w342"
        
    }
    
    static let apiKey = "17be64f009f004298adba6df55c59ec4"
    static let perPage = 20
    static let minimumVote = 100
    
    struct APIPath {
        
        static let discoverMovie = "/discover/movie"
        static let searchMovie = "/search/multi"
        static let genreMovie = "/genre/movie/list"
        static let displaySeries = "/discover/tv"
        static let searchSeries = "/search/tv"
        
    }
    
    struct APIParamKey {
        
        static let sortBy = "sort_by"
        static let apiKey = "api_key"
        static let page = "page"
        static let query = "query"
        
        
    }
    
    struct SegueIDS {
        
        static let detailSegue = "DetailSegueID"
        
    }
    
}
