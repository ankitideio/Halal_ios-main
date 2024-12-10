//
//  ViewModelForOfferListing.swift
//  Halal
//
//  Created by snow-macmini-6 on 28/02/22.
//

import UIKit

class ViewModelForOfferListing: NSObject {
    func webServiceForOfferListing(obj:OfferListingVC){
        let param = ["u_id": /fetchUserId(),"lattitude": /obj.latitude,"longitude": /obj.longitude,"cat_id": /obj.cat_id,"page_no": /obj.page_no,"distance": /obj.distance,"time": /obj.time,"presentdate": /obj.presentdate,"cuisine_id": /obj.cuisine_id] as [String: Any]
        
        ApiConnection().postDatatoServerHome(apiOfferListing, parameter: param as NSDictionary, success: { (response) in
            print(response)
            let responseDict = response.dictionaryObject
            let data = OfferListingModel.init(attributes: /responseDict as NonOptionalDictionary)
           if data.message == "suucess"{
              
               if data.arrResults.count > 0 {
                   obj.lblNotFound.isHidden = true
                 
               }else{
                   obj.lblNotFound.isHidden = false
            
               }
               obj.arrOfferListing = data.arrResults
               obj.tblVwOfferListing.reloadData()
              
               
            }else{
                if /data.message == "Failure" {
                    obj.lblNotFound.isHidden = false
                    obj.arrOfferListing.removeAll()
                    obj.tblVwOfferListing.reloadData()
//                    obj.tblVwOfferListing.reloadData()
//                    TostErrorMessage(view: obj.view, message: " No venues found in your area")
                
                }
              
            }
        }) { (error) in
//            TostErrorMessage(view: obj.view, message: error.localizedDescription)
    }
        
    }
}
