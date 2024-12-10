//
//  ViewModelForLogout.swift
//  Halal
//
//  Created by snow-macmini-1 on 29/10/21.
//

import UIKit

class ViewModelForLogout: NSObject {
    func webServiceForLogout(obj:SideMenu2VC){
        let param = ["u_id":fetchUserId(),"device_token":fetchDeviceToken(),"device_type":/obj
                        .deviceType] as [String: Any]
    ApiConnection().postDatatoServer(apiLogout, parameter: param as NSDictionary, success: { (response) in
        print(response)
        let responseDict = response.dictionaryObject
        let data = LogoutModel.init(attributes: /responseDict as NonOptionalDictionary)
       if data.status == 1{
           saveLatitude(latitude: "")
           saveLongitude(longitude: "")
             saveUserId(userID: "")
           obj.dismiss(animated: false, completion: nil)
           let vc = obj.storyboard?.instantiateViewController(withIdentifier: "LogInVC") as! LogInVC
           obj.hidesBottomBarWhenPushed = true
           vc.isComingFrom = true
           obj.navigationController?.pushViewController(vc, animated: true)
        
           
        }else{
            TostErrorMessage(view: obj.view, message: /data.message)
        }
    }) { (error) in
        TostErrorMessage(view: obj.view, message: error.localizedDescription)
}
    
}
}
