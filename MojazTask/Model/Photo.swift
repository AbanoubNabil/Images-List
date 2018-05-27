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
    
    init(id : Int, albumid: Int, title: String, url: String) {
        self.album_id = albumid
        self.id=id
        self.title = title
        self.url=url
    }
}
