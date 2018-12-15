//
//  UIImageView+KingFisher.swift
//  themovies_project
//
//  Created by André Nogueira on 12/15/18.
//  Copyright © 2018 André Nogueira. All rights reserved.
//

import Foundation
import Kingfisher

extension UIImageView {
    func download(image url: String, placeholder: UIImage?) {
        guard let imageURL = URL(string:url) else {
            return
        }
        self.kf.setImage(with: ImageResource(downloadURL: imageURL), placeholder: placeholder)
    }
}
