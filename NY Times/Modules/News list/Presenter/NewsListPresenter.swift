//
//  NewsListPresenter.swift
//  NY Times
//
//  Created by Islam Soliman on 3/20/19.
//  Copyright © 2019 Islam Soliman. All rights reserved.
//

import UIKit

class NewsListPresenter {

    // MARK: - Variables
    weak var scene: NewsListViewProtocol?
    var news: [Result]?
    
    // MARK: - Constants
    let service: NewsListService
    
    // MARK: - Initializer
    init(scene: NewsListViewProtocol, service: NewsListService = NewsListService()) {
        
        self.scene = scene
        self.service = service
    }
    
    // MARK: - Presenter API
    func fetchNews() {
        
        scene?.callingApiWillStart()
        service.getNews(success: { [weak self] (news) in
            
            guard let weakSelf = self else { return }
            
            weakSelf.news = news
            weakSelf.scene?.newsDidLoadSuccefully(news: weakSelf.map(news: news))
            
        }, failure: { [weak self] (errorMsg) in
            
            self?.scene?.fetchingNewsDidFail(withError: errorMsg)
            
        }) { [weak self] in
            
            self?.scene?.callingApiDidFinish()
        }
        
    }
    
    func selectNews(at index: Int) {
        
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let detailsController: NewsDetailsViewController = storyboard.instantiateViewController(withIdentifier: "NewsDetailsViewController") as! NewsDetailsViewController
        
        let selectedNews = news![index]
        let imagesUrl = getImagesUrl(from: selectedNews)
        let detailsModel = NewsDetailsViewModel(title: selectedNews.title, byLine: selectedNews.byline, publishedDate: selectedNews.publishedDate, abstraction: selectedNews.abstractField, url: selectedNews.url, imageUrls: imagesUrl)
        let detailsPresenter = NewsDetailsPresenter(details: detailsModel, scene: detailsController)
        detailsController.presenter = detailsPresenter
        
        scene?.push(viewController: detailsController)
    }
    
    // MARK: - Private function
    func map(news: [Result]) -> [NewsViewModel] {
        
        return news.map { NewsViewModel(title: $0.title, byLine: $0.byline, publishedDate: $0.publishedDate, type: $0.type) }
    }
    
    func getImagesUrl(from news: Result) -> [String] {
        
        guard let media = news.media else { return [] }
        var imageUrls = [String]()
        
        for singleMedia in media {
            
            guard let metaData = singleMedia.mediametadata else { continue }
            let urls: [String] = metaData.map { $0.url ?? "" }
            imageUrls.append(contentsOf: urls)
        }
        
        return imageUrls
        
    }
    
}


