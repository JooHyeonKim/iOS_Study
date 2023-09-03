//
//  CodePushViewController.swift
//  ScreenTransitionExample
//
//  Created by 김주현 on 2023/09/03.
//

import UIKit

class CodePushViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func tapBackButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
