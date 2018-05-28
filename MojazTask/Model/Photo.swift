//
//  Photo.swift
//  MojazTask
//
//  Created by Sayed Abdo on 5/27/18.
//  Copyright © 2018 Bombo. All rights reserved.
//

import UIKit

class Photo: NSObject {
    var album_id : Int
    var id : Int
    var title : String
    var url : String
    override init() {
        album_id = 0
        id=0
        title="default"
        url=""
    }
    init(id : Int, albumid: Int, title: String, url: String) {
        self.album_id = albumid
        self.id=id
        self.title = title
        self.url=url
    }
    init(dictionary: [String:Any])
    {
        album_id = dictionary["albumId"] as! Int
        id = dictionary["id"] as! Int
        title = dictionary["title"] as! String
        url = dictionary["url"] as! String
        print("here is \(id)")
    }
    public class func modelsFromArray(array:[[String:Any]]) -> [Photo]
    {
        var models:[Photo] = []
        for item in array
        {
            models.append(Photo.init(dictionary:item))
        }
        return models
    }
}
