//
//  WebsiteVC.swift
//  Halal
//
//  Created by snow-macmini-1 on 23/11/21.
//

import UIKit
import WebKit
class WebsiteVC: UIViewController {
    @IBOutlet weak var webView: WKWebView!
    
    var isComing = ""
    var urlResturant:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        uiSet()
        
        if isComing == "Discover"{
            let url = URL(string: /urlResturant)
            let request = URLRequest(url: url!)
            webView.load(request)
        }else if isComing == "Menu"{
            let url = URL(string: fetchMenuImage())
            let request = URLRequest(url: url ?? URL(fileURLWithPath: ""))
            webView.load(request)
        }else{
            let url = URL(string: /urlResturant)
            let request = URLRequest(url: url ?? URL(fileURLWithPath: ""))
            webView.load(request)
        }
       
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
    @IBAction func actionBackBtn(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
