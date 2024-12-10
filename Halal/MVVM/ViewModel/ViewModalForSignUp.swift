//
//  ViewModalForSignUp.swift
//  Halal
//
//  Created by snow-macmini-2 on 15/10/21.
//

import UIKit

class ViewModalForSignUp: NSObject {

    func webServiceForSignUp(obj:LoginSignUpVC){
        let param = ["email": obj.txtFldEmail.text ?? "","password":obj.txtFldPassword.text ?? "","username":obj.txtFldName.text ?? "","device_type":obj.deviceType  ,"device_token":fetchDeviceToken(),"lat":obj.lat ,"long":obj.long ] as [String: Any]
        ApiConnection().postDatatoServer(apiSignUp, parameter: param as NSDictionary, success: { (response) in
            print(response)
            let responseDict = response.dictionaryObject
            let data = LoginModel.init(attributes: /responseDict as NonOptionalDictionary)
            if data.status == "1"{
                
                saveUserName(userName: /data.username)
                saveProfileImage(profileImage: /data.profileImageUrl)
                saveUserEmail(email: /data.email)
                saveLatitude(latitude: /obj.lat)
                saveLongitude(longitude: /obj.long)
                saveHomeCurrentLat(homeCurrentLat: /obj.lat)
                saveHomeCurrentLong(homeCurrentLog: /obj.long)
                saveUserId(userID: /data.userId)
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
