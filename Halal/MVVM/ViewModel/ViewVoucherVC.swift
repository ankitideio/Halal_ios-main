//
//  ViewVoucherVC.swift
//  Halal
//
//  Created by snow-macmini-2 on 01/11/21.
//

import UIKit

class ViewVoucherVC: UIViewController {

    @IBOutlet weak var imgOff: UIImageView!
    @IBOutlet weak var lblEntireBill: UILabel!
    @IBOutlet weak var lblCuisineName: UILabel!
    @IBOutlet weak var imgWarning: UIImageView!
    @IBOutlet weak var lblWarning: UILabel!
    @IBOutlet weak var lblVoucherValidTill: UILabel!
    @IBOutlet weak var lblOff: UILabel!
    @IBOutlet weak var lbl2VoucherValidTill: UILabel!
    @IBOutlet weak var btncall: UIButton!
    @IBOutlet weak var btnView: UIButton!
    @IBOutlet weak var btnLocation: UIButton!
    @IBOutlet weak var lbl3VoucherValidTill: UILabel!
    @IBOutlet weak var btnBack: UIButton!
    
    var month:String?
    var off:String?
    var RestName:String?
    var presentDate:String?
    var time:String?
    var callData:myVoucherData?
    var arrmyVouchers = [myVoucherData]()
    var webService = ViewModelForNearVenues()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblCuisineName.text = RestName
        lblOff.text = /off + "%" + "Off"
        let date = Date()
        let calendar = Calendar.current
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let todaysDate = dateFormatter.string(from: date)
        let hour = calendar.component(.hour, from: date)
        let minutes = calendar.component(.minute, from: date)
        let totalTime = "\(hour)" + ":" + "\(minutes)"
        presentDate = "\(todaysDate)"
        time = "\(totalTime)"
        currentMonth()
        saveResLatitude(resLatitude: /callData?.rest_lat)
        saveResLongitude(resLongitude: /callData?.rest_long)
        if self.traitCollection.userInterfaceStyle == .dark {
            btncall.backgroundColor = UIColor(red: 62.0/255.0, green: 59.0/255.0, blue: 59.2/255.0, alpha: 1.0)
            btnView.backgroundColor = UIColor(red: 62.0/255.0, green: 59.0/255.0, blue: 59.2/255.0, alpha: 1.0)
            btnLocation.backgroundColor = UIColor(red: 62.0/255.0, green: 59.0/255.0, blue: 59.2/255.0, alpha: 1.0)
            btnBack.setImage(UIImage(named: "GreenCross2"), for: .normal)
        }
    
    }
    func currentMonth(){
        let current = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM"
        month = formatter.string(from: current)
    }
    

    @IBAction func actionCross(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func actionCallRestaurent(_ sender: Any) {
        
        webService.webServiceForTrackActivity(obj: self)
        if let url = URL(string: "tel://\(/callData?.phone?.filter {!$0.isWhitespace})"),
        UIApplication.shared.canOpenURL(url) {
        UIApplication.shared.open(url, options: [:], completionHandler: nil) }
        print("tel://\(/callData?.phone)")


    }

    @IBAction func actionViewMenu(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
           let vc = storyBoard.instantiateViewController(withIdentifier: "RestourentDetailVC") as! RestourentDetailVC
        vc.lattitude = /callData?.rest_lat
        vc.longitude = /callData?.rest_long
        vc.r_id = /callData?.rest_id
        vc.time = /time
        vc.presentdate = /presentDate
        self.navigationController?.pushViewController(vc, animated: true)
        
      
    }
    @IBAction func actionLocateRestaurent(_ sender: Any) {
        let url = URL(string:  "http://maps.apple.com/maps?daddr=" + fetchResCurrentLat() + "," + fetchResCurrentLong() + "&saddr=" + fetchResLatitude() + "," + fetchResLongitude() + "&views=traffic")
        webService.webServiceForTrackActivity(obj: self)
        UIApplication.shared.open(url!)

    }
  

    
}
