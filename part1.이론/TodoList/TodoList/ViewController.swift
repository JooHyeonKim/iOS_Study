//
//  ViewController.swift
//  TodoList
//
//  Created by 김주현 on 2023/09/04.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var tasks = [Task]() //Task타입의 배열을 초기화해준것
    
    //할 일을 등록하고 테이블 뷰에 표시되도록 구현

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tapEditButton(_ sender: UIBarButtonItem) {
    }
    
    @IBAction func tapAddButton(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "할 일 등록", message: nil, preferredStyle: .alert)
        
        //handler : alert 버튼을 눌렀을 때 실행될 행동을 클로져로 정의. ex)등록버튼을 누를때마다 할일을 추가
        let registerButton = UIAlertAction(title: "등록", style: .default, handler: { [weak self]_ in
            debugPrint("\(alert.textFields?[0].text)")
        })
        
        //취소버튼을 누른 다음에는 별다른 액션을 취하지 않을 것이므로 nil
        let cancelButton = UIAlertAction(title: "취 소", style: .cancel, handler: nil)
        
        alert.addAction(cancelButton)
        alert.addAction(registerButton)
        //alert에 text field 추가
        alert.addTextField { textField in
            textField.placeholder = "할 일을 입력해주세요."
        }
        self.present(alert, animated: true, completion: nil)
    }
    
}

