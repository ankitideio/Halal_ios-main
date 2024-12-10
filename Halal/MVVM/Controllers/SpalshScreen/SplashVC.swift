//
//  SplashVC.swift
//  PadelBook
//
//  Created by snow-macmini-3 on 17/11/21.
//

import UIKit
import Lottie

class SplashVC: UIViewController {
    
    open var pulsing: Bool = false
    var animatedLogoView : AnimationView!
    
    public init(tileViewFileName: String) {
        
        super.init(nibName: nil, bundle: nil)
        animatedLogoView = AnimationView(name: tileViewFileName)
        animatedLogoView.frame = CGRect(x: 0, y: 0, width: 900, height: 900)
        
        view.addSubview(animatedLogoView)
       animatedLogoView.layer.position = view.layer.position
        
        animatedLogoView.loopMode = .loop
        animatedLogoView.play()
        
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open override var prefersStatusBarHidden : Bool {
        return true
    }
}
