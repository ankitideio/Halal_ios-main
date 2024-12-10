//
//  ViewModelForgotPassword.swift
//  Halal
//
//  Created by snow-macmini-2 on 15/10/21.
//

import UIKit

class ViewModelForgotPassword: NSObject {

    func webServiceForForgotPassword(obj:ForgotPasswordVC){
        let param = ["email": /obj.txtFldEmail.text] as [String: Any]
        ApiConnection().postDatatoServer(apiForgotPassword, parameter: param as NSDictionary, success: { (response) in
            print(response)
            let responseDict = response.dictionaryObject
            let data = LoginModel.init(attributes: /responseDict as NonOptionalDictionary)
            if data.status == "1"{
                obj.dismiss(animated: true, completion: nil)
            }else{
                TostErrorMessage(view: obj.view, message: /data.message)
            }
        }) { (error) in
            TostErrorMessage(view: obj.view, message: error.localizedDescription)
    }
        
    }
}

