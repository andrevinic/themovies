//
//  Movie.swift
//  themovies_project
//
//  Created by André Nogueira on 12/14/18.
//  Copyright © 2018 André Nogueira. All rights reserved.
//

import Foundation

struct Movie{
    
    var id: Int = 0
    var title: String = ""
    var poster_path: String = ""
    var overview: String = ""
    var release_date: String = ""
    var genres: [Int] = []
    //    let adult: Bool?
    
}

extension Movie: Decodable{
    
    private enum ResultCodingKeys: String, CodingKey{
        case id
        case title
        case poster_path
        case overview
        case release_date
        case genres = "genre_ids"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: ResultCodingKeys.self)
        
        id = try container.decode(Int.self, forKey: .id)
        title = try container.decode(String.self, forKey: .title)
        poster_path = try container.decode(String.self, forKey: .poster_path)
        overview = try container.decode(String.self, forKey: .overview)
        release_date = try container.decode(String.self, forKey: .release_date)
        genres = try container.decode([Int].self, forKey: .genres)
    }
}

