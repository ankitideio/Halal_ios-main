//
//  ViewModelForReviews.swift
//  Halal
//
//  Created by snow-macmini-1 on 29/10/21.
//

import UIKit

class ViewModelForReviews: NSObject {
    func webServiceForFetchReviewa(obj:RateAndReviewVC){
        var rId = fetchResId()
        if obj.isComing == true{
            rId = "\(obj.resturantId ?? 0)"
        }
        let param = ["res_id":rId,"u_id":fetchUserId()] as [String: Any]
    ApiConnection().postDatatoServer(apiFetchMyReviewForRestuarent, parameter: param as NSDictionary, success: { (response) in
        print(response)
        let responseDict = response.dictionaryObject
        let data = FetchReviewModel.init(attributes: /responseDict as NonOptionalDictionary)
       if data.status == true{
         
           let rating = Float(/data.rating)
           obj.vwRating.rating = /rating
           obj.txtVwReview.text = data.review
           obj.lblRating.text = /data.rating
           obj.imageId = /data.reviewImageId
           obj.ratingId = /data.ratingId
           obj.arrReviewImage = /data.arrImage
           obj.clsnReview.reloadData()
           saveRatingId(ratingId: /data.ratingId)
        }else{
       
//            TostErrorMessage(view: obj.view, message: /data.message)
        }
    }) { (error) in
        TostErrorMessage(view: obj.view, message: error.localizedDescription)
       
}
    
}
    func webServiceAddReview(obj:RateAndReviewVC){
        
        var rId = fetchResId()
        if obj.isComing == true{
            rId = "\(obj.resturantId ?? 0)"
        }
        
        let param = ["res_id":rId,"userid":fetchUserId(),"rating_count":"\(/obj.vwRating.rating)","review":obj.txtVwReview.text ?? "","rating_id":/obj.ratingId] as [String: Any]
        ApiConnection().upLoadMultipleImages(strURL: apiaddReviews, images: obj.arrImage, parameters: param, sucess:{ (response) in
            print(response)
            let responseDict = response.dictionaryObject
            let data = RestaurentDetail.init(attributes: /responseDict as NonOptionalDictionary)
           if data.status == "1"{
               obj.lblRestaurantName.text = obj.restaurentName
               if obj.isComing == true{
                   SceneDelegate().makeRootController(IDStr: "ResDetail")
               }else{
                   obj.navigationController?.popViewController(animated: true)
               }
               
            }else{
                TostErrorMessage(view: obj.view, message: /data.message)
                
            }
        }) { (error) in
            TostErrorMessage(view: obj.view, message: error.localizedDescription)
    }
        
    
        
}
    func webServiceForGetAllReviews(obj:ReadAllReviewVC){
        let param = ["r_id":fetchResId()] as [String: Any]
    ApiConnection().postDatatoServer(apiReadAllReviews, parameter: param as NSDictionary, success: { (response) in
        print(response)
        let responseDict = response.dictionaryObject
        let data = OurReviewModel.init(attributes: /responseDict as NonOptionalDictionary)
       if data.message == "success"{
           for arr in /data.arrDataReview{
               obj.arrImage = arr.arrimage
           }
           obj.arrOurReview = /data.arrDataReview
           obj.tblAllReview.reloadData()
           
        }else{
            TostErrorMessage(view: obj.view, message: /data.message)
        }
    }) { (error) in
        TostErrorMessage(view: obj.view, message: error.localizedDescription)
}
    
}
    func webServiceForReviewImageDelete(obj:RateAndReviewVC){
        let param = ["review_id":obj.ratingId ?? "","review_image_id":/obj.imageId] as [String: Any]
    ApiConnection().postDatatoServer(reviewImageDelete, parameter: param as NSDictionary, success: { (response) in
        print(response)
        let responseDict = response.dictionaryObject
        let data = RestaurentDetail.init(attributes: /responseDict as NonOptionalDictionary)
       if data.imageStatus == true{
           
           obj.webService.webServiceForFetchReviewa(obj: obj)
        }else{
            TostErrorMessage(view: obj.view, message: /data.message)
        }
    }) { (error) in
        TostErrorMessage(view: obj.view, message: error.localizedDescription)
}
    
}
}
