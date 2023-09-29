//
//  Alert.swift
//  Drink
//
//  Created by 김주현 on 2023/09/26.
//

import Foundation

struct Alert: Codable {
  var id: String = UUID().uuidString
  var date: Date
  var isOn: Bool
  
  var time: String {
    let timeFormatter = DateFormatter()
    timeFormatter.dateFormat = "hh:mm"
    return timeFormatter.string(from: date)
  }
  
  var meridiem: String {
    let meridemFormatter = DateFormatter()
    meridemFormatter.dateFormat = "a" //오전오후
    meridemFormatter.locale = Locale(identifier: "ko")
    return meridemFormatter.string(from: date)
  }
}
