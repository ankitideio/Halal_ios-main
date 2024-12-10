//
//  MapViewModel.swift
//  Halal
//
//  Created by snow-macmini-1 on 03/12/21.
//

import UIKit
import MapViewPlus

class MapViewModel:CalloutViewModel{
    var name: String?
    var address:String?
    var phone:String?
    var resId:String?
    var lat:String?
    var long:String?
    var image:String?
    init(name: String,address:String,phone:String,resId:String,lat:String,long:String,image:String) {
        self.name = name
        self.address = address
        self.phone = phone
        self.resId = resId
        self.lat = lat
        self.long = long
        self.image = image
      }
}
