//
//  YourFavouritisVC.swift
//  Halal
//
//  Created by snow-macmini-3 on 02/10/21.
//

import UIKit

class YourFavouritisVC: UIViewController {

    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var tblVwYourFavourites: UITableView!
    
   // var webService = ViewModelForFavorites()
    var webService = ViewModelForFavorites()
    var rId:String?
    var lat:String?
    var long:String?
    var presentDate:String?
    var time:String?

    var req = "fav_res_list"
    var key = ""
    var user_id = ""
    var r_id = ""
    var arrRestuentFav = [resturantDetailFav]()
    var iscomingFrom = false
    override func viewDidLoad() {
        super.viewDidLoad()
        uiSet()
    }
    
        func uiSet(){
        
       let statusBarView = UIView(frame: UIApplication.shared.statusBarFrame)
       let statusBarColor = UIColor(red: 0/255, green: 186/255, blue: 0/255, alpha: 1.0)
       statusBarView.backgroundColor = statusBarColor
       view.addSubview(statusBarView)
            let date = Date()
          
            let calendar = Calendar.current
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            let todaysDate = dateFormatter.string(from: date)
            let hour = calendar.component(.hour, from: date)
            let minutes = calendar.component(.minute, from: date)
            let totalTime = "\(hour)" + ":" + "\(minutes)"
            presentDate = "\(todaysDate)"
            time = "\(totalTime)"
//            if iscomingFrom == true{
//                btnBack.isHidden = false
//            }else{
//                btnBack.isHidden = true
//            }
       }
       override var preferredStatusBarStyle: UIStatusBarStyle {
       return .lightContent

    }
    override func viewWillAppear(_ animated: Bool) {
        
        webService.webServiceForFavourites(obj: self)
    }
    
    @IBAction func actionBackBtn(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
extension YourFavouritisVC: UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 270
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrRestuentFav.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblVwYourFavourites.dequeueReusableCell(withIdentifier: "YourFavouritesTVC", for: indexPath) as! YourFavouritesTVC
        
        cell.imgFavList.sd_setImage(with: URL(string: /arrRestuentFav[indexPath.row].r_image_path), placeholderImage: UIImage(named: ""), options: .refreshCached, context: nil)
        cell.lblPrice.text = arrRestuentFav[indexPath.row].cuisine
        cell.lblName.text = arrRestuentFav[indexPath.row].r_name

        if arrRestuentFav[indexPath.row].status_resturent == "Open"{
            cell.lblOpen.text = "OPEN"
            cell.vwOpen.backgroundColor = UIColor(red: 5.0/255.0, green: 185.0/255.0, blue: 0.0/255.0, alpha: 1.0)

        }else{
            cell.lblOpen.text = "CLOSED"
            cell.vwOpen.backgroundColor = .red
        }
        if arrRestuentFav[indexPath.row].r_is_featured == "0"{
            cell.imgFeature.isHidden = true
        }else{
            cell.imgFeature.isHidden = false
        }
        cell.btnFvrt.tag = indexPath.row
        cell.btnFvrt.addTarget(self, action: #selector(removeFvrt), for: .touchUpInside)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "RestourentDetailVC") as! RestourentDetailVC
        vc.r_id = /arrRestuentFav[indexPath.row].rId
        vc.presentdate = /presentDate
        vc.time = /time
        vc.lattitude = /lat
        vc.longitude = /long
        vc.hidesBottomBarWhenPushed = true
        saveRestaurentName(name: /arrRestuentFav[indexPath.row].r_name)
         saveIsComing(isComing: false)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @objc func removeFvrt(sender:UIButton){
        saveIsSelected(isSelected: false)
        r_id = /arrRestuentFav[sender.tag].rId
        webService.webServiceForRemoveFvrt(obj: self)
    }
}
