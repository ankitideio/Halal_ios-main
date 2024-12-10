//
//  ProfileModel.swift
//  Halal
//
//  Created by snow-macmini-1 on 29/10/21.
//

import UIKit

class ProfileModel{
    var status:String?
    var title:String?
    var message:String?
    var userEmail:String?
    var profileImage:String?
    var userName:String?
    var userId:String?
    var location:String?
    var userMobile:String?
    var profileImageUrl:String?
    init(attributes:NonOptionalDictionary){
        status = .status => attributes
        message = .message => attributes
        title = .title => attributes
        let userDetail = .userdetails =< attributes
        userEmail = .useremail => userDetail
        userId = .u_id => userDetail
        profileImage = .profileimage => userDetail
        userName = .username => userDetail
        location = .location => userDetail
        userMobile = .usermobile => userDetail
        profileImageUrl = .profile_image_url => userDetail
        
    }
}
