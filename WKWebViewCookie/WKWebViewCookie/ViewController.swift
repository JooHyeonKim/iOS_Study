//
//  ViewController.swift
//  WKWebViewCookie
//
//  Created by 김주현 on 2023/10/10.
//

import UIKit
import WebKit

class ViewController: UIViewController {

  @IBOutlet weak var webView: WKWebView!
  @IBOutlet weak var textLabel: UILabel!
 
  override func viewDidLoad() {
    super.viewDidLoad()
    
    ///웹뷰의 네비게이션 델리게이트를 설정
    webView.navigationDelegate = self
  }
  
  override func loadView() {
    super.loadView()

  }
  
  @IBAction func buttonTapped(_ sender: Any) {
    //첫번째 웹페이지(로그인페이지) URL
    let loginURLString = "https://thomeinc.cafe24.com/skin-skin2/member/login.html"
    if let loginURL = URL(string: loginURLString) {
      UIApplication.shared.open(loginURL, options: [:])
    }
    //두번째 웹페이지 (사용자 정보 페이지) URL
    let userURLString = "https://thomeinc.cafe24.com/skin-skin2/member/sync.html"
    
    //1. 첫번째 웹페이지(로그인 페이지)를 WKWebView로 연다.
    if let loginURL = URL(string: loginURLString) {
      UIApplication.shared.open(loginURL, options: [:])
      let loginRequest = URLRequest(url: loginURL)
      webView.load(loginRequest)
      
      //웹페이지의 쿠키 가져오기
      WKWebsiteDataStore.default().httpCookieStore.getAllCookies { cookies in
        //여기에서 쿠키를 분석하여 로그인 상태를 확인
        for cookie in cookies {
          print("쿠키 정보 ==> \(cookie.name):\(cookie.value)")
          if cookie.name == "PHPSESSID" {
            UserDefaults.standard.set(cookie.value, forKey: "PHPSESSID")
            print("PHPSESSID 저장하기: \(cookie.value)")
          }
          else {
            print("PHPSESSID 쿠키가 없습니다.")
          }
        }
      }
    }
  }
}

extension ViewController: WKNavigationDelegate {
  
  
  //웹뷰 내에서 페이지가 로드되었을때 호출됨.
  func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
    let cookie_domain = "https://thomeinc.cafe24.com/skin-skin2/member/login.html"
    let loadedSessid = UserDefaults.standard.value(forKey: "PHPSESSID") as! String?
    
    if let temp = loadedSessid {
      print("PHPSESSID 저장 : \(temp)")
      let cookieString: String = "document.cookie='PHPSESSID=\(temp);path=/;domain=\(cookie_domain);'"
      webView.evaluateJavaScript(cookieString)
    }
  }
  
  func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
    print("Failed to load WebView : \(error.localizedDescription)")
  }

  func checkLogiinStatusFromCookies(_ cookies: [HTTPCookie]) -> Bool {
    /// 여기에서 쿠키를 분석하여 로그인 상태를 확인
    /// 쿠키의 이름, 값, 도메인 등을 확인하여 로그인 상태를 판단
    /// 쿠키가 존재하면 로그인 상태로 간주할 수 있다.
    ///
    /// ex. loginCookie라는 쿠키가 존재하면 로그인 상태로 간주
    /// 예를 들어, 로그인에 성공하면 "AUTH"라는 쿠키를 생성하고, "AUTH" 쿠키가 존재하면 로그인한 상태라고 인식하는 것이다.
    return true
  }
  
  func performLogin() {
    
  }

}

