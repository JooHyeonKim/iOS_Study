//
//  AddAlertViewController.swift
//  Drink
//
//  Created by 김주현 on 2023/09/26.
//

import UIKit

class AddAlertViewController: UIViewController {
  var pickedDate: ((_ date: Date)-> Void)?
  @IBOutlet weak var datePicker: UIDatePicker!
  
  @IBAction func dismissButtonTapped(_ sender: UIBarButtonItem) {
    self.dismiss(animated: true, completion: nil)
  
  }
  @IBAction func saveButtonTapped(_ sender: UIBarButtonItem) {
    pickedDate?(datePicker.date)
    self.dismiss(animated: true, completion: nil)
  }
}
