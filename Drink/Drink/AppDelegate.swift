//
//  AppDelegate.swift
//  Drink
//
//  Created by 김주현 on 2023/09/26.
//

import UIKit
import NotificationCenter //알림을 울리기 위해
import UserNotifications 
@main
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var userNotificationCenter = UNUserNotificationCenter.current() ///광역으로 센터를 하나 둔것


  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
    UNUserNotificationCenter.current().delegate = self
    let authorizationOptions = UNAuthorizationOptions(arrayLiteral: [.alert, .badge, .sound])
    
    ///userNotificationCenter는 인증을 요청할 수 있다.
    ///설정해놓은 알림이 가려면 우선 알림요청 허용을 해야됨
    userNotificationCenter.requestAuthorization(options: authorizationOptions) { _, error in
      if let error = error {
        print("ERROR \(error.localizedDescription)")
       }
    }
    return true
  }

  // MARK: UISceneSession Lifecycle

  func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
  }

  func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
  }


}

extension AppDelegate: UNUserNotificationCenterDelegate {
  
  ///willPresent : notification을 보내기 전에 어떤 handling을 해줄지
  func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
    completionHandler([.banner, .list, .badge, .sound])
  }
  
  ///notification을 받았을 때?
  func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
    completionHandler()
  }
}
