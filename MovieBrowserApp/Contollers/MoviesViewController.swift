//
//  MoviesViewController.swift
//  MovieBrowserApp
//
//  Created by My Mac on 1/31/21.
//

import UIKit
import AlamofireImage

class MoviesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    //variables
    @IBOutlet weak var tableView: UITableView!
    
    //an Array of dictionary
    var movies = [[String:Any]]()
    
    //run first time the screen comes up
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
      
        getMovies();
        
        
    }
    
    
    //get Movies from the API
    func getMovies(){
        API.getMovies() { movies in
            guard let movies = movies else {
                return
            }
            self.movies = movies;
            self.tableView.reloadData()
        }
    }
    
    //asks for number of rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    //for a particular row -> cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell") as! MovieCell
        
        let movie = movies[indexPath.row]
        let title = movie["title"] as! String
        let synopsis = movie["overview"] as! String
        
        //images
        let baseUrl = "https://image.tmdb.org/t/p/w500"
        let posterPath = movie["poster_path"] as! String
        let posterUrl = URL(string: baseUrl + posterPath)
        
        cell.postReview.af.setImage(withURL: posterUrl!)
        
        //"hello ?(world) -> similar to `Hello ${world}`"
        //cell.textLabel!.text = title
        cell.titleLabel!.text = title
        cell.snynopsisLabel!.text = synopsis
        
        
        return cell
    }
    

 
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        //Find the selected movie
        let cell = sender as! UITableViewCell
        let indexPath = tableView.indexPath(for: cell)!
        let movie = movies[indexPath.row]
        
        //Pass the selected movie to the details of the view controller
        let detailsViewController = segue.destination as! MovieDetailsViewController
        detailsViewController.movie = movie
        tableView.deselectRow(at: indexPath,animated : true)
    }
   
}// end of MoviesViewController
