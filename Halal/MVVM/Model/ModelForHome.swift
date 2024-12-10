//
//  ModelForHome.swift
//  Halal
//
//  Created by snow-macmini-2 on 19/10/21.
//

import UIKit
class HomeModel{
    var Connection:String?
    var message:String?
    var status:String?
    var arrData = [HomeList]()
    init(attributes:NonOptionalDictionary){
        Connection = .Connection => attributes
        message = .Message => attributes
        status = .Status => attributes
        let data = .Data =| attributes
        for arr in /data{
            let dict = HomeList.init(attributes: arr as! NonOptionalDictionary)
            arrData.append(dict)
            }
    }
}

class HomeList{
    var  cuisinesname:String?
    var cuisineimage:String?
    var id:String?
    init(attributes:NonOptionalDictionary){
        cuisinesname = .cuisines_name => attributes
        cuisineimage = .cuisine_image => attributes
        id = .id => attributes
        
    }
}
