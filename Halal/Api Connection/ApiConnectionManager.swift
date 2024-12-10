//
//  APIConnectionManager.swift
//  Clipr
//
//  Created by Snow-Macmini-2 on 20/11/18.
//  Copyright © 2018 Snow-Macmini-2. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON
import CoreLocation

//import Toast_Swift

class ApiConnection {
    func  postDatatoServer(_ strURL: String,parameter:NSDictionary, success:@escaping (JSON) -> Void, failure:@escaping (Error) -> Void) {
        
        guard Connectivity.isConnectedToInternet == true else {
            InternetErrorToast(view: (UIApplication.shared.windows.first?.rootViewController?.view)!, message: "Sorry we cannot reach the internet. Please check your connection.")
            return
        }
        
        showProgressHud(view: (UIApplication.shared.windows.filter {$0.isKeyWindow}.first!))
        let finalUrl = BaseUrl + strURL
        print(finalUrl)
        print(parameter)
         let header : HTTPHeaders = [:]
        print(header)
        AF.request(finalUrl, method: .post, parameters: parameter as? Parameters, encoding: URLEncoding.default, headers: nil).responseJSON { (responseObject) -> Void in
            if responseObject.value != nil {
                dissmissHUD(UIApplication.shared.keyWindow!)
                let resJson = JSON(responseObject.value!)
            
                success(resJson)
            }
            if responseObject.value == nil {
                dissmissHUD(UIApplication.shared.keyWindow!)
                let error : Error = responseObject.error!
                failure(error)
                print(error)
            }
        }
    }
    func postDatatoServerHome(_ strURL: String,parameter:NSDictionary, success:@escaping (JSON) -> Void, failure:@escaping (Error) -> Void) {
        
        guard Connectivity.isConnectedToInternet == true else {
            InternetErrorToast(view: (UIApplication.shared.windows.first?.rootViewController?.view)!, message: "Sorry we cannot reach the internet. Please check your connection.")
            return
        }
        
        showProgressHud(view: (UIApplication.shared.windows.filter {$0.isKeyWindow}.first!))
        let finalUrl = BaseUrl + strURL
        print(finalUrl)
        print(parameter)
         let header : HTTPHeaders = ["Authorization":"Bearer"]
        print(header)
        AF.request(finalUrl, method: .post, parameters: parameter as? Parameters, encoding: URLEncoding.default, headers: header).responseJSON { (responseObject) -> Void in
            if responseObject.value != nil {
                dissmissHUD(UIApplication.shared.keyWindow!)
                let resJson = JSON(responseObject.value!)
            
                success(resJson)
            }
            if responseObject.value == nil {
                dissmissHUD(UIApplication.shared.keyWindow!)
                let error : Error = responseObject.error!
                failure(error)
                print(error)
            }
        }
    }
    func postDatatoHome(_ strURL: String,parameter:NSDictionary, success:@escaping (JSON) -> Void, failure:@escaping (Error) -> Void) {
        
//        guard Connectivity.isConnectedToInternet == true else {
//            InternetErrorToast(view: (UIApplication.shared.windows.first?.rootViewController?.view)!, message: "Sorry we cannot reach the internet. Please check your connection.")
//            return
//        }
//        
//        showProgressHud(view: (UIApplication.shared.windows.filter {$0.isKeyWindow}.first!))
        let finalUrl = BaseUrl + strURL
        print(finalUrl)
        print(parameter)
         let header : HTTPHeaders = ["Authorization":"Bearer"]
        print(header)
        AF.request(finalUrl, method: .post, parameters: parameter as? Parameters, encoding: URLEncoding.default, headers: header).responseJSON { (responseObject) -> Void in
            if responseObject.value != nil {
                dissmissHUD(UIApplication.shared.keyWindow!)
                let resJson = JSON(responseObject.value!)
            
                success(resJson)
            }
            if responseObject.value == nil {
                dissmissHUD(UIApplication.shared.keyWindow!)
                let error : Error = responseObject.error!
                failure(error)
                print(error)
            }
        }
    }
    func postDatatoServerReview(_ strURL: String,parameter:NSDictionary, success:@escaping (JSON) -> Void, failure:@escaping (Error) -> Void) {
        
        guard Connectivity.isConnectedToInternet == true else {
            InternetErrorToast(view: (UIApplication.shared.windows.first?.rootViewController?.view)!, message: "Sorry we cannot reach the internet. Please check your connection.")
            return
        }
        
        showProgressHud(view: (UIApplication.shared.windows.filter {$0.isKeyWindow}.first!))
        let finalUrl = strURL
        print(finalUrl)
        print(parameter)
         let header : HTTPHeaders = ["Authorization":"Bearer"]
        print(header)
        AF.request(finalUrl, method: .post, parameters: parameter as? Parameters, encoding: URLEncoding.default, headers: header).responseJSON { (responseObject) -> Void in
            if responseObject.value != nil {
                dissmissHUD(UIApplication.shared.keyWindow!)
                let resJson = JSON(responseObject.value!)
            
                success(resJson)
            }
            if responseObject.value == nil {
                dissmissHUD(UIApplication.shared.keyWindow!)
                let error : Error = responseObject.error!
                failure(error)
                print(error)
            }
        }
    }
    func getDatatoServerWithoutParms(_ strURL: String, success:@escaping (JSON) -> Void, failure:@escaping (Error) -> Void) {
        
        guard Connectivity.isConnectedToInternet == true else {
            InternetErrorToast(view: (UIApplication.shared.windows.first?.rootViewController?.view)!, message: "Sorry we cannot reach the internet. Please check your connection.")
            return
        }
        showProgressHud(view: (UIApplication.shared.windows.filter {$0.isKeyWindow}.first!))

        let finalUrl = BaseUrl + strURL
        print(finalUrl)
        let header : HTTPHeaders = ["Authorization":"Bearer"]
        AF.request(finalUrl, method: .get, encoding: URLEncoding.default, headers: header).responseJSON { (responseObject) -> Void in
            if responseObject.value != nil {
                dissmissHUD(UIApplication.shared.keyWindow!)
                let resJson = JSON(responseObject.value!)
                success(resJson)
            }
            if responseObject.value == nil {
                dissmissHUD(UIApplication.shared.keyWindow!)
                let error : Error = responseObject.error!
                failure(error)
                print(error)
            }
        }
    }
    func getDatatoServerWithoutParmsReview(_ strURL: String, success:@escaping (JSON) -> Void, failure:@escaping (Error) -> Void) {
        
        guard Connectivity.isConnectedToInternet == true else {
            InternetErrorToast(view: (UIApplication.shared.windows.first?.rootViewController?.view)!, message: "Sorry we cannot reach the internet. Please check your connection.")
            return
        }
        showProgressHud(view: (UIApplication.shared.windows.filter {$0.isKeyWindow}.first!))

        let finalUrl = strURL
        print(finalUrl)
        
        AF.request(finalUrl, method: .get, encoding: URLEncoding.default, headers: nil).responseJSON { (responseObject) -> Void in
            if responseObject.value != nil {
                dissmissHUD(UIApplication.shared.keyWindow!)
                let resJson = JSON(responseObject.value!)
                success(resJson)
            }
            if responseObject.value == nil {
                dissmissHUD(UIApplication.shared.keyWindow!)
                let error : Error = responseObject.error!
                failure(error)
                print(error)
            }
        }
    }
    func postAurhorizationDatatoServer(_ strURL: String,parameter:NSDictionary, success:@escaping (JSON) -> Void, failure:@escaping (Error) -> Void) {
        
        guard Connectivity.isConnectedToInternet == true else {
            InternetErrorToast(view: (UIApplication.shared.windows.first?.rootViewController?.view)!, message: "Sorry we cannot reach the internet. Please check your connection.")
            return
        }
        showProgressHud(view: (UIApplication.shared.windows.filter {$0.isKeyWindow}.first!))

        let finalUrl = BaseUrl + strURL
        print(finalUrl)
        print(parameter)
        let header : HTTPHeaders = ["Authorization":"Bearer "]
    
        AF.request(finalUrl, method: .post, parameters: parameter as? Parameters, encoding: JSONEncoding.default, headers: header).responseJSON { (responseObject) -> Void in
            if responseObject.value != nil {
                dissmissHUD(UIApplication.shared.keyWindow!)
                let resJson = JSON(responseObject.value!)
                success(resJson)
            }
            if responseObject.value == nil {
                dissmissHUD(UIApplication.shared.keyWindow!)
                let error : Error = responseObject.error!
                failure(error)
                print(error)
            }

        }
    }
    
    func postAurhorizationDatatoServerWithOutLoader(_ strURL: String,parameter:NSDictionary, success:@escaping (JSON) -> Void, failure:@escaping (Error) -> Void) {
        
        guard Connectivity.isConnectedToInternet == true else {
            InternetErrorToast(view: (UIApplication.shared.windows.first?.rootViewController?.view)!, message: "Sorry we cannot reach the internet. Please check your connection.")
            return
        }

        let finalUrl = BaseUrl + strURL
        print(finalUrl)
        print(parameter)
        let header : HTTPHeaders = ["Authorization":"Bearer"]
        
      //  print(header)
        AF.request(finalUrl, method: .post, parameters: parameter as? Parameters, encoding: JSONEncoding.default, headers: header).responseJSON { (responseObject) -> Void in
            if responseObject.value != nil {
                dissmissHUD(UIApplication.shared.keyWindow!)
                let resJson = JSON(responseObject.value!)
                success(resJson)
            }
            if responseObject.value == nil {
                dissmissHUD(UIApplication.shared.keyWindow!)
                let error : Error = responseObject.error!
                failure(error)
                print(error)
            }

        }
    }
    func GetAurhorizationDatatoServerWithoutProgressHud(_ strURL: String,parameter:NSDictionary, success:@escaping (JSON) -> Void, failure:@escaping (Error) -> Void) {
           
        guard Connectivity.isConnectedToInternet == true else {
            InternetErrorToast(view: (UIApplication.shared.windows.first?.rootViewController?.view)!, message: "Sorry we cannot reach the internet. Please check your connection.")
            return
        }
            let finalUrl = BaseUrl + strURL
            print(finalUrl)
            print(parameter)
            //var header : [String:String]?
    //        if guesUser == true{
    //            header = nil
    //        }
    //        else{
               let header : HTTPHeaders = ["Authorization":"Bearer "]
         //   }
            
            AF.request(finalUrl, method: .get, parameters: parameter as? Parameters, encoding: URLEncoding.default, headers: header).responseJSON { (responseObject) -> Void in
                if responseObject.value != nil {
                    dissmissHUD(UIApplication.shared.keyWindow!)
                    let resJson = JSON(responseObject.value!)
                    success(resJson)
                }
                if responseObject.value == nil {
                    dissmissHUD(UIApplication.shared.keyWindow!)
                    let error : Error = responseObject.error!
                    failure(error)
                    print(error)
                }

            }
        }
    
    func GetDatatoServer(_ strURL: String, success:@escaping (JSON) -> Void, failure:@escaping (Error) -> Void) {
       
        guard Connectivity.isConnectedToInternet == true else {
            InternetErrorToast(view: (UIApplication.shared.windows.first?.rootViewController?.view)!, message: "Sorry we cannot reach the internet. Please check your connection.")
            return
        }
        showProgressHud(view: (UIApplication.shared.windows.filter {$0.isKeyWindow}.first!))
        let finalUrl = BaseUrl + strURL
        print(finalUrl)
   
        let header : HTTPHeaders = ["Authorization":"Bearer"]

        AF.request(finalUrl, method: .get, parameters: [:], encoding: URLEncoding.default, headers: header).responseJSON { (responseObject) -> Void in
            if responseObject.value != nil {
                dissmissHUD(UIApplication.shared.keyWindow!)
                let resJson = JSON(responseObject.value!)
                success(resJson)
            }
            if responseObject.value == nil {
                dissmissHUD(UIApplication.shared.keyWindow!)
                let error : Error = responseObject.error!
                failure(error)
                print(error)
            }

        }
    }

    //IMAGEUPLOADREQUEST-------------------------------
    
    func UploadImage(strURL: String,image: Data,imgName:String,parameters: [String: Any],sucess:@escaping(JSON) ->(),failure:@escaping(Error) ->()) {
        
        
        guard Connectivity.isConnectedToInternet == true else {
            InternetErrorToast(view: (UIApplication.shared.windows.first?.rootViewController?.view)!, message: "Sorry we cannot reach the internet. Please check your connection.")
            return
        }
       showProgressHud(view: (UIApplication.shared.keyWindow)!)
        let finalUrl = BaseUrl + strURL
        
        print(finalUrl)
        print(parameters)
        
        AF.upload(multipartFormData: { multiPart in
            for (key, value) in parameters {
                if let temp = value as? String {
                    multiPart.append(temp.data(using: .utf8)!, withName: key)
                }
                if let temp = value as? Int {
                    multiPart.append("\(temp)".data(using: .utf8)!, withName: key)
                }
                if let temp = value as? NSArray {
                    temp.forEach({ element in
                        let keyObj = key + "[]"
                        if let string = element as? String {
                            multiPart.append(string.data(using: .utf8)!, withName: keyObj)
                        } else
                            if let num = element as? Int {
                                let value = "\(num)"
                                multiPart.append(value.data(using: .utf8)!, withName: keyObj)
                        }
                    })
                }
            }
            multiPart.append(image, withName: imgName, fileName: "file.jpeg", mimeType: "image/jpeg")
            }, to: finalUrl)
            
            .uploadProgress(queue: .main, closure: { progress in
                //Current upload progress of file
               // print("Upload Progress: \(progress.fractionCompleted)")
                print("Sucess Upload")
            })
            .responseJSON(completionHandler: { data in
                //Do what ever you want to do with response
                if ((data.value) != nil){
                    let jsonResult = JSON(data.value!)
                    sucess(jsonResult)
                     dissmissHUD(UIApplication.shared.keyWindow!)
                }
                if (data.error != nil){
                     let error:Error = data.error!
                     failure(error)
                     dissmissHUD(UIApplication.shared.keyWindow!)
                }
            })
    }

    
    func UploadImageWithHeader(strURL: String,image: Data,imgName:String,parameters: [String: Any],sucess:@escaping(JSON) ->(),failure:@escaping(Error) ->()) {


    guard Connectivity.isConnectedToInternet == true else {
        InternetErrorToast(view: (UIApplication.shared.windows.first?.rootViewController?.view)!, message: "Sorry we cannot reach the internet. Please check your connection.")
        return
    }
    showProgressHud(view: (UIApplication.shared.keyWindow)!)
    let finalUrl = BaseUrl + strURL

    print(finalUrl)
    print(parameters)
    let header = ["Content-Type": "application/json","Authorization" : "Bearer"]
        print(header)
    AF.upload(multipartFormData: { multiPart in
    for (key, value) in parameters {
    if let temp = value as? String {
    multiPart.append(temp.data(using: .utf8)!, withName: key)
    }
    if let temp = value as? Int {
    multiPart.append("\(temp)".data(using: .utf8)!, withName: key)
    }
    if let temp = value as? NSArray {
    temp.forEach({ element in
    let keyObj = key + "[]"
    if let string = element as? String {
    multiPart.append(string.data(using: .utf8)!, withName: keyObj)
    } else
    if let num = element as? Int {
    let value = "\(num)"
    multiPart.append(value.data(using: .utf8)!, withName: keyObj)
    }
    })
    }
    }
    multiPart.append(image, withName: imgName, fileName: "file.jpeg", mimeType: "image/jpeg")
    }, to: finalUrl, method: .post, headers: .init(header)).uploadProgress(queue: .main, closure: { progress in
    //Current upload progress of file
    // print("Upload Progress: \(progress.fractionCompleted)")
    print("Sucess Upload")
    })
    .responseJSON(completionHandler: { data in
    //Do what ever you want to do with response
    if ((data.value) != nil){
    let jsonResult = JSON(data.value!)
    sucess(jsonResult)
    dissmissHUD(UIApplication.shared.keyWindow!)
    }
    if (data.error != nil){
    let error:Error = data.error!
    failure(error)
    dissmissHUD(UIApplication.shared.keyWindow!)
    }
    })
    }
    
    
    func upLoadProviderPrfile(strURL: String,image: Data,imgName:String,imgIdCardData:Data,imgIdCardName:String,imgLicenseData:Data,imgLicenseName:String,imgOtherData:Data,imgOtherName:String,imgCoverData:Data,imgCoverName:String,parameters: [String: Any],sucess:@escaping(JSON) ->(),failure:@escaping(Error) ->()) {
        
        
        guard Connectivity.isConnectedToInternet == true else {
            InternetErrorToast(view: (UIApplication.shared.windows.first?.rootViewController?.view)!, message: "Sorry we cannot reach the internet. Please check your connection.")
            return
        }
       showProgressHud(view: (UIApplication.shared.keyWindow)!)
        let finalUrl = BaseUrl + strURL
        
        print(finalUrl)
        print(parameters)
        
        AF.upload(multipartFormData: { multiPart in
            for (key, value) in parameters {
                if let temp = value as? String {
                    multiPart.append(temp.data(using: .utf8)!, withName: key)
                }
                if let temp = value as? Int {
                    multiPart.append("\(temp)".data(using: .utf8)!, withName: key)
                }
                if let temp = value as? NSArray {
                    temp.forEach({ element in
                        let keyObj = key + "[]"
                        if let string = element as? String {
                            multiPart.append(string.data(using: .utf8)!, withName: keyObj)
                        } else
                            if let num = element as? Int {
                                let value = "\(num)"
                                multiPart.append(value.data(using: .utf8)!, withName: keyObj)
                        }
                    })
                }
            }
            multiPart.append(image, withName: imgName, fileName: "file.jpeg", mimeType: "image/jpeg")
            multiPart.append(imgIdCardData, withName: imgIdCardName, fileName: "file.jpeg", mimeType: "image/jpeg")
            multiPart.append(imgLicenseData, withName: imgLicenseName, fileName: "file.jpeg", mimeType: "image/jpeg")
            multiPart.append(imgOtherData, withName: imgOtherName, fileName: "file.jpeg", mimeType: "image/jpeg")
            multiPart.append(imgCoverData, withName: imgCoverName, fileName: "file.jpeg", mimeType: "image/jpeg")
            }, to: finalUrl)
            
            .uploadProgress(queue: .main, closure: { progress in
                //Current upload progress of file
               // print("Upload Progress: \(progress.fractionCompleted)")
                print("Sucess Upload")
            })
            .responseJSON(completionHandler: { data in
                //Do what ever you want to do with response
                if ((data.value) != nil){
                    let jsonResult = JSON(data.value!)
                    sucess(jsonResult)
                     dissmissHUD(UIApplication.shared.keyWindow!)
                }
                if (data.error != nil){
                     let error:Error = data.error!
                     failure(error)
                     dissmissHUD(UIApplication.shared.keyWindow!)
                }
            })
    }
  
    func upLoadProviderPrfileWithOptionalFields(strURL: String,image: Data,imgName:String,imgIdCardData:Data,imgIdCardName:String,imgLicenseData:Data,imgLicenseName:String,imgCoverData:Data,imgCoverName:String,parameters: [String: Any],sucess:@escaping(JSON) ->(),failure:@escaping(Error) ->()) {
        
        
        guard Connectivity.isConnectedToInternet == true else {
            InternetErrorToast(view: (UIApplication.shared.windows.first?.rootViewController?.view)!, message: "Sorry we cannot reach the internet. Please check your connection.")
            return
        }
       showProgressHud(view: (UIApplication.shared.keyWindow)!)
        let finalUrl = BaseUrl + strURL
        
        print(finalUrl)
        print(parameters)
        
        AF.upload(multipartFormData: { multiPart in
            for (key, value) in parameters {
                if let temp = value as? String {
                    multiPart.append(temp.data(using: .utf8)!, withName: key)
                }
                if let temp = value as? Int {
                    multiPart.append("\(temp)".data(using: .utf8)!, withName: key)
                }
                if let temp = value as? NSArray {
                    temp.forEach({ element in
                        let keyObj = key + "[]"
                        if let string = element as? String {
                            multiPart.append(string.data(using: .utf8)!, withName: keyObj)
                        } else
                            if let num = element as? Int {
                                let value = "\(num)"
                                multiPart.append(value.data(using: .utf8)!, withName: keyObj)
                        }
                    })
                }
            }
            multiPart.append(image, withName: imgName, fileName: "file.jpeg", mimeType: "image/jpeg")
            multiPart.append(imgIdCardData, withName: imgIdCardName, fileName: "file.jpeg", mimeType: "image/jpeg")
            multiPart.append(imgLicenseData, withName: imgLicenseName, fileName: "file.jpeg", mimeType: "image/jpeg")
            multiPart.append(imgCoverData, withName: imgCoverName, fileName: "file.jpeg", mimeType: "image/jpeg")
            }, to: finalUrl)
            
            .uploadProgress(queue: .main, closure: { progress in
                //Current upload progress of file
               // print("Upload Progress: \(progress.fractionCompleted)")
                print("Sucess Upload")
            })
            .responseJSON(completionHandler: { data in
                //Do what ever you want to do with response
                if ((data.value) != nil){
                    let jsonResult = JSON(data.value!)
                    sucess(jsonResult)
                     dissmissHUD(UIApplication.shared.keyWindow!)
                }
                if (data.error != nil){
                     let error:Error = data.error!
                     failure(error)
                     dissmissHUD(UIApplication.shared.keyWindow!)
                }
            })
    }
    
    
    func upLoadAddService(strURL: String,images: [UIImage],parameters: [String: Any],sucess:@escaping(JSON) ->(),failure:@escaping(Error) ->()) {
        
        
        guard Connectivity.isConnectedToInternet == true else {
            InternetErrorToast(view: (UIApplication.shared.windows.first?.rootViewController?.view)!, message: "Sorry we cannot reach the internet. Please check your connection.")
            return
        }
       showProgressHud(view: (UIApplication.shared.keyWindow)!)
        let finalUrl = BaseUrl + strURL
        
        print(finalUrl)
        print(parameters)
        
        AF.upload(multipartFormData: { multiPart in
            for (key, value) in parameters {
                if let temp = value as? String {
                    multiPart.append(temp.data(using: .utf8)!, withName: key)
                }
                if let temp = value as? Int {
                    multiPart.append("\(temp)".data(using: .utf8)!, withName: key)
                }
                if let temp = value as? NSArray {
                    temp.forEach({ element in
                        let keyObj = key + "[]"
                        if let string = element as? String {
                            multiPart.append(string.data(using: .utf8)!, withName: keyObj)
                        } else
                            if let num = element as? Int {
                                let value = "\(num)"
                                multiPart.append(value.data(using: .utf8)!, withName: keyObj)
                        }
                    })
                }
            }
            
//            var dataArray = [Data]()
            for (_,image) in images.enumerated(){
              if let data = image.jpegData(compressionQuality: 0.25){
                multiPart.append(data, withName: "review_images[]", fileName: "file.jpeg", mimeType: "image/jpeg")
             }
            }
            
//            for  (_,value) in dataArray.enumerated() {
//              //  multiPart.append(value, withName: "userfile[]", fileName: "file.jpeg", mimeType: "image/jpeg")
//                multiPart.append(value, withName: "review_images[]",fileName: "file.jpeg", mimeType: "image/jpeg")
//               // multiPart.append(value, withName: "userfile[]", fileName: "file.jpeg", mimeType: "image/jpeg")
//                  }
//
            }, to: finalUrl)
            
            .uploadProgress(queue: .main, closure: { progress in
                //Current upload progress of file
               // print("Upload Progress: \(progress.fractionCompleted)")
                print("Sucess Upload")
            })
            .responseJSON(completionHandler: { data in
                //Do what ever you want to do with response
                if ((data.value) != nil){
                    let jsonResult = JSON(data.value!)
                    sucess(jsonResult)
                     dissmissHUD(UIApplication.shared.keyWindow!)
                }
                if (data.error != nil){
                     let error:Error = data.error!
                     failure(error)
                     dissmissHUD(UIApplication.shared.keyWindow!)
                }
            })
    }
    
    
    func GeocoderGetPlaceInfo(lat:Double,long:Double, success:@escaping (NSDictionary) -> Void, failure:@escaping (Error) -> Void)  {
         
         let geoCoder = CLGeocoder()
         let location = CLLocation(latitude: lat, longitude: long)
         
         geoCoder.reverseGeocodeLocation(location, completionHandler: { (placemarks, error) -> Void in
             
             // Place details
             
             if ((error) != nil)
             {
                 
                 failure(error!)
             }
             else
             {
                 var placeMark: CLPlacemark!
                 placeMark = placemarks?[0]
                 success(placeMark.addressDictionary! as NSDictionary)
             }
              
         })
     }
    
    func upLoadMultipleImages(strURL: String,images: [UIImage],parameters: [String: Any],sucess:@escaping(JSON) ->(),failure:@escaping(Error) ->()) {


    guard Connectivity.isConnectedToInternet == true else {
    InternetErrorToast(view: UIApplication.shared.keyWindow!, message: "Sorry we cannot reach the internet. Please check your connection.")
    return
    }
    showProgressHud(view: (UIApplication.shared.keyWindow)!)
    let finalUrl = BaseUrl + strURL

    print(finalUrl)
    print(parameters)

    AF.upload(multipartFormData: { multiPart in
    for (key, value) in parameters {
    if let temp = value as? String {
    multiPart.append(temp.data(using: .utf8)!, withName: key)
    }
    if let temp = value as? Int {
    multiPart.append("\(temp)".data(using: .utf8)!, withName: key)
    }
    if let temp = value as? NSArray {
    temp.forEach({ element in
    let keyObj = key + "[]"
    if let string = element as? String {
    multiPart.append(string.data(using: .utf8)!, withName: keyObj)
    } else
    if let num = element as? Int {
    let value = "\(num)"
    multiPart.append(value.data(using: .utf8)!, withName: keyObj)
    }
    })
    }
    }

    for (_,image) in images.enumerated(){
    if let data = image.jpegData(compressionQuality: 0.25){
    multiPart.append(data, withName: "review_images[]", fileName: "file.jpeg", mimeType: "image/jpeg")
    }
    }
 
    }, to: finalUrl)

    .uploadProgress(queue: .main, closure: { progress in

    print("Sucess Upload")
    })
    .responseJSON(completionHandler: { data in
    if ((data.value) != nil){
    let jsonResult = JSON(data.value!)
    sucess(jsonResult)
    dissmissHUD(UIApplication.shared.keyWindow!)
    }
    if (data.error != nil){
    let error:Error = data.error!
    failure(error)
    dissmissHUD(UIApplication.shared.keyWindow!)
    }
    })
    }
    
}

