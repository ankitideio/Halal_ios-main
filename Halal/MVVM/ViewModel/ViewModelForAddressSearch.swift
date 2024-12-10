//
//  ViewModelForAddressSearch.swift
//  Halal
//
//  Created by snow-macmini-2 on 21/10/21.
//

import UIKit

class ViewModelForAddressSearch: NSObject {
    
    func webServiceForSearch(obj:AddressSearchVC){
        let param = ["start": /obj.start,"limit": /obj.limit, "key": /obj.txtFldSearchAddress.text,"req": /obj.req] as [String: Any]
        
        ApiConnection().postDatatoServer(apiAddressSearchList, parameter: param as NSDictionary, success: { (response) in
            print("responseSearch",response)
            let responseDict = response.dictionaryObject
            let data = AddressListModel.init(attributes: /responseDict as NonOptionalDictionary)
            if data.flag == "true"{
                
                obj.arrAddress = /data.arrSearch_list
                obj.tblVwAddressSearch.reloadData()
            }else{
//                TostErrorMessage(view: obj.view, message: /data.message)
            }
        }) { (error) in
            TostErrorMessage(view: obj.view, message: error.localizedDescription)
    }
        
    }


}
