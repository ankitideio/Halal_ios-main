//
//  GetDirectionVC.swift
//  Halal
//
//  Created by snow-macmini-1 on 22/11/21.
//

import UIKit
import WebKit

class GetDirectionVC: UIViewController {
    @IBOutlet weak var lblHeader: UILabel!
    @IBOutlet weak var webView: WKWebView!
    var month:String?
    var webService = ViewModelForNearVenues()
    var isComingFrom:Bool?
    override func viewDidLoad() {
        super.viewDidLoad()
    
        if isComingFrom == true {
            lblHeader.text = "TERMS OF USE"
            let url = URL(string: "https://halaladvisor.com.au/terms-of-use/")
                let request = URLRequest(url: url!)
                webView.load(request)
        }else{
            lblHeader.text = "PRIVACY POLICY"
            let url = URL(string: "https://halaladvisor.com.au/privacy-policy-2/")
                let request = URLRequest(url: url!)
                webView.load(request)
        }
        currentMonth()
        uiSet()

    }
    func uiSet(){
    let statusBarView = UIView(frame: UIApplication.shared.statusBarFrame)
    let statusBarColor = UIColor(red: 0/255, green: 186/255, blue: 0/255, alpha: 1.0)
    statusBarView.backgroundColor = statusBarColor
    view.addSubview(statusBarView)
    }
    func currentMonth(){
        let current = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM"
        month = formatter.string(from: current)
    }
    override func viewWillAppear(_ animated: Bool) {
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
    return .lightContent
   
 }
    @IBAction func actionBackBtn(_ sender: UIButton) {
    self.navigationController?.popViewController(animated: true)
    }
    

}
