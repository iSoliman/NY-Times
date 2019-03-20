//
//  NY_TimesTests.swift
//  NY TimesTests
//
//  Created by Islam Soliman on 3/21/19.
//  Copyright © 2019 Islam Soliman. All rights reserved.
//

import XCTest
@testable import NY_Times

class NewsListPresenterTests: XCTestCase {
    
    var service: NewsListServiceMock!
    var presenter: NewsListPresenter!
    var scene = NewsListViewMock()
    
    
    override func setUp() {
        super.setUp()
        
        service = NewsListServiceMock()
        presenter = NewsListPresenter(scene: scene, service: service)
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testFetchingNewsWith20ResultItems() {
        
        service.responseStatus = .successWith2oItems
        presenter.fetchNews()
        
        XCTAssert(presenter.news!.count == 20, "wrong items count of: \(presenter.news!.count)")
    }
    
    func testFailureInFetchingNews() {
        
        service.responseStatus = .failure
        presenter.fetchNews()
        
        XCTAssert(presenter.news == nil, "news != nil")
        
    }
    
    
    
}
