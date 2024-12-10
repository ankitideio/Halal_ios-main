//
//  TabBarVC.swift
//  Halal
//
//  Created by snow-macmini-3 on 01/10/21.
//

import UIKit

class TabBarVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

 
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()

        // Draw Indicator above the tab bar items
//        if self.traitCollection.userInterfaceStyle == .light{
//            UITabBar.appearance().barTintColor = .black
//            tabBar.unselectedItemTintColor = .white
//        }else{
//            tabBar.unselectedItemTintColor = appTabBarColor
//            UITabBar.appearance().barTintColor = UIColor.white
//        }
    }
  

}
