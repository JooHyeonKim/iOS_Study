//
//  AlertListViewController.swift
//  Drink
//
//  Created by 김주현 on 2023/09/26.
//

import UIKit

class AlertListViewController: UITableViewController {
    var alerts: [Alert] = [] ///tableView에 뿌려질 alert들

    override func viewDidLoad() {
        super.viewDidLoad()
        let nibName = UINib(nibName: "AlertListCell", bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: "AlertListCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        alerts = self.alertList()
    }

    @IBAction func addAlertButtonAction(_ sender: UIBarButtonItem) {
        guard let addAlerVC = storyboard?.instantiateViewController(withIdentifier: "AddAlertViewController") as? AddAlertViewController else { return }
        addAlerVC.pickedDate = {[weak self] date in
            guard let self = self else { return }
            
            var alertList = self.alertList() ///Userdefaults에 저장된 배열
            let newAlert = Alert(date: date, isOn: true) ///자식뷰에서 새롭게 추가된 알람
            
            alertList.append(newAlert)
            alertList.sort { $0.date < $1.date }
            
            self.alerts = alertList
            
            UserDefaults.standard.set(try? PropertyListEncoder().encode(self.alerts), forKey: "alerts")
            self.tableView.reloadData()
            
        }
        ///+ 버튼 눌렀을때 시간선택 창이 뜨도록
        self.present(addAlerVC, animated: true)
    }
    
    func alertList() -> [Alert] {
        guard let data = UserDefaults.standard.value(forKey: "alerts") as? Data,
              let alerts = try? PropertyListDecoder().decode([Alert].self, from: data) else { return []}
        return alerts
    }
}

extension AlertListViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return alerts.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "💧물 마실 시간"
        default:
            return nil //다른 섹션이라면 아무것도 보여주지 않음.
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        switch section {
        case 0:
            return "첫번째 section의 footer"

        default:
            return nil
        }
    }
    //cellforRowat
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AlertListCell", for: indexPath) as? AlertListCell else{ return UITableViewCell() }
        cell.alertSwitch.isOn = alerts[indexPath.row].isOn
        cell.merideimLabel.text = alerts[indexPath.row].meridiem
        cell.timeLabel.text = alerts[indexPath.row].time
        
        return cell
    }
    
    //cell 높이 설정
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    //알람 전체리스트를 삭제할 수 있도록 설정
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .delete: ///row 삭제 구현
            self.alerts.remove(at: indexPath.row)
            UserDefaults.standard.set(try? PropertyListEncoder().encode(self.alerts), forKey: "alerts")
            self.tableView.reloadData()
            
        default:
            break
        }
    }
    

}
