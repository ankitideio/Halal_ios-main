//
//  AlertsClass.swift
//  BusinessDirectory
//
//  Created by Aseem 13 on 23/01/17.
//  Copyright © 2017 Taran. All rights reserved.
//

import UIKit

typealias AlertBlock = (_ success: AlertTag) -> ()

enum AlertTag {
    case done
    case yes
    case no
}



enum Alert : String{
    case success = "Success"
    case oops = "Oops"
    case ok = "Ok"
    case cancel = "Cancel"
    case error = "Error"
    case empty = ""
    case alert = "Alert"
    case noInterNet = "No Internet"
    case SocketDisconnected = "Socket Disconnected"
}
