//
//  DiscoverVC.swift
//  Halal
//
//  Created by snow-macmini-3 on 02/10/21.
//

import UIKit
import AVFoundation
import Kingfisher
class DiscoverVC: UIViewController {

    @IBOutlet weak var clsnHeight: NSLayoutConstraint!
    @IBOutlet weak var lblDiscover: UILabel!
    @IBOutlet weak var pageControler: UIPageControl!
    @IBOutlet weak var collVwBanner: UICollectionView!
    @IBOutlet weak var collVwList: UICollectionView!
    var presentDate:String?
    var time:String?
    var lat:String?
    var long:String?
    var webSevice = ViewModelFeaturedImage()
    var webServiceInsta = ViewModelForInstagramImage()
    var arrFeaturedImage = [FeaturedImageData]()
    var arrInstaImage = [InstaImageData]()
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
            lat = fetchFeaturedLat()
            long = fetchFeaturedLong()
       }
       override var preferredStatusBarStyle: UIStatusBarStyle {
       return .lightContent

       
        
    }
    override func viewWillAppear(_ animated: Bool) {
       
            self.pageControler.currentPage = 0
            
            self.webSevice.webServiceForFeaturedImage(obj: self)
        
        DispatchQueue.main.asyncAfter(deadline: .now()+0.2){

            self.webServiceInsta.webServiceForInstagramImage(obj: self)
      
        }
    }
}


extension DiscoverVC: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == collVwBanner {
            return arrFeaturedImage.count
        }else{
            return arrInstaImage.count
        }
       
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == collVwBanner {
            let cellBanner = collVwBanner.dequeueReusableCell(withReuseIdentifier: "BannerCVC", for: indexPath) as! BannerCVC
            cellBanner.imgBanner.sd_setImage(with: URL(string:BaseUrl + /arrFeaturedImage[indexPath.row].image), placeholderImage: UIImage(named: ""), options: .refreshCached, context: nil)

            return cellBanner
        }else{
            let cellList = collVwList.dequeueReusableCell(withReuseIdentifier: "ListCVC", for: indexPath) as! ListCVC
            
            if /arrInstaImage[indexPath.row].image?.contains("video"){
//                let url = URL(string: /arrInstaImage[indexPath.row].image)
//                cellList.imgList.image = url!.generateThumbnail()
                cellList.imgList.imageLoad(imageUrl: /arrInstaImage[indexPath.row].thumbnail_url)
            }else{
                cellList.imgList.imageLoad(imageUrl: /arrInstaImage[indexPath.row].image)
//                cellList.imgList.sd_setImage(with: URL(string: /arrInstaImage[indexPath.row].image), placeholderImage: UIImage(named: ""), options: .refreshCached, context: nil)
            }
            
            saveInstaUserName(instaUserName: /arrInstaImage[indexPath.row].userName)
            clsnHeight.constant = collVwList.contentSize.height
            return cellList
        }
    
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == self.collVwBanner{
            let width = collectionView.frame.width/1 - 0
            return CGSize(width: width, height: 250)
        }else{
            let yourWidth = collVwList.frame.size.width/3 - 1
                return CGSize(width: yourWidth, height: 120)
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if collectionView == self.collVwList{
         
       }
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
          return 0
      }
      func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
          if collectionView == self.collVwBanner{
          return 0
          }else{
              return 2
          }
      }
        func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
            if collectionView == collVwBanner{
                pageControler.numberOfPages = arrFeaturedImage.count
                pageControler.currentPage = indexPath.row
        }
        }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == collVwList{
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "InstaImageDetailVC") as! InstaImageDetailVC
            saveInstaImage(instaImage: /arrInstaImage[indexPath.row].image)
            vc.caption = arrInstaImage[indexPath.row].caption
            vc.permalink = arrInstaImage[indexPath.row].permalink
            self.navigationController?.pushViewController(vc, animated: true)
        }else{
            if /arrFeaturedImage[indexPath.row].resId == "0"{
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "WebsiteVC") as! WebsiteVC
                vc.isComing = "Discover"
                vc.urlResturant = /arrFeaturedImage[indexPath.row].res_url
                self.navigationController?.pushViewController(vc, animated: true)
            }else{
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "RestourentDetailVC") as! RestourentDetailVC
                vc.presentdate = /presentDate
                vc.time = /time
                vc.r_id = /arrFeaturedImage[indexPath.row].resId
                vc.lattitude = /lat
                vc.longitude = /long
                self.navigationController?.pushViewController(vc, animated: true)
            }
            
        }
    }
    }


   

extension URL {
    func generateThumbnail() -> UIImage? {
        do {
            let asset = AVURLAsset(url: self)
            let imageGenerator = AVAssetImageGenerator(asset: asset)
            imageGenerator.appliesPreferredTrackTransform = true
            
            // Swift 5.3
            let cgImage = try imageGenerator.copyCGImage(at: .zero,
                                                         actualTime: nil)

            return UIImage(cgImage: cgImage)
        } catch {
            print(error.localizedDescription)

            return nil
        }
    }
}
extension UIImageView{
    func imageLoad(imageUrl:String)   {
        let url = URL(string:  imageUrl)
        self.kf.indicatorType = .activity
        self.kf.setImage(
            with: url,
            placeholder: UIImage(named: "No-Image-Placeholder.svg"),
            options: [
                .transition(.fade(1)),
                .cacheOriginalImage
            ])
    }
   
}
