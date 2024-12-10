//
//  ExtensionReviewAndRating.swift
//  Halal
//
//  Created by snow-macmini-1 on 04/10/21.
//

import UIKit

extension RateAndReviewVC:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

            return arrReviewImage.count
        
        }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ReviewCVC", for: indexPath) as! ReviewCVC

        cell.imgVwSelectImg.sd_setImage(with: URL(string:/arrReviewImage[indexPath.row].review_images), placeholderImage: UIImage(named: "user_150"), options: .refreshCached, context: nil)



        cell.btnDelete.tag = indexPath.row
        cell.btnDelete.addTarget(self, action: #selector(deleteImage), for: .touchUpInside)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
          return CGSize(width: 100, height: 140)
      }
    @objc func deleteImage(sender:UIButton){
   
      
        if "\(/arrReviewImage[sender.tag].id)" != "0"{
            imageId = "\(/arrReviewImage[sender.tag].id)"
            webService.webServiceForReviewImageDelete(obj: self)
        }else{
        arrReviewImage.remove(at: sender.tag)
        if self.arrReviewImage.count == 4{
        self.imgVwSelectImage.isHidden = true
        }else{
        self.imgVwSelectImage.isHidden = false
        }

        clsnReview.reloadData()


        }
    }
}
