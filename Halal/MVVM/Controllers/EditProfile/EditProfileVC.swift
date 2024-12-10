//
//  EditProfileVC.swift
//  Halal
//
//  Created by snow-macmini-1 on 04/10/21.
//

import UIKit

class EditProfileVC: UIViewController,UITextFieldDelegate,UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var lblEditPhoto: UILabel!
    @IBOutlet weak var txtFldEmail: UITextField!
    @IBOutlet weak var txtFldPhoneNumber: UITextField!
    @IBOutlet weak var txtFldAddress: UITextField!
    @IBOutlet weak var txtFldName: UITextField!
    @IBOutlet weak var imgVwProfile: UIImageView!
    var userName:String?
    var userEmail:String?
    var location:String?
    var phone:String?
//    var delegate:DelegateUpdateAddress?
    var webService = ViewModelForUpdateProfile()
    
    override func viewDidLoad() {
        super.viewDidLoad()
           uiSet()
      
    }
    func uiSet(){
        txtFldName.text = userName
        txtFldEmail.text = userEmail
        txtFldAddress.text = location
        txtFldPhoneNumber.text = phone
        imgVwProfile.sd_setImage(with: URL(string:/fetchProfileImage()), placeholderImage: UIImage(named: "03"), options: .refreshCached, context: nil)
        txtFldEmail.isUserInteractionEnabled = false
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
  //MARK:- imagePicker
    @IBAction func actionImgBtn(_ sender: Any) {
        let picker = UIImagePickerController()
            picker.delegate = self
            let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: { [self]
                action in
                picker.sourceType = .camera
                
                self.present(picker, animated: true, completion: nil)
            }))
            alert.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: {
                action in
                picker.sourceType = .photoLibrary
                self.present(picker, animated: true, completion: nil)
            }))
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
    }
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
  
            let image = info[.originalImage] as? UIImage
                imgVwProfile.image = image
            picker.dismiss(animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController)
    {
        picker.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func actionDeleteAccount(_ sender: Any) {
        let alert = UIAlertController(title: "Delete", message: "Do you really want to delete account?", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { vc in
            self.webService.webServiceDeleteAccount(obj: self)
        }))
        alert.addAction(UIAlertAction(title: "No", style: .default, handler: { vc in
          
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func actionBackBtn(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    func checkValidUpdateProfile(){
        switch Validations.validCustomerProfile( name: /txtFldName.text, email: /txtFldEmail.text, phone: /txtFldPhoneNumber.text, location: /txtFldAddress.text){
         case .success:
          apiUpdateProfile()
         case.failure( _, let message):
             TostErrorMessage(view: self.view, message: message)
         }
    }
     
     func apiUpdateProfile(){
         webService.webServiceForUpdateProfile(obj: self)
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
    @IBAction func actionSaveBtn(_ sender: UIButton) {
        checkValidUpdateProfile()
        
    }
}
//protocol DelegateUpdateAddress:AnyObject {
//    func UpdateData(profileImg:UIImage,username:String,email:String,phoneno:String,location:String)
//}
