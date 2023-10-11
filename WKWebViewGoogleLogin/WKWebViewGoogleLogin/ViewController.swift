//
//  ViewController.swift
//  WKWebViewGoogleLogin
//
//  Created by 김주현 on 2023/10/10.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate, WKUIDelegate {

  @IBOutlet weak var webView: WKWebView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    webView.isInspectable = true
    webView.navigationDelegate = self
    
    // Google 로그인 페이지를 로드합니다.
    if let loginURL = URL(string: "https://thomeinc.cafe24.com/skin-skin2/member/login.html") {
        let request = URLRequest(url: loginURL)
        webView.load(request)
    }
  }
  func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
    return
  }
}

