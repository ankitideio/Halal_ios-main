//
//  ViewModelForGoogleReview.swift
//  Halal
//
//  Created by snow-macmini-1 on 18/11/21.
//

import UIKit

class ViewModelForGoogleReview: NSObject {


    func webServiceForResPlaceId(obj:ReviewsVC){
        ApiConnection().getDatatoServerWithoutParmsReview(apiGoogleReview + fetchResName().filter {!$0.isWhitespace} + "&key=AIzaSyAwDJEMBWF47UbCpPlGh-86vBpN7ggsfDo",  success: { (response) in
            print(response)
            let responseDict = response.dictionaryObject
            let data = GooglePlaceIdModel.init(attributes: /responseDict as NonOptionalDictionary)
            if data.status == "OK"{
                for arr in /data.arrReview{
                    savePlaceId(placeId: /arr.placeId)
                    obj.webService.webServiceForRviews(obj: obj)
                }


            }else{
//                TostErrorMessage(view: obj.view, message: /data.status)
            }
        }) { (error) in
//            TostErrorMessage(view: obj.view, message: error.localizedDescription)
        }

    }
    func webServiceForAllResPlaceId(obj:RestourentDetailVC){
        ApiConnection().getDatatoServerWithoutParmsReview(apiGoogleReview + fetchResName().filter {!$0.isWhitespace} + "&key=AIzaSyAwDJEMBWF47UbCpPlGh-86vBpN7ggsfDo",  success: { (response) in
            print(response)
            let responseDict = response.dictionaryObject
            let data = GooglePlaceIdModel.init(attributes: /responseDict as NonOptionalDictionary)
            if data.status == "OK"{
                for arr in /data.arrReview{
                    saveAllReviewPlaceId(allReviewPlaceId: /arr.placeId)
                }


            }else{
//                TostErrorMessage(view: obj.view, message: /data.status)
//                saveAllReviewPlaceId(allReviewPlaceId: "")
            }
        }) { (error) in
//            TostErrorMessage(view: obj.view, message: error.localizedDescription)
            
        }

    }
    func webServiceForRviews(obj:ReviewsVC){
        ApiConnection().getDatatoServerWithoutParmsReview(apiGoogleReviewPlace + fetchPlaceId() + "&key=AIzaSyAwDJEMBWF47UbCpPlGh-86vBpN7ggsfDo",  success: { (response) in
            print(response)
            let responseDict = response.dictionaryObject
            let data = GetAllReviewsModel.init(attributes: /responseDict as NonOptionalDictionary)
            if data.status == "OK"{
                saveGoogleReviewCount(googleReviewCount: "\(/data.arrGoogleReview.count)")
                saveResRating(resRating: "\(/data.rating)")
                if data.arrGoogleReview.count > 0{
                    obj.arrGoogleReview = data.arrGoogleReview[0]
                    obj.tblVwReviews.reloadData()
                }
    
            }else{
//                TostErrorMessage(view: obj.view, message: /data.status)
            }
        }) { (error) in
            TostErrorMessage(view: obj.view, message: error.localizedDescription)
        }
        
    }
    func webServiceForAllReviews(obj:ReadAllReviewVC){
        ApiConnection().getDatatoServerWithoutParmsReview(apiGoogleReviewPlace + fetchAllReviewPlaceId() + "&key=AIzaSyAwDJEMBWF47UbCpPlGh-86vBpN7ggsfDo",  success: { (response) in
            print(response)
            let responseDict = response.dictionaryObject
            let data = GetAllReviewsModel.init(attributes: /responseDict as NonOptionalDictionary)
            if data.status == "OK"{
                obj.arrGoogleReview = /data.arrGoogleReview
                obj.tblAllReview.reloadData()
    
            }else{
//                TostErrorMessage(view: obj.view, message: /data.status)
            }
        }) { (error) in
            TostErrorMessage(view: obj.view, message: error.localizedDescription)
        }
        
    }
   
}
