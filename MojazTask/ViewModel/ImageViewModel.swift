//
//  ImageViewMode.swift
//  MojazTask
//
//  Created by Sayed Abdo on 5/28/18.
//  Copyright © 2018 Bombo. All rights reserved.
//

import UIKit
import SwiftyJSON

class ImageViewModel : NSObject {
    
    var networkObj = NetworkServiceLayer()
    var viewControllerDelegate : UpdatePhotoListDelegate?
    
    open var photos : [Photo] = [Photo]()
    open var filteredList : [Photo] = [Photo]()
    
    lazy var handlerBlock: (JSON) -> Void = { items in
        let photoArray = items.arrayObject
        self.photos = Photo.modelsFromArray(array: photoArray as! [[String : Any]])
        self.viewControllerDelegate?.updateList()
    }
    
    func getDataFromAPI(){
       networkObj.fetchRequest(completion: handlerBlock, myurl: "https://jsonplaceholder.typicode.com/photos")
    }
   
}
extension ImageViewModel{
    func updateFilteredList(photo : Photo) {
        if filteredList.count <= 10 {
            filteredList.append(photo)
            NotificationCenter.default.post(name: .updatecount, object: nil)
        }
    }
}
