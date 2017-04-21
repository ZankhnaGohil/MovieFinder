//
//  OverviewTableViewCell.swift
//  MovieFinder
//
//  Created by Zankhna Gohil on 18/04/17.
//  Copyright © 2017 Zankhna. All rights reserved.
//

import UIKit

class OverviewTableViewCell: UITableViewCell {

    @IBOutlet weak var labelOverview: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell(movie: Movie) {
    
        self.labelOverview.text = movie.overview
        self.labelOverview.numberOfLines = 0
        
    }
    
}
