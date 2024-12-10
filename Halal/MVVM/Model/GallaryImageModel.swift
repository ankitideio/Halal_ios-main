//
//  GallaryImageModel.swift
//  Halal
//
//  Created by snow-macmini-1 on 30/10/21.
//

import UIKit
class GallaryImageModel{
    var image:String?
    var status:Bool?
    var message:String?
    var arrGallryRslt = [galleryResult]()
    
        init(attributes:NonOptionalDictionary){
            image = .image => attributes
            status = .status =/ attributes
            message = .message => attributes
            
            let galleryPhoto = .result =| attributes
            for arr in /galleryPhoto{
                let dictGallery = galleryResult.init(attributes: arr as! NonOptionalDictionary)
                arrGallryRslt.append(dictGallery)
          }
    }
}

class galleryResult{
    
    var gal_image_name:String?
    init(attributes:NonOptionalDictionary){
        gal_image_name = .gal_image_name => attributes
}

}


