//
//  Genrer.swift
//  themovies_project
//
//  Created by André Nogueira on 12/15/18.
//  Copyright © 2018 André Nogueira. All rights reserved.
//

import Foundation

struct GenreList{
    var genres: [Genre] = []
}

extension GenreList: Decodable{

    private enum ResultCodingKeys: String, CodingKey{
        case genres
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: ResultCodingKeys.self)
        
        genres = try container.decode([Genre].self, forKey: .genres)
    }
    
}

struct Genre{
    let id: Int
    let name: String?
}

extension Genre: Decodable{
    
    private enum ResultCodingKeys: String, CodingKey{
        case id
        case name
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: ResultCodingKeys.self)
        
        id = try container.decode(Int.self, forKey: .id)
        name = try container.decodeIfPresent(String.self, forKey: .name)
    }
    
}
