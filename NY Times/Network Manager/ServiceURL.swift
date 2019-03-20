//
//  ServiceURL.swift
//  Mama Africa
//
//  Created by Islam Soliman on 3/11/19.
//  Copyright © 2019 Islam Soliman. All rights reserved.
//

import UIKit

class ServiceURL: NSObject {
    
//    private static let baseURL = "https://afcon-app.herokuapp.com/api/"
    private static let baseURL = "http://192.168.1.15:8080/api/"
    static let getNews = baseURL + "news"
    static let getAllPlaces = baseURL + "places"
    static let getAllCategories = baseURL + "place-categories"
    static let getAllEvents = baseURL + "events"

}
