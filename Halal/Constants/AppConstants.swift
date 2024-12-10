//
//  AppConstants.swift
//  BoomThing
//
//  Created by snow-macmini-2 on 25/12/20.
//  Copyright © 2020 snow-macmini-2. All rights reserved.
//

import Foundation
import UIKit
//let appColor = UIColor(red: 6/255.0, green: 21/255.0, blue: 158/255.0, alpha: 1.0)
//let appDarkColor = UIColor(red: 56/255.0, green: 65/255.0, blue: 151/255.0, alpha: 1.0)
enum CustomTitle:String{
    case selectType = "Select Your Choice"
}

enum CustomAlert:String{
    case police = "Police"
    case hotel = "Hotel"
    case ok = "Ok"
    case resendLink = "Resend Link"
    case cancel = "Cancel"
    case repeatCustmization = "Repeat"
    case choose = "I'll choose"
    case home = "Go Home"
    case viewOrder = "View Order"
}
enum dateFormater: String{
    case ddMMMyyyy = "dd MMM yyyy"
    case dd_MM_yyyy = "dd-MM-yyyy"
    case yyyyMMdd = "yyyy-MM-dd"
    case yyyyMMddhhmmss = "yyyy-MM-dd HH:mm:ss"
    case MMM = "MMM"
    case dd = "dd"
    case hhmma = "hh:mm a"
    case dayMMMMddyyyy = "EEE, MMMM dd, yyyy"
    case MMMMyyyy = "MMMM yyyy"
    case ddMMyyyyHHmmss = "dd-MM-yyyy HH:mm:ss"
    case yyyyMMddTHHmmssSSSZ = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
    case hhmmss = "HH:mm:ss"
}

enum ValidationsText: String{
    case email = "Enter your email id"
    case validEmail = "Enter your registered email id"
    case password = "Enter your password"
    case name = "Please enter your Name"
    case username = "Enter your full name"
    case phnNo = "Please enter Phone Number"
    case validPhnNo = "Please enter valid Phone Number"
    case otp = "Please enter OTP"
    case newPassword = "Please enter new password"
    case confirmPassword = "Please enter confirm password"
    case passwordDontMatch = "Password don't match"
    case currentPassword = "Please enter current password"
    case profileImage = "Please select profile image"
    case dob = "Please enter your date of birth"
    case address = "Please enter your address"
    case idCard = "Please select id card image"
    case licence = "Please select driving license image"
    case other = "Please select other image"
    case serviecName = "Please add offered service name"
    case serviecPrice = "Please add offered service price"
    case serviceTitle = "Please add sevice title"
    case serviceTotalPrice = "Please add service total amount"
    case serviceLocation = "Please add service locatiobn"
    case serviceCatgory = "Please select service category"
    case serviceSubCatgory = "Please select service sub category"
    case serviceOffers = "Please tap on Add button to add service offer"
    case startTime = "Please select business start time"
    case endTime = "Please select business end time"
    case days = "Please select business day"
    case description = "Please enter description"
    case serviceImg = "Please upload service images"
    case serviceTiming = "Tap on the Add button to add the business hours"
    case subject = "Please enter your subject"
    case message = "Please enter your message"
    case businessType = "Please enter business type"
    case businessSummery = "Please enter summary of business"
    case coverImg = "Please select cover image"
    case productImages = "Please select product images"
    case productName = "Please enter product name"
    case productCaegory = "Please select product category"
    case productSubCtegory = "Please selcet product sub category"
    case productPrice = "Please enter price"
    case productPreparTime = "Please enter prepare time"
    case freeDelivery = "Please select free delivery option"
    case productDescription = "Please enter descriptio"
    case productSpecification = "Please enter specification"
    case productEastimateTime = "Please enter estimated delivery time"
    case deliveryCharges = "Please enter delivery charges"
    case feedback = "Please enter your feedback"
    case location = "Please enter location"
    case review = "Give Your Rating"
 
}

