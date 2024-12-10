//
//  ExtensionHome.swift
//  Halal
//
//  Created by snow-macmini-1 on 27/10/21.
//

import UIKit

extension HomeVC:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0{
            return 170
        }else if indexPath.section == 2{
            return 270
        }else{
            return 185
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 2{
            if fetchResHeight() == true{
                return arrResult.count
            }else{
                
                vwMap.isHidden = false
                mapVwPlus.isHidden = false
                return 0
            }
        }else{
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        heightTblVw.constant = tblVwHome.contentSize.height
        if indexPath.section == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "HomeBannerTVC", for: indexPath) as! HomeBannerTVC
            cell.arrBanner.removeAll()
            cell.arrBanner = self.arrBanner
            cell.uiSet()
            if arrBanner.count > 0{
              
                cell.pageController.numberOfPages = arrBanner.count
            }else{
                
                cell.pageController.numberOfPages = 0
            }
            cell.callBack = { (selectIndex) -> Void in
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "WebsiteVC") as! WebsiteVC
                vc.isComing = "Home"
                vc.urlResturant = self.arrBanner[selectIndex].resUrl ?? ""
                self.navigationController?.pushViewController(vc, animated: true)
            }
            return cell
        }else if indexPath.section == 1{
                let cusineCell = tblVwHome.dequeueReusableCell(withIdentifier: "CusineTVC", for: indexPath) as! CusineTVC
                    if fetchResHeight() == true{
    //                    cusineCell.vwList.backgroundColor = UIColor(red: 227.0/255.0, green: 227.0/255.0, blue: 227.0/255.0, alpha: 1.0)
    //                    cusineCell.vwMap.backgroundColor = UIColor.white
                        if self.traitCollection.userInterfaceStyle == .light {
                            cusineCell.vwList.backgroundColor = UIColor(red: 227.0/255.0, green: 227.0/255.0, blue: 227.0/255.0, alpha: 1.0)
                            cusineCell.vwMap.backgroundColor = UIColor.white
                        }else{
                            cusineCell.vwList.backgroundColor = UIColor.init(red: 5.0/255.0, green: 185.0/255.0, blue: 0.0/255.0, alpha: 1.0)
                            cusineCell.vwMap.backgroundColor = UIColor(red: 227.0/255.0, green: 227.0/255.0, blue: 227.0/255.0, alpha: 1.0)
                        }
                        cusineCell.btnList.isSelected = true
                        cusineCell.btnMap.isSelected = false
                    }else{
                        if self.traitCollection.userInterfaceStyle == .light {
                            cusineCell.vwMap.backgroundColor = UIColor(red: 227.0/255.0, green: 227.0/255.0, blue: 227.0/255.0, alpha: 1.0)
                            cusineCell.vwList.backgroundColor = UIColor.white
                        }else{
                            cusineCell.vwList.backgroundColor = UIColor(red: 227.0/255.0, green: 227.0/255.0, blue: 227.0/255.0, alpha: 1.0)
                            cusineCell.vwMap.backgroundColor = UIColor.init(red: 5.0/255.0, green: 185.0/255.0, blue: 0.0/255.0, alpha: 1.0)
                        }
                        cusineCell.btnList.isSelected = false
                        cusineCell.btnMap.isSelected = true
                        }
                cusineCell.btnList.tag = indexPath.row
                cusineCell.btnMap.tag = indexPath.row
                cusineCell.btnList.addTarget(self, action: #selector(selectList), for: .touchUpInside)
                cusineCell.btnMap.addTarget(self, action: #selector(selectMap), for: .touchUpInside)
                return cusineCell
            }else {
            let cell = tblVwHome.dequeueReusableCell(withIdentifier: "HomeTVC", for: indexPath) as! HomeTVC
                if arrResult.count > 0{
                    cell.imgTblList.sd_setImage(with: URL(string: /arrResult[indexPath.row].image), placeholderImage: UIImage(named: ""), options: .refreshCached, context: nil)
                    cell.lblTblName.text = arrResult[indexPath.row].name
                    saveFeaturedLat(featuredLat: /arrResult[indexPath.row].latitude)
                    saveFeaturedLong(featuredLog: /arrResult[indexPath.row].longitude)
                    cell.lblOpen.text = arrResult[indexPath.row].status
                    cell.lblTblPrice.text = arrResult[indexPath.row].cost_sign
                    cell.imgVwOff.isHidden = true
                    cell.lblOff.isHidden = true
                    cell.vwOff.isHidden = true
                    cell.vwOff.backgroundColor = .clear
                    var array = [String]()
                    for arr in /arrResult[indexPath.row].arrcusineName{
                        array.append(/arr.cusineName)
                    }
                    cell.lblCategoryName.text = "• \(/array.joined(separator: " • "))"
                    if /arrResult[indexPath.row].arrcusineName.count == 0{
                        cell.lblCategoryName.text = ""
                    }
                    if arrResult[indexPath.row].status == "Open" {
                        cell.lblOpen.backgroundColor = UIColor(red: 5.0/255.0, green: 185.0/255.0, blue: 0.0/255.0, alpha: 1.0)
                        cell.lblOpen.text = "OPEN"
                    }else{
                        cell.lblOpen.backgroundColor = .red
                        cell.lblOpen.text = "CLOSED"
                    }
                    
                    if arrResult[indexPath.row].resFav == 0{
                        
                        cell.btnFavouretHome.setImage(UIImage(named: "like"), for: .normal)
                    }else{
                        cell.btnFavouretHome.setImage(UIImage(named: "heart3"), for: .normal)
                    }
                    
                    if /arrResult[indexPath.row].offerPrice != ""{
                        cell.lblOff.isHidden = true
                        cell.vwOff.isHidden = true
                        //                cell.vwOff.backgroundColor = UIColor(red: 231.0/255.0, green: 76.0/255.0, blue: 60.0/255.0, alpha: 1.0)
                        cell.imgVwOff.isHidden = true
                        //                cell.lblOff.text = /arrResult[indexPath.row].offerPrice + "%" + " OFF - " + /arrResult[indexPath.row].type
                        
                    }
                    if arrResult[indexPath.row].r_is_featured == "0"{
                        cell.imgFeature.isHidden = true
                    }else{
                        cell.imgFeature.isHidden = false
                    }
                    cell.btnFavouretHome.tag = indexPath.row
                    cell.btnFavouretHome.addTarget(self, action: #selector(addToFavourt), for: .touchUpInside)
                }
            return cell
           
           
        }
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.section == 1{
        let lastItem = self.arrResult.count - 1
          if indexPath.row == lastItem {
    if  pageCount < totalCount{
        pageCount += 1
        webService.webServiceForHome(obj: self)
    }
          }
            let lastIndex = self.arrResult.count - 8
              if indexPath.row == lastItem {
                  if indexPath.row == lastItem{
                if fetchReviewSelected() == false{
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "FeedbackPopUpVC") as! FeedbackPopUpVC
                vc.modalPresentationStyle = .overFullScreen
                self.navigationController?.present(vc, animated: true, completion: nil)
                }else{
                    
                }
    }
    }
    }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 2{
        let vc = storyboard?.instantiateViewController(withIdentifier: "RestourentDetailVC") as! RestourentDetailVC
        //        saveResId(resId: /arrResult[indexPath.row].id)
        vc.r_id = /arrResult[indexPath.row].r_id
        vc.presentdate = presentdate
        vc.time = time
        vc.lattitude = /arrResult[indexPath.row].latitude
        vc.longitude = /arrResult[indexPath.row].longitude
        vc.callData = arrResult[indexPath.row]
 
        self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    @objc func addToFavourt(_ sender: UIButton){
        let cell = tblVwHome.cellForRow(at: IndexPath(row: sender.tag, section: 2)) as! HomeTVC
        cell.btnFavouretHome.setImage(UIImage(named: "heart3"), for: .normal)
        r_id  = /arrResult[sender.tag].r_id
        id = /arrResult[sender.tag].id
        webServiceFav.webServiceForAddToFav(obj: self,index:sender.tag)
    }
    @objc func selectList(sender:UIButton){
        let cell = tblVwHome.cellForRow(at: IndexPath(row: sender.tag, section: 1)) as! CusineTVC
        if self.traitCollection.userInterfaceStyle == .light {
            cell.vwList.backgroundColor = UIColor(red: 227.0/255.0, green: 227.0/255.0, blue: 227.0/255.0, alpha: 1.0)
            cell.vwMap.backgroundColor = UIColor.white
        }else{
            cell.vwList.backgroundColor = UIColor.init(red: 5.0/255.0, green: 185.0/255.0, blue: 0.0/255.0, alpha: 1.0)
            cell.vwMap.backgroundColor = UIColor(red: 227.0/255.0, green: 227.0/255.0, blue: 227.0/255.0, alpha: 1.0)
        }
            
           vwMap.isHidden = true
//           HeightMap.constant = 0
           mapVwPlus.isHidden = true
           saveMapheight(mapHeight: false)
           saveResHeight(resHeight: true)
           tblVwHome.reloadData()
          
    }
    @objc func selectMap(sender:UIButton){
        let cell = tblVwHome.cellForRow(at: IndexPath(row: sender.tag, section: 1)) as! CusineTVC
           saveResHeight(resHeight: false)
           saveMapheight(mapHeight: true)
             vwMap.isHidden = false
            mapVwPlus.isHidden = false
        if self.traitCollection.userInterfaceStyle == .light {
            cell.vwMap.backgroundColor = UIColor(red: 227.0/255.0, green: 227.0/255.0, blue: 227.0/255.0, alpha: 1.0)
            cell.vwList.backgroundColor = UIColor.white
        }else{
            cell.vwList.backgroundColor = UIColor(red: 227.0/255.0, green: 227.0/255.0, blue: 227.0/255.0, alpha: 1.0)
            cell.vwMap.backgroundColor = UIColor.init(red: 5.0/255.0, green: 185.0/255.0, blue: 0.0/255.0, alpha: 1.0)
        }
//        if UIDevice.modelName.contains("iPhone 6s") ||  UIDevice.modelName.contains("iPhone 6") ||  UIDevice.modelName.contains("iPhone SE") ||  UIDevice.modelName.contains("iPhone 7") ||  UIDevice.modelName.contains("iPhone 8") ||  UIDevice.modelName.contains("iPhone SE (2nd generation)") ||  UIDevice.modelName.contains("iPhone 12 mini"){
//            HeightMap.constant = CGFloat(220)
//        }else{
//           HeightMap.constant = CGFloat(400)
//        }
        tblVwHome.reloadData()
        //NotificationCenter.default.post(name: Notification.Name("NotificationIdentifier"), object: nil)
           
    }
   
}

extension CusineTVC:UITextFieldDelegate{
    func textFieldDidEndEditing(_ textField: UITextField) {
        saveSearchParamValue(search: /txtFldSearch.text)
        NotificationCenter.default.post(name: NSNotification.Name("HomeSearch"), object: nil, userInfo: nil)
    }
}

