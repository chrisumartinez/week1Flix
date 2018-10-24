//
//  MovieCell.swift
//  Flix
//
//  Created by Chris Martinez on 9/11/18.
//

import UIKit

class MovieCell: UITableViewCell {

    
    
    var movie : Movie! {
        didSet{
            titleLabel.text = movie.title
            overviewLabel.text = movie.overview
            posterImageView.af_setImage(withURL: movie.posterURL!)
        }
    }
    
    @IBOutlet weak var titleLabel: UILabel!

    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var overviewLabel: UILabel!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        posterImageView.layer.cornerRadius = 3
        posterImageView.clipsToBounds = true
        // Initialization code
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
