//
//  AllReviewTVC.swift
//  Halal
//
//  Created by snow-macmini-1 on 05/10/21.
//

import UIKit

class AllReviewTVC: UITableViewCell {

    @IBOutlet weak var heightImgVw: NSLayoutConstraint!
    @IBOutlet weak var heightImage: NSLayoutConstraint!
    @IBOutlet weak var imgVwUploadImg: UIImageView!
    @IBOutlet weak var lblReview: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var vwRating: FloatRatingView!
    @IBOutlet weak var imgVwUser: UILabel!
    @IBOutlet weak var imgVwProfile: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

}
