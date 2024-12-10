//
//  OfferListModel.swift
//  Halal
//
//  Created by snow-macmini-1 on 30/10/21.
//

import UIKit
class OfferListModel{
    var status:Bool?
    var message:String?
 
    var arrOffer = [offersData]()
    
        init(attributes:NonOptionalDictionary){
            status = .status =/ attributes
            message = .message => attributes
        let offers = .data =| attributes
            for arr in /offers{
                let dictOffer = offersData.init(attributes: arr as! NonOptionalDictionary)
                arrOffer.append(dictOffer)
          }
    }
}

class offersData{
    
    var offer_price:String?
    var end_date:String?
    var type:String?
    var minimum_order:String?
    var offer_desc:String?
    var offer_id:String?
    var r_name:String?
    var how_to_redeem:String?
    init(attributes:NonOptionalDictionary){
        offer_price = .offer_price => attributes
        end_date = .end_date => attributes
        minimum_order = .minimum_order => attributes
        type = .type => attributes
        offer_desc = .offer_desc => attributes
        offer_id = .offer_id => attributes
        r_name = .r_name => attributes
        how_to_redeem = .how_to_redeem => attributes
}
}
