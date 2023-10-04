//
//  WeatherInformation.swift
//  Weather
//
//  Created by 김주현 on 2023/09/22.
//

import Foundation

struct WeatherInformation: Codable { ///Codable: 자신을 외부표현(Json)으로 변환할 수 있는 타입
  let weather: [Weather]
  let temp: Temp
  let name: String
  
  enum CodingKeys: String, CodingKey {
    case weather
    case temp = "main"
    case name
  }
}

struct Weather: Codable {
  let id: Int
  let main: String
  let description: String
  let icon: String
}

struct Temp: Codable {
  let temp: Double
  let feelsLike: Double
  let minTemp: Double
  let maxTemp: Double
  
  enum CodingKeys: String, CodingKey {
    case temp
    case feelsLike = "feels_like"
    case minTemp = "temp_min"
    case maxTemp = "temp_max"
  }
}
