//
//  ModelRestaurentDetail.swift
//  Halal
//
//  Created by snow-macmini-2 on 27/10/21.
//

import UIKit
class RestaurentDetail{
    var image:String?
    var name:String?
    var status_resturent:String?
    var delivary_type:String?
    var message:String?
    var status:String?
    var arrMoreInfo = [moreInformation]()
    var arrCuisines = [CuisenesResDetl]()
    var arrHour = [OpenHour]()
    var arrReviews = [ReviewsModel]()
    var arrMenu = [menuList]()
    var avaragecost_range:String?
    var time:String?
    var resId:String?
    var estb_type:String?
    var latitude:String?
    var longitude:String?
    var webSite:String?
    var imageStatus:Bool?
    var res_fav:Int?
    var rest_avg_rating:String?
    var total_distance:String?
    var arrNearByRestaurent = [nearByRestaurent]()
    init(attributes:NonOptionalDictionary) {
        imageStatus = .status =/ attributes
        message = .message => attributes
        status = .status => attributes
        let result = .result =< attributes
        image = .image => result
        name = .name => result
        rest_avg_rating = .rest_avg_rating => result
        res_fav = .res_fav =|| result
        status_resturent = .status_resturent => result
        delivary_type = .delivary_type => result
        avaragecost_range = .avaragecost_range => result
        time = .time => result
        total_distance = .total_distance => result
        estb_type = .estb_type => result
        resId = .id => result
        latitude = .latitude => result
        longitude = .longitude => result
        webSite = .website => result
        let moreInfo = .more_info =| result
        for arr in /moreInfo{
            let dict = moreInformation.init(attributes: arr as! NonOptionalDictionary)
            arrMoreInfo.append(dict)
        }
        let CuisineResDet = .cuisines_name =| result
        for arr in /CuisineResDet{
            let dictCuisineResDet = CuisenesResDetl.init(attributes: arr as! NonOptionalDictionary)
            arrCuisines.append(dictCuisineResDet)
      }
      
        let hour = .open_hours =| result
        for arr in /hour{
            let dictHour = OpenHour.init(attributes: arr as! NonOptionalDictionary)
            arrHour.append(dictHour)
      }
        
        let nearByRest = .near_by_resturent =| result
        for arr in /nearByRest{
            let dictNearByRes = nearByRestaurent.init(attributes: arr as! NonOptionalDictionary)
            arrNearByRestaurent.append(dictNearByRes)
      }
        let reviews = .reviews =| result
        for arr in /reviews{
            let dict = ReviewsModel.init(attributes: arr as! NonOptionalDictionary)
            arrReviews.append(dict)
        }
      
        let menu = .menu =| result
        for arr in /menu{
            let dictMenu = menuList.init(attributes: arr as! NonOptionalDictionary)
            arrMenu.append(dictMenu)
  

        }
    }
}

class moreInformation{
    var more_info:String?
    init(attributes:NonOptionalDictionary){
        more_info = .more_info => attributes

}
}
 
class CuisenesResDetl{
    
    var cuisines_name:String?
    init(attributes:NonOptionalDictionary){
        cuisines_name = .cuisines_name => attributes
}

}
    class OpenHour{
            
        var res_id:String?
        var sun_opening_time:String?
        var friday_closeing_time:String?
        var tuesday_closeing_time:String?
        var mdonday_closeing_time:String?
        var friday_opening_time:String?
        var thursday_opening_time:String?
        var thursday_closeing_time:String?
        var saturday_closeing_time:String?
        var sun_closeing_time:String?
        var saturday_opening_time:String?
        var tuesday_opening_time:String?
        var mdonday_opening_time:String?
        var wednesday_closeing_time:String?
        var wednesday_opening_time:String?
        
            init(attributes:NonOptionalDictionary){
                res_id = .res_id => attributes
                sun_opening_time = .sun_opening_time => attributes
                friday_closeing_time = .friday_closeing_time => attributes
                tuesday_closeing_time = .tuesday_closeing_time => attributes
                mdonday_closeing_time = .mdonday_closeing_time => attributes
                friday_opening_time = .friday_opening_time => attributes
                thursday_opening_time = .thursday_opening_time => attributes
                thursday_closeing_time = .thursday_closeing_time => attributes
                saturday_closeing_time = .saturday_closeing_time => attributes
                sun_closeing_time = .sun_closeing_time => attributes
                saturday_opening_time = .saturday_opening_time => attributes
                tuesday_opening_time = .tuesday_opening_time => attributes
                mdonday_opening_time = .mdonday_opening_time => attributes
                wednesday_closeing_time = .wednesday_closeing_time => attributes
                wednesday_opening_time = .wednesday_opening_time => attributes
                
        }
    }

class nearByRestaurent{
        
    var image:String?
    var name:String?
    var rId:String?
    var status_resturent:String?
    var latitude:String?
    var longitude:String?
    var resFav:Int?
        init(attributes:NonOptionalDictionary){
            image = .image => attributes
            name = .name => attributes
            status_resturent = .status_resturent => attributes
            rId = .r_id => attributes
            latitude = .latitude => attributes
            longitude = .longitude => attributes
            resFav = .res_fav =|| attributes
    }
}
class ReviewsModel{
    var resId:String?
    var review:String?
    var userName:String?
    var postDate:String?
    var timeStamp:String?
    var ratingId:String?
    var rrImage:String?
    var reviewImage:String?
    var userId:String?
    var rating:String?
    var arrReviewImage = [String]()
    init(attributes:NonOptionalDictionary){
        resId = .res_id => attributes
        review = .review => attributes
        userName = .username => attributes
        postDate = .date_of_post => attributes
        timeStamp = .timestamp => attributes
        ratingId = .rating_id => attributes
        rrImage = .rru_image => attributes
        userId = .u_id => attributes
        rating = .rating => attributes
        let arrImage = .review_images =| attributes
        for arr in /arrImage{
            arrReviewImage.append(arr as! String)
        }
        
    }
}
class menuList{
    
    var menu:String?
    var status:String?
      
    init(attributes:NonOptionalDictionary){
        
        menu = .menu => attributes
        status = .status => attributes
        
    }
    
}
