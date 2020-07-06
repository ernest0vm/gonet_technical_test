//
//  ApiMAnager.swift
//  gonettest
//
//  Created by Ernesto Valdez on 05/07/20.
//  Copyright © 2020 Ernesto Valdez. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class ApiManager {
    static var shared = ApiManager()
    let BASE_URL: String = "http://api.themoviedb.org/3/movie/popular"
    
    func getRecordsFromApi(completion: @escaping (Bool, APIResponse?) -> Void) {
        
        let parameters: [String: Any] = [
            "api_key" : "802b2c4b88ea1183e50e6b285a27696e",
            "language" : "es",
            "region" : "MX"
        ]
        
        Alamofire.request(
            BASE_URL,
            method: .get,
            parameters: parameters
        ).responseJSON { response in
            
            switch (response.result){
                
            case .success(_):
                let apiResponse = try? JSONDecoder().decode(APIResponse.self, from: response.data!)
                debugPrint("results found: \(apiResponse?.results.count ?? 0)")
                completion(true, apiResponse)
            case .failure(_):
                debugPrint("no result found!")
                completion(false, nil)
            }
            
        }
        
    }
}
