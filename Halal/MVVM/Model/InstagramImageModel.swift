//
//  InstagramImageModel.swift
//  Halal
//
//  Created by snow-macmini-1 on 29/11/21.
//

import UIKit

class InstagramImageModel{
   var arrImage = [InstaImageData]()
    init(attributes:NonOptionalDictionary){
    let arrInstaImage = .data =| attributes
        for arr in /arrInstaImage{
            let dict = InstaImageData.init(attributes: arr as! NonOptionalDictionary)
            arrImage.append(dict)
}
}
}
class InstaImageData{
    var image:String?
    var caption:String?
    var userName:String?
    var thumbnail_url:String?
    var permalink:String?
    
    init(attributes:NonOptionalDictionary){
        image = .media_url => attributes
        caption = .caption => attributes
        userName = .username => attributes
        thumbnail_url = .thumbnail_url => attributes
        permalink = .permalink => attributes
    }
}
