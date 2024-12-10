//
//  ViewModelForMyVoucher.swift
//  Halal
//
//  Created by snow-macmini-2 on 21/10/21.
//

import UIKit

class ViewModelForMyVoucher: NSObject {

    func webServiceForMyVoucher(obj:MyVouchersVC){
        let param = ["user_id":fetchUserId()] as [String: Any]
        ApiConnection().postDatatoServer(apiVoucherList, parameter: param as NSDictionary, success: { (response) in
            print("response",response)
            let responseDict = response.dictionaryObject
            let data = LoginModel.init(attributes: /responseDict as NonOptionalDictionary)
            if data.status == "1"{
                SceneDelegate().makeRootController(IDStr: "TTabBarViewController")
            }else{
                TostErrorMessage(view: obj.view, message: /data.message)
            }
        }) { (error) in
            TostErrorMessage(view: obj.view, message: error.localizedDescription)
    }
        
    }
    
    
}
