//
//  Array + Dictionary.swift
//  themovies_project
//
//  Created by André Nogueira on 12/15/18.
//  Copyright © 2018 André Nogueira. All rights reserved.
//

import Foundation
extension Array {
    public func toDictionary<Key: Hashable>(with selectKey: (Element) -> Key) -> [Key:Element] {
        var dict = [Key:Element]()
        for element in self {
            dict[selectKey(element)] = element
        }
        return dict
    }
}
