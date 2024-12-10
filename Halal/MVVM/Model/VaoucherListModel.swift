//
//  VaoucherListModel.swift
//  Halal
//
//  Created by snow-macmini-1 on 30/10/21.
//

import UIKit
class VoucherListModel{
var status:String?
var message:String?
var title:String?
var arrVoucherData = [myVoucherData]()
init(attributes:NonOptionalDictionary) {
     message  = .Message => attributes
    status = .status => attributes
    title = .title => attributes
    
    let voucher = .data =| attributes
    for arr in /voucher{
        let dictVoucher = myVoucherData.init(attributes: arr as! NonOptionalDictionary)
        arrVoucherData.append(dictVoucher)
  }
}
    
}

class myVoucherData{
var  offer_type:String?
var rest_name:String?
var offer_description:String?
var offer_price:String?
var end_date:String?
var type:String?
var phone:String?
var rest_long:String?
var rest_lat:String?
var current_date:String?
var rest_id:String?
init(attributes:NonOptionalDictionary){
    rest_id = .rest_id => attributes
    offer_type = .offer_type => attributes
    rest_name = .rest_name => attributes
    offer_description = .offer_description => attributes
    offer_price = .offer_price => attributes
    end_date = .end_date => attributes
    type = .type => attributes
    phone = .phone => attributes
    rest_long = .rest_long => attributes
    rest_lat = .rest_lat => attributes
  
    
    
}
}


