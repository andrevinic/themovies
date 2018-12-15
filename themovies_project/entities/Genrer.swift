//
//  Genrer.swift
//  themovies_project
//
//  Created by André Nogueira on 12/15/18.
//  Copyright © 2018 André Nogueira. All rights reserved.
//

import Foundation

struct Genrer{
    let id: Int
    let name: String
    
}
extension Genrer: Decodable{
    
    private enum ResultCodingKeys: String, CodingKey{
        case id
        case name
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: ResultCodingKeys.self)
        
        id = try container.decode(Int.self, forKey: .id)
        name = try container.decode(String.self, forKey: .id)
    }
    
}
