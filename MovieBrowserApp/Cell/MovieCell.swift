//
//  MovieCell.swift
//  MovieBrowserApp
//
//  Created by My Mac on 1/31/21.
//

import UIKit

import AlamofireImage

class MovieCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var snynopsisLabel: UILabel!
    @IBOutlet weak var postReview: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        //line break in portrait mode
        snynopsisLabel.lineBreakMode = .byTruncatingTail
        snynopsisLabel.numberOfLines = 5
        
        // label line set to 0 in landscape mode
        if UIDevice.current.orientation == UIDeviceOrientation.landscapeLeft || UIDevice.current.orientation == UIDeviceOrientation.landscapeRight{
            snynopsisLabel.lineBreakMode = .byWordWrapping
            snynopsisLabel.numberOfLines = 0
        }
        
    }

}
