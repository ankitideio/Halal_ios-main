//
//  ReviewsVC.swift
//  Halal
//
//  Created by snow-macmini-2 on 04/10/21.
//

import UIKit

class ReviewsVC: UIViewController {
    @IBOutlet var vwReviewmain: UIView!
    
    @IBOutlet weak var heightTbl: NSLayoutConstraint!
    @IBOutlet weak var tblVwReviews: UITableView!
    @IBOutlet weak var vwReview: UIView!
    var resId:String?
    var userId:String?
    var ratingId:String?
    var selectRow = Int()
    var arrReviews:ReviewsModel?
    var arrGoogleReview:GetGoogleReviewsModel?
    var webService = ViewModelForGoogleReview()
    var arrReviewImage = [String]()
    var resName:String?
    override func viewDidLoad() {
        super.viewDidLoad()
        uiSet()
        
    }
    func uiSet(){
        
        tblVwReviews.delegate = self
        tblVwReviews.dataSource = self
        tblVwReviews.estimatedRowHeight = 250.0
        tblVwReviews.rowHeight = UITableView.automaticDimension
    }
    override func viewWillAppear(_ animated: Bool) {
       
    }
    
    @IBAction func actionAddReview(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "RateAndReviewVC") as! RateAndReviewVC
        vc.restaurentName = resName
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func actionAllReview(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ReadAllReviewVC") as! ReadAllReviewVC
        vc.resName = resName
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
extension ReviewsVC: UITableViewDelegate,UITableViewDataSource{
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReviewsTVC", for: indexPath) as! ReviewsTVC
        
        for arr in /arrReviews?.arrReviewImage{
            cell.imgVwReviewImage.sd_setImage(with: URL(string: BaseUrl +  arr), placeholderImage: UIImage(named: "no-image"), options: .refreshCached, context: nil)
        }
        if /arrReviews?.arrReviewImage.count == 0{
            cell.hightVwReview.constant = 125
            cell.vwImage.isHidden = true
        }else{
            cell.hightVwReview.constant = 45
            cell.vwImage.isHidden = false
            
        }
        cell.lblTimeAgo.text = arrReviews?.timeStamp
        cell.lblUserName.text = arrReviews?.userName
        cell.lblTotalRating.text =  "[" + "\(/fetchReviewCount())"  +  "]" + " " + "Reviews"
        cell.imgVwUser.sd_setImage(with: URL(string:/arrReviews?.rrImage), placeholderImage: UIImage(named: "user_150"), options: .refreshCached, context: nil)
        cell.lblReviews.text = arrReviews?.review
        let rating = Float(/arrReviews?.rating)
        let totalRat = Float(/fetchTotalRating())
        cell.vwTotalRating.rating = /totalRat
        cell.lblRating.text = "\(/totalRat)"
        cell.vwRating.rating = /rating
       // cell.lblReviews.numberOfLines = 2
      //  cell.lblReviews.sizeToFit()
        cell.vwUserName.isHidden = false
        cell.vwReview.isHidden = false
        cell.vwReviews.isHidden = false
       // cell.heightReviewVw.constant = CGFloat(cell.lblReviews.frame.height) + 50
        if arrReviews == nil{
            cell.lblTotalRating.text =  "[" + "\(/fetchGoogleReviewCount())"  +  "]" + " " + "Reviews"
            cell.lblUserName.text = arrGoogleReview?.authorName
            cell.lblTimeAgo.text = arrGoogleReview?.timeDescription
            cell.imgVwUser.sd_setImage(with: URL(string:/arrGoogleReview?.profilePhoto), placeholderImage: UIImage(named: "user_150"), options: .refreshCached, context: nil)
            let vwRating = Float(/arrGoogleReview?.rating)
            let totalRating = Float(/fetchResRating())
            cell.vwTotalRating.rating = /totalRating
            cell.vwRating.rating = /vwRating
            cell.vwImage.isHidden = true
            cell.lblReviews.text = arrGoogleReview?.text
            cell.lblRating.text = /fetchResRating()
          //  cell.lblReviews.numberOfLines = 5
            cell.vwUserName.isHidden = false
            cell.vwReview.isHidden = false
            cell.vwReviews.isHidden = false
            cell.hightVwReview.constant = 125
        //    cell.lblReviews.sizeToFit()
          //  cell.heightReviewVw.constant = CGFloat(cell.lblReviews.frame.height) + 100
            if arrGoogleReview == nil{
                
                cell.lblReviews.text = ""
                cell.lblRating.text = "0.0"
                cell.lblTotalRating.text = "[" + "0" + "]" + " Reviews"
                cell.vwTotalRating.rating = 0.0
                cell.vwUserName.isHidden = true
                cell.vwReview.isHidden = true
                cell.vwReviews.isHidden = true
             }
            
        }
       
        return cell
    }
    
}
