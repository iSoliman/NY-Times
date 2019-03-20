//
//  NetworkManager.swift
//  Mama Africa
//
//  Created by Islam Soliman on 3/11/19.
//  Copyright © 2019 Islam Soliman. All rights reserved.
//

import Alamofire
import AlamofireObjectMapper
import ObjectMapper

class NetworkManager: NSObject {
    
    func getApi<Model: Mappable>(withPath path: String, success: @escaping (Model) -> Void, failure: @escaping (String) -> Void, finished: @escaping () -> Void) {
        
        Alamofire.request(path, method: HTTPMethod.get, parameters: nil, encoding: URLEncoding.default, headers: nil).responseObject { (response: DataResponse<Model>) in
            
            finished()
            switch response.result {
                
            case .success(let model):
                success(model)
                
            case .failure(let error):
                failure(error.localizedDescription)
                
            }
        }
        
    }
    
}
