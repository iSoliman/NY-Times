//
//  NewsListServiceMock.swift
//  NY TimesTests
//
//  Created by Islam Soliman on 3/21/19.
//  Copyright © 2019 Islam Soliman. All rights reserved.
//

import UIKit
@testable import NY_Times

enum networkResponseStatus {
    
    case successWith2oItems
    case failure
}

class NewsListServiceMock: NewsListService {
    
    var responseStatus: networkResponseStatus = .successWith2oItems

    override func getNews(success: @escaping ([Result]) -> Void, failure: @escaping (String) -> Void, finished: @escaping () -> Void) {
        
        switch responseStatus {
        case .successWith2oItems:
            success([Result](repeating: Result(), count: 20))
            
        case .failure:
            failure("Error")
        
    
        }
    
    }
    
}
