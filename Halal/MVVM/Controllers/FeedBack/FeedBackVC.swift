//
//  FeedBackVC.swift
//  Halal
//
//  Created by snow-macmini-1 on 04/10/21.
//

import UIKit
class FeedBackVC: UIViewController,UITextFieldDelegate,UITextViewDelegate {
    
    @IBOutlet weak var txtVwFeedback: UITextView!
    @IBOutlet weak var txtFldName: UITextField!
    @IBOutlet weak var txtFldEmail: UITextField!
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet var vwBase: UIView!
    
    var name = ""
    var email = ""
    var feedback = ""
    
    var webService = ViewModelForSendFeedback()
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        uiSet()
        
    }
    func uiSet(){
        txtFldName.delegate = self
        txtFldEmail.delegate = self
        txtVwFeedback.delegate = self
        
    let statusBarView = UIView(frame: UIApplication.shared.statusBarFrame)
           let statusBarColor = UIColor(red: 0/255, green: 186/255, blue: 0/255, alpha: 1.0)
           statusBarView.backgroundColor = statusBarColor
           view.addSubview(statusBarView)
        txtFldName.attributedPlaceholder = NSAttributedString(string: "Full Name", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        txtFldEmail.attributedPlaceholder = NSAttributedString(string: "Email Address", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        txtFldName.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: txtFldName.frame.height))
        txtFldName.leftViewMode = .always

        // Create a padding view for padding on right
        txtFldName.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: txtFldName.frame.height))
        txtFldName.rightViewMode = .always
        txtFldEmail.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: txtFldEmail.frame.height))
        txtFldEmail.leftViewMode = .always

        // Create a padding view for padding on right
        txtFldEmail.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: txtFldEmail.frame.height))
        txtFldEmail.rightViewMode = .always
        
        if self.traitCollection.userInterfaceStyle == .light {
            vwBase.backgroundColor = UIColor(red: 227.0/255.0, green: 227.0/255.0, blue: 227.0/255.0, alpha: 1.0)
        }else{
            txtFldName.backgroundColor = .systemGray5
            txtFldEmail.backgroundColor = .systemGray5
            txtVwFeedback.backgroundColor = .systemGray5
            btnBack.setImage(UIImage(named: "GreenCross2"), for: .normal)
        }
        
}
override var preferredStatusBarStyle: UIStatusBarStyle {
       return .lightContent

}
    
    @IBAction func actionBtnSend(_ sender: UIButton) {
        checkValidData()
    }
    @IBAction func actionCrossBtn(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case txtFldName:
            txtFldName.resignFirstResponder()
            txtFldEmail.becomeFirstResponder()
        case txtFldEmail:
            txtFldEmail.resignFirstResponder()
            txtVwFeedback.becomeFirstResponder()
        default: break
        }
        return true
    }
    func checkValidData(){
        switch Validations.validSendFeedback(email: /txtFldEmail.text, name: /txtFldName.text, feedback: /txtVwFeedback.text) {
           case .success:
            webService.webServiceForSendFeedback(obj: self)
           case.failure(_, let message):
            TostErrorMessage(view: self.view, message: message)
        }
       }

}
