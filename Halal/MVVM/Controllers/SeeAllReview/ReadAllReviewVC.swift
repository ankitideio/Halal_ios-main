//
//  ReadAllReviewVC.swift
//  Halal
//
//  Created by snow-macmini-1 on 05/10/21.
//

import UIKit
import SideMenu
class ReadAllReviewVC: UIViewController {

    @IBOutlet weak var tblAllReview: UITableView!
    @IBOutlet weak var lblRestaurantName: UILabel!
    var webService = ViewModelForReviews()
    var arrGoogleReview = [GetGoogleReviewsModel]()
    var arrOurReview = [ReviewDataModel]()
    var arrImage = [String]()
    var resName:String?
    var webServiceGoogleReview = ViewModelForGoogleReview()
    override func viewDidLoad() {
        super.viewDidLoad()
       
       uiSet()
        
    }
    func uiSet(){
        tblAllReview.delegate = self
        tblAllReview.dataSource = self
        tblAllReview.estimatedRowHeight = 44.0
        tblAllReview.rowHeight = UITableView.automaticDimension
         
            let statusBarView = UIView(frame: UIApplication.shared.statusBarFrame)
                   let statusBarColor = UIColor(red: 0/255, green: 186/255, blue: 0/255, alpha: 1.0)
                   statusBarView.backgroundColor = statusBarColor
                   view.addSubview(statusBarView)
    }
    override func viewWillAppear(_ animated: Bool) {
        lblRestaurantName.text = resName
        webServiceGoogleReview.webServiceForAllReviews(obj: self)
        webService.webServiceForGetAllReviews(obj: self)
       
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
               return .lightContent

    
    }
    @IBAction func actionBackBtn(_ sender: UIButton) {
        
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func actionAddBtn(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "RateAndReviewVC") as! RateAndReviewVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    

    

}
