//
//  AnnotationMapView.swift
//  Halal
//
//  Created by snow-macmini-1 on 03/12/21.
//

import UIKit
import MapViewPlus
class AnnotationMapView: UIView,CalloutViewPlus {
    @IBOutlet weak var lblPhone: UILabel!
    @IBOutlet weak var lblResName: UILabel!
    @IBOutlet weak var lblResAddress: UILabel!
    @IBOutlet weak var imgResturant: UIImageView!
    @IBOutlet weak var btnNext: UIButton!
    @IBOutlet weak var btnDirection: UIButton!
    
    @IBOutlet weak var btnPhn: UIButton!
    var resId:String?
    var latitude:String?
    var longitude:String?
    var name:String?
    func configureCallout(_ viewModel: CalloutViewModel) {
        let viewModel = viewModel as! MapViewModel
        lblResName.text = viewModel.name
        lblResAddress.text = viewModel.address
        lblPhone.text = viewModel.phone
        resId = viewModel.resId
        latitude = viewModel.lat
        longitude = viewModel.long
        imgResturant.sd_setImage(with: URL(string:/viewModel.image), placeholderImage: UIImage(named: "annotation2"), options: .refreshCached, context: nil)
        saveMapId(id: /resId)
        saveMapLat(mapLat: /latitude)
        saveResLong(resLong: /longitude)
        saveRestaurentName(name: /lblResName.text)
        savePhoneNumber(phoneNumber: /viewModel.phone)
        
    }
}
