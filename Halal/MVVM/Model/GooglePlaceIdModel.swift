//
//  GooglePlaceIdModel.swift
//  Halal
//
//  Created by snow-macmini-6 on 20/01/22.
//

import UIKit

class GooglePlaceIdModel{
    var status:String?
    var arrReview = [ResPlaceIdModel]()
    init(attributes:NonOptionalDictionary){
        status = .status => attributes
        
        let arrResult = .results =| attributes
        for arr in /arrResult{
            let dict = ResPlaceIdModel.init(attributes: arr as! NonOptionalDictionary)
            arrReview.append(dict)
        }
        
    }
}
class ResPlaceIdModel{
 var placeId:String?
    init(attributes:NonOptionalDictionary){
        placeId = .place_id => attributes
    }
}
