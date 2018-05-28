//
//  ViewController.swift
//  MojazTask
//
//  Created by Sayed Abdo on 5/27/18.
//  Copyright © 2018 Bombo. All rights reserved.
//

import UIKit
import SwiftyJSON

class ImageListController : UIViewController, UITableViewDelegate, UITableViewDataSource, UpdatePhotoListDelegate{
    
    @IBOutlet weak var imageListTable: UITableView!
    var viewmodel = ImageViewMode()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewmodel.getDataFromAPI()
        viewmodel.viewControllerDelegate = self
    }
    func updateList() {
        self.imageListTable.reloadData()
    }
    
    

}
extension ImageListController{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (viewmodel.photos.count)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        let phototitle = cell.viewWithTag(2) as! UILabel
        phototitle.text = viewmodel.photos[indexPath.row].title
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
  
}
