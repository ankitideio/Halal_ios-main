//
//  ModelLogin.swift
//  Halal
//
//  Created by snow-macmini-2 on 15/10/21.
//

import UIKit

class LoginModel{
    var status:String?
    var message:String?
    var username:String?
    var profileImage:String?
    var phone:String?
    var country_code:String?
    var address:String?
    var first_name:String?
    var last_name:String?
    var userId:String?
    var email:String?
    var feedbackMessage:String?
    var feedbackStatus:String?
    var profileImageUrl:String?
    init(attributes:NonOptionalDictionary) {
         message  = .message => attributes
        status = .status => attributes
        feedbackMessage  = .Message => attributes
       feedbackStatus = .Status => attributes
        let userdeatail = .userdetails =< attributes
        profileImage = .profileimage => userdeatail
        userId = .u_id => userdeatail
        username = .username => userdeatail
        email = .useremail => userdeatail
        profileImageUrl = .profile_image_url => userdeatail
        
        
}
}
