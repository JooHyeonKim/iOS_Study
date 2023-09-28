//
//  Alert.swift
//  Drink
//
//  Created by 김주현 on 2023/09/26.
//

import Foundation

struct Alert: Codable {
    var id: String = UUID().uuidString
    let date: Date
    let isOn: Bool
    
    var time: String {
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "hh:mm"
        return timeFormatter.string(from: date)
    }
    
    var meridiem: String {
        let meridiemFormatter = DateFormatter()
        meridiemFormatter.dateFormat = "a"
        meridiemFormatter.locale = Locale(identifier: "ko")
        return meridiemFormatter.string(from: date)
    }
}
