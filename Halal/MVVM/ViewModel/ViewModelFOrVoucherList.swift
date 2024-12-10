//
//  ViewModelFOrVoucherList.swift
//  Halal
//
//  Created by snow-macmini-1 on 30/10/21.
//

import UIKit

class ViewModelFOrVoucherList: NSObject {

    func webServiceForMyVoucher(obj:MyVouchersVC){
        let param = ["user_id":fetchUserId()] as [String: Any]
        ApiConnection().postDatatoServer(apiVoucherList, parameter: param as NSDictionary, success: { (response) in
            print(response)
            let responseDict = response.dictionaryObject
            let data = VoucherListModel.init(attributes: /responseDict as NonOptionalDictionary)
            if data.status == "1"{
              
                obj.arrmyVouchers = /data.arrVoucherData
                obj.tblMyVouchers.reloadData()
                
            }else{
                let alert = UIAlertController(title: "Alert", message: "No Voucher found", preferredStyle: .alert)
                    
                     let ok = UIAlertAction(title: "OK", style: .default, handler: { action in
                         
                     })
                     alert.addAction(ok)
                alert.view.tintColor = UIColor(red: 0/255, green: 186/255, blue: 0/255, alpha: 1.0)
                     DispatchQueue.main.async(execute: {
                        obj.present(alert, animated: true)
                })
//                TostErrorMessage(view: obj.view, message: /data.message)
            }
        }) { (error) in
            TostErrorMessage(view: obj.view, message: error.localizedDescription)
    }
        
    }
    
    
}
