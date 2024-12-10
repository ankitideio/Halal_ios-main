//
//  SideMenu2VC.swift
//  Halal
//
//  Created by snow-macmini-2 on 06/10/21.
//

import UIKit
import SideMenu
class SideMenu2VC: UIViewController,SideMenuNavigationControllerDelegate {
    @IBOutlet var vwSideMenu: UIView!
    
    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var imgVwProfile: UIImageView!
    @IBOutlet weak var vwMyVw: UIView!
    var deviceType = "I"
 
    var arrImage  = [String]()
     
    
    var arrLable = ["Home","My Favourites","My Profile","My Vouchers","Send Feedback","Rate App","Advertise with Halal Advisor","About Halal Advisor","Logout"]
    var webService = ViewModelForLogout()
    @IBOutlet weak var tblVwSideMenu: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        if self.traitCollection.userInterfaceStyle == .light {
            arrImage = ["homeB2","like3","user3","icon3","mail3","star3","speaker3","support3","logout3"]
        }else{
            arrImage = ["WhatsApp Image 2022-09-08 at 10.58.48 PM","like1","user1","icon1","mail1","star1","speaker1","support1","logout1"]
        }
       uiSet()
       
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    
    func uiSet(){
        lblUserName.text = fetchUserName()
        imgVwProfile.sd_setImage(with: URL(string:/fetchProfileImage()), placeholderImage: UIImage(named: "03"), options: .refreshCached, context: nil)
        imgVwProfile.layer.cornerRadius = imgVwProfile.frame.size.width/2
    let statusBarView = UIView(frame: UIApplication.shared.statusBarFrame)
    let statusBarColor = UIColor(red: 0/255, green: 186/255, blue: 0/255, alpha: 1.0)
    statusBarView.backgroundColor = statusBarColor
    view.addSubview(statusBarView)
    }
   

    override func viewWillAppear(_ animated: Bool) {
        saveSideMenu(sideMenuShow: false)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
        {
//            dismiss(animated: false, completion: nil)
        }
    @IBAction func actionSideMenuDissmiss(_ sender: UIButton) {
        
        dismiss(animated: false, completion: nil)
    }
}
extension SideMenu2VC: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrImage.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblVwSideMenu.dequeueReusableCell(withIdentifier: "SideMenuTVC", for: indexPath) as! SideMenuTVC
        cell.imgSideMenu.image = UIImage(named: arrImage[indexPath.row])
        cell.lblSideMenu.text = arrLable[indexPath.row]
        
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            
            dismiss(animated: false, completion: nil)
            SceneDelegate().makeRootController(IDStr: "TTabBarViewController")
        case 1:
            dismiss(animated: false, completion: nil)
//            if fetchIsComingFrom() == true{
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "YourFavouritisVC") as! YourFavouritisVC
                vc.hidesBottomBarWhenPushed = true
//               vc.iscomingFrom = true
                self.navigationController?.pushViewController(vc, animated: true)
//            }else{
//                let vc = self.storyboard?.instantiateViewController(withIdentifier: "YourFavouritisVC") as! YourFavouritisVC
//                vc.iscomingFrom = false
//                self.navigationController?.pushViewController(vc, animated: true)
//            }
//
        case 2:
            dismiss(animated: false, completion: nil)
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "ProfileVC") as! ProfileVC
            vc.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(vc, animated: true)
        case 3:
            dismiss(animated: false, completion: nil)
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "MyVouchersVC") as! MyVouchersVC
            vc.isComingFrom = "Home"
            vc.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(vc, animated: true)
        case 4:
            dismiss(animated: false, completion: nil)
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "FeedBackVC") as! FeedBackVC
            vc.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(vc, animated: true)

        case 6:
            dismiss(animated: false, completion: nil)
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "AdvertiseHalalVC") as! AdvertiseHalalVC
            vc.hidesBottomBarWhenPushed = true
           
            self.navigationController?.pushViewController(vc, animated: true)
        case 7:
            dismiss(animated: false, completion: nil)
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "HalalAdvisorVC") as! HalalAdvisorVC
            vc.hidesBottomBarWhenPushed = true
           
            self.navigationController?.pushViewController(vc, animated: true)
        case 8:
           
            let alertController = UIAlertController(title: "Logout", message: "Do you really want to logout?", preferredStyle: .alert)
                    
                    let OKAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction!) in
                            
                            self.webService.webServiceForLogout(obj: self)
                        
                    }
                    alertController.addAction(OKAction)
                   alertController.view.tintColor = UIColor(red: 0/255, green: 186/255, blue: 0/255, alpha: 1.0)
                    // Create Cancel button
                    let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action:UIAlertAction!) in
                       
                    }
                    alertController.addAction(cancelAction)
                    self.present(alertController, animated: true, completion:nil)
            
        default:
            break
        }
    }
}
