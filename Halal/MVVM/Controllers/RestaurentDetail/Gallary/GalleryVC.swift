//
//  GalleryVC.swift
//  Halal
//
//  Created by snow-macmini-2 on 04/10/21.
//

import UIKit

class GalleryVC: UIViewController {
    
    @IBOutlet weak var lblNotFound: UILabel!
    @IBOutlet weak var collVwGallery: UICollectionView!
    var r_id = String()
    var arrGallery = [galleryResult]()
    var webService = ViewModelForRestuarentDetail()
    override func viewDidLoad() {
        super.viewDidLoad()
     uiSet()
    }
    func uiSet(){
//        webService.webServiceForGallery(obj: self)
    }
    override func viewWillAppear(_ animated: Bool) {
       
      
    }
}
    extension GalleryVC: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout
    {
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return arrGallery.count
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collVwGallery.dequeueReusableCell(withReuseIdentifier: "GalleryCVC", for: indexPath) as! GalleryCVC
            cell.imgVwGallary.sd_setImage(with: URL(string: /arrGallery[indexPath.row].gal_image_name), placeholderImage: UIImage(named: "__findlight_noimage"), options: .refreshCached, context: nil)
            
            return cell
        }
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "ViewImageVC") as! ViewImageVC
            vc.modalPresentationStyle = .overFullScreen
            
            vc.arrGallary = arrGallery
        
            self.navigationController?.present(vc, animated: true, completion: nil)
        }
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: collVwGallery.frame.width/3 - 10, height: 100)
        }
       
    }
