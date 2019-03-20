//
//  NewsDetailsPresenter.swift
//  NY Times
//
//  Created by Islam Soliman on 3/20/19.
//  Copyright © 2019 Islam Soliman. All rights reserved.
//

import UIKit

class NewsDetailsPresenter {

    // MARK: - Constants
    let newsDetails: NewsDetailsViewModel
    
    // MARK: - Variables
    weak var scene: NewsDetailsViewProtocol?
    
    // MARK: - Initializer
    init(details: NewsDetailsViewModel, scene: NewsDetailsViewProtocol) {
        
        self.scene = scene
        newsDetails = details
    }
    
    // MARK: - Presenter API
    func viewDidLoad() {
        
        scene?.configureSubViews(title: newsDetails.title, lineBy: newsDetails.byLine, publishedDate: newsDetails.publishedDate, abstraction: newsDetails.abstraction)
        
        scene?.setImages(with: newsDetails.imageUrls)
        
        if newsDetails.url == nil {
            
            scene?.hideSeeMoreButton()
        }
    }
    
    func openURL() {
        
        if UIApplication.shared.canOpenURL(newsDetails.url!) {
            
            UIApplication.shared.open(newsDetails.url!, options: [:], completionHandler: nil)
        }
    }
    
}
