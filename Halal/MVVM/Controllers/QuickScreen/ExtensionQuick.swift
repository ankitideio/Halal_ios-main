//
//  ExtensionQuick.swift
//  Halal
//
//  Created by snow-macmini-1 on 09/12/21.
//

import UIKit


extension QuickViewVC: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrNearByVenue.count
//        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "QuickCVC", for: indexPath) as! QuickCVC
        cell.imgVwRestaurent.sd_setImage(with: URL(string: /arrNearByVenue[indexPath.row].image), placeholderImage: UIImage(named: ""), options: .refreshCached, context: nil)
        cell.lblRestaurentName.text = arrNearByVenue[indexPath.row].name
        cell.lblOpen.text = arrNearByVenue[indexPath.row].restaurentStatus
        cell.lblDollar.text = arrNearByVenue[indexPath.row].cost_sign
        var array = [String]()
        for arr in /arrNearByVenue[indexPath.row].arrCusine{
            array.append(/arr.cuisines_name)
        
        }
      
        cell.lblCategory.text = "• \(/array.joined(separator: " • "))"
        if /arrNearByVenue[indexPath.row].arrCusine.count == 0{
            cell.lblCategory.text = ""
        }
        if /arrNearByVenue[indexPath.row].restaurentStatus == "Open"{
                cell.lblOpen.text = "OPEN"
            cell.lblOpen.backgroundColor = UIColor(red: 5.0/255.0, green: 185.0/255.0, blue: 0.0/255.0, alpha: 1.0)
       }else{
           cell.lblOpen.text = "CLOSED"
           cell.lblOpen.backgroundColor = .red
       }
        cell.btnFvrt.tag = indexPath.row
        if arrNearByVenue[indexPath.row].resFav == 1 {
            cell.btnFvrt.setImage(UIImage(named: "heart3"), for: .normal)
            
        }else{
            cell.btnFvrt.setImage(UIImage(named: "like"), for: .normal)
        }
     
        cell.btnFvrt.addTarget(self, action: #selector(addToFvrt), for: .touchUpInside)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if UIDevice.modelName.contains("iPhone 6s") ||  UIDevice.modelName.contains("iPhone 6") ||  UIDevice.modelName.contains("iPhone SE") ||  UIDevice.modelName.contains("iPhone 7") ||  UIDevice.modelName.contains("iPhone 8") ||  UIDevice.modelName.contains("iPhone SE (2nd generation)") ||  UIDevice.modelName.contains("iPhone 12 mini"){
        return CGSize(width: 320 - 0 , height: clsnNearByRestaurent.frame.height)
        }else{
            return CGSize(width: 360 - 0 , height: clsnNearByRestaurent.frame.height)
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
       
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            return 0
        }

        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return 0
        }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "RestourentDetailVC") as! RestourentDetailVC
        vc.r_id = /arrNearByVenue[indexPath.row].rId
        vc.presentdate = /currentDate
        vc.time = /time
//        vc.lattitude = /arrNearByVenue[indexPath.row].latitude
//        vc.longitude = /arrNearByVenue[indexPath.row].longitude
//        saveRestaurentName(name: /arrNearByVenue[indexPath.row].name)
//        saveIsComing(isComing: false)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @objc func addToFvrt(sender:UIButton){
        let cell = clsnNearByRestaurent.cellForItem(at: IndexPath(row: sender.tag, section: 0)) as! QuickCVC
        cell.btnFvrt.setImage(UIImage(named: "heart3"), for: .normal)
    saveResIdNear(resIdNear: /arrNearByVenue[sender.tag].rId)
    webServiceFav.webServiceForAddToFavNearVenue(obj: self, index: sender.tag)
    }
}
