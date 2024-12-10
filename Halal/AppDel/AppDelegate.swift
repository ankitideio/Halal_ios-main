//
//  AppDelegate.swift
//  Halal
//
//  Created by Ankit KaleRamans on 19/08/21.
//

import UIKit
import CoreData
import SideMenu
import IQKeyboardManagerSwift
import FBSDKLoginKit
import SDWebImage
import GoogleMaps
import GooglePlaces
import CoreLocation
import WebKit
import FBSDKCoreKit
import Firebase
import FirebaseMessaging
import FirebaseInstanceID
@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var notificationDelegate = UserNotifcations()


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        IQKeyboardManager.shared.enable = true
        FirebaseApp.configure()
        configureNotification()
       // Thread.sleep(forTimeInterval: -3.0)
        ApplicationDelegate.shared.application(application, didFinishLaunchingWithOptions: launchOptions)
        GMSServices.provideAPIKey("AIzaSyAwDJEMBWF47UbCpPlGh-86vBpN7ggsfDo")
        saveLongitude(longitude: "")
        saveLatitude(latitude: "")
        SceneDelegate().checkUserExist()
        configureNotification()
        return true
    }

    //MARK:-Notification Handler
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
    let deviceTokenString = deviceToken.reduce("", {$0 + String(format: "%02X", $1)})
    print("APNs device token: \(deviceTokenString)")
        
        Messaging.messaging().apnsToken = deviceToken
        if let token = Messaging.messaging().fcmToken {
        print("APNs fcm token: \(/token)")
        }
   
    }

    func configureNotification() {
        if #available(iOS 10.0, *) {
            let center = UNUserNotificationCenter.current()
            center.requestAuthorization(options:[.badge, .alert, .sound]){ (granted, error) in }
            center.delegate = notificationDelegate
        } else {
            UIApplication.shared.registerUserNotificationSettings(UIUserNotificationSettings(types: [.badge, .sound, .alert], categories: nil))
        }
        UIApplication.shared.registerForRemoteNotifications()
        Messaging.messaging().delegate = self
    }

    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
    print("APNs registration failed: \(error)")
        
    }
    
    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
        guard let url = URLContexts.first?.url else {
            return
        }

        ApplicationDelegate.shared.application(
            UIApplication.shared,
            open: url,
            sourceApplication: nil,
            annotation: [UIApplication.OpenURLOptionsKey.annotation]
        )
    }
    func application(
    _ app: UIApplication,
    open url: URL,
    options: [UIApplication.OpenURLOptionsKey : Any] = [:]
    ) -> Bool {

    ApplicationDelegate.shared.application(
    app,
    open: url,
    sourceApplication: options[UIApplication.OpenURLOptionsKey.sourceApplication] as? String,
    annotation: options[UIApplication.OpenURLOptionsKey.annotation]
    )

    }

    
    

//func configureNotification() {
//    if #available(iOS 10.0, *){
//    let center = UNUserNotificationCenter.current()
//    center.requestAuthorization(options:[.badge, .alert, .sound]){ (granted, error) in }
//    center.delegate = notificationDelegate
//    } else {
//    UIApplication.shared.registerUserNotificationSettings(UIUserNotificationSettings(types: [.badge, .sound, .alert], categories: nil))
//    }
//    UIApplication.shared.registerForRemoteNotifications()
//    }

                  
    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func applicationWillTerminate(_ application: UIApplication) {
       saveSplashStatusForHome(status: true)
    }
    
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
        print("hello")
    }

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "Halal")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}


extension AppDelegate: MessagingDelegate {
    
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
        print("APNs fcm token: \(/fcmToken)")
        saveDeviceToken(deviceToken: /fcmToken)
    }
}
