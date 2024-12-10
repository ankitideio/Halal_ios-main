//
//  HomeTVC.swift
//  Halal
//
//  Created by snow-macmini-3 on 01/10/21.
//

import UIKit

class HomeTVC: UITableViewCell {
    
    @IBOutlet weak var imgVwOff: UIImageView!
    @IBOutlet weak var vwHeight: NSLayoutConstraint!
    @IBOutlet weak var vwOff: UIView!
    @IBOutlet weak var lblOff: UILabel!
    @IBOutlet weak var lblCategoryName: UILabel!
    @IBOutlet weak var vwTableView: UIView!
    @IBOutlet weak var lblTblPrice: UILabel!
    @IBOutlet weak var lblTblName: UILabel!
    @IBOutlet weak var imgTblList: UIImageView!
    @IBOutlet weak var btnFavouretHome: UIButton!
    @IBOutlet weak var lblOpen: UILabel!
    @IBOutlet weak var heightRes: NSLayoutConstraint!
    @IBOutlet weak var vwHome: UIView!
    @IBOutlet weak var imgFeature: UIImageView!
    

    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    @IBAction func actionFvrt(_ sender: Any) {
      //  webService.webServiceForFavourites(obj: self)
    }
    
}
