//
//  ExtensionImage.swift
//  Halal
//
//  Created by snow-macmini-1 on 03/12/21.
//

import UIKit

extension ViewImageVC:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        arrGallary.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = clsnPopupImage.dequeueReusableCell(withReuseIdentifier: "ImageCVC", for: indexPath) as! ImageCVC
        
        cell.imgVwRes.sd_setImage(with: URL(string: /arrGallary[indexPath.row].gal_image_name), placeholderImage: UIImage(named: ""), options: .refreshCached, context: nil)
     
        return cell
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
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: clsnPopupImage.frame.size.width/1 - 0, height: clsnPopupImage.frame.size.height)
        }
    
}
