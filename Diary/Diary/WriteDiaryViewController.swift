//
//  WriteDiaryViewController.swift
//  Diary
//
//  Created by 김주현 on 2023/09/05.
//

import UIKit

class WriteDiaryViewController: UIViewController {
    @IBOutlet var confirmButton: UIBarButtonItem!
    @IBOutlet var dateTextField: UITextField!
    @IBOutlet var contentsTextField: UITextView!
    @IBOutlet var titleTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    private func configureContentsTextView() {
        
    }
    
    @IBAction func tapConfirmButton(_ sender: Any) {
    }
}
