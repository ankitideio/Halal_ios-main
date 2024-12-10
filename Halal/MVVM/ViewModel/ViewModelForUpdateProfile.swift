//
//  ViewModelForUpdateProfile.swift
//  Halal
//
//  Created by snow-macmini-2 on 18/10/21.
//

import UIKit

class ViewModelForUpdateProfile: NSObject {
    func webServiceForUpdateProfile(obj:EditProfileVC) {
        let imgData = obj.imgVwProfile.image?.jpegData(compressionQuality: 0.5)
        let param = ["u_id":fetchUserId(),"username":obj.txtFldName.text ?? "","useremail":obj.txtFldEmail.text ?? "","usermobile":obj.txtFldPhoneNumber.text ?? "","location":/obj.txtFldAddress.text] as [String : Any]
        ApiConnection().UploadImageWithHeader(strURL: apiUpdateProfile, image: imgData!, imgName: "profileimage", parameters: param, sucess: { (response) in
            print(response)
            let responseDict = response.dictionaryObject
            let data = ProfileModel.init(attributes: /responseDict as NonOptionalDictionary)
            if data.status == "1"{
                saveProfileImage(profileImage: /data.profileImageUrl)
                saveUserEmail(email: /data.userEmail)
                saveUserName(userName: /data.userName)
                saveLocation(location: /data.location)
                savePhoneNumber(phoneNumber: /data.userMobile)
                obj.navigationController?.popViewController(animated: true)
            }else{
                TostErrorMessage(view: obj.view, message: /data.message)
            }
        }) { (error) in
            TostErrorMessage(view: obj.view, message: error.localizedDescription)
        }
        
    }

    func webServiceDeleteAccount(obj:EditProfileVC){
        let param = ["u_id":/fetchUserId()]
        ApiConnection().postDatatoServer(apiDeleteAccount, parameter: param as NSDictionary) { response in
            print(response)
            let responseDict = response.dictionaryObject
            let data = ProfileModel.init(attributes: /responseDict as NonOptionalDictionary)
            if data.status == "1"{
                saveUserId(userID: "")
                SceneDelegate().checkUserExist()
            }else{
                TostErrorMessage(view: obj.view, message: /data.message)
            }
        } failure: { error in
            TostErrorMessage(view: obj.view, message: error.localizedDescription)
        }

    }
}

    

