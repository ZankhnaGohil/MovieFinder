//
//  MovieDetailViewController.swift
//  MovieFinder
//
//  Created by Zankhna Gohil on 18/04/17.
//  Copyright © 2017 Zankhna. All rights reserved.
//

import UIKit

enum Row: Int {
    case image = 0
    case overview = 1
    case detail = 2
}

class MovieDetailViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    let cell:MovieDetailTableViewCell = MovieDetailTableViewCell()
    var movie: Movie!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        self.setUpTableView()
        
    }

    func setUpTableView() {
        
        self.tableView.register(UINib.init(nibName: R.CellId.movieDetail, bundle: nil), forCellReuseIdentifier: R.CellId.movieDetail)
        self.tableView.register(UINib.init(nibName: R.CellId.movieOverview, bundle: nil), forCellReuseIdentifier: R.CellId.movieOverview)
        self.tableView.register(UINib.init(nibName: R.CellId.moreInfo, bundle: nil), forCellReuseIdentifier: R.CellId.moreInfo)
        
        self.tableView.estimatedRowHeight = 44.0;
        self.tableView.rowHeight = UITableViewAutomaticDimension;
        self.tableView.tableFooterView = UIView()
        
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

extension MovieDetailViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case Row.image.rawValue:
            
            let cell: MovieDetailTableViewCell = tableView.dequeueReusableCell(withIdentifier: R.CellId.movieDetail, for: indexPath) as! MovieDetailTableViewCell
            cell.setUpCellMovie(movie: self.movie!)
            
            return cell
            
        case Row.overview.rawValue:
            
            let cell: OverviewTableViewCell = tableView.dequeueReusableCell(withIdentifier: R.CellId.movieOverview, for: indexPath) as! OverviewTableViewCell
            cell.setupCell(movie: self.movie!)
            
            return cell
            
        case Row.detail.rawValue:
            
            let cell:MoreInfoTableViewCell = tableView.dequeueReusableCell(withIdentifier: R.CellId.moreInfo, for: indexPath) as! MoreInfoTableViewCell
            
            cell.setUpCell(movie: self.movie)
            
            return cell
            
        default:
            return UITableViewCell()
        }
        
}
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    
        switch indexPath.row {
        case Row.image.rawValue:
            return 270
        case Row.overview.rawValue:
            return UITableViewAutomaticDimension
        case Row.detail.rawValue:
            return 180
        default:
            return 44
        }
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case Row.image.rawValue:
            return 270
        case Row.overview.rawValue:
            return 44
        case Row.detail.rawValue:
            return 180
        default:
            return 44
        }
    }
}
