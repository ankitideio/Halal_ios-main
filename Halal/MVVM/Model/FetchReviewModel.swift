//
//  FetchReviewModel.swift
//  Halal
//
//  Created by snow-macmini-1 on 02/11/21.
//

import UIKit

class FetchReviewModel {
    var status:Bool?
    var message :String?
    var reviewImageId:String?
    var review:String?
    var ratingId:String?
    var reviewStatus:String?
    var userId:String?
    var resId:String?
    var postDate:String?
    var rating:String?
    var arrImage = [Revieimage]()
    init(attributes:NonOptionalDictionary){
        status = .status =/ attributes
        message = .message => attributes
        let resultDict = .result =< attributes
        reviewImageId = .review_image_id => resultDict
        ratingId = .rating_id => resultDict
        reviewStatus = .status => resultDict
        userId = .u_id => resultDict
        review = .review => resultDict
        resId = .res_id => resultDict
        rating = .rating => resultDict
        let image = .images =| resultDict
        for arr in /image{
            let dict = Revieimage.init(attributes: arr as! NonOptionalDictionary)
            arrImage.append(dict)
        }
    }
}
class Revieimage{
    var id:Int?
    var review_images:String?
    init(attributes:NonOptionalDictionary){
        id = .id =|| attributes
        review_images = .review_images => attributes
    }
}
