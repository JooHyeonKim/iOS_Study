//
//  SeguePresentViewController.swift
//  ScreenTransitionExample
//
//  Created by 김주현 on 2023/09/03.
//

import UIKit

class SeguePresentViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func tabBackButton(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true)
    }
    

}
