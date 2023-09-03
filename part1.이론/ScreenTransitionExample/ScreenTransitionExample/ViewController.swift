//
//  ViewController.swift
//  ScreenTransitionExample
//
//  Created by 김주현 on 2023/09/03.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //새로운 함수로 present되게하는 코드
    @IBAction func tapCodePresent(_ sender: UIButton) {
        
        //스토리보드의 뷰컨트롤러를 찾아서 인스턴스화시켜준 것.
        guard let viewController = self.storyboard?.instantiateViewController(identifier: "CodePresentViewController") else {return}
        viewController.modalPresentationStyle = .fullScreen
        self.present(viewController, animated: true)
    }

    @IBAction func TapCodePushButton(_ sender: UIButton) {
        //화면전환을 했을 때 나타나는 화면
        guard let viewController = self.storyboard?.instantiateViewController(identifier: "CodePushViewController") else {return}
        
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    

    
}

