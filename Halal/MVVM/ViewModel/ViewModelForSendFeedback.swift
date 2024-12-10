//
//  ViewModelForSendFeedback.swift
//  Halal
//
//  Created by snow-macmini-2 on 21/10/21.
//

import UIKit

class ViewModelForSendFeedback: NSObject {

    
    
    func webServiceForSendFeedback(obj:FeedBackVC){
        let param = ["email": /obj.txtFldEmail.text,"name": /obj.txtFldName.text,"feedback": /obj.txtVwFeedback.text] as [String: Any]
        ApiConnection().postDatatoServer(apiSendFeedback, parameter: param as NSDictionary, success: { (response) in
            print(response)
            let responseDict = response.dictionaryObject
            let data = LoginModel.init(attributes: /responseDict as NonOptionalDictionary)
            if data.feedbackStatus == "Success"{
               
               
                let alert = UIAlertController(title: nil, message: data.feedbackMessage, preferredStyle: .alert)
                    
                     let ok = UIAlertAction(title: "OK", style: .default, handler: { action in
                         SceneDelegate().makeRootController(IDStr: "TTabBarViewController")
                     })
                     alert.addAction(ok)
                    
                     DispatchQueue.main.async(execute: {
                        obj.present(alert, animated: true)
                })
               
            }else{
                TostErrorMessage(view: obj.view, message: /data.feedbackMessage)
            }
        }) { (error) in
            TostErrorMessage(view: obj.view, message: error.localizedDescription)
    }
        
    }
    
}
