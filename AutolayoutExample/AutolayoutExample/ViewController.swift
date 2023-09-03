//
//  ViewController.swift
//  AutolayoutExample
//
//  Created by 김주현 on 2023/09/02.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var colorView: UIView! //초록색으로 설정된 화면을 이제 코드에서 마음껏 변경할 수 있게됨.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //버튼을 누르면 이 함수가 호출됨.
    @IBAction func tapChangeColorButton(_ sender: UIButton) {
        self.colorView.backgroundColor = UIColor.blue
        print("색상 변경 버튼이 클릭되었음.")
    }
    
}

