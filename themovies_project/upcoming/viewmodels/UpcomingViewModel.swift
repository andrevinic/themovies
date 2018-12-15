//
//  UpcomingViewModel.swift
//  themovies_project
//
//  Created by André Nogueira on 12/14/18.
//  Copyright © 2018 André Nogueira. All rights reserved.
//

import UIKit
import Moya
import RxSwift
import RxCocoa

protocol UpcomingUtils{
    func buildGenreStr(movie: Movie) -> String?
    func toDictionary(genres: [Genre])->Dictionary<Int, String>
}

class UpcomingViewModel: NSObject {
    var upcoming_movies = BehaviorRelay<[Movie]>(value: [Movie]())
    
    var dictionary_genres:Dictionary<Int, String>? = [:]
    
    func fetchGenres(completion: @escaping (_ success: Bool)->Void){
        NetworkManager.shared.fetchGenrers { (genres, error) in
            let myDict = self.toDictionary(genres: genres)
            self.dictionary_genres = myDict
            completion(true)
        }
    }

}

extension UpcomingViewModel: UpcomingUtils{
    
    func toDictionary(genres: [Genre])->Dictionary<Int, String>{
        let myDict = genres.reduce(into: [Int: String]()) {
            $0[$1.id] = $1.name
        }
        return myDict
    }
    
    func buildGenreStr(movie: Movie) -> String?{
        var genres_str = ""
        var count = 1
        
        if let dictionary = self.dictionary_genres{
            for genre in movie.genres{
                
                if count == movie.genres.count{
                    if let value = dictionary[genre]{
                        genres_str += value
                    }
                }else{
                    if let value = dictionary[genre]{
                        genres_str += value + ", "
                    }
                }
                count += 1
                
            }
        }else{
            
        }
        
        return genres_str
        
    }
}

