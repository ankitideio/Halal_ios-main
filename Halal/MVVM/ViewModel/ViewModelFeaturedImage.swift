//
//  ViewModelFeaturedImage.swift
//  Halal
//
//  Created by snow-macmini-1 on 03/11/21.
//

import UIKit

class ViewModelFeaturedImage: NSObject {
    func webServiceForFeaturedImage(obj:DiscoverVC){
        ApiConnection().getDatatoServerWithoutParms(apiFeaturedImage, success: { (response) in
            print(response)
            let responseDict = response.dictionaryObject
            let data = FeaturedImageModel.init(attributes: /responseDict as NonOptionalDictionary)
            if data.status == "success"{
                obj.arrFeaturedImage = /data.arrFeaturedImage
                obj.collVwBanner.reloadData()
            }else{
                TostErrorMessage(view: obj.view, message: /data.message)
            }
        }) { (error) in
            TostErrorMessage(view: obj.view, message: error.localizedDescription)
        }
        
    }
}
