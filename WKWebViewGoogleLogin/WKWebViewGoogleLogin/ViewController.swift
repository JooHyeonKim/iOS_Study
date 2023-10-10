//
//  ViewController.swift
//  WKWebViewGoogleLogin
//
//  Created by 김주현 on 2023/10/10.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {

  @IBOutlet weak var webView: WKWebView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    webView.navigationDelegate = self
    
    if let loginURL = URL(string: "https://thomeinc.cafe24.com/skin-skin2/member/login.html")
  }
}

