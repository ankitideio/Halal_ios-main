//
//  ViewModelForOffer.swift
//  Halal
//
//  Created by snow-macmini-1 on 28/10/21.
//

import UIKit

class ViewModelForOffer: NSObject {
    func webServiceForMyVoucher(obj:OffersVC){
        let param = ["user_id":fetchUserId()] as [String: Any]
        ApiConnection().postDatatoServer(apiOfferList, parameter: param as NSDictionary, success: { (response) in
            print(response)
            let responseDict = response.dictionaryObject
            let data = OfferListModel.init(attributes: /responseDict as NonOptionalDictionary)
            if data.status == true{
                obj.lblOffer.isHidden = true
                obj.arrOffers = /data.arrOffer
                obj.tblVwOffers.reloadData()
            }else{
                TostErrorMessage(view: obj.view, message: /data.message)
            }
        }) { (error) in
            TostErrorMessage(view: obj.view, message: error.localizedDescription)
    }
        
    }
    
    
}

