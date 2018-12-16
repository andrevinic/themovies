//
//  MovieCollectionViewCell.swift
//  themovies_project
//
//  Created by André Nogueira on 12/14/18.
//  Copyright © 2018 André Nogueira. All rights reserved.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var genre: UILabel!
    @IBOutlet weak var release_date: UILabel!
    @IBOutlet weak var poster_image: UIImageView!
    
    let id: Int = 0
    let image_base_url = "https://image.tmdb.org/t/p/"
    let size = "w500"
    
    func setupCell(name: String, genre: String, release_date: String, id: Int){
        self.name.text = name
        self.genre.text  = genre
        self.release_date.text = release_date
    }
    
    func setupImage(path: String)->String{
        let path = image_base_url + size + "/" + path
        self.poster_image.download(image: path, placeholder: nil)
        return path
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
