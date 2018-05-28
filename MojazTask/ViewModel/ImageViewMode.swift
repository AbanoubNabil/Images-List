//
//  ImageViewMode.swift
//  MojazTask
//
//  Created by Sayed Abdo on 5/28/18.
//  Copyright © 2018 Bombo. All rights reserved.
//

import UIKit
import SwiftyJSON

class ImageViewMode: NSObject {
    var networkObj = NetworkServiceLayer()
    open var photos : [Photo] = [Photo]()
    
    lazy var handlerBlock: (JSON) -> Void = { items in
        let photoArray = items.arrayObject
        self.photos = Photo.modelsFromArray(array: photoArray as! [[String : Any]])
        
    }
    
    func getDataFromAPI(){
       networkObj.fetchRequest(completion: handlerBlock, myurl: "https://jsonplaceholder.typicode.com/photos")
    }

}
