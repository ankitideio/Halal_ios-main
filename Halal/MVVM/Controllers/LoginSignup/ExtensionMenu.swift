//
//  ExtensionMenu.swift
//  Halal
//
//  Created by snow-macmini-1 on 02/12/21.
//

import UIKit

extension MenuVC:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return arrMenu.count
}

func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = clsnMenu.dequeueReusableCell(withReuseIdentifier: "MenuCVC", for: indexPath) as! MenuCVC
    cell.lblMenuName.text = arrMenu[indexPath.row].menu_name
//    cell.imgVwMenu.sd_setImage(with: URL(string: /arrMenu[indexPath.row].menu_link), placeholderImage: UIImage(named: "no-image"), options: .refreshCached, context: nil)
    return cell
}
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
       
            
                return CGSize(width: 150, height: 250)
        }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 30, left: 20, bottom: 0, right: 20)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "WebsiteVC") as! WebsiteVC
        vc.isComing = "Menu"
        saveMenuImage(menuImage: /arrMenu[indexPath.row].menu_link)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

