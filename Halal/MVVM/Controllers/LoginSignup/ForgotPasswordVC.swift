//
//  ForgotPasswordVC.swift
//  Halal
//
//  Created by snow-macmini-2 on 15/10/21.
//

import UIKit

class ForgotPasswordVC: UIViewController {
    var webService = ViewModelForgotPassword()
    
    @IBOutlet weak var txtFldEmail: UITextField!
    @IBOutlet weak var btnReset: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      uiSet()
        
    }
    func uiSet(){

   let statusBarView = UIView(frame: UIApplication.shared.statusBarFrame)
   let statusBarColor = UIColor(red: 0/255, green: 186/255, blue: 0/255, alpha: 1.0)
   statusBarView.backgroundColor = statusBarColor
   view.addSubview(statusBarView)
    btnReset.backgroundColor = UIColor.init(red: 5.0/255.0, green: 185.0/255.0, blue: 0.0/255.0, alpha: 1.0)
   }
   override var preferredStatusBarStyle: UIStatusBarStyle {
   return .lightContent
}

override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
   {
      self.dismiss(animated: true, completion: nil)
   }

    @IBAction func actionResetPassword(_ sender: Any) {
        checkValidData()
    }
    
func checkValidData(){
    switch Validations.validForgotPassword(email: /txtFldEmail.text) {
       case .success:
        forgotPassword()
       case.failure(_, let message):
        TostErrorMessage(view: self.view, message: message)
    }
   }
   func forgotPassword() {
       webService.webServiceForForgotPassword(obj: self)

   }
    
}
