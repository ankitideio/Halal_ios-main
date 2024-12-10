//
//  ViewModelForInstagramImage.swift
//  Halal
//
//  Created by snow-macmini-1 on 29/11/21.
//

import UIKit

class ViewModelForInstagramImage: NSObject {
    func webServiceForInstagramImage(obj:DiscoverVC){
        ApiConnection().getDatatoServerWithoutParmsReview(apiInstagramApi,  success: { (response) in
            print(response)
            let responseDict = response.dictionaryObject
            let data = InstagramImageModel.init(attributes: /responseDict as NonOptionalDictionary)
            obj.arrInstaImage = /data.arrImage
            obj.collVwList.reloadData()
           
            
        }) { (error) in
            TostErrorMessage(view: obj.view, message: error.localizedDescription)
        }
        
    }
}
