//
//  NewsCell.swift
//  NY Times
//
//  Created by Islam Soliman on 3/20/19.
//  Copyright © 2019 Islam Soliman. All rights reserved.
//

import UIKit

class NewsCell: UITableViewCell {

    @IBOutlet weak var labeltitle: UILabel!
    @IBOutlet weak var labelByLine: UILabel!
    @IBOutlet weak var labelPublishedDate: UILabel!
    @IBOutlet weak var labelType: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureNewsCell(with news: NewsViewModel) {
        
        labeltitle.text = news.title
        labelByLine.text = news.byLine
        labelPublishedDate.text = news.publishedDate
        labelType.text = news.type
    }
    
}
