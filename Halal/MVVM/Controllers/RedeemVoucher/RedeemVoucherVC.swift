//
//  RedeemVoucherVC.swift
//  Halal
//
//  Created by snow-macmini-1 on 04/10/21.
//

import UIKit

class RedeemVoucherVC: UIViewController {
    @IBOutlet weak var heightHowToRedeemView: NSLayoutConstraint!
    @IBOutlet weak var lblHowToRedeem: UILabel!
    @IBOutlet weak var txtFldName: UITextField!
    @IBOutlet weak var lblRestaurantName: UILabel!
    @IBOutlet weak var lblTotalBill: UILabel!
    @IBOutlet weak var lblOff: UILabel!
    @IBOutlet weak var txtFldEmail: UITextField!
    @IBOutlet weak var txtFldPhone: UITextField!
    @IBOutlet weak var vwRedeem: UIView!
    @IBOutlet var vwBase: UIView!
    @IBOutlet weak var btnBack: UIButton!
    var off:String?
    var TotalBill:String?
    var RestName:String?
    var r_id = String()
    var offer_id = String()
    var howToRedeem = String()
    var webService = ViewModelForVouchers()
    override func viewDidLoad() {
        super.viewDidLoad()

        uiSet()
        
    }
    func uiSet(){
        
        if self.traitCollection.userInterfaceStyle == .light {
            vwBase.backgroundColor = UIColor(red: 227.0/255.0, green: 227.0/255.0, blue: 227.0/255.0, alpha: 1.0)
        }else{
            txtFldName.backgroundColor = .systemGray5
            txtFldEmail.backgroundColor = .systemGray5
            txtFldPhone.backgroundColor = .systemGray5
            vwRedeem.backgroundColor = .systemGray5
            btnBack.setImage(UIImage(named: "GreenCross2"), for: .normal)
        }
        
        lblOff.text = /off + "% OFF"
        lblTotalBill.text = TotalBill
        txtFldName.text = fetchUserName()
        txtFldEmail.text = fetchUserEmail()
        lblRestaurantName.text = RestName
//        lblHowToRedeem.numberOfLines = 0
//        lblHowToRedeem.sizeToFit()
//        heightHowToRedeemView.constant = CGFloat(lblHowToRedeem.frame.height) + 70
        let statusBarView = UIView(frame: UIApplication.shared.statusBarFrame)
               let statusBarColor = UIColor(red: 0/255, green: 186/255, blue: 0/255, alpha: 1.0)
               statusBarView.backgroundColor = statusBarColor
               view.addSubview(statusBarView)
}
override var preferredStatusBarStyle: UIStatusBarStyle {
           return .lightContent

    }
    

    @IBAction func actionRedeemBtn(_ sender: UIButton) {
  
        checkValidData()
       
    }
    @IBAction func actionBackBtn(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    func checkValidData(){

        switch Validations.validRedeem(email: txtFldEmail.text!, name: txtFldName.text!, phone: txtFldPhone.text!){
        case .success:
          apiRedeem()
           
        case.failure( _, let message):
            TostErrorMessage(view: self.view, message: message)
        }
        
    }
    func apiRedeem(){
       
        webService.webServiceForRedeemOffer(obj: self)
      
    }
    
    
}
