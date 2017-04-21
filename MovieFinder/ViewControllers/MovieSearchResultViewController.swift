//
//  MovieSearchResultViewController.swift
//  MovieFinder
//
//  Created by Zankhna Gohil on 17/04/17.
//  Copyright © 2017 Zankhna. All rights reserved.
//

import UIKit

protocol SearchToDetail  {
    func searchToDetail(movie: Movie)
}

private let reuseIdentifier = "Cell"

class MovieSearchResultViewController: UICollectionViewController {

    var delegate:SearchToDetail?
    var movie: [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView?.backgroundColor = UIColor.white
        self.collectionView?.register(UINib.init(nibName: R.CellId.movieListCellID, bundle: nil), forCellWithReuseIdentifier: R.CellId.movieListCellID)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
        let movieDetail: MovieDetailViewController = segue.destination as! MovieDetailViewController
        movieDetail.movie = sender as! Movie!
        
    }
    
    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return (self.movie.count)
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:MovieCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: R.CellId.movieListCellID, for: indexPath) as! MovieCollectionViewCell
        let movie:Movie = self.movie[indexPath.row]
        cell.setUpCell(movie:movie)
        
        return cell
    }

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let movie:Movie = self.movie[indexPath.row]
        
        self.delegate?.searchToDetail(movie: movie)
        
    }
}
