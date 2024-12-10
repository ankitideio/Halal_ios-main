//
//  ModelFavouiret.swift
//  Halal
//
//  Created by snow-macmini-2 on 22/10/21.
//

import UIKit
class FavouirotModel{
    var total_records:Int?
    var message:String?
    var status:String?
    var flag:String?
    var totalPages:Int?
    var arrFavourit_list = [resultModel]()
    var arrResturentFavList = [resturantDetailFav]()
    var arrBanner = [BannerList]()
    init(attributes:NonOptionalDictionary) {
         message  = .message => attributes
        flag = .flag => attributes
        status = .status => attributes
        total_records = .total_records =|| attributes
        totalPages = .total_pages =|| attributes
        let result = .result =| attributes
        for arr in /result{
        let dict = resultModel.init(attributes: arr as! NonOptionalDictionary)
        arrFavourit_list.append(dict)
        }
        let resDetail = .result =| attributes
        for arr in /resDetail{
        let dict = resturantDetailFav.init(attributes: arr as! NonOptionalDictionary)
        arrResturentFavList.append(dict)
            
            }
        let banner = .homePageBanners =| attributes
        for arr in /banner{
            let dict = BannerList.init(attributes: arr as! NonOptionalDictionary)
            arrBanner.append(dict)
        }
        }
    }

 class resultModel{
    var cusine_id:String?
    var image:String?
    var r_id:String?
    var name:String?
    var cost_sign:String?
    var total_records:String?
    var message:String?
    var address:String?
    var r_rating:String?
    var status:String?
    var total_rating:String?
    var id:String?
    var rating:String?
    var longitude:String?
    var latitude:String?
    var distance:String?
    var type:String?
    var offerPrice:String?
    var contact:String?
    var r_contact:String?
    var resFav:Int?
    var r_is_featured:String?
    var arrcusineName = [CusineNameList]()
    init(attributes:NonOptionalDictionary){
        image  = .image => attributes
        r_id = .r_id => attributes
        name = .name => attributes
        cost_sign  = .cost_sign => attributes
        total_records = .total_records => attributes
        cusine_id = .cusine_id => attributes
        address  = .address => attributes
        r_rating = .r_rating => attributes
        total_rating  = .total_rating => attributes
        rating = .rating => attributes
        id = .id => attributes
        r_is_featured = .r_is_featured => attributes
        longitude = .longitude => attributes
        latitude = .latitude => attributes
        status = .status => attributes
        distance = .distance => attributes
        type = .type => attributes
        contact = .contact => attributes
        offerPrice = .offer_price => attributes
        r_contact = .r_contact => attributes
        resFav = .res_fav =|| attributes
        let cusineName = .cuisines_name =| attributes
        for arr in /cusineName{
            let dict = CusineNameList.init(attributes: arr as! NonOptionalDictionary)
            arrcusineName.append(dict)
        }
        
}
}
            
 class resturantDetailFav{
    var r_image_path:String?
    var r_name:String?
    var cuisine:String?
    var avgRating:String?
    var totalRating:String?
     var rId:String?
     var delivery:String?
     var latitude:String?
     var longitude:String?
     var status_resturent:String?
     var r_is_featured:String?
    init(attributes:NonOptionalDictionary){
        r_image_path  = .r_image_path => attributes
        cuisine = .cuisine => attributes
        r_name = .r_name => attributes
        avgRating = .rest_avg_rating => attributes
        totalRating = .total_rating => attributes
        rId = .r_id => attributes
        delivery = .delivery => attributes
        latitude = .latitude => attributes
        longitude = .longitude => attributes
        r_is_featured = .r_is_featured => attributes
        status_resturent = .status_resturent => attributes
}
}
class CusineNameList{
    var cusineName:String?
    init(attributes:NonOptionalDictionary){
        cusineName = .cuisines_name => attributes
    }
    
}
class BannerList{
    var resUrl:String?
    var status:String?
    var distance:String?
    var latitude:String?
    var longitude:String?
    var image:String?
    init(attributes:NonOptionalDictionary){
        resUrl = .res_url => attributes
        status = .status => attributes
        distance = .distance => attributes
        latitude = .latitude => attributes
        longitude = .longitude => attributes
        image = .image => attributes
    }
}

