//
//  NewsListViewMock.swift
//  NY TimesTests
//
//  Created by Islam Soliman on 3/21/19.
//  Copyright © 2019 Islam Soliman. All rights reserved.
//

import UIKit
@testable import NY_Times

class NewsListViewMock: NewsListViewProtocol {
    
    func callingApiWillStart() {
        print("callingApiWillStart")
    }
    
    func callingApiDidFinish() {
        
        print("callingApiDidFinish")
    }
    
    func newsDidLoadSuccefully(news: [NewsViewModel]) {
        
        print("newsDidLoadSuccefully")
    }
    
    func noNewsAvailable() {
        print("noNewsAvailable")
    }
    
    func fetchingNewsDidFail(withError errorMsg: String) {
        print("fetchingNewsDidFail")
    }
    
    func push(viewController: UIViewController) {
        print("push")
    }
    

}
