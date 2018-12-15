//
//  Upcoming.swift
//  themovies_project
//
//  Created by André Nogueira on 12/14/18.
//  Copyright © 2018 André Nogueira. All rights reserved.
//

import Foundation

struct Upcoming{
    
    var movies: [Movie] = []
    
}


extension Upcoming: Decodable{
    
    private enum ResultCodingKeys: String, CodingKey{
        case movies = "results"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: ResultCodingKeys.self)
        
        movies = try container.decode([Movie].self, forKey: .movies)
    }
       
}
