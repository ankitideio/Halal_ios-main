//
//  OfferListingModel.swift
//  Halal
//
//  Created by snow-macmini-6 on 28/02/22.
//

import UIKit

class OfferListingModel{
    var message:String?
    var status:String?
    var total_records:Int?
    var total_pages:Int?
    var arrResults = [OfferLitingResult]()
    init(attributes:NonOptionalDictionary){
        message = .message => attributes
        status = .status => attributes
        total_records = .total_records =|| attributes
        total_pages = .total_pages =|| attributes
        let results = .result =| attributes
        for arr in /results{
            let dict = OfferLitingResult.init(attributes: arr as! NonOptionalDictionary)
            arrResults.append(dict)
        }
    }
}
class OfferLitingResult{
    var image:String?
    var status:String?
    var cost_sign:String?
    var type:String?
    var latitude:String?
    var longitude:String?
    var id:String?
    var r_contact:String?
    var r_id:String?
    var res_fav:Int?
    var offer_price:String?
    var name:String?
    var r_is_featured:String?
    var arrCusineName = [CusineNameListingModel]()
    init(attributes:NonOptionalDictionary){
        image = .image => attributes
        status = .status => attributes
        cost_sign = .cost_sign => attributes
        type = .type => attributes
        latitude = .latitude => attributes
        longitude = .longitude => attributes
        id = .id => attributes
        r_id = .r_id => attributes
        r_contact = .r_contact => attributes
        res_fav = .res_fav =|| attributes
        offer_price = .offer_price => attributes
        name = .name => attributes
        r_is_featured = .r_is_featured => attributes
        let arrCusineListing = .cuisines_name =| attributes
        for arr in /arrCusineListing{
            let dict = CusineNameListingModel.init(attributes: arr as! NonOptionalDictionary)
            arrCusineName.append(dict)
        }
    }

}
class CusineNameListingModel{
    var cuisines_name:String?
    init(attributes:NonOptionalDictionary){
        cuisines_name = .cuisines_name => attributes
    }
    
}
