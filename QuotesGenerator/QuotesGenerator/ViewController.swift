//
//  ViewController.swift
//  QuotesGenerator
//
//  Created by 김주현 on 2023/09/03.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel! //명언라벨
    @IBOutlet weak var quoteLabel: UILabel! //이름 라벨
    
    let quotes = [
        
        Quote(contents: "우리는 나이가 들면서 변하는 게 아니다. 보다 자기 다뤄지는 것이다.", name: "린홀"),
        Quote(contents: "인생에 뜻을 세우는데 적당한 때는 없다.", name: "볼드윈"),
        Quote(contents: "실패는 잊어라. 하지만 그것이 준 교훈은 절대 잊으면 안 된다.", name: "하버트 개서"),
        Quote(contents: "우리는 행복하기 때문에 웃는 게 아니라, 웃기 때문에 행복하다.", name: "윌리엄 제임스"),
        Quote(contents: "너 자신이 돼라. 다른 사람은 이미 있으니까.", name: "오스카 와일드")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
//명연생성 버튼 누를때마다 tabQuoteGeneratorButton이 호출되야함.
    @IBAction func tabQuoteGeneratorButton(_ sender: Any) {
        
        let random = Int(arc4random_uniform(5)) // 0~4 사이의 난수를 생성
        let quote = quotes[random]
        self.quoteLabel.text = quote.contents
        self.nameLabel.text = quote.name
    }
    
}

