//
//  FacebookLoginModel.swift
//  Halal
//
//  Created by snow-macmini-6 on 24/01/22.
//

import UIKit

class FacebookLoginModel{
    var email:String?
    var first_name:String?
    var id:String?
    var last_name:String?
    var name:String?
    var url:String?
    var shortName:String?
    init(attributes:NonOptionalDictionary){
        email = .email => attributes
        first_name = .first_name => attributes
        id = .id => attributes
        last_name = .last_name => attributes
        name = .name => attributes
        let picture = .picture =< attributes
        let data = .data =< picture
        url = .url => data
        
    }
}
