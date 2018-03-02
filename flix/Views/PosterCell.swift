//
//  PosterCell.swift
//  flix
//
//  Created by Han Chi on 2018/2/6.
//  Copyright © 2018年 Han Chi. All rights reserved.
//

import UIKit

class PosterCell: UICollectionViewCell {
    
    @IBOutlet weak var posterImageView: UIImageView!
    var movie: Movie! {
        didSet {
            if let posterUrl = movie.posterUrl {
                posterImageView.af_setImage(withURL: posterUrl)
            } else {
                posterImageView.image = nil
            }
        }
    }
    
}
