//
//  AdvertiseHalalVC.swift
//  Halal
//
//  Created by snow-macmini-1 on 22/11/21.
//

import UIKit
import WebKit
class AdvertiseHalalVC: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: "https://halaladvisor.com.au/restaurant-discovery")
            let request = URLRequest(url: url!)
            webView.load(request)
   uiSet()
    }
    
    @IBAction func actionBackBtn(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
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
   

}
