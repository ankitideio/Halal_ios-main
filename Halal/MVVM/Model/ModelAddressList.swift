//
//  ModelAddressList.swift
//  Halal
//
//  Created by snow-macmini-2 on 22/10/21.
//

import UIKit
class AddressListModel{
    var searchkey:String?
    var flag:String?
    var message:String?
    var status:String?
    var arrSearch_list = [AddressList]()
    init(attributes:NonOptionalDictionary){
        message = .Message => attributes
        status = .status => attributes
        searchkey = .searchkey => attributes
        flag = .flag => attributes
        let searchList = .search_list =| attributes
        for arr in /searchList{
            let dict = AddressList.init(attributes: arr as! NonOptionalDictionary)
            arrSearch_list.append(dict)
        }
    }
}
class AddressList{
    var  state_code:String?
    var longitude:String?
    var name:String?
    var latitude:String?
    var postcode:String?
    var urban_area:String?
    init(attributes:NonOptionalDictionary){
        state_code = .state_code => attributes
        longitude = .longitude => attributes
        name = .name => attributes
        latitude = .latitude => attributes
        postcode = .postcode => attributes
        urban_area = .urban_area => attributes
    }
}
