//
//  CollectionVwCustomDataSorces.swift
//  Nice&Bella
//
//  Created by cbl20 on 8/13/18.
//  Copyright © 2018 CodeBrew. All rights reserved.
//

import UIKit

typealias itemForRowAtIndex = (_ cel:Any,_ item : Any?, _ indexPath: IndexPath) -> ()
typealias pullToRefresh = () -> ()
typealias  ViewForHeaderInSection = (_ section : Int) -> UIView?
typealias didSelectItem = (_ cel:Any,_ item : Any?, _ indexPath: IndexPath) -> ()
typealias ScrollViewScrolled = (UIScrollView) -> ()
typealias willDisplayItem = (_ cel:Any,_ indexPath: IndexPath) -> ()
typealias ScrollViewEndDraging = ( _ scrollView:UIScrollView,  _ velocity:CGPoint,_ targetContentOffset:UnsafeMutablePointer<CGPoint>) -> ()

class CollectionVwCustomDataSorces:NSObject {
    
    //Mark:- variables
    var items: Array<Any>?
    var cellHeight: CGFloat = 0.0
    var cellWidth : CGFloat = 0.0
    var headerHeight: CGFloat = 0.0
    var headerWidth: CGFloat = 0.0
    var cellIdentifier  : String?
    var headerIdentifier: String?
    var collectionView  : UICollectionView?
    var itemAtIndex : itemForRowAtIndex?
    var headerForSection : ViewForHeaderInSection?
    var didSelectAtIndex : didSelectItem?
    var willDisplay : willDisplayItem?
    var scroll : ScrollViewScrolled?
    var backgroundLabel = UILabel()
    var scrollVwEnded: ScrollViewEndDraging?
    
    init (items: Array<Any>?  , collectionView: UICollectionView? , cellIdentifier: String? , headerIdentifier: String? , cellHeight: CGFloat , cellWidth: CGFloat ,headerHeight:CGFloat,headerWidth:CGFloat, configureCellBlock: itemForRowAtIndex? ,headerVw:ViewForHeaderInSection?, selectedRow: didSelectItem?,willDisplay:willDisplayItem?,scrollViewDidScroll:ScrollViewScrolled?)  {
        super.init()
        self.collectionView = collectionView
        self.items = items
        self.cellIdentifier = cellIdentifier
        self.headerIdentifier = headerIdentifier
        self.cellWidth  = cellWidth
        self.cellHeight = cellHeight
        self.itemAtIndex     = configureCellBlock
        self.didSelectAtIndex = selectedRow
        self.headerForSection = headerVw
        self.willDisplay = willDisplay
        self.scroll = scrollViewDidScroll
        initLabel()
    }
 
    private func initLabel(){
        guard let col = collectionView else{return}
        backgroundLabel.frame = col.bounds
        backgroundLabel.text = "No Result"
        backgroundLabel.textAlignment = .center
//        backgroundLabel.font = Fonts.SemiBold.SFProDisplay(ofSize: 20)
        backgroundLabel.textColor = .black
    }
    
    func scrollVwEndCall(_ block:ScrollViewEndDraging?){
        scrollVwEnded = block
    }
}


extension CollectionVwCustomDataSorces: UICollectionViewDelegate , UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        backgroundLabel.text = self.items == nil ? NotFound.processing.localized : NotFound.noResultFound.localized
        collectionView.backgroundView = self.items?.count == 0 || self.items == nil ? backgroundLabel : nil
        return self.items?.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let identifier = cellIdentifier else{
            fatalError("Cell identifier not provided")
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as UICollectionViewCell
        if let block = self.itemAtIndex , let item: Any = self.items?[indexPath.row]{
            block(cell , item , indexPath)
        }
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        if let block = self.didSelectAtIndex,let cell = collectionView.cellForItem(at: indexPath), let item: Any = self.items?[(indexPath).row]{
            block(cell , item, indexPath)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if let block = willDisplay {
            block(cell, indexPath)
        }
    }

}

extension CollectionVwCustomDataSorces: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: cellWidth, height: cellHeight)
    }
}

extension CollectionVwCustomDataSorces: UIScrollViewDelegate{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if let block = self.scroll {
            block(scrollView)
        }
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        if let block = scrollVwEnded {
            block(scrollView,velocity,targetContentOffset)
        }
    }
}
