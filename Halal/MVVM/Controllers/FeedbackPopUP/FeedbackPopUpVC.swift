//
//  FeedbackPopUpVC.swift
//  Halal
//
//  Created by snow-macmini-6 on 24/02/22.
//

import UIKit
import StoreKit
class FeedbackPopUpVC: UIViewController {
    @IBOutlet weak var lblThanks: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var btnReview: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      uiSet()
    }
    func uiSet(){
        
        if self.traitCollection.userInterfaceStyle == .dark {
            btnReview.backgroundColor = UIColor.init(red: 5.0/255.0, green: 185.0/255.0, blue: 0.0/255.0, alpha: 1.0)
        }
        
        lblDescription.text = "Here at Halal Advisor, feedback is \n very important to us, We'd love to get your \n honest opinion by taking a moment to \n to leave us a review."
        lblThanks.text = "We thank you in advance! \n May Allah bring peace and blessings upon you."
    }
    @IBAction func actionReviewBtn(_ sender: UIButton) {
        saveReviewSelected(reviewSelected: true)
        rateApp()
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func actionNeThanks(_ sender: UIButton) {
        saveReviewSelected(reviewSelected: true)
        self.dismiss(animated: true, completion: nil)
    }
    func rateApp() {
        
        let url = URL(string: "itms-apps:itunes.apple.com/us/app/apple-store/id\("1195552608")?mt=8&action=write-review")!
        UIApplication.shared.openURL(url)
//        SKStoreReviewController.requestReview()
}
}
