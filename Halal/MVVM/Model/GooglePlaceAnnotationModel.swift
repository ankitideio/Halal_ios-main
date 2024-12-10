//
//  GooglePlaceAnnotationModel.swift
//  Halal
//
//  Created by snow-macmini-6 on 20/01/22.
//

import UIKit

class GooglePlaceAnnotationModel{
    var status:String?
    var arrReview = [AnnotationPlaceId]()
    init(attributes:NonOptionalDictionary){
        status = .status => attributes
        
        let arrResult = .results =| attributes
        for arr in /arrResult{
            let dict = AnnotationPlaceId.init(attributes: arr as! NonOptionalDictionary)
            arrReview.append(dict)
        }
        
    }
}
class AnnotationPlaceId{
 var placeId:String?
    init(attributes:NonOptionalDictionary){
        placeId = .place_id => attributes
    }
}
