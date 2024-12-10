//
//  GoogleReviewModel.swift
//  Halal
//
//  Created by snow-macmini-1 on 18/11/21.
//

import UIKit

class GoogleReviewModel{
    var status:String?
    var arrReview = [ReviewResult]()
    init(attributes:NonOptionalDictionary){
        status = .status => attributes
        
        let arrResult = .results =| attributes
        for arr in /arrResult{
            let dict = ReviewResult.init(attributes: arr as! NonOptionalDictionary)
            arrReview.append(dict)
        }
        
    }
}
class ReviewResult{
 var placeId:String?
    init(attributes:NonOptionalDictionary){
        placeId = .place_id => attributes
    }
}
