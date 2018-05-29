//
//  ImageCell.swift
//  MojazTask
//
//  Created by Sayed Abdo on 5/27/18.
//  Copyright © 2018 Bombo. All rights reserved.
//

import UIKit

class ImageCell: UIView {
    
    var btn_flag : Bool = false
    let checkImg = UIImage(named: "check") as UIImage?
    let unCheckImg = UIImage(named: "circle") as UIImage?
   
    @IBOutlet var contentView: UIView!
  
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    private func commonInit() {
       setupNip()
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCell()
    }
    
    func setupCell() {
        contentView.layer.cornerRadius=10
        contentView.layer.masksToBounds=false
        contentView.layer.shadowOffset=CGSize(width: 0, height: 4)
        contentView.layer.shadowOpacity=0.5
    }
    
    func setupNip(){
        Bundle.main.loadNibNamed("ImageCell", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
}

