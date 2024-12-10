//
//  SideMenuVC.swift
//  Halal
//
//  Created by snow-macmini-3 on 02/10/21.
//

import UIKit
import SideMenu

class SideMenuVC: UIViewController, SideMenuNavigationControllerDelegate {

  
//    var arrImage  = ["homeB2","like3","user3","icon3","mail3","star3","speaker3","support3","logout3"]
//       var arrLable = ["Home","My Favourites","My Profile","My Vouchers","Send Feedback","Rate App","Advertise with Halal Advisor","About Halal Advisor","Logout"]
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        uiSet()
    }
        func uiSet(){

       let statusBarView = UIView(frame: UIApplication.shared.statusBarFrame)
       let statusBarColor = UIColor(red: 0/255, green: 186/255, blue: 0/255, alpha: 1.0)
       statusBarView.backgroundColor = statusBarColor
       view.addSubview(statusBarView)
       }
       override var preferredStatusBarStyle: UIStatusBarStyle {
       return .lightContent

       
      
        }
    override func viewWillAppear(_ animated: Bool) {
        saveSideMenu(sideMenuShow: true)
        SceneDelegate().makeRootController(IDStr: "TTabBarViewController")
    }
   


}



