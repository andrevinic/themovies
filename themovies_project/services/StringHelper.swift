//
//  StringHelper.swift
//  themovies_project
//
//  Created by André Nogueira on 12/16/18.
//  Copyright © 2018 André Nogueira. All rights reserved.
//

import UIKit

final class StringHelper: NSObject {
    
    class func buildGenreStr(movie: Movie, dictionary_genres: Dictionary<Int, String>?) -> String?{
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
}
