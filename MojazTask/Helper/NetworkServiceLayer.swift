//
//  NetworkServiceLayer.swift
//  MojazTask
//
//  Created by Sayed Abdo on 5/27/18.
//  Copyright © 2018 Bombo. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
class NetworkServiceLayer: NSObject {
    
    
    func fetchRequest(completion: @escaping (JSON) -> Void , myurl : String) {
        guard let url = URL(string: myurl) else {
            completion(JSON.null)
            return
        }
        
        //make a request
        Alamofire.request(url,method: .get).validate().responseJSON { response in
            //1 check result
            guard response.result.isSuccess else {
                print(" Error while fetching remote rooms: \(String(describing:response.result.error))")
                completion(JSON.null)
                return
            }
            
            //2 result value
            let json = JSON(response.value ?? JSON.null)
            completion(json)
            
            }
//            .stream { (data) in
//                print(String(data: data, encoding: String.Encoding.utf8) ?? "No data")
//        }
    }
}
