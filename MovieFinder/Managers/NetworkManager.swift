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
    
    func fetchMovies(page:Int, onCompletion: @escaping ([Movie]?,Error?) -> Void) -> Void {
        
        let URL = R.apiBaseUrl + R.APIPath.discoverMovie + "?api_key=17be64f009f004298adba6df55c59ec4&page=1"
        //let param:Dictionary<String,Any> = [R.APIParamKey.apiKey:R.apiKey]
        
        Alamofire.request(URL).responseObject { (response:DataResponse<MoviePageResponse>) in
            
            if let error = response.result.error {
                onCompletion(nil,error)
            }
            else{
                let movieResponse = response.result.value
                onCompletion(movieResponse?.movies,nil)
            }
        }
        
    }

}
