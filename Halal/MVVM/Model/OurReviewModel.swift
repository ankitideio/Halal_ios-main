//
//  OurReviewModel.swift
//  Halal
//
//  Created by snow-macmini-1 on 19/11/21.
//

import UIKit

class OurReviewModel{
    var message:String?
    var arrDataReview = [ReviewDataModel]()
    init(attributes:NonOptionalDictionary){
        message = .message => attributes
        let arrData = .data =| attributes
        for arr in /arrData{
            let dict = ReviewDataModel.init(attributes: arr as! NonOptionalDictionary)
            arrDataReview.append(dict)
        }
    }
}
class ReviewDataModel{
    var profileImage:String?
    var userName:String?
    var review:String?
    var arrimage = [String]()
    var postDate:String?
    var rating:String?
    init(attributes:NonOptionalDictionary){
        profileImage = .profileimage => attributes
        userName = .username => attributes
        review = .review => attributes
        postDate = .date_of_post => attributes
        rating = .rating => attributes
        let arrImage = .images =| attributes
        for arr in /arrImage{
            arrimage.append(arr as! String)
        }
    }
    
}
