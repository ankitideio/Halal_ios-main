//
//  UserNotifcations.swift
//  Dad&Mom Jokes
//
//  Created by snow-macmini-1 on
//  Copyright © 2020 macbook-snow-03. All rights reserved.
//

import Foundation
import UserNotifications
import UserNotificationsUI


class UserNotifcations: NSObject , UNUserNotificationCenterDelegate {
    @available(iOS 10.0, *)
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                willPresent notification: UNNotification,
                                withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        print(notification.request.content)
        completionHandler([.alert,.sound])
    }
    
    @available(iOS 10.0, *)
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                didReceive response: UNNotificationResponse,
                                withCompletionHandler completionHandler: @escaping () -> Void) {
        switch response.actionIdentifier {
        case UNNotificationDismissActionIdentifier:
            print("Dismiss Action")
        case UNNotificationDefaultActionIdentifier:
            print("Open Action")
            didRecieveBackgroundPushNotificaion(response: response)
        case "Snooze":
            print("Snooze")
        case "Delete":
            print("Delete")
        default:
            print("default")
        }
        completionHandler()
    }
    
    private  func didRecieveBackgroundPushNotificaion(response: UNNotificationResponse){
        let userInfo = response.notification.request.content.userInfo
        let apsDict = userInfo["aps"] as? NSDictionary
        let title = apsDict?["alert"] as? String
        let fcmOption = userInfo["fcm_options"] as? NSDictionary
        let imgNotification = fcmOption?["image"] as? String
        let noti_tag = userInfo["gcm.notification.noti_tag"] as? String
        let restaurant_name = userInfo["gcm.notification.restaurant_name"] as? String
        let restaurant_id = userInfo["gcm.notification.restaurant_id"] as? String
        let lat = userInfo["latitude"] as? String
        let long = userInfo["longitude"] as? String
        let contact = userInfo["r_contact"] as? String
        print(/title)
         print(userInfo)
        print(restaurant_id ?? "")
        print(lat ?? "")
        print(long ?? "")
        print(contact ?? "")

        if let topController = UIApplication.topViewController()
        {
            if noti_tag == "review"{
                saveComingNotification(comingNotification: true)
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc: RateAndReviewVC = storyboard.instantiateViewController(withIdentifier: "RateAndReviewVC") as! RateAndReviewVC
                vc.restaurentName = restaurant_name
                vc.lattitude = lat ?? ""
                vc.longitude = long ?? ""
                vc.contact = contact ?? ""
                vc.resturantId = Int(restaurant_id ?? "") ?? 0
                vc.isComing = true
                vc.hidesBottomBarWhenPushed = true
                topController.navigationController?.pushViewController(vc, animated: true)
                
            }
        }
    }
}


extension UNNotificationRequest {
    var attachment: UNNotificationAttachment? {
        
        let fcmOption = content.userInfo["fcm_options"] as? NSDictionary
        guard let attachmentURL = fcmOption?["image"] as? String, let imageData = try? Data(contentsOf: URL(string: attachmentURL)!) else {
            return nil
        }
        return try? UNNotificationAttachment(data: imageData, options: nil)
    }
}

extension UNNotificationAttachment {

    convenience init(data: Data, options: [NSObject: AnyObject]?) throws {
        let fileManager = FileManager.default
        let temporaryFolderName = ProcessInfo.processInfo.globallyUniqueString
        let temporaryFolderURL = URL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent(temporaryFolderName, isDirectory: true)

        try fileManager.createDirectory(at: temporaryFolderURL, withIntermediateDirectories: true, attributes: nil)
        let imageFileIdentifier = UUID().uuidString + ".jpg"
        let fileURL = temporaryFolderURL.appendingPathComponent(imageFileIdentifier)
        try data.write(to: fileURL)
        try self.init(identifier: imageFileIdentifier, url: fileURL, options: options)
    }
}

final class NotificationService: UNNotificationServiceExtension {

    private var contentHandler: ((UNNotificationContent) -> Void)?
    private var bestAttemptContent: UNMutableNotificationContent?

    override func didReceive(_ request: UNNotificationRequest, withContentHandler contentHandler: @escaping (UNNotificationContent) -> Void) {
        self.contentHandler = contentHandler
        bestAttemptContent = (request.content.mutableCopy() as? UNMutableNotificationContent)

        defer {
            contentHandler(bestAttemptContent ?? request.content)
        }

        guard let attachment = request.attachment else { return }

        bestAttemptContent?.attachments = [attachment]
    }
    
    override func serviceExtensionTimeWillExpire() {
        // Called just before the extension will be terminated by the system.
        // Use this as an opportunity to deliver your "best attempt" at modified content, otherwise the original push payload will be used.
        if let contentHandler = contentHandler, let bestAttemptContent = bestAttemptContent {
            contentHandler(bestAttemptContent)
        }
    }
}
