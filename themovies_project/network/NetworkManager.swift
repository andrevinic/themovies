//
//  NetworkManager.swift
//  themovies_project
//
//  Created by André Nogueira on 12/14/18.
//  Copyright © 2018 André Nogueira. All rights reserved.
//

import Foundation
import Moya

protocol Networkable{
    var provider: MoyaProvider<MovieService> { get }
}

struct NetworkManager: Networkable{
    
    var provider = MoyaProvider<MovieService>(plugins: [NetworkLoggerPlugin(verbose: true)])
    static let shared:NetworkManager = NetworkManager()
    
    func fetchGenrers(completion: @escaping (_ success: [Genrer], _ error: Error?) -> Void){

        provider.rx.request(.genrer).subscribe(onSuccess: { (response) in
           
            if let results = try? response.map([Genrer].self, atKeyPath: nil, using: JSONDecoder(), failsOnEmptyData: true){

                completion(results, nil)
            }
            
            
        }) { (error) in
            debugPrint(error)
        }
    }
    
    func fetchMovieList(page: Int, completion: @escaping (_ success: [Movie], _ error: Error?) -> Void){
        let provider = MoyaProvider<MovieService>(plugins: [NetworkLoggerPlugin(verbose: true)])
        provider.rx.request(.upcoming).subscribe(onSuccess: { (response) in
            if let results = try? response.map(Upcoming.self, atKeyPath: nil, using: JSONDecoder(), failsOnEmptyData: true){
                completion(results.movies, nil)
            }
            
        }) { (error) in
            debugPrint(error)
        }
    }
}
