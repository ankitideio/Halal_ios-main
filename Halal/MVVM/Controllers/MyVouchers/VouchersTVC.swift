//
//  VouchersTVC.swift
//  Halal
//
//  Created by snow-macmini-1 on 04/10/21.
//

import UIKit

class VouchersTVC: UITableViewCell {
    @IBOutlet weak var btnViewVoucher: UIButton!
    @IBOutlet weak var btnRateIt: UIButton!
    @IBOutlet weak var lblOffTakeAway: UILabel!
    @IBOutlet weak var lblRestaurantName: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        if self.traitCollection.userInterfaceStyle == .dark {
            btnRateIt.backgroundColor = UIColor(red: 62.0/255.0, green: 59.0/255.0, blue: 59.2/255.0, alpha: 1.0)
        }
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
