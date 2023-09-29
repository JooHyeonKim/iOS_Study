//
//  AlertListViewController.swift
//  Drink
//
//  Created by 김주현 on 2023/09/26.
//

import UIKit
import UserNotifications

class AlertListViewController: UITableViewController {
  var alerts: [Alert] = []
  let userNotificationCenter = UNUserNotificationCenter.current()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let nibName = UINib(nibName: "AlertListCell", bundle: nil)
    tableView.register(nibName, forCellReuseIdentifier: "AlertListCell")
  }
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    alerts = alertList()
  }
  
  @IBAction func addAlertButtonAction(_ sender: UIBarButtonItem) {
    guard let addAlertVC = self.storyboard?.instantiateViewController(withIdentifier: "AddAlertViewController") as? AddAlertViewController else { return }
    addAlertVC.pickedDate = { [weak self] date in
      guard let self = self else { return }
      
      var alertList = self.alertList()
      let newAlert = Alert(date: date, isOn: true)
      
      alertList.append(newAlert)
      alertList.sort {$0.date < $1.date}
      
      self.alerts = alertList
      
      UserDefaults.standard.set(try? PropertyListEncoder().encode(self.alerts), forKey: "alerts")
      
      self.userNotificationCenter.addNotificationRequest(by: newAlert)
      
      self.tableView.reloadData()
      
    }
    self.present(addAlertVC, animated: true, completion: nil)
  }
  
  func alertList() -> [Alert] {
    guard let data = UserDefaults.standard.value(forKey: "alerts") as? Data,
          let alarts = try? PropertyListDecoder().decode([Alert].self, from: data) else { return [] }
    return alerts
  }
  
}
// UITableView Datasource, Dlegate
extension AlertListViewController {
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return alerts.count
  }
  
  override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    switch section {
    case 0: //첫 번째 section
      return "🚰 물 마실 시간"
    default:
      return nil //다른 섹션일 경우 아무것도 안보여줌
    }
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "AlertListCell", for: indexPath) as?AlertListCell else { return UITableViewCell() }
    cell.alertSwitch.isOn = alerts[indexPath.row].isOn
    cell.timeLabel.text = alerts[indexPath.row].time
    cell.meridiemLabel.text = alerts[indexPath.row].meridiem
    
    cell.alertSwitch.tag = indexPath.row //cell의 alertSwitch가 자신의 index를 알 수 있게 하는 방법. indexPath.row와 같게해줌.
    return cell
  }
  
  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 80 //row 높이
  }
  
  override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
    return true
  }
  
  override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    switch editingStyle {
    case .delete:
      //노티피케이션 삭제 구현
      self.alerts.remove(at: indexPath.row)
      UserDefaults.standard.set(try? PropertyListEncoder().encode(self.alerts), forKey: "alerts")
      self.tableView.reloadData() //변경사항이 UI에도 반영
      
      ///pending되어있는 request를 삭제
      userNotificationCenter.removePendingNotificationRequests(withIdentifiers: [alerts[indexPath.row].id])
      return
    default:
      break
    }
  }
}
