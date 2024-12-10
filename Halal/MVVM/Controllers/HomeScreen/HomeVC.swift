//
//  HomeVC.swift
//  Halal
//
//  Created by snow-macmini-2 on 01/10/21.
//

import UIKit
import MapKit
import SideMenu
import CoreLocation
import GoogleMaps
import GooglePlaces
import MapViewPlus

class HomeVC: UIViewController,SideMenuNavigationControllerDelegate,UITextFieldDelegate,CLLocationManagerDelegate,DelegateSearchAddress{
 
    @IBOutlet weak var scrollvw: UIScrollView!
    @IBOutlet weak var vwGrayLine: UIView!
//    @IBOutlet weak var HeightMap: NSLayoutConstraint!
    @IBOutlet weak var mapVwPlus: MapViewPlus!
    @IBOutlet weak var lblResAddress: UILabel!
    @IBOutlet weak var lblResName: UILabel!
    @IBOutlet weak var txtFldSearch: UITextField!
    @IBOutlet weak var btnList: UIButton!
    @IBOutlet weak var vwLocation: UIView!
    @IBOutlet weak var btnLocation: UIButton!
    @IBOutlet weak var lblResPhone: UILabel!
    @IBOutlet weak var vwMap: UIView!
    @IBOutlet weak var vwList: UIView!
    @IBOutlet weak var vwAnnotation: UIView!
    @IBOutlet weak var heightTblVw: NSLayoutConstraint!
    @IBOutlet weak var vwTable: UIView!
    @IBOutlet weak var lblPhoneAnnotation: UILabel!
    @IBOutlet weak var collVwHome: UICollectionView!
    @IBOutlet weak var scrollVw: UIScrollView!
    @IBOutlet weak var tblVwHome: UITableView!
    //MARK:- Variables
    var isSelected = false
    var locManager = CLLocationManager()
    var currentLocation: CLLocation!
    var webServiceFav = ViewModelForFavorites()
    var webServiceReview = ViewModelForGoogleReview()
    var webService = ViewModelForHome()
    var images = String()
    var cuisine_id = ""
    var lat = String()
    var long = String()
    var cat_id = "2,3,6"
    var page_no = "1"
    var distance = "15"
    var contentOffset:CGFloat = 20
    var page = 1
    var time = String()
    var presentdate = String()
    var arrResult = [resultModel]()
    var arrBanner = [BannerList]()
    var totalCount = 0
    var pageCount = 1
    var rowHeight = Int()
    var id:String?
    var req = "unfav_res"
    var key = "1702NKDRDA"
    var user_id = ""
    var r_id = ""
    var locationManager = CLLocationManager()
    var cameraPosition = GMSCameraPosition()
    var currentDate = Date()
    var rId:String?
    var resName:String?
    var resAddress:String?
    var resPhone:String?
    var selectIndex:Int?
    var placeId:String?
    var searchStatus = false

    override func viewDidLoad() {
        super.viewDidLoad()
      
   
        
        if self.traitCollection.userInterfaceStyle == .dark {
            txtFldSearch.textColor = .black
        }
        
        if fetchLatitude() == "" && fetchLongitude() == ""{
            determineMyCurrentLocation()
        }
        uiSet()
        NotificationCenter.default.addObserver(self, selector: #selector(self.methodOfReceivedNotification(notification:)), name: Notification.Name("Home"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.methodOfReceivedNotificationHomeSearch(notification:)), name: NSNotification.Name("HomeSearch"), object: nil)
    }
    
    @objc func methodOfReceivedNotificationHomeSearch(notification: Notification) {
        
        pageCount = 1
        mapVwPlus.removeAllAnnotations()
        arrResult.removeAll()
       
        webService.webServiceForHome(obj: self)
    }
    
    func uiSet(){
        saveComingNotification(comingNotification: false)
        tblVwHome.delegate = self
        tblVwHome.dataSource = self
        mapVwPlus.delegate = self
        txtFldSearch.delegate = self
        vwMap.isHidden = true
        mapVwPlus.isHidden = true
//        HeightMap.constant = CGFloat(0)
        //selectCompanyUser()
        let tabBar = self.tabBarController!.tabBar
        if self.traitCollection.userInterfaceStyle == .dark {
            tabBar.selectionIndicatorImage = UIImage().createSelectionIndicator(color: UIColor.white, size: CGSize(width: tabBar.frame.width/CGFloat(tabBar.items!.count), height: tabBar.frame.height), lineHeight: 2.0)
        }else{
            tabBar.selectionIndicatorImage = UIImage().createSelectionIndicator(color: UIColor.black, size: CGSize(width: tabBar.frame.width/CGFloat(tabBar.items!.count), height: tabBar.frame.height), lineHeight: 2.0)
        }
        
        
        
        
        
        let statusBarView = UIView(frame: UIApplication.shared.statusBarFrame)
        let statusBarColor = UIColor(red: 0/255, green: 186/255, blue: 0/255, alpha: 1.0)
        statusBarView.backgroundColor = statusBarColor
        view.addSubview(statusBarView)
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

    func selectCompanyUser() {
        guard let window = UIApplication.shared.keyWindow else {
            return
        }

        guard let rootViewController = window.rootViewController else {
            return
        }

        let viewController = TTabBarViewController()
        viewController.view.frame = rootViewController.view.frame
        viewController.view.layoutIfNeeded()

        UIView.transition(with: window, duration: 0.6, options: .transitionFlipFromLeft, animations: {
            window.rootViewController = viewController
        }, completion: nil)
    }
    
    func annotationsOnMap() {
        
        var index = 0
        
        for arr in /arrResult{
        
            let lat = Double(/arr.latitude)
            let long = Double(/arr.longitude)
            let viewModel = MapViewModel(name: /arr.name, address: /arr.address, phone: /arr.r_contact,resId: /arr.r_id,lat: /arr.latitude,long: /arr.longitude,image: /arr.image)
            
            let annotation = AnnotationPlus(viewModel: viewModel,
                                            coordinate: CLLocationCoordinate2DMake(/lat, /long))
            
            var annotations: [AnnotationPlus] = []
                annotations.append(annotation)
            
            let span = MKCoordinateSpan.init(latitudeDelta: 0.2, longitudeDelta:
                                                0.2)
            let coordinate = CLLocationCoordinate2D.init(latitude: /lat, longitude: /long)
            let region = MKCoordinateRegion.init(center: coordinate, span: span)
            mapVwPlus.setRegion(region, animated: true)
            mapVwPlus.showsUserLocation = true
          
            mapVwPlus.setup(withAnnotations: annotations)
            index = +1
        }
        
    }
   
    @objc func methodOfReceivedNotification(notification: Notification) {
        arrResult.removeAll()
        pageCount = 1
        webService.webServiceForHome(obj: self)
    }
    
    func determineMyCurrentLocation() {
        self.locationManager.requestAlwaysAuthorization()
        self.locationManager.requestWhenInUseAuthorization()
        
        DispatchQueue.main.async {
            if CLLocationManager.locationServicesEnabled() {
                self.locationManager.delegate = self
                self.locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
                self.locationManager.startUpdatingLocation()
                
            }
        }
        
    }
    
    
    
    @IBAction func actionAnnotationBtn(_ sender: UIButton) {
        //        heightAnnotationVw.constant = CGFloat(0.0)
        
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let userLocation:CLLocation = locations[0] as CLLocation
        
        print("user latitude = \(userLocation.coordinate.latitude)")
        print("user longitude = \(userLocation.coordinate.longitude)")
        lat = "\(userLocation.coordinate.latitude)"
        long =  "\(userLocation.coordinate.longitude)"
        let latitude = Double(/lat)
        let longitude = Double(/long)
        let location = CLLocation(latitude: /latitude, longitude: /longitude)
         getAdressName(coords: location)
        arrResult.removeAll()
        pageCount = 1
        webService.webServiceForHome(obj: self)
        locationManager.stopUpdatingLocation()
    }
    func hasTopNotch() -> Bool {
        if #available(iOS 11.0, tvOS 11.0, *) {
            return UIApplication.shared.delegate?.window??.safeAreaInsets.top ?? 0 > 20
        }
        return false
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case txtFldSearch:
            txtFldSearch.resignFirstResponder()
        default: break
            
        }
        return true
    }
   
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    override func viewWillAppear(_ animated: Bool) {
        uiSet()
        self.hidesBottomBarWhenPushed = false
       // TTabBarViewController().viewWillAppear(true)
        lat = fetchLatitude()
        long = fetchLongitude()
        let latitude = Double(/fetchLatitude())
        let longitude = Double(/fetchLongitude())
        let location = CLLocation(latitude: /latitude, longitude: /longitude)
         getAdressName(coords: location)
        if fetchSideMenu() == true{
            let menu = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SideMenuNavigationController") as! SideMenuNavigationController
            menu.sideMenuDelegate = self
            menu.sideMenuManager.menuPresentMode = .menuSlideIn
            menu.sideMenuManager.menuFadeStatusBar = false
            menu.sideMenuManager.menuAnimationBackgroundColor = .white
            menu.menuWidth = view.frame.width * 0.80
//            txtFldSearch.text = /fetchAddressName()
            
            self.present(menu, animated: false, completion: nil)
            
        }
        
            arrResult.removeAll()
        if fetchLatitude() == "" && fetchLongitude() == ""{
            determineMyCurrentLocation()
        }else{
            webService.webServiceForHome(obj: self)
        }
          
    }
    @IBAction func actionBtnList(_ sender: Any) {
//        vwGrayLine.isHidden = false
       
        
    }
    
    
    func UpdateData(status: Bool, name: String, lat: String, long: String,city:String,stateCode:String,urban:String) {
        txtFldSearch.text = name
        self.lat = lat
        self.long = long
        print(lat)
        print(long)
        print(name)
        pageCount = 1
        arrResult.removeAll()
     
        webService.webServiceForHome(obj: self)
     
    }
    @IBAction func actionBtnSearch(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "AddressSearchVC") as! AddressSearchVC
        vc.modalPresentationStyle = .overFullScreen
        vc.delegate = self
        self.navigationController?.present(vc, animated: true, completion: nil)
    }
    @IBAction func actionBtnLocation(_ sender: Any) {
       
    }
    @IBAction func actionBtnFavourite(_ sender: Any) {
    }
    
    @IBAction func actionBtnImage(_ sender: Any) {
        
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
                    if place.locality != nil {
                        addressCity = addressCity + place.locality! 
                    }
                    let str = addressCity
                    let firstWord = str.components(separatedBy: " ").first
                    saveCityName(cityName: /firstWord)
                    self.txtFldSearch.text = adressString
                    print(adressString)
                }
            }
        }
    }
}

extension HomeVC: MapViewPlusDelegate {
    
    func mapView(_ mapView: MapViewPlus, imageFor annotation: AnnotationPlus) -> UIImage {
     
            return UIImage(named: "1x")!
        
    }
    
    func mapView(_ mapView: MapViewPlus, calloutViewFor annotationView: AnnotationViewPlus) -> CalloutViewPlus{
        let calloutView = Bundle.main.loadNibNamed("MapAnnotation", owner: nil, options: nil)!.first as! AnnotationMapView
        calloutView.lblPhone.textColor = UIColor.init(red: 5.0/255.0, green: 185.0/255.0, blue: 0.0/255.0, alpha: 1.0)
        calloutView.btnDirection.setTitleColor(UIColor.init(red: 5.0/255.0, green: 185.0/255.0, blue: 0.0/255.0, alpha: 1.0), for: .normal)
        calloutView.lblResName.textColor = UIColor.init(red: 5.0/255.0, green: 185.0/255.0, blue: 0.0/255.0, alpha: 1.0)
        
        calloutView.btnDirection.addTarget(self, action: #selector(direction), for: .touchUpInside)
        calloutView.btnPhn.addTarget(self, action: #selector(call), for: .touchUpInside)
        calloutView.btnNext.addTarget(self, action: #selector(Next), for: .touchUpInside)
        return calloutView
    }
    @objc func Next(){
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "RestourentDetailVC") as! RestourentDetailVC
        vc.resName = fetchRestaurentName()
        vc.r_id = fetchMapId()
        vc.lattitude = fetchMapLat()
        vc.longitude = fetchMapLong()
        vc.time = time
        vc.presentdate = presentdate
        vc.callData?.contact = fetchPhoneNumber()
        vc.isComingFrom = true
//        vc.resName = fetchRestaurentName()
        saveIsComing(isComing: true)
//        webServiceReview.webServiceForAnnotationPlaceId(obj: self)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func direction(){
        let url = URL(string:  "http://maps.apple.com/maps?daddr=" + fetchResCurrentLat() + "," + fetchResCurrentLong() + "&saddr=" + fetchMapLat() + "," + fetchMapLong() + "&views=traffic")
        UIApplication.shared.open(url!)
    }
    
    @objc func call(){
        if let url = URL(string: "tel://\(/fetchPhoneNumber().filter {!$0.isWhitespace})"),
           UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil) }
    }
    
}
