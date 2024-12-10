//
//  QuickViewVC.swift
//  Halal
//
//  Created by snow-macmini-1 on 09/12/21.
//

import UIKit
import CoreLocation
import SideMenu
import SystemConfiguration
class QuickViewVC: UIViewController,CLLocationManagerDelegate,SideMenuNavigationControllerDelegate{
    @IBOutlet weak var imgVwSwipe: UIImageView!
    @IBOutlet weak var heightClsnBottom: NSLayoutConstraint!
    @IBOutlet weak var lblNotFound: UILabel!
    @IBOutlet weak var clsnNearByRestaurent: UICollectionView!
    @IBOutlet weak var lblRestaurentnotFound: UILabel!
    @IBOutlet weak var btnQuickView: UIButton!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var vwNearBy: UIView!
    @IBOutlet weak var vwNearVenues: UIView!
    @IBOutlet weak var heightClsnVw: NSLayoutConstraint!
    @IBOutlet weak var bottomQuickView: NSLayoutConstraint!
    @IBOutlet weak var lblNearby: UILabel!
    @IBOutlet weak var vwSplash: UIView!
    
    var arrNearByVenue = [VenueResultModel]()
    var currentDate:String?
    var time:String?
    var latitude:String?
    var longitude:String?
    fileprivate var splashViewController: SplashVC? = nil
    var locationManager = CLLocationManager()
    var webService = ViewModelForNearVenues()
    var webServiceFav = ViewModelForFavorites()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if fetchSplashStatusForHome() == true{
            showSplashViewController()
            saveSplashStatusForHome(status: false)
        }else{
            vwSplash.isHidden = true
            saveSplashStatusForHome(status: false)
        }
        
        uiSet()
      
        }
        override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
     
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
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation :CLLocation = locations[0] as CLLocation

      latitude = ("\(userLocation.coordinate.latitude)")
      longitude = ("\(userLocation.coordinate.longitude)")

        
    }
    func uiSet(){
        
        if self.traitCollection.userInterfaceStyle == .light {
            vwNearVenues.backgroundColor = UIColor(red: 244.0/255, green: 244.0/255, blue: 244.0/255, alpha: 1.0)
            vwNearBy.backgroundColor = UIColor(red: 244.0/255, green: 244.0/255, blue: 244.0/255, alpha: 1.0)
        }
        determineMyCurrentLocation()
         
         lblName.text = "Salaam " + /fetchUserName() + ","
         let statusBarView = UIView(frame: UIApplication.shared.statusBarFrame)
         let statusBarColor = UIColor(red: 0/255, green: 186/255, blue: 0/255, alpha: 1.0)
         statusBarView.backgroundColor = statusBarColor
         view.addSubview(statusBarView)
//        lblNotFound.isHidden = true
        heightClsnVw.constant = CGFloat(0)
        
//        bottomQuickView.constant = CGFloat(70)
        clsnNearByRestaurent.delegate = self
        clsnNearByRestaurent.dataSource = self
        let date = Date()
        let calendar = Calendar.current
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let todaysDate = dateFormatter.string(from: date)
        let hour = calendar.component(.hour, from: date)
        let minutes = calendar.component(.minute, from: date)
        let totalTime = "\(hour)" + ":" + "\(minutes)"
        currentDate = "\(todaysDate)"
        time = "\(totalTime)"
        if UIDevice.modelName.contains("iPhone 6s") ||  UIDevice.modelName.contains("iPhone 6") ||  UIDevice.modelName.contains("iPhone SE") ||  UIDevice.modelName.contains("iPhone 7") ||  UIDevice.modelName.contains("iPhone 8") ||  UIDevice.modelName.contains("iPhone SE (2nd generation)") ||  UIDevice.modelName.contains("iPhone 12 mini"){
            heightClsnVw.constant = 0
            heightClsnBottom.constant = 0
            bottomQuickView.constant = CGFloat(70)
        }else{
            heightClsnVw.constant = 0
            heightClsnBottom.constant = 0
            bottomQuickView.constant = CGFloat(70)
        }
        
        webService.webServiceForNearByVenues(obj: self)

       
       
    }
    
    func showSplashViewControllerNoPing() {
        
        let loadingScreen = SplashVC(tileViewFileName: "SplashVCAnimation")
        self.splashViewController = loadingScreen
        loadingScreen.pulsing = true
        loadingScreen.view.backgroundColor = UIColor.init(red: 238/255, green: 238/255, blue: 238/255, alpha: 1.0)
        loadingScreen.willMove(toParent: self)
        addChild(loadingScreen)
        view.addSubview(loadingScreen.view)
        loadingScreen.didMove(toParent: self)
    }
    
    func showSplashViewController() {
        vwSplash.isHidden = true
        showSplashViewControllerNoPing()
        
        delay(2.00) {
            self.splashViewController?.willMove(toParent: nil)
            self.splashViewController?.removeFromParent()
            self.splashViewController?.view.removeFromSuperview()
            self.didMove(toParent: nil)
        }
    }
    
    public func delay(_ delay:Double, closure:@escaping ()->()) {
        DispatchQueue.main.asyncAfter(
            deadline: DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: closure)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        saveIsComingFrom(isComingFrom: true)
       
    }

    @IBAction func actionBtnSearchLoction(_ sender: UIButton) {
        SceneDelegate().makeRootController(IDStr: "TTabBarViewController")
    }
    @IBAction func actionQuickButton(_ sender: UIButton) {
        if btnQuickView.isSelected == false{
            view.layoutIfNeeded()
            if UIDevice.modelName.contains("iPhone 6s") ||  UIDevice.modelName.contains("iPhone 6") ||  UIDevice.modelName.contains("iPhone SE") ||  UIDevice.modelName.contains("iPhone 7") ||  UIDevice.modelName.contains("iPhone 8") ||  UIDevice.modelName.contains("iPhone SE (2nd generation)") ||  UIDevice.modelName.contains("iPhone 12 mini"){
                heightClsnVw.constant = 345
                heightClsnBottom.constant = 15
                bottomQuickView.constant = CGFloat(45)
            }else{
                heightClsnVw.constant = 370
                heightClsnBottom.constant = 50
                bottomQuickView.constant = CGFloat(70)
            }
         
            UIView.animate(withDuration: 1.0, animations: {
                 self.view.layoutIfNeeded()
            })
             
//            btnQuickView.setImage(UIImage(named: "swipe3 copy"), for: .normal)
            imgVwSwipe.image = UIImage(named: "sww")
            btnQuickView.isSelected = true
            
        }else{
            view.layoutIfNeeded()
            heightClsnVw.constant = 0

            UIView.animate(withDuration: 1.0, animations: {
                 self.view.layoutIfNeeded()
            })
            if UIDevice.modelName.contains("iPhone 6s") ||  UIDevice.modelName.contains("iPhone 6") ||  UIDevice.modelName.contains("iPhone SE") ||  UIDevice.modelName.contains("iPhone 7") ||  UIDevice.modelName.contains("iPhone 8") ||  UIDevice.modelName.contains("iPhone SE (2nd generation)") ||  UIDevice.modelName.contains("iPhone 12 mini"){
              
                bottomQuickView.constant = CGFloat(45)
            }else{
          
                bottomQuickView.constant = CGFloat(70)
            }
//                   bottomQuickView.constant = CGFloat(70)

            imgVwSwipe.image = UIImage(named: "sww1")
            btnQuickView.isSelected = false
        }

    }
    @IBAction func actionMenuBtn(_ sender: UIButton) {
//        if fetchSideMenu() == true{
            let menu = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SideMenuNavigationController") as! SideMenuNavigationController
            menu.sideMenuDelegate = self
            menu.sideMenuManager.menuPresentMode = .menuSlideIn
            menu.sideMenuManager.menuFadeStatusBar = false
            menu.sideMenuManager.menuAnimationBackgroundColor = .white
            menu.menuWidth = view.frame.width * 0.80
            //     webService.webServiceForHome(obj: self)

            self.present(menu, animated: false, completion: nil)
//            
//        }
      
    }
   
  
}

