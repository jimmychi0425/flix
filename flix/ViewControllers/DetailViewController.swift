//
//  DetailViewController.swift
//  flix
//
//  Created by Han Chi on 2018/2/6.
//  Copyright © 2018年 Han Chi. All rights reserved.
//

import UIKit


class DetailViewController: UIViewController {

    @IBOutlet weak var backDropImageView: UIImageView!
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var realeaseDateLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    var movie: Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let movie = movie {
            titleLabel.text = movie.title
            realeaseDateLabel.text = movie.releaseDate
            overviewLabel.text = movie.overview
            if let backDropURL = movie.backDropURL {
                backDropImageView.af_setImage(withURL: backDropURL)
            } else {
                backDropImageView.image = nil
            }
            if let posterURL = movie.posterUrl {
                posterImageView.af_setImage(withURL: posterURL)
            } else {
                posterImageView.image = nil
            }
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
