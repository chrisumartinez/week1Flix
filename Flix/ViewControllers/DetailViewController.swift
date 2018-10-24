//
//  DetailViewController.swift
//  Flix
//
//  Created by Chris Martinez on 9/16/18.
//

import UIKit


enum MovieKeys{
    static let title = "title"
    static let backdropPath = "backdrop_path"
    static let overview = "overview"
    static let releaseDate = "release_date"
    static let posterPath = "poster_path"
}

class DetailViewController: UIViewController {

    @IBOutlet weak var backDropImageView: UIImageView!
    
    @IBOutlet weak var posterImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var releaseDateLabel: UILabel!
    
    @IBOutlet weak var overViewLabel: UILabel!
    

    var movie : Movie?
    
    
    override func viewDidLoad() {
        
        if let movie = movie{
            titleLabel.text = movie.title as String
            releaseDateLabel.text = movie.releaseDate as String
            overViewLabel.text = movie.overview as String
            
            backDropImageView.af_setImage(withURL: movie.backDropURL!)
            posterImageView.af_setImage(withURL: movie.posterURL!)
            
        }
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
