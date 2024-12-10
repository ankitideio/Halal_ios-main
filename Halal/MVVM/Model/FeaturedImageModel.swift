//
//  FeaturedImageModel.swift
//  Halal
//
//  Created by snow-macmini-1 on 03/11/21.
//

import UIKit

class FeaturedImageModel{
    var status:String?
    var message:String?
    var arrFeaturedImage = [FeaturedImageData]()
    init(attributes:NonOptionalDictionary){
        status = .status => attributes
        message  = .message => attributes
        let arrData = .data =| attributes
        for arr in /arrData{
            let dict = FeaturedImageData.init(attributes: arr as! NonOptionalDictionary)
            arrFeaturedImage.append(dict)
        }
    }
}
class FeaturedImageData{
    var resId:String?
    var id:String?
    var image:String?
    var res_url:String?
    
    init(attributes:NonOptionalDictionary){
        resId = .res_id => attributes
        id = .id => attributes
        image = .image => attributes
        res_url = .res_url => attributes
    }
}
