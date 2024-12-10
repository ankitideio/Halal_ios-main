//
//  NearByVenuesModel.swift
//  Halal
//
//  Created by snow-macmini-1 on 09/12/21.
//

import UIKit

class NearByVenuesModel{
    var status:String?
    var message:String?
    var arrNearVenus = [VenueResultModel]()
    init(attributes:NonOptionalDictionary){
        status = .status => attributes
        message = .message => attributes
        let arrResult = .result =| attributes
        for arr in /arrResult{
            let dict = VenueResultModel.init(attributes: arr as! NonOptionalDictionary)
            arrNearVenus.append(dict)
        }
    }
}
class VenueResultModel{
    var image:String?
    var name:String?
    var restaurentStatus:String?
    var rId:String?
    var latitude:String?
    var longitude:String?
    var resFav:Int?
    var cost_sign:String?
    var arrCusine = [CusineNameModel]()
    init(attributes:NonOptionalDictionary){
        image = .image => attributes
        name = .name => attributes
        restaurentStatus = .status_resturent => attributes
        rId = .r_id => attributes
        latitude = .latitude => attributes
        longitude = .longitude => attributes
        resFav = .res_fav =|| attributes
        cost_sign = .cost_sign => attributes
        let arrCusineName = .cuisines_name =| attributes
        for arr in /arrCusineName{
            let dict = CusineNameModel.init(attributes: arr as! NonOptionalDictionary)
            arrCusine.append(dict)
        }
        
    }
    
}
class CusineNameModel{
    var cuisines_name:String?
    init(attributes:NonOptionalDictionary){
        cuisines_name = .cuisines_name => attributes
        }
}
