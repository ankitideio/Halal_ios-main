//
//  MenuListModel.swift
//  Halal
//
//  Created by snow-macmini-1 on 30/10/21.
//

import UIKit

class MenuListModel{
    var status:String?
    var message:String?

  var arrMenuRslt = [MenuRslt]()

init(attributes:NonOptionalDictionary){
    status = .status => attributes
    message = .message => attributes
    let arrMenu = .menus =| attributes
    for arr in /arrMenu{
        let dictMenu = MenuRslt.init(attributes: arr as! NonOptionalDictionary)
        
        arrMenuRslt.append(dictMenu)
    }

}
}
class MenuRslt{

var menu_link:String?
var menu_name:String?

init(attributes:NonOptionalDictionary){
    menu_link = .menu_link => attributes
    menu_name = .menu_name => attributes
}



}

