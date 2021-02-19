//
//  TrailerViewController.swift
//  MovieBrowserApp
//
//  Created by My Mac on 2/19/21.
//

import UIKit
import WebKit

class TrailerViewController: UIViewController, WKUIDelegate {

    
    var movieVideos = [[String:Any]]()
    var webView : WKWebView!
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero,configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        if(movieVideos.count > 0){
            let videoKey = movieVideos[0]["key"] as! String
            let url = URL(string: "https://www.youtube.com/watch?v=" + videoKey)
            let myRequest = URLRequest(url: url!)
            webView.load(myRequest)
            
        }else{
            print("No Trailer video")
        }
       
        
    }
    
   
    
  

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
