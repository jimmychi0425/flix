//
//  Movie.swift
//  flix
//
//  Created by Han Chi on 2018/2/28.
//  Copyright © 2018年 Han Chi. All rights reserved.
//
import UIKit

class Movie {
    var title: String
    var overview: String
    var posterUrl: URL?
    var backDropURL: URL?
    var releaseDate: String?
    
    init(dictionary: [String: Any]) {
        title = dictionary["title"] as? String ?? "No title"
        overview = dictionary["overview"] as? String ?? "No overview"
        releaseDate = dictionary["release_date"] as? String ?? "No overview"
        
        // Set the rest of the properties
        if let posterPathString = dictionary["poster_path"] as? String {
            let baseURLString = "https://image.tmdb.org/t/p/w500"
            posterUrl = URL(string: baseURLString + posterPathString)!
        } else {
            posterUrl = nil
        }
        if let backDropPathString = dictionary["backdrop_path"] as? String {
            let baseURLString = "https://image.tmdb.org/t/p/w500"
            backDropURL = URL(string: baseURLString + backDropPathString)!
        } else {
            backDropURL = nil
        }
    }
    
    class func movies(dictionaries: [[String: Any]]) -> [Movie] {
        var movies: [Movie] = []
        for dictionary in dictionaries {
            let movie = Movie(dictionary: dictionary)
            movies.append(movie)
        }
        
        return movies
    }
}
