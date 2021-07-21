//
//  WebView.swift
//  HackerDaily
//
//  Created by Amit Chaudhary on 7/21/21.
//

import Foundation
import WebKit
import SwiftUI

struct WebDetailView: UIViewRepresentable {
    let urlString: String?
    
    func makeUIView(context: Context) -> WKWebView {     //WKWebView replaced some UIView
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {     // WKWebView replaced UIViewType
        if let safeString = urlString {
            if let safeURL = URL(string: safeString) {
                let request = URLRequest.init(url: safeURL)
                uiView.load(request)
            }
        }
    }
}
