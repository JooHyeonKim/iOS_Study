//
//  UNNotificationCenter.swift
//  Drink
//
//  Created by 김주현 on 2023/09/29.
//

import Foundation
import UserNotifications

extension UNUserNotificationCenter {
  func addNotificationRequest(by alert: Alert) {
    //contents
    let content = UNMutableNotificationContent()
    content.title = "물 마실 시간이에요💧"
    content.body = "세계보건기구(WHO)가 권장하는 하루 물 섭취량은 1.5~2리터 입니다."
    content.sound = .default
    content.badge = 1 ///어떤 시점에 badge를 없애줄지도 따로 설정해줘야한다. SceneDelegate 참고
    
    let component = Calendar.current.dateComponents([.hour,.minute], from: alert.date)
    let trigger = UNCalendarNotificationTrigger(dateMatching: component, repeats: alert.isOn)
    ///repeat: 스위치가 켜져 있다면 반복
    let request = UNNotificationRequest(identifier: alert.id, content: content, trigger: trigger)
    self.add(request, withCompletionHandler: nil)
  }
}
