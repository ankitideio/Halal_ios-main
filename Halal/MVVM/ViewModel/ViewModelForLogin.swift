//
//  ViewModelForLogin.swift
//  Halal
//
//  Created by snow-macmini-2 on 15/10/21.
//

import UIKit

class ViewModelForLogin: NSObject {
    func webServiceForLogin(obj:LogInVC){
        let param = ["email":obj.txtFldEmail.text ?? "","password":obj.txtFldPassword.text ?? "","device_type":obj.deviceType,"device_token":fetchDeviceToken(),"lat":obj.lat ?? "","long":/obj.long] as [String: Any]
        ApiConnection().postDatatoServer(apiLogin, parameter: param as NSDictionary, success: { (response) in
            print(response)
            let responseDict = response.dictionaryObject
            let data = LoginModel.init(attributes: /responseDict as NonOptionalDictionary)
            if data.status == "1"{
                saveResLat(resLat: /obj.lat)
                saveResLong(resLong: /obj.long)
                saveUserId(userID: /data.userId)
                saveLatitude(latitude: /obj.lat)
                saveLongitude(longitude: /obj.long)
//                saveHomeCurrentLat(lat: /obj.lat)
//                saveHomeCurrentLong(long: /obj.long)
                saveAddressLat(addressLat: /obj.lat)
                saveAddressLong(addressLong: /obj.long)
                saveProfileImage(profileImage: /data.profileImageUrl)
                saveUserEmail(email: /data.email)
                saveUserName(userName: /data.username)
                saveResCurrentLat(resCurrentLat: /obj.lat)
                saveResCurrentLong(resCurrentLong: /obj.long)
                saveOfferListingLat(offerListingLat: /obj.lat)
                saveOfferListingLong(offerListingLong: /obj.long)
                saveDistanceLat(distanceLat: /obj.lat)
                saveDistanceLong(distanceLong: /obj.long)
                saveUrbanName(urbanName: "Sydney")
                SceneDelegate().checkUserExist()
            }else{
                TostErrorMessage(view: obj.view, message: /data.message)
            }
        }) { (error) in
            TostErrorMessage(view: obj.view, message: error.localizedDescription)
    }
        
    }
}
