//
//  MovieListViewController.swift
//  MovieFinder
//
//  Created by Zankhna Gohil on 14/04/17.
//  Copyright © 2017 Zankhna. All rights reserved.
//

import UIKit

class MovieListViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    var dataSourceArray:[Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView.register(UINib.init(nibName: R.CellId.movieListCellID, bundle: nil), forCellWithReuseIdentifier: R.CellId.movieListCellID)
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.fetchMovies()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func fetchMovies() -> Void {
        let networkManager:NetworkManager = NetworkManager()
        networkManager.fetchMovies(page: 1) { (movies, error) in
            
            if let err = error{
                print(err.localizedDescription)
            }
            else{
                 self.dataSourceArray = self.dataSourceArray + movies!
                 self.collectionView.reloadData()
            }
        }
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

extension MovieListViewController:UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.dataSourceArray.count
    }
 
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell:MovieCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: R.CellId.movieListCellID, for: indexPath) as! MovieCollectionViewCell
        let movie:Movie = self.dataSourceArray[indexPath.row]
        cell.setUpCell(movie:movie)
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
    
        return CGSize(width: collectionView.frame.size.width/2-12, height: 270)
        
    }
 
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets{
    
            return UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat{
    
            return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat{
        
        return 8
        
    }
    
}
