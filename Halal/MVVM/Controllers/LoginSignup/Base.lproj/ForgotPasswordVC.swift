//
//  ForgotPasswordVC.swift
//  Halal
//
//  Created by snow-macmini-2 on 30/09/21.
//

import UIKit

class ForgotPasswordVC: UIViewController {

    
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
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
       {
         
          self.dismiss(animated: true, completion: nil)
       }
  
}
