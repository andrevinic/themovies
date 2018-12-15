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
    
    func setupCell(name: String, genre: String, release_date: String){
        self.name.text = name
        self.genre.text  = genre
        self.release_date.text = release_date
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
