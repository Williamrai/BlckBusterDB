//
//  MovieDetailsViewController.swift
//  MovieBrowserApp
//
//  Created by My Mac on 2/15/21.
//

import UIKit
import AlamofireImage

class MovieDetailsViewController: UIViewController {
    
    //Outlets
    
    @IBOutlet weak var backDropView: UIImageView!
    @IBOutlet weak var posterView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var synopsisLabel: UILabel!
    @IBOutlet weak var extraDetailsLabel: UILabel!
    
    var movie : [String:Any]!
    var movieVideos : [[String:Any]]!
   

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = movie["title"] as? String
        synopsisLabel.text = movie["overview"] as? String
        synopsisLabel.sizeToFit()
        
       
    
        //image
        posterView.af.setImage(withURL: getImage(type: "poster_path", size: "500"))
        backDropView.af.setImage(withURL: getImage(type: "backdrop_path",size: "780"))
        
        let movieId = self.movie["id"] as! Int
        print("movie Id",movieId)
        getTrailer(id: movieId)
        getMovieDetail()
        
    
    }
    
    //setImage
    func getImage(type: String, size : String) -> URL{
        let baseUrl = "https://image.tmdb.org/t/p/w" + size
        let posterPath = movie[type] as? String ?? movie["poster_path"] as! String
    
        let posterUrl = URL(string: baseUrl + posterPath)!
       
        return posterUrl 
    }

    @IBAction func posterTap(_ sender: UITapGestureRecognizer) {
        print("open")
        performSegue(withIdentifier: "trailerSegue", sender: nil)
    }
    
    //for setting up genres and other information
    func getMovieDetail(){
        let movieId = movie["id"] as! Int
        let url = URL(string: "https://api.themoviedb.org/3/movie/" + String(movieId) + "?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed&language=en-US")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
           // This will run when the network request returns
           if let error = error {
              print(error.localizedDescription)
           } else if let data = data {
        
            DispatchQueue.main.async {
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                let releasedDate = dataDictionary["release_date"] as! String
                let genres = dataDictionary["genres"] as! [[String:Any]]
                let runtime = dataDictionary["runtime"] as! Int
                
                var extraDetails : String = releasedDate + " \u{2022} "
                for genre in genres{
                    extraDetails += genre["name"] as! String + ","
                }
                extraDetails.removeLast()
                extraDetails += " \u{2022} " + self.convertToHours(minute: runtime)
                self.extraDetailsLabel.text = extraDetails
            
            }

           }
        }
        task.resume()
    }
    
    
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        let trailerViewController = segue.destination as! TrailerViewController
        trailerViewController.movieVideos = movieVideos
        
        // Pass the selected object to the new view controller.
        
    }
    
    func convertToHours(minute : Int) -> String{
        let hour = minute / 60
        let minute = minute % 60
        let hm = String(hour) + "h " + String(minute) + "m"
        return hm
    }
    
    
    func  getTrailer(id : Int){
        API.takeThisId(id: id)
        
        API.getMovieTrailer() { movie in
            guard let movie = movie else{
                return
            }
            self.movieVideos = movie
        }
      
    }
    


}//end of MovieDetailsViewController
