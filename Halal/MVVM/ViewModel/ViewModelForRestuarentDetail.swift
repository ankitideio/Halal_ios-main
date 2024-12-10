//
//  ViewModelForRestuarentDetail.swift
//  Halal
//
//  Created by snow-macmini-1 on 29/10/21.
//

import UIKit

class ViewModelForRestuarentDetail: NSObject {
    func webServiceForGallery(obj:RestourentDetailVC){
        let param = ["u_id": fetchUserId(),"r_id":obj.r_id,"lattitude":fetchDistanceLat(),"longitude":fetchDistanceLong(),"time":obj.time ?? "","presentdate":/obj.presentdate] as [String: Any]
        ApiConnection().postDatatoServer(apiRestaurantDetail, parameter: param as NSDictionary, success: { (response) in
            print(response)
            let responseDict = response.dictionaryObject
            let data = RestaurentDetail.init(attributes: /responseDict as NonOptionalDictionary)
            if data.status == "1"{
               
//                obj.webServiceReview.webServiceForResPlaceId(obj: obj)
                if  /data.res_fav == 1{
                    obj.btnFvrt.setImage(UIImage(named: "NewFav"), for: .normal)
                }else{
                    obj.btnFvrt.setImage(UIImage(named: "UnFavNew"), for: .normal)
                }
                saveResName(restaurentName: /data.name)
                obj.webServiceReview.webServiceForAllResPlaceId(obj: obj)
                saveTotalRating(totlaRating: /data.rest_avg_rating)
                saveResTime(resTime: /data.time)
                saveResWebSite(resWebsite: /data.webSite)
                saveResLatitude(resLatitude: /data.latitude)
                saveResLongitude(resLongitude: /data.longitude)
                saveResId(resId: /data.resId)
                
                if data.arrMoreInfo.count > 0{
                data.arrMoreInfo.removeLast()
                }
                obj.arrInfo = /data.arrMoreInfo
                obj.tblVwHalalOption.reloadData()
//                obj.showDistance()
                let vc = obj.children[0] as! ReviewsVC
                vc.resName = /data.name
            
                if /data.arrReviews.count > 0{
             
                    if /data.arrReviews[0].arrReviewImage == [] {
                        obj.heightVw.constant = CGFloat(340)
                    }else{
                        obj.heightVw.constant = CGFloat(450)
                    }
                    
                    vc.arrReviews =  data.arrReviews[0]
                    vc.ratingId = data.arrReviews[0].ratingId
                    vc.arrReviewImage = data.arrReviews[0].arrReviewImage
                    saveReviewCount(reviewCount: "\(/data.arrReviews.count)")
//                    vc.webService.webServiceForResPlaceId(obj: vc)
                    vc.tblVwReviews.reloadData()
                }else{
                    
                    obj.heightVw.constant = CGFloat(370)
                    vc.webService.webServiceForResPlaceId(obj: vc)
                    if vc.arrGoogleReview == nil{
                        obj.heightVw.constant = CGFloat(370)
                        saveAllReviewPlaceId(allReviewPlaceId: "")
                        
                    }
                    vc.tblVwReviews.reloadData()
     
                }
            
                obj.lblAvrageCost.text = /data.avaragecost_range
                if obj.lblAvrageCost.text == ""{
                    obj.lblAvrageCost.text = "NA"
                }
                if data.delivary_type == "Yes"{
                    obj.lblDeliveryStatus.text = "Delivery Available"
                }else{
                    obj.lblDeliveryStatus.text = "Delivery Not Available"
                }
              
                if data.status_resturent == "Open"{
                    obj.lblNowOpen.isHidden = true
                    let loginText = "Now Open - \(/fetchResTime())"
                    let login = "Now Open"
                    
                    if obj.traitCollection.userInterfaceStyle == .dark {
                        let formattedText = String.format(strings: [login],
                                                          boldFont: UIFont.boldSystemFont(ofSize: 17),
                                                          boldColor: UIColor.init(red: 5.0/255.0, green: 185.0/255.0, blue: 0.0/255.0, alpha: 1.0),
                                                          inString: loginText,
                                                          font: UIFont.systemFont(ofSize: 17),
                                                          color: UIColor.white)
                        obj.lblOpeningClosingStatus.attributedText = formattedText
                        obj.lblOpeningClosingStatus.numberOfLines = 0
                        obj.lblOpeningClosingStatus.textAlignment = .center
                    }else{
                        let formattedText = String.format(strings: [login],
                                                          boldFont: UIFont.boldSystemFont(ofSize: 17),
                                                          boldColor: UIColor.init(red: 5.0/255.0, green: 185.0/255.0, blue: 0.0/255.0, alpha: 1.0),
                                                          inString: loginText,
                                                          font: UIFont.systemFont(ofSize: 17),
                                                          color: UIColor.black)
                        obj.lblOpeningClosingStatus.attributedText = formattedText
                        obj.lblOpeningClosingStatus.numberOfLines = 0
                        obj.lblOpeningClosingStatus.textAlignment = .center
                    }
                }else{
                    obj.lblNowOpen.isHidden = true
                    obj.lblOpeningClosingStatus.text = "Currently Closed"
                }
              
                obj.lblRestuarentName.text = /data.name
                obj.webSite = /data.webSite
                obj.lblKm.text = /data.total_distance + " Km"
                obj.imgVwRestuarent.sd_setImage(with: URL(string: /data.image), placeholderImage: UIImage(named: ""), options: .refreshCached, context: nil)
                
                obj.lblEstimateType.text = /data.estb_type
                if obj.lblEstimateType.text == ""{
                    obj.lblEstimateType.text = "NA"
                }
                if /data.arrCuisines.count > 0{
                obj.lblCusineName.text = /data.arrCuisines[0].cuisines_name
                }
                
                let vcHour = obj.children[4] as! HoursVC
                vcHour.hourData =  data.arrHour[0]
                vcHour.lblSunOpn.text = data.arrHour[0].sun_opening_time
                vcHour.lblSunCls.text = data.arrHour[0].sun_closeing_time
                vcHour.lblMonOpn.text = data.arrHour[0].mdonday_opening_time
                vcHour.lblMonCls.text = data.arrHour[0].mdonday_closeing_time
                vcHour.lblTueOpn.text = data.arrHour[0].tuesday_opening_time
                vcHour.lblTueCls.text = data.arrHour[0].tuesday_closeing_time
                vcHour.lblWedOpn.text = data.arrHour[0].wednesday_opening_time
                vcHour.lblWedCls.text = data.arrHour[0].wednesday_closeing_time
                vcHour.lblThuOpn.text = data.arrHour[0].thursday_opening_time
                vcHour.lblThuCls.text = data.arrHour[0].thursday_closeing_time
                vcHour.lblFriOpn.text = data.arrHour[0].friday_opening_time
                vcHour.lblFriCls.text = data.arrHour[0].friday_closeing_time
                vcHour.lblSatOpn.text = data.arrHour[0].saturday_opening_time
                vcHour.lblSatCls.text = data.arrHour[0].saturday_closeing_time
                let vcGallary = obj.children[3] as! GalleryVC
                vcGallary.webService.webServiceForGallery(obj: vcGallary)
                let vcOffer = obj.children[2] as! OffersVC
                vcOffer.webService.webServiceForOffers(obj: vcOffer)
                let vcMenu = obj.children[1] as! MenuVC
                vcMenu.webService.webServiceForMenu(obj: vcMenu)
                if data.arrHour[0].sun_opening_time == "" {
                    vcHour.lblSunTo.text = "NA"
        
                }else{
                    
                }
                if data.arrHour[0].mdonday_opening_time == ""{
                    vcHour.lblMonTo.text = "NA"
                  
                }else{
                    
                }
                if data.arrHour[0].tuesday_opening_time  == "" {
                    vcHour.lblTueTo.text = "NA"
                    
                }else{
                    
                }
                if data.arrHour[0].wednesday_opening_time == "" {
                    vcHour.lblWedTo.text = "NA"
                }else{
                    
                }
                if data.arrHour[0].thursday_opening_time == ""{
                    vcHour.lblThuTo.text = "NA"
                } else{
                    
                }
                if data.arrHour[0].friday_opening_time == ""{
                    vcHour.lblFriTo.text = "NA"
                }else{
                    
                }
                if data.arrHour[0].saturday_opening_time == ""{
                    vcHour.lblSatTo.text = "NA"
                }else{
                    
                }
               
                
                obj.arrNearByRestrnt = /data.arrNearByRestaurent
        
                obj.collVwRestourentDetail.reloadData()
                obj.annotationsOnMap()
            
               
            }else{
                TostErrorMessage(view: obj.view, message: /data.message)
            }
        }) { (error) in
            TostErrorMessage(view: obj.view, message: error.localizedDescription)
        }
        
    }
    
    func webServiceForAnalytics(obj:RestourentDetailVC,type:Int){
        let param = ["user_id": fetchUserId(),"r_id":obj.r_id,"type":"\(/type)"] as [String: Any]
        
        ApiConnection().postDatatoServer(apiTrackAnalytics, parameter: param as NSDictionary, success: { (response) in
            print(response)
            let responseDict = response.dictionaryObject
            let data = GallaryImageModel.init(attributes: /responseDict as NonOptionalDictionary)
            if data.status == true{
         
            }else{
//                TostErrorMessage(view: obj.view, message: /data.message)
            }
        }) { (error) in
            TostErrorMessage(view: obj.view, message: error.localizedDescription)
        }
        
    }
    
    func webServiceForGallery(obj:GalleryVC){
        let param = ["res_id":fetchResId()] as [String: Any]
        
        ApiConnection().postDatatoServer(apiGalleryImgOnResDetail, parameter: param as NSDictionary, success: { (response) in
            print(response)
            let responseDict = response.dictionaryObject
            let data = GallaryImageModel.init(attributes: /responseDict as NonOptionalDictionary)
            if data.status == true{
                if /data.arrGallryRslt.count == 0{
                    obj.lblNotFound.isHidden = false
                    
                }else{
                    obj.lblNotFound.isHidden = true
                }
                obj.arrGallery = /data.arrGallryRslt
                obj.collVwGallery.reloadData()
                
            }else{
//                TostErrorMessage(view: obj.view, message: /data.message)
            }
        }) { (error) in
            TostErrorMessage(view: obj.view, message: error.localizedDescription)
        }
        
    }
    
    func webServiceForMenu(obj:MenuVC){
            let param = ["r_id":fetchResId()] as [String: Any]
           
            ApiConnection().postDatatoServer(apiMenu, parameter: param as NSDictionary, success: { (response) in
                let responseDict = response.dictionaryObject
                let data = MenuListModel.init(attributes: /responseDict as NonOptionalDictionary)
                print(response)
               if data.status == "success"{
                   obj.arrMenu = /data.arrMenuRslt
                   obj.clsnMenu.reloadData()
                   if /data.arrMenuRslt.count == 0 {
                       obj.lblNotAvailable.isHidden = false
                   }else{
                       obj.lblNotAvailable.isHidden = true
                   }
                }else{
                    TostErrorMessage(view: obj.view, message: /data.message)
                }
            }) { (error) in
                TostErrorMessage(view: obj.view, message: error.localizedDescription)
        }
            
        }
        
    
    
    func webServiceForOffers(obj:MenuVC){
        let param = ["r_id":fetchResId()] as [String: Any]
        
        ApiConnection().postDatatoServer(apiOfferList, parameter: param as NSDictionary, success: { (response) in
            let responseDict = response.dictionaryObject
            let data = RestaurentDetail.init(attributes: /responseDict as NonOptionalDictionary)
            if data.status == "1"{
                
            }else{
                TostErrorMessage(view: obj.view, message: /data.message)
            }
        }) { (error) in
            TostErrorMessage(view: obj.view, message: error.localizedDescription)
        }
        
    }
    
}

