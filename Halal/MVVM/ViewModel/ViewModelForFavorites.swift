//
//  ViewModelForFavorites.swift
//  Halal
//
//  Created by snow-macmini-2 on 19/10/21.
//

import UIKit

class ViewModelForFavorites: NSObject {
    func webServiceForAddToFav(obj:HomeVC,index:NSInteger){
     
        ApiConnection().postDatatoServer(apiAddToFav + "user_id=\(fetchUserId())&" + "r_id=\(/obj.r_id)", parameter: [:], success: { (response) in
            print(response)
            let responseDict = response.dictionaryObject
            let data = FavouirotModel.init(attributes: /responseDict as NonOptionalDictionary)
            if data.flag == "true"{

                obj.alert(message: /data.message)
            }else{
             
                TostErrorMessage(view: obj.view, message: /data.message)
            }
        }) { (error) in
            TostErrorMessage(view: obj.view, message: error.localizedDescription)
    }

   }
    func webServiceForAddToFavDetail(obj:RestourentDetailVC,index:NSInteger){
     
        ApiConnection().postDatatoServer(apiAddToFav + "user_id=\(fetchUserId())&" + "r_id=\(/obj.r_id)", parameter: [:], success: { (response) in
            print(response)
            let responseDict = response.dictionaryObject
            let data = FavouirotModel.init(attributes: /responseDict as NonOptionalDictionary)
            if data.flag == "true"{
                obj.alert(message: /data.message)
            }else{
             
                TostErrorMessage(view: obj.view, message: /data.message)
            }
        }) { (error) in
            TostErrorMessage(view: obj.view, message: error.localizedDescription)
    }

   }
    func webServiceForAddToFavNearVenue(obj:QuickViewVC,index:NSInteger){
     
        ApiConnection().postDatatoServer(apiAddToFav + "user_id=\(fetchUserId())&" + "r_id=\(/fetchResIdNear())", parameter: [:], success: { (response) in
            print(response)
            let responseDict = response.dictionaryObject
            let data = FavouirotModel.init(attributes: /responseDict as NonOptionalDictionary)
            if data.flag == "true"{
             
                obj.alert(message: /data.message)
            }else{
             
                TostErrorMessage(view: obj.view, message: /data.message)
            }
        }) { (error) in
            TostErrorMessage(view: obj.view, message: error.localizedDescription)
    }

   }
    func webServiceForAddToFavDetailResturant(obj:RestourentDetailVC){
     
        ApiConnection().postDatatoServer(apiAddToFav + "user_id=\(fetchUserId())&" + "r_id=\(/obj.r_id)", parameter: [:], success: { (response) in
            print(response)
            let responseDict = response.dictionaryObject
            let data = FavouirotModel.init(attributes: /responseDict as NonOptionalDictionary)
            if data.flag == "true"{
              
                obj.alert(message: /data.message)
            }else{
             
                TostErrorMessage(view: obj.view, message: /data.message)
            }
        }) { (error) in
            TostErrorMessage(view: obj.view, message: error.localizedDescription)
    }

   }
    
    func webServiceForFavourites(obj:YourFavouritisVC){
        let param = ["user_id":fetchUserId(),"time":obj.time ?? "","presentdate":/obj.presentDate] as [String: Any]
        ApiConnection().postDatatoServer(apiFavoritesList, parameter: param as NSDictionary, success: { (response) in
            print(response)
            let responseDict = response.dictionaryObject
            let data = FavouirotModel.init(attributes: /responseDict as NonOptionalDictionary)
            if data.status == "1"{
                for arr in data.arrResturentFavList{
                    obj.rId = arr.rId
                    obj.lat = arr.latitude
                    obj.long = arr.longitude
                }
                if /data.arrResturentFavList.count > 0 {
                obj.arrRestuentFav = /data.arrResturentFavList
                obj.tblVwYourFavourites.reloadData()
                }else{
                   
                    obj.arrRestuentFav.removeAll()
                    obj.tblVwYourFavourites.reloadData()
                }
            }else{
                TostErrorMessage(view: obj.view, message: /data.message)
            }
        }) { (error) in
            TostErrorMessage(view: obj.view, message: error.localizedDescription)
    }
        
    }
    func webServiceForRemoveFvrt(obj:YourFavouritisVC){

        ApiConnection().postDatatoServer(apiRemoveFvrt + "user_id=\(fetchUserId())&" + "r_id=\(/obj.r_id)", parameter: [:], success: { (response) in
            print(response)
            let responseDict = response.dictionaryObject
            let data = FavouirotModel.init(attributes: /responseDict as NonOptionalDictionary)
            if data.flag == "true"{
                
                obj.webService.webServiceForFavourites(obj: obj)
               
            }else{
                TostErrorMessage(view: obj.view, message: /data.message)
            }
        }) { (error) in
            TostErrorMessage(view: obj.view, message: error.localizedDescription)
    }
   }
    func webServiceForAddToFavOfferListing(obj:OfferListingVC,index:NSInteger){
     
        ApiConnection().postDatatoServer(apiAddToFav + "user_id=\(fetchUserId())&" + "r_id=\(/obj.r_id)", parameter: [:], success: { (response) in
            print(response)
            let responseDict = response.dictionaryObject
            let data = FavouirotModel.init(attributes: /responseDict as NonOptionalDictionary)
            if data.flag == "true"{

                obj.alert(message: /data.message)
            }else{
             
                TostErrorMessage(view: obj.view, message: /data.message)
            }
        }) { (error) in
            TostErrorMessage(view: obj.view, message: error.localizedDescription)
    }

   }
}
