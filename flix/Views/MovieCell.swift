//
//  MovieCell.swift
//  flix
//
//  Created by Han Chi on 2018/2/3.
//  Copyright © 2018年 Han Chi. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {

    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var posterImageView: UIImageView!
    var movie: Movie! {
        didSet {
            overviewLabel.text = movie.overview
            titleLabel.text = movie.title
            if let posterURL = movie.posterUrl {
                posterImageView.af_setImage(withURL: posterURL)
            } else {
                posterImageView.image = nil
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
