//
//  OffersTVC.swift
//  Halal
//
//  Created by snow-macmini-2 on 05/10/21.
//

import UIKit

class OffersTVC: UITableViewCell {
    @IBOutlet weak var lblOff: UILabel!
    
    @IBOutlet weak var btnRedeem: UIButton!
    @IBOutlet weak var lblTillDate: UILabel!
    @IBOutlet weak var lblMinimum: UILabel!
    @IBOutlet weak var lblOfferDetail: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
