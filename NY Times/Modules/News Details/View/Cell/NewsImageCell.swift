//
//  NewsImageCell.swift
//  NY Times
//
//  Created by Islam Soliman on 3/20/19.
//  Copyright © 2019 Islam Soliman. All rights reserved.
//

import UIKit
import SDWebImage

class NewsImageCell: UICollectionViewCell {

    @IBOutlet weak var newsImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCellImage(with url: String) {
        
        newsImage.sd_setImage(with: URL(string: url), placeholderImage: UIImage(named: "placeholder"))
    }

}
