//
//  Movie.swift
//  Flix
//
//  Created by Chris Martinez on 10/19/18.
//

import Foundation


class Movie{
    var title : String
    var posterURL : URL?
    var overview : String
    var releaseDate : String
    var backDropURL : URL?
    var baseURLString: String = "https://image.tmdb.org/t/p/w500"
    

    
    init(dictionary: [String : Any]){
        title = dictionary["title"] as? String ?? "No Title"
        let posterURLString = dictionary["poster_path"] as? String ?? "No Poster Path"
        let fullPosterURLString = (baseURLString + posterURLString)
        posterURL = URL(string: fullPosterURLString)
        overview = dictionary["overview"] as? String ?? "No Overview"
        releaseDate = dictionary["release_date"] as? String ?? "No Release Date"
        let backDropURLString = dictionary["backdrop_path"] as? String ?? "No Backdrop Path"
        let fullBackdropPathString = (baseURLString + backDropURLString)
        backDropURL = URL(string: fullBackdropPathString)
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
