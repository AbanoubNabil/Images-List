//
//  ViewController.swift
//  MojazTask
//
//  Created by Sayed Abdo on 5/27/18.
//  Copyright © 2018 Bombo. All rights reserved.
//

import UIKit
import SwiftyJSON

class ImageListController : UIViewController {

    var networkObj = NetworkServiceLayer()
    lazy var handlerBlock: (JSON) -> Void = { items in
        print("test url \(items)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
     networkObj.fetchRequest(completion: handlerBlock, myurl: "https://jsonplaceholder.typicode.com/photos")
        
    }

}

