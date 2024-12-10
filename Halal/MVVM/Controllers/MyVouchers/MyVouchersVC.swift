
//
//  MyVouchersVC.swift
//  Halal
//
//  Created by snow-macmini-1 on 04/10/21.
//

import UIKit

class MyVouchersVC: UIViewController {
    
    @IBOutlet weak var tblMyVouchers: UITableView!
    @IBOutlet weak var vwTop: UIView!
    
    var arrmyVouchers = [myVoucherData]()
    var webService = ViewModelFOrVoucherList()
    var isComingFrom = String()
    override func viewDidLoad() {
        super.viewDidLoad()
      uiSet() 
       
    }
    func uiSet(){
//        webService.webServiceForMyVoucher(obj: self)
      //  lblMyVoucher.text = "MY VOUCHER"
        if self.traitCollection.userInterfaceStyle == .dark {
            vwTop.backgroundColor = UIColor(red: 62.0/255.0, green: 59.0/255.0, blue: 59.2/255.0, alpha: 1.0)
        }
        tblMyVouchers.delegate = self
        tblMyVouchers.dataSource = self
        self.tblMyVouchers.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: tblMyVouchers.frame.size.width, height: 1))
        let statusBarView = UIView(frame: UIApplication.shared.statusBarFrame)
               let statusBarColor = UIColor(red: 0/255, green: 186/255, blue: 0/255, alpha: 1.0)
               statusBarView.backgroundColor = statusBarColor
               view.addSubview(statusBarView)
}
override var preferredStatusBarStyle: UIStatusBarStyle {
           return .lightContent
    }
    
    
    @IBAction func actionBackBtn(_ sender: UIButton) {
        if isComingFrom == "Voucher"{
            let viewcontrollers = self.navigationController?.viewControllers
            viewcontrollers?.forEach({ (vc) in
            if let MyVouchersVC = vc as? RestourentDetailVC {
            self.navigationController!.popToViewController(MyVouchersVC, animated: true)
            }
            })
        }else{
         
            self.navigationController?.popViewController(animated: true)
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        webService.webServiceForMyVoucher(obj: self)
    }
    
}
