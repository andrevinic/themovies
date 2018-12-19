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
    var pagination = 1
    
    func fetchMovies(completion: @escaping (_ success: Bool)->Void){
        NetworkManager.shared.fetchMovieList(page: pagination, completion: { (movies, error) in
            
            self.upcoming_movies.accept(self.upcoming_movies.value + movies)
            completion(true)
            self.pagination += 1
        })
    }
    
    // MARK: - todo
    
    ////////////////////////////////////////////////////////////////
    //MARK:-
    //MARK: store list of genres in a singleton class
    //MARK:- presentation of 1 cell per row portrait, landscape 2 cells per row
    // MARK: - why used mvvm, why used libraries on readme.md
    ////////////////////////////////////////////////////////////////

    
}


