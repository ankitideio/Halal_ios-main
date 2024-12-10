//
//  ReviewsTVC.swift
//  Halal
//
//  Created by snow-macmini-2 on 04/10/21.
//

import UIKit

class ReviewsTVC: UITableViewCell {
    @IBOutlet weak var imgVwReview: UIImageView!
    
    @IBOutlet weak var hightVwReview: NSLayoutConstraint!
    @IBOutlet weak var vwRatingCount: UIView!
    @IBOutlet weak var vwAddReview: UIView!
    @IBOutlet weak var vwReviews: UIView!
    @IBOutlet weak var heightReviewVw: NSLayoutConstraint!
    @IBOutlet weak var imgVwReviewImage: UIImageView!
    @IBOutlet weak var clsnReviewImage: UICollectionView!
    @IBOutlet weak var vwImage: UIView!
    @IBOutlet weak var vwReview: UIView!
    @IBOutlet weak var vwUserName: UIView!
    @IBOutlet weak var lblTotalRating: UILabel!
    @IBOutlet weak var vwTotalRating: FloatRatingView!
    @IBOutlet weak var lblRating: UILabel!
    @IBOutlet weak var vwRating: FloatRatingView!
    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var imgVwUser: UIImageView!
    @IBOutlet weak var lblReviews: UILabel!
    @IBOutlet weak var lblTimeAgo: UILabel!
    var arrImage = [String]()
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }
//    func collData(){
//        clsnReviewImage.delegate = self
//        clsnReviewImage.dataSource = self
//        clsnReviewImage.reloadData()
//    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
//extension ReviewsTVC:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        arrImage.count
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = clsnReviewImage.dequeueReusableCell(withReuseIdentifier: "ReviewImageCVC", for: indexPath) as! ReviewImageCVC
//        cell.imgVwReview.sd_setImage(with: URL(string: BaseUrl + /arrImage[indexPath.row]), placeholderImage: UIImage(named: ""), options: .refreshCached, context: nil)
//
//        return cell
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//
//        return CGSize(width: 100, height: clsnReviewImage.frame.size.height)
//
//}
//}
