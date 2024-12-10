//
//  ExtensionOfferListing.swift
//  Halal
//
//  Created by snow-macmini-6 on 24/02/22.
//

import UIKit

extension OfferListingVC: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrOfferListing.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTVC", for: indexPath) as! HomeTVC

        cell.imgTblList.sd_setImage(with: URL(string: /arrOfferListing[indexPath.row].image), placeholderImage: UIImage(named: ""), options: .refreshCached, context: nil)
        cell.lblTblName.text = arrOfferListing[indexPath.row].name
        saveFeaturedLat(featuredLat: /arrOfferListing[indexPath.row].latitude)
        saveFeaturedLong(featuredLog: /arrOfferListing[indexPath.row].longitude)
        cell.lblOpen.text = arrOfferListing[indexPath.row].status
        cell.lblTblPrice.text = arrOfferListing[indexPath.row].cost_sign
      
        var array = [String]()
        for arr in /arrOfferListing[indexPath.row].arrCusineName{
            array.append(/arr.cuisines_name)
        }
        cell.lblCategoryName.text = "• \(/array.joined(separator: " • "))"
        if /arrOfferListing[indexPath.row].arrCusineName.count == 0{
            cell.lblCategoryName.text = ""
        }
        if arrOfferListing[indexPath.row].status == "Open" {
            cell.lblOpen.backgroundColor = UIColor(red: 5.0/255.0, green: 185.0/255.0, blue: 0.0/255.0, alpha: 1.0)
            cell.lblOpen.text = "OPEN"
        }else{
            cell.lblOpen.backgroundColor = .red
            cell.lblOpen.text = "CLOSED"
        }
     
        if arrOfferListing[indexPath.row].res_fav == 0{
           
            cell.btnFavouretHome.setImage(UIImage(named: "like"), for: .normal)
        }else{
            cell.btnFavouretHome.setImage(UIImage(named: "heart3"), for: .normal)
        }
        if arrOfferListing[indexPath.row].r_is_featured == "0"{
            cell.imgFeature.isHidden = true
        }else{
            cell.imgFeature.isHidden = false
        }
        cell.btnFavouretHome.tag = indexPath.row
        cell.btnFavouretHome.addTarget(self, action: #selector(addToFavourt), for: .touchUpInside)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
     
        let vc = storyboard?.instantiateViewController(withIdentifier: "RestourentDetailVC") as! RestourentDetailVC
        //        saveResId(resId: /arrResult[indexPath.row].id)
        vc.r_id = /arrOfferListing[indexPath.row].r_id
        vc.presentdate = presentdate
        vc.time = time
        vc.lattitude = /arrOfferListing[indexPath.row].latitude
        vc.longitude = /arrOfferListing[indexPath.row].longitude
        
        saveRestaurentName(name: /arrOfferListing[indexPath.row].name)

          saveIsComing(isComing: false)
        self.navigationController?.pushViewController(vc, animated: true)
       
    }
    @objc func addToFavourt(_ sender: UIButton){
        let cell = tblVwOfferListing.cellForRow(at: IndexPath(row: sender.tag, section: 0)) as! HomeTVC
        cell.btnFavouretHome.setImage(UIImage(named: "heart3"), for: .normal)
        r_id  = /arrOfferListing[sender.tag].r_id
        id = /arrOfferListing[sender.tag].id
        webServiceFav.webServiceForAddToFavOfferListing(obj: self,index:sender.tag)
    }
}
