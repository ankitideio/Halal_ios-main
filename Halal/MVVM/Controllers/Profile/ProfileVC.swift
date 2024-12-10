//
//  ProfileVC.swift
//  Halal
//
//  Created by snow-macmini-1 on 04/10/21.
//

import UIKit

class ProfileVC: UIViewController,UITextFieldDelegate{
    

    @IBOutlet weak var imgVwProfile: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var txtFldName: UITextField!
    @IBOutlet weak var txtFldEmail: UITextField!
    @IBOutlet weak var txtFldPhoneNumber: UITextField!
    @IBOutlet weak var txtFldAddress: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        uiSet()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        imgVwProfile.sd_setImage(with: URL(string:/fetchProfileImage()), placeholderImage: UIImage(named: "03"), options: .refreshCached, context: nil)
        txtFldName.text = fetchUserName()
        txtFldEmail.text = fetchUserEmail()
        txtFldAddress.text = fetchLocation()
       
        txtFldPhoneNumber.text = fetchPhoneNumber()
//        lblName.text = fetchUserName()
//        lblAddress.text = fetchLocation()
        
    }
    func uiSet(){
        txtFldName.delegate = self
        txtFldEmail.delegate = self
        txtFldPhoneNumber.delegate = self
        txtFldAddress.delegate = self
        imgVwProfile.layer.cornerRadius = imgVwProfile.frame.size.width/2
        let statusBarView = UIView(frame: UIApplication.shared.statusBarFrame)
               let statusBarColor = UIColor(red: 0/255, green: 186/255, blue: 0/255, alpha: 1.0)
               statusBarView.backgroundColor = statusBarColor
               view.addSubview(statusBarView)
    
}
override var preferredStatusBarStyle: UIStatusBarStyle {
           return .lightContent

    }
    
    @IBAction func actionBackBtn(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func actionEditBtn(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "EditProfileVC") as! EditProfileVC
        vc.location = txtFldAddress.text
        vc.phone = txtFldPhoneNumber.text
        vc.userName = txtFldName.text
        vc.userEmail = txtFldEmail.text
        self.navigationController?.pushViewController(vc, animated: true)
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case txtFldName:
            txtFldName.resignFirstResponder()
        case txtFldEmail:
            txtFldEmail.resignFirstResponder()
        case txtFldPhoneNumber:
            txtFldPhoneNumber.resignFirstResponder()
        case txtFldAddress:
            txtFldAddress.resignFirstResponder()

        default: break
            
        }
        return true
    }
//    func UpdateData(profileImg: UIImage, username: String, email: String, phoneno: String, location: String) {
//        imgVwProfile.image = profileImg
//        txtFldName.text = username
//        txtFldEmail.text = email
//        txtFldPhoneNumber.text = phoneno
//        txtFldAddress.text = location
//        lblName.text = username
//        lblAddress.text = location
//    }
}
