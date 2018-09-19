//
//  SuperheroViewController.swift
//  Flix
//
//  Created by Chris Martinez on 9/18/18.
//

import UIKit

class SuperheroViewController: UIViewController, UICollectionViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var movies : [[String: Any]] = []
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:  "PosterCell", for: indexPath) as! PosterCell
        let movie = movies[indexPath.item]
        if let posterPathString = movie["poster_path"] as? String{
            let baseUrlString = "http://image.tmdb.org/t/p/w500"
            let posterPathURL = URL(string: baseUrlString + posterPathString)! 
            cell.posterImageView.af_setImage(withURL: posterPathURL)
        }
        return cell
    }
    
    
    
    
    func fetchMovies(){
        let url  = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session  = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        
        let task = session.dataTask(with: request)
        { (data, response, error) in
            if let error = error{
                print(error.localizedDescription)
            } else if let data = data{
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                let movies = dataDictionary["results"] as! [[String: Any]]
                self.movies = movies
                self.collectionView.reloadData()
//                self.refreshControl.endRefreshing()
            }
        }
        task.resume()
    }
    
    override func viewDidLoad() {
        
        collectionView.dataSource = self
        super.viewDidLoad()
        fetchMovies()
        
        
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        let cellsForLine:CGFloat = 2
        layout.minimumInteritemSpacing = 5
        layout.minimumLineSpacing = layout.minimumInteritemSpacing
        let interItemSpacingTotal = layout.minimumInteritemSpacing * (cellsForLine - 1)
        let width = collectionView.frame.width / cellsForLine - interItemSpacingTotal / cellsForLine
        layout.itemSize = CGSize(width: width, height: width * 3/2)
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
