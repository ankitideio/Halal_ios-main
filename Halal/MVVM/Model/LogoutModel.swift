//
//  LogoutModel.swift
//  Halal
//
//  Created by snow-macmini-1 on 30/10/21.
//

import UIKit
class LogoutModel{
var status:Int?
var message:String?
init(attributes:NonOptionalDictionary){
    status = .status =|| attributes
    message = .message => attributes
}
}
