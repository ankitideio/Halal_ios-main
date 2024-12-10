//
//  ViewModelForNearVenues.swift
//  Halal
//
//  Created by snow-macmini-1 on 09/12/21.
//

import UIKit

class ViewModelForNearVenues: NSObject {
    func webServiceForNearByVenues(obj:QuickViewVC){
        let param = ["u_id": fetchUserId(),"lattitude": fetchResCurrentLat(),"longitude": fetchResCurrentLong(),"time": obj.time ?? "","presentdate": /obj.currentDate] as [String: Any]
        
        ApiConnection().postDatatoHome(apiNearByVenues, parameter: param as NSDictionary, success: { (response) in
            print(response)
            let responseDict = response.dictionaryObject
            let data = NearByVenuesModel.init(attributes: /responseDict as NonOptionalDictionary)
           if data.status == "1"{
               
               if data.message ==  "Failure"{
                   obj.lblNotFound.isHidden = false
               }else{
                   obj.lblNotFound.isHidden = true
               }
               obj.arrNearByVenue = /data.arrNearVenus
               obj.clsnNearByRestaurent.reloadData()
            }else{
                if /data.message == "Failure" {
//                    TostErrorMessage(view: obj.view, message: "Restaurent not found")
//                 
//                    obj.lblNotFound.isHidden = false
                
                }
              
            }
        }) { (error) in
            TostErrorMessage(view: obj.view, message: error.localizedDescription)
    }
        
    }
    func webServiceForTrackActivity(obj:RestourentDetailVC){
        let timestamp = NSDate().timeIntervalSince1970
        let myTimeInterval = TimeInterval(timestamp)
        let time = String(format: "%.0f", myTimeInterval)
        let param = ["activity_type": "call_button","user_id":fetchUserId() ,"timestamp": time ,"month_name": /obj.month] as [String: Any]
        
        ApiConnection().postDatatoServer(apiTrackActivity, parameter: param as NSDictionary, success: { (response) in
            print(response)
            let responseDict = response.dictionaryObject
            let data = NearByVenuesModel.init(attributes: /responseDict as NonOptionalDictionary)
           if data.status == "1"{
               
            }else{
                if /data.message == "Failure" {
                    TostErrorMessage(view: obj.view, message: "Restaurent not found")

                }
              
            }
        }) { (error) in
            TostErrorMessage(view: obj.view, message: error.localizedDescription)
    }
        
    }
    func webServiceForTrackActivity(obj:ViewVoucherVC){
        let timestamp = NSDate().timeIntervalSince1970
        let myTimeInterval = TimeInterval(timestamp)
        let time = String(format: "%.0f", myTimeInterval)
        let param = ["activity_type": "call_button","user_id":fetchUserId() ,"timestamp": time ,"month_name": /obj.month] as [String: Any]
        
        ApiConnection().postDatatoServer(apiTrackActivity, parameter: param as NSDictionary, success: { (response) in
            print(response)
            let responseDict = response.dictionaryObject
            let data = NearByVenuesModel.init(attributes: /responseDict as NonOptionalDictionary)
           if data.status == "1"{
               
            }else{
                if /data.message == "Failure" {
                    TostErrorMessage(view: obj.view, message: "Restaurent not found")

                }
              
            }
        }) { (error) in
            TostErrorMessage(view: obj.view, message: error.localizedDescription)
    }
        
    }
    func webServiceForRestaurentTrackActivity(obj:RestourentDetailVC){
        let timestamp = NSDate().timeIntervalSince1970
        let myTimeInterval = TimeInterval(timestamp)
        let time = String(format: "%.0f", myTimeInterval)
        let param = ["activity_type": "restaurant_view","user_id":fetchUserId() ,"timestamp": time ,"month_name": /obj.month] as [String: Any]
        
        ApiConnection().postDatatoServer(apiTrackActivity, parameter: param as NSDictionary, success: { (response) in
            print(response)
            let responseDict = response.dictionaryObject
            let data = NearByVenuesModel.init(attributes: /responseDict as NonOptionalDictionary)
           if data.status == "1"{
               
            }else{
                if /data.message == "Failure" {
                    TostErrorMessage(view: obj.view, message: "Restaurent not found")

                }
              
            }
        }) { (error) in
            TostErrorMessage(view: obj.view, message: error.localizedDescription)
    }
        
    }
    func webServiceForLocationTrackActivity(obj:RestourentDetailVC){
        let timestamp = NSDate().timeIntervalSince1970
        let myTimeInterval = TimeInterval(timestamp)
        let time = String(format: "%.0f", myTimeInterval)
        let param = ["activity_type": "get_direction","user_id":fetchUserId() ,"timestamp": time ,"month_name": /obj.month,"resturant_id":obj.r_id] as [String: Any]
        
        ApiConnection().postDatatoServer(apiTrackActivity, parameter: param as NSDictionary, success: { (response) in
            print(response)
            let responseDict = response.dictionaryObject
            let data = NearByVenuesModel.init(attributes: /responseDict as NonOptionalDictionary)
           if data.status == "1"{
               
            }else{
                if /data.message == "Failure" {
                    TostErrorMessage(view: obj.view, message: "Restaurent not found")

                }
              
            }
        }) { (error) in
            TostErrorMessage(view: obj.view, message: error.localizedDescription)
    }
        
    }
}
