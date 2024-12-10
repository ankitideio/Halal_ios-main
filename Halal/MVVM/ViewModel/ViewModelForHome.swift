//
//  ViewModelForHome.swift
//  Halal
//
//  Created by snow-macmini-2 on 18/10/21.
//

import UIKit

class ViewModelForHome: NSObject {
    
//MARK:- GET API
    func webServiceForCusineList(obj:CusineTVC){
        ApiConnection().getDatatoServerWithoutParms(apiGetCuisinesList, success: { (response) in
            print(response)
            let responseDict = response.dictionaryObject
            let data = HomeModel.init(attributes: /responseDict as NonOptionalDictionary)
            if data.status == "Success"{
               
                obj.arrCusine = /data.arrData
                obj.clsnCusine.reloadData()
            }else{
                TostErrorMessage(view: obj.contentView, message: /data.message)
            }
        }) { (error) in
            TostErrorMessage(view: obj.contentView, message: error.localizedDescription)
        }
        
    }
    func webServiceForHome(obj:HomeVC){
        let param = ["u_id": fetchUserId(),"lattitude": obj.lat,"longitude":obj.long,"cat_id": obj.cat_id,"page_no":obj.pageCount,"distance": obj.distance,"time": obj.time,"presentdate": obj.presentdate,"cuisine_id": fetchCusineId(),"search":/fetchSearchParamValue()] as [String: Any]
        print(param)
        ApiConnection().postDatatoServerHome(apiHome, parameter: param as NSDictionary, success: { (response) in
            print(response)
            let responseDict = response.dictionaryObject
            let data = FavouirotModel.init(attributes: /responseDict as NonOptionalDictionary)
           if data.status == "1"{
            
               saveCusineId(cusineId: "")
               if fetchMapheight() == true{
//                   if UIDevice.modelName.contains("iPhone 6s") ||  UIDevice.modelName.contains("iPhone 6") ||  UIDevice.modelName.contains("iPhone SE") ||  UIDevice.modelName.contains("iPhone 7") ||  UIDevice.modelName.contains("iPhone 8") ||  UIDevice.modelName.contains("iPhone SE (2nd generation)") ||  UIDevice.modelName.contains("iPhone 12 mini"){
//                       obj.HeightMap.constant = CGFloat(220)
//                   }else{
//                       obj.HeightMap.constant = CGFloat(420)
//                   }
                   obj.vwMap.isHidden = false
               }else{
//                   obj.HeightMap.constant = CGFloat(0)
                   obj.vwMap.isHidden = true
               }
           
               obj.arrBanner.removeAll()
               obj.totalCount = /data.totalPages
               obj.arrResult.append(contentsOf: /data.arrFavourit_list)
               obj.arrBanner.append(contentsOf: /data.arrBanner)
               NotificationCenter.default.post(name: Notification.Name("NotificationIdentifier"), object: nil)
             
               obj.tblVwHome.reloadData()
               obj.searchStatus = false
               obj.annotationsOnMap()
              
            }else{
                if /data.message == "Failure" {
                    obj.arrResult.removeAll()
                    obj.arrBanner.removeAll()
                    obj.arrBanner.append(contentsOf: /data.arrBanner)
                    
                    obj.tblVwHome.reloadData()
                    if fetchMapheight() == true{
                       
                        obj.vwMap.isHidden = false
//                        if UIDevice.modelName.contains("iPhone 6s") ||  UIDevice.modelName.contains("iPhone 6") ||  UIDevice.modelName.contains("iPhone SE") ||  UIDevice.modelName.contains("iPhone 7") ||  UIDevice.modelName.contains("iPhone 8") ||  UIDevice.modelName.contains("iPhone SE (2nd generation)") ||  UIDevice.modelName.contains("iPhone 12 mini"){
//                            obj.HeightMap.constant = CGFloat(220)
//                        }else{
//                            obj.HeightMap.constant = CGFloat(400)
//                        }
                    }else{
//                        obj.HeightMap.constant = CGFloat(0)
                        obj.vwMap.isHidden = true
                    }
                   
                    TostErrorMessage(view: obj.view, message: " No venues found in your area")
                
                }
              
            }
        }) { (error) in
            TostErrorMessage(view: obj.view, message: error.localizedDescription)
    }
        
    }
    
    
   
    
    
}
