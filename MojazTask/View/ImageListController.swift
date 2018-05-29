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
        saveflag=true
    }
    var checkbox : Checkbox?
    var saveflag : Bool = false
    var viewmodel = ImageViewModel()
    var checktag : Int = 4
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
        checkbox = cell.viewWithTag(4) as? Checkbox
        if !saveflag {
            checkbox?.addTarget(self, action: #selector(checkboxValueChanged(sender:)), for: .valueChanged)
        }else{
            checkbox?.alpha = 0
        }
        if photo.selected {
            checkbox?.isChecked=true
        }else{
            checkbox?.isChecked=false
        }
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

// MARK: - CheckBox Methods
extension ImageListController{
    
    @objc func checkboxValueChanged(sender: Checkbox) {
        let cell = sender.superview?.superview?.superview?.superview as! UITableViewCell
        let indexPath = self.imageListTable.indexPath(for: cell)
        print("from chechbox target")
        viewmodel.photos[(indexPath?.row)!].selected=true
        viewmodel.updateFilteredList(photo: viewmodel.photos[(indexPath?.row)!] , state: sender.isChecked)
    }
    
}
