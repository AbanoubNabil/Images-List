//
//  ViewController.swift
//  MojazTask
//
//  Created by Sayed Abdo on 5/27/18.
//  Copyright © 2018 Bombo. All rights reserved.
//

import UIKit
import SwiftyJSON
import SDWebImage

class ImageListController : UIViewController, UITableViewDelegate, UITableViewDataSource, UpdatePhotoListDelegate{
    
    @IBOutlet weak var imageListTable: UITableView!
    @IBOutlet weak var countLbl: UILabel!
    
    @IBOutlet weak var listTitle: UILabel!
    @IBAction func saveAction(_ sender: Any) {
        viewmodel.photos=viewmodel.filteredList
        updateList()
        self.listTitle.text="Filtered List"
    }
    var viewmodel = ImageViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewmodel.getDataFromAPI()
        viewmodel.viewControllerDelegate = self
        registerNofification()
    }
    func updateList() {
        self.imageListTable.reloadData()
    }
    func setPhotoAttributes(cell: UITableViewCell, photo : Photo) {
        let phototitle = cell.viewWithTag(2) as! UILabel
        phototitle.text = photo.title
        let albumId = cell.viewWithTag(3) as! UILabel
        albumId.text = "\(photo.id)"
        let image = cell.viewWithTag(1) as! UIImageView
        print("\(photo.url)")
        image.sd_setImage(with: URL(string: photo.url+".jpg"), placeholderImage: UIImage(named: "placeholder.png"))
    }
}

// MARK: - A tableview Delegete and data source.
extension ImageListController{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (viewmodel.photos.count)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        setPhotoAttributes(cell: cell, photo: viewmodel.photos[indexPath.row])
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("=======================any test")
        viewmodel.updateFilteredList(photo: viewmodel.photos[indexPath.row])
        
    }
}

// MARK: - Notification Handling.
extension ImageListController{
    func registerNofification()  {
        NotificationCenter.default.addObserver(self, selector:#selector(setLabebTxt(notfication:)), name: .updatecount, object: nil)
    }
    @objc func setLabebTxt(notfication: NSNotification) {
        self.countLbl.text = "\(viewmodel.filteredList.count)"
    }
}
