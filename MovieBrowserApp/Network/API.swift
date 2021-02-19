//
//  API.swift
//  MovieBrowserApp
//
//  Created by My Mac on 2/19/21.
//

import Foundation

struct  API {
    
    static let apiKey = "a07e22bc18f5cb106bfe4cc1f83ad8ed";
    static var movieId = "0";
    
    static func getMovies (completion : @escaping ([[String:Any]]?) -> Void) {
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key="+apiKey)!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
           // This will run when the network request returns
           if let error = error {
              print(error.localizedDescription)
           } else if let data = data {
              let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]

            let movies = dataDictionary["results"] as! [[String:Any]]
            
            return completion(movies)

           }
        }
        task.resume()
    }//end of getMovies()
    
    //
    static func getSimilarMovies(completion : @escaping ([[String:Any]]?) -> Void){
        let url = URL(string: "https://api.themoviedb.org/3/movie/297762/similar?api_key="+apiKey)!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
           // This will run when the network request returns
           if let error = error {
              print(error.localizedDescription)
           } else if let data = data {
              let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
            print("-----datadic---",dataDictionary)
            let similarMovies = dataDictionary["results"] as! [[String:Any]]
           
            return completion(similarMovies)
           }
        }
        task.resume()
    }// end of getSimilarMovies()
    
    static func getMovieTrailer(completion : @escaping ([[String:Any]]?) -> Void){
        let url = URL(string: "https://api.themoviedb.org/3/movie/" + movieId + "/videos?api_key=" + apiKey + "&language=en-US")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
           // This will run when the network request returns
           if let error = error {
              print(error.localizedDescription)
           } else if let data = data {
        
              let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]

            let trailerMovieRes = dataDictionary["results"] as! [[String:Any]]
            
            return completion(trailerMovieRes)
           }
        }
        task.resume()
    }
    
    //helper
    static func takeThisId(id : Int) {
        movieId = String(id)
    }
    
  
    
}
