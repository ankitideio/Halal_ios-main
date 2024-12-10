//
//  WalkthrowTabVC.swift
//  Halal
//
//  Created by Ankit KaleRamans on 19/08/21.
//

import UIKit

class WalkthrowTabVC: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var pageControll: UIPageControl!
    @IBOutlet weak var btnNext: UIButton!
    @IBOutlet weak var scrollVc: UIScrollView!
    @IBOutlet var vwBase: UIView!
    @IBOutlet weak var vwSplash: UIView!
    
    var tabStatus = 1
    fileprivate var splashViewController: SplashVC? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showSplashViewController()
        saveSplashStatusForSignUp(statusSignup: false)
        uiSet()
        scrollVc.delegate = self
        pageControll.numberOfPages = 3
        pageControll.currentPage = 0
        scrollVc.setContentOffset(.zero, animated: true)
        pageControll.currentPage = 0
        pageControll.currentPageIndicatorTintColor = UIColor.init(red: 5.0/255.0, green: 185.0/255.0, blue: 0.0/255.0, alpha: 1.0)
        pageControll.tintColor = UIColor.init(red: 130.0/255.0, green: 132.0/255.0, blue: 134.0/255.0, alpha: 1.0)
        btnNext.backgroundColor = UIColor.init(red: 5.0/255.0, green: 185.0/255.0, blue: 0.0/255.0, alpha: 1.0)

        
    }
    
    func showSplashViewControllerNoPing() {
        
        let loadingScreen = SplashVC(tileViewFileName: "SplashVCAnimation")
        self.splashViewController = loadingScreen
        loadingScreen.pulsing = true
        loadingScreen.view.backgroundColor = UIColor.init(red: 238/255, green: 238/255, blue: 238/255, alpha: 1.0)
        loadingScreen.willMove(toParent: self)
        addChild(loadingScreen)
        view.addSubview(loadingScreen.view)
        loadingScreen.didMove(toParent: self)
    }
    
    func showSplashViewController() {
        vwSplash.isHidden = true
        showSplashViewControllerNoPing()
        
        delay(2.00) {
            self.splashViewController?.willMove(toParent: nil)
            self.splashViewController?.removeFromParent()
            self.splashViewController?.view.removeFromSuperview()
            self.didMove(toParent: nil)
        }
    }
    
    public func delay(_ delay:Double, closure:@escaping ()->()) {
        DispatchQueue.main.asyncAfter(
            deadline: DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: closure)
    }
    
    func uiSet(){
        saveSignUpStatus(signUpStatus: true)
        let statusBarView = UIView(frame: UIApplication.shared.statusBarFrame)
        let statusBarColor = UIColor(red: 5.0/255.0, green: 186.0/255.0, blue: 0/255.0, alpha: 1.0)
        statusBarView.backgroundColor = statusBarColor
        view.addSubview(statusBarView)
        }
        override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
     
    }
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {

    if scrollView == scrollVc {
    if scrollView.panGestureRecognizer.translation(in: scrollView.superview).x > 0 {
    if scrollVc.contentOffset == .zero{
        btnNext.setTitle("NEXT", for: .normal)
       
    }
    if scrollVc.contentOffset == CGPoint(x: scrollVc.frame.size.width, y: 0){
        btnNext.setTitle("NEXT", for: .normal)
        pageControll.currentPage = 1
        
    NotificationCenter.default.post(name: Notification.Name("Onbording1"), object: nil)
    }
    if scrollVc.contentOffset == CGPoint(x: scrollVc.frame.size.width*2, y: 0){
        btnNext.setTitle("GET STARTED", for: .normal)
        pageControll.currentPage = 2
       
    NotificationCenter.default.post(name: Notification.Name("Onbording2"), object: nil)
    }
    } else {
    if scrollVc.contentOffset == .zero{
        pageControll.currentPage = 1
      tabStatus = 1
    NotificationCenter.default.post(name: Notification.Name("Onbording2"), object: nil)

    }
    if scrollVc.contentOffset == CGPoint(x: scrollVc.frame.size.width, y: 0){
        pageControll.currentPage = 2
        tabStatus = 2
    NotificationCenter.default.post(name: Notification.Name("Onbording3"), object: nil)
    }
    if scrollVc.contentOffset == CGPoint(x: scrollVc.frame.size.width*2, y: 0){
     tabStatus = 3
       
    }
    }
    }
    }
    @IBAction func actionNext(_ sender: Any) {
        switch tabStatus {
        case 1:
            tabStatus = 2
            scrollVc.setContentOffset(CGPoint(x: scrollVc.frame.size.width, y: 0), animated: true)
            pageControll.currentPage = 1
          
        case 2:
            scrollVc.setContentOffset(CGPoint(x: scrollVc.frame.size.width * 2, y: 0), animated: true)
            tabStatus = 3
            pageControll.currentPage = 2
            btnNext.setTitle("GET STARTED", for: .normal)
        case 3:
            let vc = storyboard?.instantiateViewController(withIdentifier: "LoginSignUpVC") as! LoginSignUpVC
            navigationController?.pushViewController(vc, animated: true)
            
        default:
            break
        }
        
    }
}
