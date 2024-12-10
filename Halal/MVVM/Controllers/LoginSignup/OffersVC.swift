//
//  OffersVC.swift
//  Halal
//
//  Created by snow-macmini-2 on 04/10/21.
//

import UIKit

class OffersVC: UIViewController {
    @IBOutlet weak var lblOffer: UILabel!
    @IBOutlet weak var tblVwOffers: UITableView!
    var resId:String?
    var arrOffers = [offersData]()
    var r_id = String()
    var offer_id = String()
    var webService = ViewModelForVouchers()
    override func viewDidLoad() {
        super.viewDidLoad()
       uiSet()
        
    }
    func uiSet(){
        
        resId = fetchResId()
    }
    override func viewWillAppear(_ animated: Bool) {
       
    }
}
extension OffersVC: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrOffers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblVwOffers.dequeueReusableCell(withIdentifier: "OffersTVC", for: indexPath) as! OffersTVC
        cell.lblOff.text = /arrOffers[indexPath.row].offer_price + "% Off - " + /arrOffers[indexPath.row].type
        cell.lblOfferDetail.text = arrOffers[indexPath.row].offer_desc
        cell.lblMinimum.text = "Minimum spend "
       
        
        let date = /arrOffers[indexPath.row].end_date
        let dateFormatter = DateFormatter()

        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let dateFromString = dateFormatter.date(from:date)!
        dateFormatter.dateFormat = "dd/MM/yy"
  
        let endDate = dateFormatter.string(from: dateFromString)
        cell.lblTillDate.text = "Valid Till " + /endDate
        cell.btnRedeem.tag = indexPath.row
        cell.btnRedeem.addTarget(self, action: #selector(redeemOffer), for: .touchUpInside)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return    350

    }
    
    @objc func redeemOffer(_ sender: UIButton){
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "RedeemVoucherVC") as! RedeemVoucherVC
        vc.off = /arrOffers[sender.tag].offer_price
        vc.TotalBill = arrOffers[sender.tag].offer_desc
        vc.RestName = arrOffers[sender.tag].r_name
        vc.offer_id = /arrOffers[sender.tag].offer_id
        vc.howToRedeem = /arrOffers[sender.tag].how_to_redeem
        
        self.navigationController?.pushViewController(vc, animated: true)

      

    }
}



