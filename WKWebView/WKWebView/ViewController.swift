//
//  ViewController.swift
//  WKWebView
//
//  Created by 김주현 on 2023/10/06.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {
  var web = WKWebView()
  
  @IBOutlet weak var dataLabel: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    web = WKWebView(frame: .zero)
    web.navigationDelegate = self

    web.load("https://thomeinc.cafe24.com/skin-skin2/member/login.html")
  }
  
  func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
      web.evaluateJavaScript("document.getElementsByClassName('h3 center hide')[0].innerText") {(result, error) in
        if error != nil {
               print(result)
           }
          print(String(describing: result))
          self.dataLabel.text = result as? String
      }
  }
}
