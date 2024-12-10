//
//  GoToVoucherVC.swift
//  Halal
//
//  Created by snow-macmini-1 on 04/10/21.
//

import UIKit

class GoToVoucherVC: UIViewController {
    
    @IBOutlet weak var lblRestaurantName: UILabel!
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var lblOff: UILabel!
    
    var resname = String()
    var Off = String()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if self.traitCollection.userInterfaceStyle == .dark {
            btnBack.setImage(UIImage(named: "GreenCross2"), for: .normal)
        }
        
        uiSet()
        
    }
    func uiSet(){
        lblRestaurantName.text = /resname
        lblOff.text = /Off + "% OFF"
        let statusBarView = UIView(frame: UIApplication.shared.statusBarFrame)
               let statusBarColor = UIColor(red: 0/255, green: 186/255, blue: 0/255, alpha: 1.0)
               statusBarView.backgroundColor = statusBarColor
               view.addSubview(statusBarView)
}
override var preferredStatusBarStyle: UIStatusBarStyle {
           return .lightContent

    }
    
    @IBAction func actionBackBtn(_ sender: UIButton) {
        let viewcontrollers = self.navigationController?.viewControllers
        viewcontrollers?.forEach({ (vc) in
        if let GoToVoucherVC = vc as? RestourentDetailVC {
        self.navigationController!.popToViewController(GoToVoucherVC, animated: true)
          }
       })

    }
    @IBAction func actionGoToVoucher(_ sender: UIButton) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "MyVouchersVC") as! MyVouchersVC
        vc.isComingFrom = "Voucher"
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
    

    


