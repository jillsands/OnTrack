//
//  WebViewModel.swift
//  OnTrack
//
//  Created by Jillian Sands on 8/12/22.
//

import Foundation
import WebKit
// https://medium.com/devtechie/webview-in-swiftui-a9c283f29327
final class WebViewModel: ObservableObject {
    
    //@Published var urlString = "https://www.wmata.com/schedules/trip-planner/"
    
    let webView: WKWebView
    
    init() {
        webView = WKWebView(frame: .zero)
    }
    
    // Will load a view of the webpage specified in the parameter
    func loadUrl(urlString: String) {
        guard let url = URL(string: urlString) else {
            return
        }
        webView.load(URLRequest(url: url))
    }
    
    
    // not updating as it needs to be
    func getURL() -> String {
        let currentURL = webView.url
        return currentURL!.absoluteString
    }
}
