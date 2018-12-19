//
//  DetailMovieModalViewController.swift
//  themovies_project
//
//  Created by André Nogueira on 12/15/18.
//  Copyright © 2018 André Nogueira. All rights reserved.
//

import UIKit

class DetailMovieModalViewController: UIViewController {

    @IBOutlet weak var movie_releasedate: UILabel!
    @IBOutlet weak var movie_overview: UITextView!
    @IBOutlet weak var movie_genres: UILabel!
    @IBOutlet weak var movie_name: UILabel!
    @IBOutlet weak var image_movie: UIImageView!
    
    var movie: Movie? = nil
    let image_base_url = "https://image.tmdb.org/t/p/"
    let size = "original"
//    let genres = ""
    var genres_dict: Dictionary<Int, String>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.parseData()
    }
    
    func parseData(){
        
        if let movie = self.movie{
            let path = image_base_url + size + "/" + movie.poster_path
            
            self.image_movie.download(image: path, placeholder: nil)
            self.movie_overview.text = movie.overview
            self.movie_releasedate.text = movie.release_date
            self.movie_name.text = movie.title
            self.movie_genres.text = GenresManager.shared.buildGenreStr(movie: movie)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
