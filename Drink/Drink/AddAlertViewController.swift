//
//  AddAlertViewController.swift
//  Drink
//
//  Created by 김주현 on 2023/09/26.
//

import UIKit

class AddAlertViewController: UIViewController {
    /// 현재 화면에서 선택한 시간데이터를 부모뷰로 전달해줘야함. 클로져로
    var pickedDate:((_ date: Date)-> Void)?
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBAction func dismissButtonTap(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil) //현재 화면 사라지게
    }
    
    /// 현재 화면에서 선택한 시간데이터를 부모뷰로 전달해줘야함. 클로져로
    @IBAction func saveButtonTap(_ sender: UIBarButtonItem) {
        self.pickedDate?(datePicker.date)
        self.dismiss(animated: true, completion: nil)
    }
}
