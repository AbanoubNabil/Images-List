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
    func updateFilteredList(photo : Photo , state : Bool ) {
        
        if filteredList.count < 10 && state {
                filteredList.append(photo)
                NotificationCenter.default.post(name: .updatecount, object: nil)
        }else{
            for itm in 0 ... filteredList.count-1{
                if filteredList[itm].id==photo.id && filteredList[itm].album_id==photo.album_id{
                    filteredList.remove(at: itm)
                    NotificationCenter.default.post(name: .updatecount, object: nil)
                }
            }
            
        }
        
    }
}
