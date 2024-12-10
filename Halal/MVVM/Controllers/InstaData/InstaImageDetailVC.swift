//
//  InstaImageDetailVC.swift
//  Halal
//
//  Created by snow-macmini-1 on 29/11/21.
//

import UIKit
import Alamofire

class InstaImageDetailVC: UIViewController {

    @IBOutlet weak var heightVw: NSLayoutConstraint!
    @IBOutlet weak var txtVwCaption: UITextView!
    @IBOutlet weak var lblDetail: UILabel!
    @IBOutlet weak var imgVwInsta: UIImageView!
    var image:String?
    var caption:String?
    var permalink:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
       uiSet()
    }
    func uiSet(){

        let yourstring = /caption

        // Update UITextView font and font size.
      

        // Make web links clickable
        txtVwCaption.isUserInteractionEnabled = true
        txtVwCaption.isSelectable = true
        txtVwCaption.isEditable = false
        txtVwCaption.dataDetectorTypes = UIDataDetectorTypes.link
        txtVwCaption.sizeToFit()
       
        // Update UITextView content
        txtVwCaption.text = yourstring

        // Update hyperlink text colour.
        txtVwCaption.linkTextAttributes = [.foregroundColor : UIColor(red: 0/255, green: 186/255, blue: 0/255, alpha: 1.0), .underlineStyle : NSUnderlineStyle.single.rawValue]
      
        if /fetchInstaImage().contains("video"){
            let url = URL(string: /fetchInstaImage())
            imgVwInsta.image = url!.generateThumbnail()
        }else{
            imgVwInsta.sd_setImage(with: URL(string: /fetchInstaImage()), placeholderImage: UIImage(named: ""), options: .refreshCached, context: nil)
        }
        
        let statusBarView = UIView(frame: UIApplication.shared.statusBarFrame)
        let statusBarColor = UIColor(red: 0/255, green: 186/255, blue: 0/255, alpha: 1.0)
        statusBarView.backgroundColor = statusBarColor
        view.addSubview(statusBarView)
        }
        override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
       
     
    }
    override func viewWillAppear(_ animated: Bool) {
   
        
    }
    @IBAction func actionViewOnInstagramButton(_ sender: UIButton) {
       
           let appURL = URL(string: /permalink)!
           let application = UIApplication.shared
        if application.canOpenURL(appURL) {
                application.open(appURL)
            } else {
                // if Instagram app is not installed, open URL inside Safari
                let webURL = URL(string: /permalink)!
                application.open(webURL)
            }
    }
    

    @IBAction func actionBackBtn(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
