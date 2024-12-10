//
//  OfferListingVC.swift
//  Halal
//
//  Created by snow-macmini-6 on 24/02/22.
//

import UIKit
import MapKit
import CoreLocation
import GoogleMaps
import GooglePlaces
class OfferListingVC: UIViewController,DelegateSearchAddress,CLLocationManagerDelegate {
 
    //MARK:- Outlets
    @IBOutlet weak var lblNotFound: UILabel!
    @IBOutlet weak var txtFldSearch: UITextField!
    @IBOutlet weak var tblVwOfferListing: UITableView!
    @IBOutlet weak var lblPlaceName: UILabel!
    
    //MARK:- Variables
    var webServiceFav = ViewModelForFavorites()
    var locManager = CLLocationManager()
    var currentLocation: CLLocation!
    var latitude = String()
    var longitude = String()
    var distance = "100"
    var cat_id = "2,3,6"
    var cuisine_id = ""
    var time = ""
    var presentdate = ""
    var page_no = "1"
    var cityName = "Sydney"
    var r_id = String()
    var id = String()
    var webService = ViewModelForOfferListing()
    var arrOfferListing = [OfferLitingResult]()
    override func viewDidLoad() {
        super.viewDidLoad()
       
        uiSet()
    }
    func uiSet(){
//        lblPlaceName.text = fetchOfferResName()
//        txtFldSearch.text = fetchOfferResName()
        if self.traitCollection.userInterfaceStyle == .dark {
            txtFldSearch.textColor = .black
        }
        
        tblVwOfferListing.delegate = self
        tblVwOfferListing.dataSource = self
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
       
      

    }
    override func viewWillAppear(_ animated: Bool) {
        DispatchQueue.main.asyncAfter(deadline: .now()){
            self.cityName = fetchUrbanName()
            self.latitude = fetchLatitude()
            self.longitude = fetchLongitude()
            let lat = Double(/self.latitude)
            let long = Double(/self.longitude)
            let location = CLLocation(latitude: /lat, longitude: /long)
            self.getAdressName(coords: location)
    //        arrOfferListing.removeAll()
            self.webService.webServiceForOfferListing(obj: self)
        }
 
    }
    
    @IBAction func actionSearchAddress(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "AddressSearchVC") as! AddressSearchVC
        vc.modalPresentationStyle = .overFullScreen
        vc.delegate = self
        self.navigationController?.present(vc, animated: true, completion: nil)
    }
    
    func UpdateData(status: Bool, name: String, lat: String, long: String, city: String, stateCode: String,urban:String) {
        
        latitude = lat
        longitude = long
        cityName = urban
        if urban == ""{
        cityName = city
        }
        txtFldSearch.text = name
        
        let str = city
        let firstWord = str.components(separatedBy: " ").first
        saveCityName(cityName: /firstWord)
//        lblPlaceName.text = "Current Deals in " + /city + "," + /stateCode
//        arrOfferListing.removeAll()
        webService.webServiceForOfferListing(obj: self)
    }
    
    func getAdressName(coords: CLLocation) {
        
        CLGeocoder().reverseGeocodeLocation(coords) { (placemark, error) in
            if error != nil {
                print("Hay un error")
            } else {
                
                let place = placemark! as [CLPlacemark]
                if place.count > 0 {
                    let place = placemark![0]
                    var adressString : String = ""
                    var addressCity : String = ""
                    var state: String = ""
                    //                           if place.thoroughfare != nil {
                    //                               adressString = adressString + place.thoroughfare! + ","
                    //                           }
//                    if place.name != nil {
//                        adressString = adressString + place.name! + ","
//                    }
//                    if place.subAdministrativeArea != nil {
//                        adressString = adressString + place.subAdministrativeArea! + ","
//                    }
                    if place.locality != nil {
                        adressString = adressString + place.locality! + ","
                    }
                    if place.administrativeArea != nil {
                        adressString = adressString + place.administrativeArea! + ","
                    }
                    if place.postalCode != nil {
                        adressString = adressString + place.postalCode!
                    }
                   
                    if place.locality != nil{
                        addressCity = addressCity + place.locality!
                    }
                    if place.administrativeArea != nil{
                        state = state + place.administrativeArea!
                    }
                    self.txtFldSearch.text = adressString
                    let str = addressCity
                    let firstWord = str.components(separatedBy: " ").first
//                    self.lblPlaceName.text = "Current Deals in " + /addressCity + "," + state
                    saveCityName(cityName: /firstWord)
//
                    print(adressString)
                }
            }
        }
    }
}
