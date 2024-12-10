//
//  ApiConstants.swift
//  BoomThing
//
//  Created by snow-macmini-2 on 28/12/20.
//  Copyright © 2020 snow-macmini-2. All rights reserved.
//

import Foundation

enum ParamKeys : String {
    case status
    case Message
    case username
    case email
    case userdetails
    case profileimage
    case u_id
    case Connection
    case Data
    case cuisines_name
    case cuisine_image
    case id
    case searchkey
    case flag
    case search_list
    case state_code
    case longitude
    case name
    case latitude
    case postcode
    case result
    case cusine_id
    case image
    case r_id
    case cost_sign
    case total_records
    case r_image_path
    case address
    case r_rating
    case rating
    case Status
    case total_rating
    case rest_avg_rating
   // case name
    case r_name
    case resturant_details
    case message
    case useremail
    case total_pages
    case distance
    case title
    case location
    case usermobile
    case profile_image_url
    case status_resturent
    case responseResDetail
    case delivary_type
    case more_info
    case photos
    case res_id
    case open_hours
    case sun_opening_time
    case friday_closeing_time
    case tuesday_closeing_time
    case mdonday_closeing_time
    case friday_opening_time
    case thursday_opening_time
    case thursday_closeing_time
    case saturday_closeing_time
    case sun_closeing_time
    case saturday_opening_time
    case tuesday_opening_time
    case mdonday_opening_time
    case wednesday_closeing_time
    case wednesday_opening_time
    case near_by_resturent
    case review
    case date_of_post
    case timestamp
    case rating_id
    case rru_image
    case reviews
    case avaragecost_range
    case estb_type
    case time
    case gal_image_name
    case menu
    case cuisine
    case delivery
    case minimum_order
    case type
    case end_date
    case offer_price
    case offer_desc
    case menu_name
    case menu_link
    case offer_id
    case data
    case menus
    case offer_description
    case rest_name
    case offer_type
    case phone
    case rest_long
    case rest_lat
    case review_image_id
    case review_images
    case images
    case contact
    case r_contact
    case place_id
    case results
    case relative_time_description
    case author_url
    case text
    case author_name
    case profile_photo_url
    case website
    case media_url
    case caption
    case rest_id
    case res_fav
    case total_distance
    case first_name
    case last_name
    case picture
    case url
    case how_to_redeem
    case urban_area
    case res_url
    case r_is_featured
    case thumbnail_url
    case permalink
    case homePageBanners
  
}

typealias OptionalDictionary = [String : AnyObject]?
typealias NonOptionalDictionary = [String : AnyObject]
//typealias Completion = (Response) -> ()

infix operator =>
infix operator =|
infix operator =<
infix operator =<<
infix operator =||
infix operator =^^
infix operator =^
infix operator =/
prefix operator /


func =>(key : ParamKeys, json : OptionalDictionary) -> String? {
    if let result = json?[key.rawValue] as? String{
        return result
    }
    return nil
}

func =<(key : ParamKeys, json : OptionalDictionary) -> OptionalDictionary {
    if let result = json?[key.rawValue] as? [String:AnyObject]{
        return result
    }
    return nil
}


func =|(key : ParamKeys, json : OptionalDictionary) -> [AnyObject]? {
    if let result = json?[key.rawValue] as? [AnyObject]{
        return result
    }
    return nil
}

func =||(key : ParamKeys, json : OptionalDictionary) -> Int? {
    if let result = json?[key.rawValue] as? Int{
        return result
    }
    return nil
    
}

func =^(key : ParamKeys, json : OptionalDictionary) -> Float? {
    if let result = json?[key.rawValue] as? Float{
        return result
    }
    return nil
}

func =^^(key : ParamKeys, json : OptionalDictionary) -> Double? {
    if let result = json?[key.rawValue] as? Double{
        return result
    }
    return nil
}

func =/(key : ParamKeys, json : OptionalDictionary) -> Bool? {
    if let result = json?[key.rawValue] as? Bool{
        return result
    }
    return nil
}

protocol OptionalType { init() }

//MARK:- EXTENSIONS
extension String: OptionalType {}
extension Int: OptionalType {}
extension Double: OptionalType {}
extension Bool: OptionalType {}
extension Float: OptionalType {}
//extension CGFloat: OptionalType {}
//extension CGRect: OptionalType {}
//extension UIImage: OptionalType {}
extension IndexPath: OptionalType {}
extension Array: OptionalType {}
extension Dictionary: OptionalType {}
//unwrapping values
prefix func /<T: OptionalType>( value: T?) -> T {
    guard let validValue = value else { return T() }
    return validValue
}
