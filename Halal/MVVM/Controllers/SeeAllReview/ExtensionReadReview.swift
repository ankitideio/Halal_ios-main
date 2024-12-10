//
//  ExtensionReadReview.swift
//  Halal
//
//  Created by snow-macmini-1 on 05/10/21.
//

import UIKit

extension ReadAllReviewVC:UITableViewDelegate,UITableViewDataSource{


    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return arrOurReview.count
        }else{
            return arrGoogleReview.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0{
        let cell = tableView.dequeueReusableCell(withIdentifier: "AllReviewTVC", for: indexPath) as! AllReviewTVC
            cell.imgVwUser.text = arrOurReview[indexPath.row].userName
            cell.lblReview.text = arrOurReview[indexPath.row].review
            cell.imgVwProfile.layer.cornerRadius = cell.imgVwProfile.frame.size.width/2
            cell.imgVwProfile.sd_setImage(with: URL(string:BaseUrl + /arrOurReview[indexPath.row].profileImage), placeholderImage: UIImage(named: "user_150"), options: .refreshCached, context: nil)
            
            cell.lblDate.text = arrOurReview[indexPath.row].postDate
            for arr in arrOurReview[indexPath.row].arrimage{
                cell.imgVwUploadImg.sd_setImage(with: URL(string: BaseUrl + arr), placeholderImage: UIImage(named: "user_150"), options: .refreshCached, context: nil)
            }
            if arrOurReview[indexPath.row].arrimage.count == 0{
                cell.heightImgVw.constant = CGFloat(0)
            }else{
                cell.heightImgVw.constant = CGFloat(120)
            }
            let rating = Float(/arrOurReview[indexPath.row].rating)
            cell.vwRating.rating = /rating
        return cell
        }else{
            let GoogleCell = tableView.dequeueReusableCell(withIdentifier: "GoogleReviewTVC", for: indexPath) as! GoogleReviewTVC
            
            GoogleCell.imgVwUser.layer.cornerRadius = GoogleCell.imgVwUser.frame.size.width/2
            GoogleCell.lblGoogleReview.text = arrGoogleReview[indexPath.row].text
            GoogleCell.lblReviewDate.text = arrGoogleReview[indexPath.row].timeDescription
            GoogleCell.lblUserName.text = arrGoogleReview[indexPath.row].authorName
            let rating = Float(/arrGoogleReview[indexPath.row].rating)
            GoogleCell.vwGoogleRating.rating = /rating
            GoogleCell.imgVwUser.sd_setImage(with: URL(string:/arrGoogleReview[indexPath.row].profilePhoto), placeholderImage: UIImage(named: "user_150"), options: .refreshCached, context: nil)
            return GoogleCell
        }
    }
    
    
}
