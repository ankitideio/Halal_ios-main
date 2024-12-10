//
//  CusineTVC.swift
//  Halal
//
//  Created by snow-macmini-6 on 31/12/21.
//

import UIKit

class CusineTVC: UITableViewCell {
    @IBOutlet weak var vwList: UIView!
    @IBOutlet weak var btnList: UIButton!
    @IBOutlet weak var vwMap: UIView!
    @IBOutlet weak var btnMap: UIButton!
    @IBOutlet weak var clsnCusine: UICollectionView!
    @IBOutlet weak var txtFldSearch: CustomTextField!
    
    var arrCusine = [HomeList]()
    var cuisine_id = ""
    var webServiceFav = ViewModelForFavorites()
    var webService = ViewModelForHome()
    override func awakeFromNib() {
        super.awakeFromNib()
        clsnCusine.delegate = self
        clsnCusine.dataSource = self
        txtFldSearch.delegate = self
        if self.traitCollection.userInterfaceStyle == .dark {
            txtFldSearch.textColor = .black
            txtFldSearch.attributedPlaceholder = NSAttributedString(
                string: "Search by venue name",
                attributes: [NSAttributedString.Key.foregroundColor: UIColor.black]
            )
            
        }else{
            txtFldSearch.textColor = .black
            txtFldSearch.attributedPlaceholder = NSAttributedString(
                string: "Search by venue name",
                attributes: [NSAttributedString.Key.foregroundColor: UIColor.black]
            )
        }
        
        webService.webServiceForCusineList(obj: self)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
extension CusineTVC:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrCusine.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = clsnCusine.dequeueReusableCell(withReuseIdentifier: "HomeCVC", for: indexPath) as! HomeCVC
        
        cell.imgVwItem.sd_setImage(with: URL(string: /arrCusine[indexPath.row].cuisineimage), placeholderImage: UIImage(named: ""), options: .refreshCached, context: nil)
        cell.lblItemName.text = arrCusine[indexPath.row].cuisinesname
        return cell
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == 0{
            saveCusineId(cusineId: "")
            NotificationCenter.default.post(name: Notification.Name("Home"), object: nil)
        }else{
            saveCusineId(cusineId: /arrCusine[indexPath.row].id)
            NotificationCenter.default.post(name: Notification.Name("Home"), object: nil)
       
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return CGSize(width: 80.0, height: 85.0)
    }
}


class CustomTextField: UITextField {

    override func layoutSubviews() {
        super.layoutSubviews()

        for view in subviews {
            if let button = view as? UIButton {
                button.setImage(button.image(for: .normal)?.withRenderingMode(.alwaysTemplate), for: .normal)
                button.tintColor = .black
            }
        }
    }
}
