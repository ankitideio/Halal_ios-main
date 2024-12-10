//
//  Extentions.swift
//  Nice&Bella
//
//  Created by cbl20 on 8/14/18.
//  Copyright © 2018 CodeBrew. All rights reserved.
//

import Foundation
import UIKit
//import Kingfisher

public extension Date {
    var millisecondsSince1970:TimeInterval {
        return NSDate().timeIntervalSince1970 * 1000
    }
}

public extension String{
    
    func toBase64()->String{
        let base64Encoded = Data(self.utf8).base64EncodedString()
        return base64Encoded
    }

    func firstLastChar()->String{
        let arrTrimWithSpace = components(separatedBy: " ")
        switch arrTrimWithSpace.count {
        case 0:break
        case 1:
            if count > 0{
                return String(prefix(1))
            }
        default:
            return calculateFirstLastLetter()
        }
        return ""
    }
    
    private func calculateFirstLastLetter()->String{
        let arrTrimWithSpace = components(separatedBy: " ")
        if arrTrimWithSpace.count>1{
            if let str1 = arrTrimWithSpace.first, let str2 = arrTrimWithSpace.last{
                return String(str1.prefix(1))+String(str2.prefix(1))
            }
        }
        return ""
    }
    
    var html2AttributedString: NSAttributedString? {
        return Data(utf8).html2AttributedString
    }
    var html2String: String {
        return html2AttributedString?.string ?? ""
    }
    
    func directTextHeight(textFont : UIFont?) -> CGFloat {
        
        guard let font = textFont else { return 0.0 }
        let width = UIScreen.main.bounds.width - 100
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        
        return boundingBox.height
    }
    
}
extension UITextField {
    func textFieldCorner(cornerRadius:CGFloat) {
        layer.cornerRadius = cornerRadius
        layer.borderWidth = 0.5
        layer.borderColor = UIColor.lightGray.cgColor
        layer.masksToBounds = true
    }
    func textFieldCornerWithColor() {
           layer.borderWidth = 0.5
        layer.borderColor = UIColor(red: 249.0/254.0, green: 77.0/255.0, blue: 103.0/255.0, alpha: 1).cgColor
           layer.masksToBounds = true
       }
    
    func setRightPadingPoint(_ pading:CGFloat)
        {
            let padingView = UIView(frame: CGRect(x: 0, y: 0, width: pading, height: self.frame.size.height))
            self.rightView = padingView
            self.rightViewMode = .always
        }
    func setLeftPaddingPoints(_ amount:CGFloat){
          let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
          self.leftView = paddingView
          self.leftViewMode = .always
      }
}
extension UILabel {
    
     func retrieveTextHeight () -> CGFloat {
           let attributedText = NSAttributedString(string: self.text!, attributes: [NSAttributedString.Key.font:self.font!])
           let rect = attributedText.boundingRect(with: CGSize(width: self.frame.size.width, height: CGFloat.greatestFiniteMagnitude), options: .usesLineFragmentOrigin, context: nil)
          return ceil(rect.size.height)
     }
    
     func retrieveTextWidth () -> CGFloat {
          let attributedText = NSAttributedString(string: self.text!, attributes: [NSAttributedString.Key.font:self.font!])
          let rect = attributedText.boundingRect(with: CGSize(width: self.frame.size.width, height: CGFloat.greatestFiniteMagnitude), options: .usesLineFragmentOrigin, context: nil)
         return ceil(rect.size.width + 10 )
     }
}

class CustomDashedView: UIView {

    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }
    @IBInspectable var dashWidth: CGFloat = 0
    @IBInspectable var dashColor: UIColor = .clear
    @IBInspectable var dashLength: CGFloat = 0
    @IBInspectable var betweenDashesSpace: CGFloat = 0

    var dashBorder: CAShapeLayer?

    override func layoutSubviews() {
        super.layoutSubviews()
        dashBorder?.removeFromSuperlayer()
        let dashBorder = CAShapeLayer()
        dashBorder.lineWidth = dashWidth
        dashBorder.strokeColor = dashColor.cgColor
        dashBorder.lineDashPattern = [dashLength, betweenDashesSpace] as [NSNumber]
        dashBorder.frame = bounds
        dashBorder.fillColor = nil
        if cornerRadius > 0 {
            dashBorder.path = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).cgPath
        } else {
            dashBorder.path = UIBezierPath(rect: bounds).cgPath
        }
        layer.addSublayer(dashBorder)
        self.dashBorder = dashBorder
    }
}
public extension UIView{
    func cornerRadiusWithGrayBoarder(radius:CGFloat)  {
           self.layer.cornerRadius = radius
           self.layer.masksToBounds = true
        if #available(iOS 13.0, *) {
            self.layer.borderColor = UIColor.systemGray6.cgColor
        } else {
            // Fallback on earlier versions
        }
            //UIColor(red: 234/255.0, green: 234/255.0, blue: 234/255.0, alpha: 1.0).cgColor
           self.layer.borderWidth = 1
       }
    func cellViewShadow(radius:CGFloat? = 5)  {
       self.layer.shadowColor = UIColor.lightGray.cgColor
       self.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
       self.layer.masksToBounds = false
       self.layer.shadowRadius = 5.0
       self.layer.shadowOpacity = 0.2
       self.layer.cornerRadius = radius ?? 0
       self.layer.borderColor = UIColor.clear.cgColor
       self.layer.borderWidth = 1.0
       }
    func setBorderShadow(radius:CGFloat? = 5)  {
    self.layer.shadowColor = UIColor.lightGray.cgColor
    self.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
    self.layer.masksToBounds = false
        self.layer.shadowRadius = 8.0
        self.layer.shadowOpacity = 1.0
    self.layer.cornerRadius = radius ?? 0
    self.layer.borderColor = UIColor.clear.cgColor
    self.layer.borderWidth = 1.0
    }
    func createDottedLine(width: CGFloat, color: CGColor) {
       let caShapeLayer = CAShapeLayer()
       caShapeLayer.strokeColor = color
       caShapeLayer.lineWidth = width
       caShapeLayer.lineDashPattern = [2,3]
       let cgPath = CGMutablePath()
       let cgPoint = [CGPoint(x: 0, y: 0), CGPoint(x: self.frame.width, y: 0)]
       cgPath.addLines(between: cgPoint)
       caShapeLayer.path = cgPath
       layer.addSublayer(caShapeLayer)
    }
    func addDashedBorder() {
       let color = UIColor.lightGray.cgColor

       let shapeLayer:CAShapeLayer = CAShapeLayer()
       let frameSize = self.frame.size
       let shapeRect = CGRect(x: 0, y: 0, width: frameSize.width, height: frameSize.height)

       shapeLayer.bounds = shapeRect
       shapeLayer.position = CGPoint(x: frameSize.width/2, y: frameSize.height/2)
       shapeLayer.fillColor = UIColor.clear.cgColor
       shapeLayer.strokeColor = color
       shapeLayer.lineWidth = 2
       shapeLayer.lineJoin = CAShapeLayerLineJoin.round
       shapeLayer.lineDashPattern = [6,3]
       shapeLayer.path = UIBezierPath(roundedRect: shapeRect, cornerRadius: 5).cgPath

       self.layer.addSublayer(shapeLayer)
       }
    
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        if #available(iOS 11, *) {
            self.clipsToBounds = true
            self.layer.cornerRadius = radius
            var masked = CACornerMask()
            if corners.contains(.topLeft) { masked.insert(.layerMinXMinYCorner) }
            if corners.contains(.topRight) { masked.insert(.layerMaxXMinYCorner) }
            if corners.contains(.bottomLeft) { masked.insert(.layerMinXMaxYCorner) }
            if corners.contains(.bottomRight) { masked.insert(.layerMaxXMaxYCorner) }
            self.layer.maskedCorners = masked
        }else{
            let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
            let mask = CAShapeLayer()
            mask.path = path.cgPath
            layer.mask = mask
        }
    }
    func cornerRadius(radius:CGFloat)  {
           self.layer.cornerRadius = radius
           self.layer.masksToBounds = true
        }
    func circle()  {
        self.layer.cornerRadius = self.frame.size.width/2
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.borderWidth = 1
        self.layer.masksToBounds = true
    }
    @IBInspectable var cornerRadiusUi: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
    
    @IBInspectable var borderWidthUi: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable var borderColorUi: UIColor? {
        get {
            return UIColor(cgColor: layer.borderColor!)
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }
    
    @IBInspectable var shadowColorUi: UIColor? {
        get {
            if let color = layer.shadowColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.shadowColor = color.cgColor
            } else {
                layer.shadowColor = nil
            }
        }
    }
    
    @IBInspectable var shadowOpacityUi: Float {
        get {
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
        }
    }
    
    @IBInspectable var shadowOffsetUi: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
        }
    }
    
    @IBInspectable var shadowRadiusUi: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
        }
    }
    
    func takeScreenshot() -> UIImage? {
        
        // Begin context
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, false, UIScreen.main.scale)
        
        // Draw view in that context
        drawHierarchy(in: self.bounds, afterScreenUpdates: true)
        
        // And finally, get image
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image
    }
    
}
extension UIViewController {
  func alert(message: String, title: String = "") {
    let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
    alertController.addAction(OKAction)
    self.present(alertController, animated: true, completion: nil)
  }
}
extension UISwitch{
    @IBInspectable var transformUi: CGAffineTransform {
        get {
            return transform
        }
        set {
            transform = newValue
        }
    }
}

//extension UIImageView{
//    func setImage(strUrl:String?){
//        guard let url =  strUrl else {image = R.image.default();return}
//        if url != ""{
//            kf.indicatorType = .activity
//            kf.setImage(with: URL(string: url), placeholder: R.image.default(), options: nil, progressBlock: nil, completionHandler: nil)
//        }else{
//            image = R.image.default()
//        }
//    }
//}

extension Data {
    var html2AttributedString: NSAttributedString? {
        do {
            return try NSAttributedString(data: self, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            print("error:", error)
            return  nil
        }
    }
    var html2String: String {
        return html2AttributedString?.string ?? ""
    }
}
extension UIImage {
    func fixOrientation() -> UIImage {
        if self.imageOrientation == UIImage.Orientation.up {
            return self
        }
        UIGraphicsBeginImageContextWithOptions(self.size, false, self.scale)
        self.draw(in: CGRect(x: 0, y: 0, width: self.size.width, height: self.size.height))
        if let normalizedImage: UIImage = UIGraphicsGetImageFromCurrentImageContext() {
            UIGraphicsEndImageContext()
            return normalizedImage
        } else {
            return self
        }
    }
}

extension UITableView {
    override open func touchesShouldCancel(in view: UIView) -> Bool {
        if view is UITextField || view is UITextView {
            return true
        }
        return super.touchesShouldCancel(in: view)
    }
    
}
//MARK::CELL IDENTIFIRE
extension UITableViewCell {
    static var identifier: String {
        return "\(self)"
    }
}
extension UICollectionViewCell {
    static var identifier: String {
        return "\(self)"
    }
}

extension UIApplication {
    var statusBarView: UIView? {
        return value(forKey: "statusBar") as? UIView
    }
}
extension UIView {
    
    

    
}


public extension UIApplication {
    /// Sweeter: `keyWindow` for scene-based apps
    var legacyKeyWindow: UIWindow? {
        if #available(iOS 13, *) {
            return windows.first { $0.isKeyWindow }
        } else {
            return keyWindow
        }
    }

    /// Sweeter: Returns the currently top-most view controller.
    class func topViewController(base: UIViewController? = UIApplication.shared.legacyKeyWindow?.rootViewController) -> UIViewController? {
        if let nav = base as? UINavigationController {
            return topViewController(base: nav.visibleViewController)
        }
        if let tab = base as? UITabBarController {
            if let selected = tab.selectedViewController {
                return topViewController(base: selected)
            }
        }
        if let presented = base?.presentedViewController {
            return topViewController(base: presented)
        }
        return base
    }

    /// Sweeter: Show `viewController` over the top-most view controller.
    class func present(_ viewController: UIViewController, animated: Bool = true, completion: (() -> Void)? = nil) {
        DispatchQueue.main.async {
            topViewController()?.present(viewController, animated: animated, completion: completion)
        }
    }
}
