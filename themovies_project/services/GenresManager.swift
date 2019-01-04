//
//  StringHelper.swift
//  themovies_project
//
//  Created by André Nogueira on 12/16/18.
//  Copyright © 2018 André Nogueira. All rights reserved.
//

import UIKit

protocol ServiceUtils{
    func buildGenreStr(movie: Movie) -> String?
    func toDictionary(genres: [Genre])->Dictionary<Int, String>
}

class GenresManager: ServiceUtils {
    
    static let shared:GenresManager = GenresManager()
    var dictionary_genres:Dictionary<Int, String>? = [:]

    func fetchGenres(completion: @escaping (_ success: Bool)->Void){
        NetworkManager.shared.fetchGenrers { (genres, error) in
            let myDict = self.toDictionary(genres: genres)
            self.dictionary_genres = myDict
            completion(true)
        }
    }
    
    func buildGenreStr(movie: Movie) -> String?{
        var genres_str = ""
        var count = 1
        
        if let dictionary = dictionary_genres{
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
        }
        
        return genres_str
        
    }
    
    func toDictionary(genres: [Genre])->Dictionary<Int, String>{
        let myDict = genres.reduce(into: [Int: String]()) {
            $0[$1.id] = $1.name
        }
        return myDict
    }
}
