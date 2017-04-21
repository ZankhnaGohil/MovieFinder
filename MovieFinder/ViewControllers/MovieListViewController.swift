//
//  MovieListViewController.swift
//  MovieFinder
//
//  Created by Zankhna Gohil on 14/04/17.
//  Copyright © 2017 Zankhna. All rights reserved.
//

import UIKit
import PKHUD

enum sortBy: Int {
    case movie = 0
    case series = 1
}

class MovieListViewController: UIViewController, UISearchControllerDelegate, UISearchResultsUpdating {

    var dataSourceArray:[Movie] = []
    var searchResultViewController: MovieSearchResultViewController!
    var searchController: UISearchController!
    var selectedSortType: sortBy = .movie
    @IBOutlet weak var collectionView: UICollectionView!
    var page:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpCollectionView()
        self.setUpSearchController()
        HUD.show(.progress)
        self.fetchMovies()
    }
    
    func setUpAlert(errorMsg:String, onRetry:@escaping () -> Void) {
        
        let alert = UIAlertController(title: "Alert", message: errorMsg, preferredStyle: UIAlertControllerStyle.alert)
        let action:UIAlertAction = UIAlertAction(title: "Retry", style: .default) { (alert) in
            onRetry()
        }
        
        alert.addAction(action)
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
    fileprivate func setUpCollectionView() {
        self.collectionView.register(UINib.init(nibName: R.CellId.movieListCellID, bundle: nil), forCellWithReuseIdentifier: R.CellId.movieListCellID)
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
    }
    
    fileprivate func setUpSearchController() {
        
        //Initialise the result view controller.
        self.searchResultViewController = MovieSearchResultViewController(collectionViewLayout: self.getFlowLayout())
        self.searchResultViewController.delegate = self
        //Assign the view controller which will display the results of the search controller.
        self.searchController = UISearchController(searchResultsController: self.searchResultViewController)
        
        self.searchController.searchResultsUpdater = self
        self.searchController.delegate = self
        self.searchController.hidesNavigationBarDuringPresentation = false
        self.searchController.dimsBackgroundDuringPresentation = true
        self.navigationItem.titleView = self.searchController.searchBar
        self.definesPresentationContext = true
        
    }
    
    fileprivate func getFlowLayout() -> UICollectionViewFlowLayout {
        
        let flowLayout:UICollectionViewFlowLayout = UICollectionViewFlowLayout();
        
        flowLayout.itemSize = CGSize(width: self.view.frame.size.width/2-12, height: 270)
        flowLayout.minimumInteritemSpacing = 8
        flowLayout.minimumLineSpacing = 8
        flowLayout.sectionInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        
        return flowLayout
        
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        
        if searchController.searchBar.text == nil {
            return
        } else if searchController.searchBar.text?.characters.count == 0 {
            return
        }
        
        let networkManager = NetworkManager()
        
        networkManager.fetchSearchResults(searchText: searchController.searchBar.text!) { (movie, error) in
            if let err = error {
                self.setUpAlert(errorMsg: err.localizedDescription, onRetry: {
                    self.fetchMovies()
                })
                print(err.localizedDescription)
            }
            else {
                if (movie?.count)! > 0 {
                    self.searchResultViewController.movie = movie!
                    self.searchResultViewController.collectionView?.reloadData()
                }
            }
            
        }
    }

    @IBAction func segmentControlClickAction(_ sender: UISegmentedControl) {
        
        if sender.selectedSegmentIndex == 0 {
            self.selectedSortType = .movie
        } else {
            self.selectedSortType = .series
        }
        self.dataSourceArray = []
        self.fetchMovies()
    }
    
    fileprivate func fetchMovies() -> Void {
        
        let networkManager:NetworkManager = NetworkManager()
        networkManager.fetchMovies(page: self.page+1, sortType: self.selectedSortType) { (movies, error) in
            HUD.hide(animated: true)
            if let err = error{
                self.setUpAlert(errorMsg: err.localizedDescription, onRetry: { 
                    self.fetchMovies()
                })
                print(err.localizedDescription)
            }
            else{
                self.dataSourceArray = self.dataSourceArray + movies!
                self.page = self.page + 1
                self.collectionView.reloadData()
            }
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let movieDetail: MovieDetailViewController = segue.destination as! MovieDetailViewController
        movieDetail.movie = sender as! Movie!
    }

}

extension MovieListViewController: SearchToDetail {
    func searchToDetail(movie: Movie) {
        self.performSegue(withIdentifier: R.SegueIDS.detailSegue, sender: movie)
    }
}

extension MovieListViewController:UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.dataSourceArray.count
    }
 
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell:MovieCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: R.CellId.movieListCellID, for: indexPath) as! MovieCollectionViewCell
        let movie:Movie = self.dataSourceArray[indexPath.row]
        
        cell.setUpCellResult(movie: movie, sortType: self.selectedSortType)
        
        if indexPath.row == self.dataSourceArray.count - 3 {
            self.fetchMovies()
        }
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let movie:Movie = self.dataSourceArray[indexPath.row]
        self.performSegue(withIdentifier: R.SegueIDS.detailSegue, sender: movie)
    }
    
}
