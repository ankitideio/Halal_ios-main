//
//  HomeBannerTVC.swift
//  Halal
//
//  Created by meet sharma on 31/03/23.
//

import UIKit

class HomeBannerTVC: UITableViewCell {

    @IBOutlet weak var clsnVwBanner: UICollectionView!
    @IBOutlet weak var pageController: UIPageControl!
    var arrBanner = [BannerList]()
    var callBack:((_ selectIndex:Int)->())?
    override func awakeFromNib() {
        super.awakeFromNib()
        startTimer()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    func uiSet(){
        clsnVwBanner.delegate = self
        clsnVwBanner.dataSource = self
        clsnVwBanner.reloadData()
        
    }
    func startTimer() {
      
    let timer =  Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(self.scrollAutomatically), userInfo: nil, repeats: true)

    }


    @objc func scrollAutomatically(_ timer1: Timer) {

        if let coll  = clsnVwBanner {
            for cell in coll.visibleCells {
                let indexPath: IndexPath? = coll.indexPath(for: cell)
                if ((indexPath?.row)! < arrBanner.count - 1){
                    let indexPath1: IndexPath?
                    indexPath1 = IndexPath.init(row: (indexPath?.row)! + 1, section: (indexPath?.section)!)

                    coll.scrollToItem(at: indexPath1!, at: .left, animated: true)
                }
                else{
                    let indexPath1: IndexPath?
                    indexPath1 = IndexPath.init(row: 0, section: (indexPath?.section)!)
                    coll.scrollToItem(at: indexPath1!, at: .right, animated: true)
                }

            }
        }
    }

}

extension HomeBannerTVC: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrBanner.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeBannerCVC", for: indexPath) as! HomeBannerCVC
        if arrBanner.count > 0{
            cell.imgVwBanner.sd_setImage(with: URL(string: /arrBanner[indexPath.row].image), placeholderImage: UIImage(named: ""), options: .refreshCached, context: nil)
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: clsnVwBanner.frame.width/1-0, height: 150)
    }
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        pageController.currentPage = indexPath.row
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        callBack?(indexPath.row)
      
    }
}
