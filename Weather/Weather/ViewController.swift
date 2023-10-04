//
//  ViewController.swift
//  Weather
//
//  Created by 김주현 on 2023/09/22.
//

import UIKit

class ViewController: UIViewController {
  
  
  @IBOutlet weak var cityNameTextField: UITextField!
  @IBOutlet weak var cityNameLabel: UILabel!
  @IBOutlet weak var weatherDescription: UILabel!
  @IBOutlet weak var tempLabel: UILabel!
  @IBOutlet weak var maxTempLabel: UILabel!
  @IBOutlet weak var minTempLabel: UILabel!
  @IBOutlet weak var weatherStackView: UIStackView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }
  
  @IBAction func tapFetchWeatherButton(_ sender: Any) {
    if let cityName = self.cityNameTextField.text {
      self.getCurrentWeather(cityName: cityName)
      self.view.endEditing(true) //버튼이 눌리면 키보드가 사라지게
    }
  }
  
  func configureView(weatherInformation: WeatherInformation) {
    self.cityNameLabel.text = weatherInformation.name
    if let weather = weatherInformation.weather.first {
      self.weatherDescription.text = weather.description
    }
    self.tempLabel.text = "\(Int(weatherInformation.temp.temp - 273.15))°C"
    self.maxTempLabel.text = "최고: \(Int(weatherInformation.temp.maxTemp - 273.15))°C"
    self.minTempLabel.text = "최저: \(Int(weatherInformation.temp.minTemp - 273.15))°C"
  }
  
  func showAlert(message: String) {
    let alert = UIAlertController(title: "에러", message: message, preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "확인", style: .default))
    self.present(alert, animated: true, completion: nil)
  }
  
  func getCurrentWeather(cityName: String) {
    guard let url = URL(string:
                          "https://api.openweathermap.org/data/2.5/weather?q=\(cityName)&appid=b29b9971668c1826844eafa5b78c357b") else { return}
    let session = URLSession(configuration: .default) //기본세션
    session.dataTask(with: url) { [weak self] data, response, error in
      let successRange = (200..<300) //200번대면 성공
      guard let data = data, error == nil else { return }
      let decoder = JSONDecoder() //JSon유형 -> struct로 변환
      if let response = response as? HTTPURLResponse, successRange.contains(response.statusCode) {
        guard let weatherInformation = try? decoder.decode(WeatherInformation.self, from: data) else { return }
        //main 스레드에서 작업할 수 있도록 해줌
        DispatchQueue.main.async {
          self?.weatherStackView.isHidden = false
          self?.configureView(weatherInformation: weatherInformation)
          debugPrint(weatherInformation)
        }
      } else {
        guard let errorMessage = try? decoder.decode(ErrorMessage.self, from:data) else { return }
        debugPrint(errorMessage)
        DispatchQueue.main.async {
          self?.showAlert(message: errorMessage.message)
        }
      
      }
      
      
    }.resume()
  }
  
}

