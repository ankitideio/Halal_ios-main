//
//  GetAllReviewsModel.swift
//  Halal
//
//  Created by snow-macmini-1 on 19/11/21.
//

import UIKit

class GetAllReviewsModel{
    var status:String?
    var rating:Double?
    var arrGoogleReview = [GetGoogleReviewsModel]()
    init(attributes:NonOptionalDictionary){
        status = .status => attributes
        let result = .result =< attributes
        let arrReview = .reviews =| result
        rating = .rating =^^ result
        for arr in /arrReview{
            let dict = GetGoogleReviewsModel.init(attributes: arr as! NonOptionalDictionary)
            arrGoogleReview.append(dict)
        }
    }
}
class GetGoogleReviewsModel{
    var rating:Int?
    var timeDescription:String?
    var authorUrl:String?
    var text:String?
    var authorName:String?
    var profilePhoto:String?
    init(attributes:NonOptionalDictionary){
        rating = .rating =|| attributes
        timeDescription = .relative_time_description => attributes
        authorUrl = .author_url => attributes
        text = .text => attributes
        authorName = .author_name => attributes
        profilePhoto = .profile_photo_url => attributes
    }
}
