//
//  ExtensionMyVoucher.swift
//  Halal
//
//  Created by snow-macmini-1 on 04/10/21.
//

import UIKit

extension MyVouchersVC:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrmyVouchers.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VouchersTVC", for: indexPath) as! VouchersTVC
        cell.btnViewVoucher.addTarget(self, action: #selector(viewVoucher), for: .touchUpInside)
        cell.btnRateIt.addTarget(self, action: #selector(rateIt), for: .touchUpInside)
        cell.btnViewVoucher.tag = indexPath.row
        cell.btnRateIt.tag = indexPath.row
        cell.lblRestaurantName.text = arrmyVouchers[indexPath.row].rest_name
        cell.lblOffTakeAway.text = /arrmyVouchers[indexPath.row].offer_price  + "%" + " off " + /arrmyVouchers[indexPath.row].offer_type
//        cell.lblDate.text = arrmyVouchers[indexPath.row].end_date
        let date = /arrmyVouchers[indexPath.row].end_date
        let dateFormatter = DateFormatter()

        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let dateFromString = dateFormatter.date(from:date)!
        dateFormatter.dateFormat = "dd/MM/yy"
  
        let endDate = dateFormatter.string(from: dateFromString)
        cell.lblDate.text = "Valid Till " + /endDate
        return cell
    }
    
    @objc func viewVoucher(_sender:UIButton){
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ViewVoucherVC") as! ViewVoucherVC
        vc.off = arrmyVouchers[_sender.tag].offer_price
        vc.RestName = arrmyVouchers[_sender.tag].rest_name
        vc.callData = arrmyVouchers[_sender.tag]
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @objc func rateIt(_sender:UIButton){
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "RateAndReviewVC") as! RateAndReviewVC
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
