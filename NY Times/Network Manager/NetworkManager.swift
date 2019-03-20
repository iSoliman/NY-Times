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
    
    func getList<Model: Mappable>(withURL path: String, success: @escaping ([Model]) -> Void, failure: @escaping (String) -> Void, finished: @escaping () -> Void) {
        
        let headers = ["Authorization": "Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJhZG1pbiIsImF1dGgiOiJST0xFX0FETUlOLFJPTEVfVVNFUiIsImV4cCI6MTU1NTQyOTIyNX0.M9Z9NKUvCr3gTL71ZMWoOXw8VmG5zCR7A3L8Atpu71DSihYRoV-my5zs0hxojWvV8wFEx2-rfoGFlWcdSvhbTA"]
        
        Alamofire.request(path, method: HTTPMethod.get, parameters: nil, encoding: URLEncoding.default, headers: headers).responseArray { (response: DataResponse<[Model]>) in
            
            let unknownError = "unknown error"
            
            finished()
            
            switch response.result {
                
            case .success(_):
                guard let models = response.result.value else {
                    
                    failure(unknownError)
                    return
                }
                success(models)
            case .failure(_):
                failure(response.error?.localizedDescription ?? unknownError)
                
            }
            
        }
        
    }
}
