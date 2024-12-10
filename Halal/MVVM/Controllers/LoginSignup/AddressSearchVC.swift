//
//  AddressSearchVC.swift
//  Halal
//
//  Created by snow-macmini-2 on 21/10/21.
//

import UIKit
import CoreLocation

class AddressSearchVC: UIViewController,UITextFieldDelegate,UINavigationControllerDelegate,CLLocationManagerDelegate {

    @IBOutlet weak var tblVwAddressSearch: UITableView!
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var btnCross: UIButton!
    @IBOutlet weak var txtFldSearchAddress: UITextField!
    var delegate:DelegateSearchAddress?
    var arrAddress = [AddressList]()
    var webService = ViewModelForAddressSearch()
    
   
    
    var start = 0
    var limit = "8"
    var req = "search_au_towns"
  
    var lat = ""
    var long = ""
    var cat_id = "2"
    var page_no = "1"
    var distance = "20"
    var time = ""
    var presentdate = ""
    var cuisine_id = ""
    
    var currentDate = Date()
    var locationManager: CLLocationManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        txtFldSearchAddress.delegate = self
        let BackImg = UIImage(named: "back2")
        let tintedImage = BackImg?.withRenderingMode(.alwaysTemplate)
        btnBack.setImage(tintedImage, for: .normal)
        btnBack.tintColor = .gray
        
        let crossImg = UIImage(named: "GreenCross2")
        let tintImage = crossImg?.withRenderingMode(.alwaysTemplate)
        btnCross.setImage(tintImage, for: .normal)
        btnCross.tintColor = .gray
        
//MARK:- Crurrent Lat&Long
                if (CLLocationManager.locationServicesEnabled())
                        {
                            locationManager = CLLocationManager()
                            locationManager.delegate = self
                            locationManager.desiredAccuracy = kCLLocationAccuracyBest
                            locationManager.requestAlwaysAuthorization()
                            locationManager.startUpdatingLocation()
                }
//MARK:- Current Date&Time
                let date = Date()
                print("date",date)
                let calendar = Calendar.current
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd"
                let todaysDate = dateFormatter.string(from: date)
                let hour = calendar.component(.hour, from: date)
                let minutes = calendar.component(.minute, from: date)
                let totalTime = "\(hour)" + ":" + "\(minutes)"
                presentdate = "\(todaysDate)"
                time = "\(totalTime)"
               // webService.webServiceForHomeAddressList(obj: self)
                
    
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        dismiss(animated: true, completion: nil)
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation :CLLocation = locations[0] as CLLocation

        print("user latitude = \(userLocation.coordinate.latitude)")
        print("user longitude = \(userLocation.coordinate.longitude)")
         lat = "\(userLocation.coordinate.latitude)"
        long = "\(userLocation.coordinate.longitude)"
    //    webService.webServiceForHomeAddressList(obj: self)

    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error \(error)")
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if textField == self.txtFldSearchAddress{
            
                   let underlineAttriString = NSAttributedString(string: /txtFldSearchAddress.text,
                                                             attributes: [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue])
                   txtFldSearchAddress.attributedText = underlineAttriString
                   webService.webServiceForSearch(obj: self)
               
    }
    }

    @IBAction func actionBackBtn(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    @IBAction func actionBtnCross(_ sender: Any) {

        self.txtFldSearchAddress.text = nil
    }

    @objc func textFieldDidChange(textField: UITextField){
            let text = textField.text
            if  text?.count == 1 {
                switch textField{
                case txtFldSearchAddress:
                    txtFldSearchAddress.becomeFirstResponder()
                
                default:
                    break
                }
            }
            if  text?.count == 0 {
                switch textField{
                case txtFldSearchAddress:
                    txtFldSearchAddress.becomeFirstResponder()
                
                default:
                    break
                }
            }
            else{

            }
        }
}

extension AddressSearchVC: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return  50

    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrAddress.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblVwAddressSearch.dequeueReusableCell(withIdentifier: "AddressSearchTVC", for: indexPath) as! AddressSearchTVC
        
        cell.lblSearch.text = /arrAddress[indexPath.row].name + ", " + /arrAddress[indexPath.row].state_code + ", " + /arrAddress[indexPath.row].postcode
        
        
        return cell
    }
 
  
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        delegate?.UpdateData(status: true, name: "\(/arrAddress[indexPath.row].name)" + ", " + "\(/arrAddress[indexPath.row].state_code)" + ", " + "\(/arrAddress[indexPath.row].postcode)",lat:"\(/arrAddress[indexPath.row].latitude)",long:"\(/arrAddress[indexPath.row].longitude)", city: "\(/arrAddress[indexPath.row].name)", stateCode: "\(/arrAddress[indexPath.row].state_code)",urban: "\(/arrAddress[indexPath.row].urban_area)")
        saveUrbanName(urbanName: /arrAddress[indexPath.row].urban_area)
        saveLatitude(latitude: /arrAddress[indexPath.row].latitude)
        saveLongitude(longitude: /arrAddress[indexPath.row].longitude)
        saveOfferListingLat(offerListingLat: /arrAddress[indexPath.row].latitude)
        saveOfferListingLong(offerListingLong: /arrAddress[indexPath.row].longitude)
        saveAddressName(addressName: "\(/arrAddress[indexPath.row].name)" + ", " + "\(/arrAddress[indexPath.row].state_code)" + ", " + "\(/arrAddress[indexPath.row].postcode)")
        saveDistanceLat(distanceLat: /arrAddress[indexPath.row].latitude)
        saveDistanceLong(distanceLong: /arrAddress[indexPath.row].longitude)
      
        dismiss(animated: true, completion: nil)
    }
}
protocol DelegateSearchAddress:AnyObject {
    func UpdateData(status:Bool,name:String,lat:String,long:String,city:String,stateCode:String,urban:String)
}

