//
//  NewsListService.swift
//  NY Times
//
//  Created by Islam Soliman on 3/20/19.
//  Copyright © 2019 Islam Soliman. All rights reserved.
//


class NewsListService {

    func getNews(success: @escaping ([Result]) -> Void, failure: @escaping (String) -> Void, finished: @escaping () -> Void) {
        
        let path = "https://api.nytimes.com/svc/mostpopular/v2/viewed/7.json?api-key=TxschGNk7jPY3TIkrRDjOjzKYneNH18t"
        
        NetworkManager().getApi(withPath: path, success: { (newsBase: NewsBaseResponse) in
            
            if let news = newsBase.results, newsBase.status == "OK" {
                
                success(news)
            } else  {
                
                failure("Unknown error")
            }
            
        }, failure: { (errorMsg) in
            
            failure(errorMsg)
        }) {
            
            finished()
        }
    }
    
}
