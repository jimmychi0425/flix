//
//  NowPlayingViewController.swift
//  flix
//
//  Created by Han Chi on 2018/2/3.
//  Copyright © 2018年 Han Chi. All rights reserved.
//

import UIKit
import AlamofireImage
import PKHUD

class NowPlayingViewController: UIViewController, UITableViewDataSource {

    var movies: [Movie] = []
    var refreshControl: UIRefreshControl!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    var alertController = UIAlertController(title: "Title", message: "Message", preferredStyle: .alert)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(NowPlayingViewController.didPullToRefresh(_:)), for: .valueChanged)
        tableView.insertSubview(refreshControl, at: 0)
        tableView.dataSource = self
        self.tableView.rowHeight = 200
        fetchMovies()
    }
    
    @objc func didPullToRefresh(_ refreshControl: UIRefreshControl) {
        fetchMovies()
    }
    
    func fetchMovies() {
        //activityIndicator.startAnimating()
//        HUD.show(.progress, onView: tableView)
//        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
//        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
//        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
//        let task = session.dataTask(with: request) { (data, response, error) in
//            // This will run when the network request returns
//            if let error = error {
//                print(error.localizedDescription)
//            } else if let data = data {
//                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String : Any]
//                let movieDictionaries = dataDictionary["results"] as! [[String: Any]]
//                self.movies = Movie.movies(dictionaries: movieDictionaries)
//                self.tableView.reloadData()
//                self.refreshControl.endRefreshing()
//                HUD.flash(.success, delay: 1.0)
//                //self.activityIndicator.stopAnimating()
//            }
//        }
//        task.resume()
        MovieApiManager().nowPlayingMovies { (movies: [Movie]?, error: Error?) in
            if let movies = movies {
                self.movies = movies
                self.tableView.reloadData()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        cell.movie = movies[indexPath.row]
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cell = sender as! UITableViewCell
        if let indexPath = self.tableView.indexPath(for: cell) {
            let movie = movies[indexPath.row]
            let detailViewController = segue.destination as! DetailViewController
            detailViewController.movie = movie
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
