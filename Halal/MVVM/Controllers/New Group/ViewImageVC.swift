//
//  ViewImageVC.swift
//  Halal
//
//  Created by snow-macmini-1 on 03/12/21.
//

import UIKit

class ViewImageVC: UIViewController {
    @IBOutlet weak var clsnPopupImage: UICollectionView!
    var arrGallary = [galleryResult]()
 
    override func viewDidLoad() {
        super.viewDidLoad()
      uiSet()
     
    }
    func uiSet(){
        clsnPopupImage.delegate = self
        clsnPopupImage.dataSource = self
        
    }
    @IBAction func actionCrossBtn(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    @IBAction func actionBackBtn(_ sender: UIButton) {
        let visibleItems: NSArray = self.clsnPopupImage.indexPathsForVisibleItems as NSArray
            let currentItem: IndexPath = visibleItems.object(at: 0) as! IndexPath
            let nextItem: IndexPath = IndexPath(item: currentItem.item - 1, section: 0)
            if nextItem.row < arrGallary.count && nextItem.row >= 0{
                self.clsnPopupImage.scrollToItem(at: nextItem, at: .right, animated: true)

            }
    }
    @IBAction func actionNextBtn(_ sender: UIButton) {
        let visibleItems: NSArray = self.clsnPopupImage.indexPathsForVisibleItems as NSArray
           let currentItem: IndexPath = visibleItems.object(at: 0) as! IndexPath
           let nextItem: IndexPath = IndexPath(item: currentItem.item + 1, section: 0)
                  if nextItem.row < arrGallary.count {
               self.clsnPopupImage.scrollToItem(at: nextItem, at: .left, animated: true)
                  }
    }
}
