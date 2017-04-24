//
//  NetworkManager.swift
//  MovieFinder
//
//  Created by Zankhna Gohil on 14/04/17.
//  Copyright © 2017 Zankhna. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper

class NetworkManager: NSObject {
    
    func fetchMovies(page:Int, sortType:DisplayType, onCompletion: @escaping ([Movie]?,Error?) -> Void) -> Void {
        
        var URLPath = R.APIPath.discoverMovie
        
        if sortType == .series {
            URLPath = R.APIPath.displaySeries
        }
        
        let url = R.apiBaseUrl + URLPath
        let param:Dictionary<String,Any> = [R.APIParamKey.apiKey:R.apiKey,R.APIParamKey.page:page]
        
        Alamofire.request(url, parameters: param).responseObject { (response:DataResponse<MoviePageResponse>) in
            
            if let error = response.result.error {
                onCompletion(nil,error)
            }
            else{
                let movieResponse = response.result.value
                onCompletion(movieResponse?.movies,nil)
            }
        }
        
    }

    func fetchSearchResults(searchText:String , onCompletion: @escaping ([Movie]?,Error?) -> Void) -> Void {
        
        let url = R.apiBaseUrl + R.APIPath.searchMovie
        
        let param:Dictionary<String,Any> = [R.APIParamKey.apiKey:R.apiKey, R.APIParamKey.page:1,R.APIParamKey.query:searchText]
        
        Alamofire.request(url, parameters: param).responseObject { (response:DataResponse<MoviePageResponse>) in
            
            if let error = response.result.error {
                onCompletion(nil,error)
            }
            else if let movieResponse = response.result.value {
                onCompletion(movieResponse.movies,nil)
            }
        }

    }

    func fetchGenres(onCompletion: @escaping ([Genre]?,Error?) -> Void) -> Void {
    
        let url = R.apiBaseUrl + R.APIPath.genreMovie + "?api_key=17be64f009f004298adba6df55c59ec4"
    
        Alamofire.request(url).responseObject { (response:DataResponse<GenreList>) in
            
            if let error = response.result.error {
                onCompletion(nil,error)
            }
            else {
                let genres = response.result.value?.genres
                onCompletion(genres,nil)
            }
        }
    }
    
}
