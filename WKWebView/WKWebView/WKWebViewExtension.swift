//
//  WKWebViewExtension.swift
//  WKWebView
//
//  Created by 김주현 on 2023/10/06.
//

import Foundation
import WebKit

extension WKWebView {
  func load(_ urlString: String) {
    if let url = URL(string: urlString) {
      let request = URLRequest(url: url)
      load(request)
    }
  }
}
