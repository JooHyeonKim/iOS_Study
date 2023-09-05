//
//  ViewController.swift
//  TodoList
//
//  Created by 김주현 on 2023/09/04.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var editButton: UIBarButtonItem!
    var doneButton: UIBarButtonItem?
    
    var tasks = [Task]() { //Task타입의 배열을 초기화해준것
        didSet {
            self.saveTasks()
        }
    }
    
    //할 일을 등록하고 테이블 뷰에 표시되도록 구현

    override func viewDidLoad() {
        super.viewDidLoad()
        self.doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonTap))
        self.tableView.dataSource = self //UITableViewDataSource 프로토콜을 체택하라는 에러 발생.
        self.tableView.delegate = self  // 체크표시를 만들것임. UITableViewDelegate 프로토콜을 체택하라는 에러 발생.
        self.loadTasks()
    }
    
    @objc func doneButtonTap() {
        self.navigationItem.leftBarButtonItem = self.editButton
        self.tableView.setEditing(false, animated: true)
    }

    @IBAction func tapEditButton(_ sender: UIBarButtonItem) {
        //할일이 없으면 편집할 필요가 없으므로
        guard !self.tasks.isEmpty else { return }
        self.navigationItem.leftBarButtonItem = self.doneButton
        self.tableView.setEditing(true, animated: true)
    }
    
    @IBAction func tapAddButton(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "할 일 등록", message: nil, preferredStyle: .alert)
        
        //handler : alert 버튼을 눌렀을 때 실행될 행동을 클로져로 정의. ex)등록버튼을 누를때마다 할일을 추가
        let registerButton = UIAlertAction(title: "등록", style: .default, handler: { [weak self]_ in
            debugPrint("\(alert.textFields?[0].text)")
            guard let title = alert.textFields?[0].text else {return}
            let task = Task(title: title, done: false)
            self?.tasks.append(task) //tasks배열에 할일이 추가될때마다
            self?.tableView.reloadData() // tableView에 반영되게
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
    
    func saveTasks() {
        let data = self.tasks.map {
            [
                "title" : $0.title,
                "done": $0.done
            ]
        }
        let userDefaults = UserDefaults.standard
        userDefaults.set(data, forKey: "tasks")
    }
    
    func loadTasks() {
        let userDefaults = UserDefaults.standard
        guard let data = userDefaults.object(forKey: "tasks") as? [[String: Any]] else {return}
        self.tasks = data.compactMap {
            guard let title = $0["title"] as? String else { return nil}
            guard let done = $0["done"] as? Bool else {return nil}
            return Task(title: title, done: done)
        }
    }
}



extension ViewController: UITableViewDataSource { // UITableViewDataSource 프로토콜을 준수해야함.
    
    //!구현필수 - numberOfRowsInSection
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //numberOfRowsInSection : 각 섹션에 표시할 행 개수
        return self.tasks.count
    }
    
    //!구현필수 - cellForRowAt
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //스토리보드에서 가져온 cell을 dequeueReusableCell로 가져와서 가져온 cell을 tableView에 표시될수 있게됨.
        //indexPath : cellForRowAt의 파라미터
        //dequeueReusableCell : 큐를 사용해서 cell을 재사용
        //                    : 재사용 가능한 cell을 찾아서 tableView에 추가
        // indexPath 위치에 해당 cell을 재사용
        //indexPath.row : 0 ~ task배열길이
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let task = self.tasks[indexPath.row]
        cell.textLabel?.text = task.title
        
        if task.done {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        
        return cell
    }
    
    //삭제버튼이 눌려진 셀이 어떤 셀인지 알려주는 메소드
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        self.tasks.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .automatic)
        
        //할일이 모두 삭제되면 편집모드를 빠져나요게.
        
        if self.tasks.isEmpty {
            self.doneButtonTap()
        }
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    //cell이 다른 위치로 이동하면
    //sourceIndexPath      : 이동하기 전 원래 위치
    //destinationIndexPath : 이동한 후 위치
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        var tasks = self.tasks
        let task = tasks[sourceIndexPath.row]
        tasks.remove(at: sourceIndexPath.row)
        tasks.insert(task, at:destinationIndexPath.row)
        self.tasks = tasks
    }
    

}

//체크박스 기능
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var task = self.tasks[indexPath.row]
        task.done = !task.done
        self.tasks[indexPath.row] = task
        self.tableView.reloadRows(at: [indexPath], with: .automatic)
    }
}
