//
//  ViewModelForSocialLogin.swift
//  Halal
//
//  Created by snow-macmini-6 on 24/01/22.
//

import UIKit

class ViewModelForSocialLogin: NSObject {
    func webServiceForFacebookLogin(obj:LogInVC){
        let param = ["third_party_id": obj.third_party_id ?? "","profileimage": obj.profileimage ?? "","username": obj.username ?? "","email": obj.email ?? "","phone": obj.phoneNo ?? "","device_type":obj.deviceType ,"device_token":fetchDeviceToken() ,"lat":obj.lat ?? "","long":/obj.long] as [String: Any]
        
        ApiConnection().postDatatoHome(apiSocialLogin, parameter: param as NSDictionary, success: { (response) in
            print(response)
            let responseDict = response.dictionaryObject
            let data = LoginModel.init(attributes: /responseDict as NonOptionalDictionary)
           if data.status == "1"{
               saveUserId(userID: /data.userId)
               saveUserName(userName: /data.username)
               saveDeviceToken(deviceToken: /fetchDeviceToken())
               saveResLat(resLat: /obj.lat)
               saveResLong(resLong: /obj.long)
               saveLatitude(latitude: /obj.lat)
               saveLongitude(longitude: /obj.long)
               saveAddressLat(addressLat: /obj.lat)
               saveAddressLong(addressLong: /obj.long)
               saveProfileImage(profileImage: /data.profileImageUrl)
               saveUserEmail(email: /data.email)
               saveResCurrentLat(resCurrentLat: /obj.lat)
               saveResCurrentLong(resCurrentLong: /obj.long)
               SceneDelegate().checkUserExist()
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
    func webServiceForAppleLogin(obj:LogInVC,third_party_id:String,email:String,username:String){
        let param = ["profileimage": obj.profileimage ?? "","phone": obj.phoneNo ?? "","device_type":obj.deviceType ,"device_token":fetchDeviceToken() ,"lat":obj.lat  ?? "","long":obj.long  ?? "","email":email ,"third_party_id":third_party_id ,"username":/username] as [String: Any]
        
        ApiConnection().postDatatoHome(apiSocialLogin, parameter: param as NSDictionary, success: { (response) in
            print(response)
            let responseDict = response.dictionaryObject
            let data = LoginModel.init(attributes: /responseDict as NonOptionalDictionary)
           if data.status == "1"{
               saveUserId(userID: /data.userId)
               saveUserName(userName: /data.username)
               saveDeviceToken(deviceToken: /fetchDeviceToken())
               saveResLat(resLat: /obj.lat)
               saveResLong(resLong: /obj.long)
               saveLatitude(latitude: /obj.lat)
               saveLongitude(longitude: /obj.long)
               saveAddressLat(addressLat: /obj.lat)
               saveAddressLong(addressLong: /obj.long)
               saveProfileImage(profileImage: /data.profileImageUrl)
               saveUserEmail(email: /data.email)
               saveResCurrentLat(resCurrentLat: /obj.lat)
               saveResCurrentLong(resCurrentLong: /obj.long)
               SceneDelegate().checkUserExist()
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
    func webServiceForFacebookSignUp(obj:LoginSignUpVC){
        let param = ["third_party_id": obj.third_party_id ?? "","profileimage": obj.profileimage ?? "","username": obj.username ?? "","email": obj.email ?? "","phone": obj.phoneNo ?? "","device_type":obj.deviceType,"device_token":fetchDeviceToken(),"lat":obj.lat,"long":/obj.long] as [String: Any]
        
        ApiConnection().postDatatoHome(apiSocialLogin, parameter: param as NSDictionary, success: { (response) in
            print(response)
            let responseDict = response.dictionaryObject
            let data = LoginModel.init(attributes: /responseDict as NonOptionalDictionary)
           if data.status == "1"{
               saveUserId(userID: /data.userId)
               saveUserName(userName: /data.username)
               saveDeviceToken(deviceToken: /fetchDeviceToken())
               saveResLat(resLat: /obj.lat)
               saveResLong(resLong: /obj.long)
               saveLatitude(latitude: /obj.lat)
               saveLongitude(longitude: /obj.long)
               saveAddressLat(addressLat: /obj.lat)
               saveAddressLong(addressLong: /obj.long)
               saveProfileImage(profileImage: /data.profileImageUrl)
               saveUserEmail(email: /data.email)
               saveResCurrentLat(resCurrentLat: /obj.lat)
               saveResCurrentLong(resCurrentLong: /obj.long)
               SceneDelegate().checkUserExist()
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
    func webServiceForAppleSignUp(obj:LoginSignUpVC,third_party_id:String,email:String,username:String){
        let param = ["profileimage": obj.profileimage ?? "","phone": obj.phoneNo ?? "","device_type":obj.deviceType,"device_token":fetchDeviceToken(),"lat":obj.lat,"long":/obj.long] as [String: Any]
        
        ApiConnection().postDatatoHome(apiSocialLogin, parameter: param as NSDictionary, success: { (response) in
            print(response)
            let responseDict = response.dictionaryObject
            let data = LoginModel.init(attributes: /responseDict as NonOptionalDictionary)
           if data.status == "1"{
               saveUserId(userID: /data.userId)
               saveUserName(userName: /data.username)
               saveDeviceToken(deviceToken: /fetchDeviceToken())
               saveResLat(resLat: /obj.lat)
               saveResLong(resLong: /obj.long)
               saveLatitude(latitude: /obj.lat)
               saveLongitude(longitude: /obj.long)
               saveAddressLat(addressLat: /obj.lat)
               saveAddressLong(addressLong: /obj.long)
               saveProfileImage(profileImage: /data.profileImageUrl)
               saveUserEmail(email: /data.email)
               saveResCurrentLat(resCurrentLat: /obj.lat)
               saveResCurrentLong(resCurrentLong: /obj.long)
               SceneDelegate().checkUserExist()
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
}
