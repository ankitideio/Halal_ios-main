//
//  GoogleReviewTVC.swift
//  Halal
//
//  Created by snow-macmini-1 on 19/11/21.
//

import UIKit

class GoogleReviewTVC: UITableViewCell {
    @IBOutlet weak var imgVwUser: UIImageView!
    @IBOutlet weak var lblGoogleReview: UILabel!
    
    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var vwGoogleRating: FloatRatingView!
    @IBOutlet weak var lblReviewDate: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
