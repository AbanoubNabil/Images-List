//
//  ViewController.swift
//  MojazTask
//
//  Created by Sayed Abdo on 5/27/18.
//  Copyright © 2018 Bombo. All rights reserved.
//

import UIKit
import SwiftyJSON

class ImageListController : UIViewController, UITableViewDelegate, UITableViewDataSource{
   
    
    @IBOutlet weak var imageListTable: UITableView!
    
    var networkObj = NetworkServiceLayer()
    
    lazy var handlerBlock: (JSON) -> Void = { items in
        print("test url \(items)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        networkObj.fetchRequest(completion: handlerBlock, myurl: "https://jsonplaceholder.typicode.com/photos")
        
    }

}
extension ImageListController{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
}
