//
//  MovieCell.swift
//  Flix
//
//  Created by Chris Martinez on 9/11/18.
//

import UIKit

class MovieCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!

    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var overviewLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
