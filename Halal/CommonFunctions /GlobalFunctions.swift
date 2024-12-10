//
//  GlobalFunctions.swift
//  FoodTigerMerchantApp
//
//  Created by Ankit KaleRamans on 24/04/20.
//  Copyright © 2020 Ankit Jaat. All rights reserved.
//

import Foundation
import Alamofire
import UIKit
import MBProgressHUD
import Toast_Swift
struct Connectivity {
    static let sharedInstance = NetworkReachabilityManager()!
    static var isConnectedToInternet:Bool {
        return self.sharedInstance.isReachable
    }
}

func showProgressHud(view:UIView)  {
      
      let loadingNotification = MBProgressHUD.showAdded(to: view, animated: true)
      loadingNotification.mode = .indeterminate
      loadingNotification.color = UIColor.gray
      loadingNotification.activityIndicatorColor = UIColor.black
      loadingNotification.backgroundColor = UIColor.clear
  }
func dissmissHUD(_ view:UIView)  {
      
      MBProgressHUD.hideAllHUDs(for: view, animated: true)
  }

func InternetErrorToast(view:UIView,message:String)  {
    var style = ToastStyle()
    style.backgroundColor = UIColor.black
    style.cornerRadius = 5
    view.makeToast(message, duration: 3.2, position: .center, title: "", image: UIImage(named: "wifi"), style: style, completion: nil)
}
func TostErrorMessage(view:UIView,message:String)  {
    
    var style = ToastStyle()
    style.backgroundColor = UIColor.black
    style.cornerRadius = 5
    view.makeToast( message, duration: 3.0, position: .center,style: style)
}

func getReadableDate(timeStamp: TimeInterval) -> String? {
    let date = Date(timeIntervalSince1970: timeStamp / 1000)
    let dateFormatter = DateFormatter()
    
    if Calendar.current.isDateInTomorrow(date) {
        return "Tomorrow"
    } else if Calendar.current.isDateInYesterday(date) {
        return "Yesterday"
    } else if dateFallsInCurrentWeek(date: date) {
        if Calendar.current.isDateInToday(date) {
            dateFormatter.dateFormat = "h:mm a"
            return dateFormatter.string(from: date)
        } else {
            dateFormatter.dateFormat = "EEEE"
            return dateFormatter.string(from: date)
        }
    } else {
        dateFormatter.dateFormat = "MMM d, yyyy"
        return dateFormatter.string(from: date)
    }
}
func dateFallsInCurrentWeek(date: Date) -> Bool {
    let currentWeek = Calendar.current.component(Calendar.Component.weekOfYear, from: Date())
    let datesWeek = Calendar.current.component(Calendar.Component.weekOfYear, from: date)
    return (currentWeek == datesWeek)
}

