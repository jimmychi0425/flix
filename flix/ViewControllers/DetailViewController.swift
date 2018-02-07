//
//  DetailViewController.swift
//  flix
//
//  Created by Han Chi on 2018/2/6.
//  Copyright © 2018年 Han Chi. All rights reserved.
//

import UIKit

enum MovieKeys {
    static let title = "title"
    static let realeaseDate = "release_date"
    static let overview = "overview"
    static let backDropPath = "backdrop_path"
    static let posterPath = "poster_path"
}
class DetailViewController: UIViewController {

    @IBOutlet weak var backDropImageView: UIImageView!
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var realeaseDateLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    var movie: [String : Any]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let movie = movie {
            titleLabel.text = movie[MovieKeys.title] as? String
            realeaseDateLabel.text = movie[MovieKeys.realeaseDate] as? String
            overviewLabel.text = movie[MovieKeys.overview] as? String
            let backDropPathString = movie[MovieKeys.backDropPath] as! String
            let posterPathString = movie[MovieKeys.posterPath] as! String
            let baseURLString = "https://image.tmdb.org/t/p/w500"
            let backDropURL = URL(string: baseURLString + backDropPathString)!
            backDropImageView.af_setImage(withURL: backDropURL)
            let posterURL = URL(string: baseURLString + posterPathString)!
            posterImageView.af_setImage(withURL: posterURL)
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
