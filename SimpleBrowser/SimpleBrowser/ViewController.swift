//
//  ViewController.swift
//  SimpleBrowser
//
//  Created by mac on 22/05/20.
//  Copyright © 2020 KuldeepBhandari. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController,WKNavigationDelegate {

    var webview:WKWebView!
    
    var progressView : UIProgressView!
    
    
    override func loadView() {
        webview = WKWebView()
        webview.navigationDelegate = self
        view = webview
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
         navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Open", style: .plain, target: self, action: #selector(opentapped))
        progressView = UIProgressView(progressViewStyle: .default)
        progressView.sizeToFit()
        let progressButton = UIBarButtonItem(customView: progressView)
        
        let spcaer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let refresh = UIBarButtonItem(barButtonSystemItem: .refresh, target: webview, action: #selector(webview.reload))
        toolbarItems = [progressButton,spcaer,refresh]
        navigationController?.isToolbarHidden = false
        let url = URL(string: "https://www.hackingwithswift.com")!
        webview.load(URLRequest(url: url))
        webview.allowsBackForwardNavigationGestures = true
        webview.addObserver(self, forKeyPath: #keyPath(WKWebView.estimatedProgress), options: .new, context: nil)
        
        // Do any additional setup after loading the view.
       
    }

    override  func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "estimatedProgress"{
            progressView.progress = Float(webview.estimatedProgress)
        }
    }
    func openPage(action:UIAlertAction){
        
        let url = URL(string: "https://" + action.title!)!
        webview.load(URLRequest(url: url))
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        title = webview.title
    }
    @objc func opentapped(){
        let ac = UIAlertController(title: "Open page…", message: nil, preferredStyle: .actionSheet)
        ac.addAction(UIAlertAction(title: "apple.com", style: .default, handler: openPage))
        ac.addAction(UIAlertAction(title: "hackingwithswift.com", style: .default, handler: openPage))
        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        ac.popoverPresentationController?.barButtonItem = self.navigationItem.rightBarButtonItem
        present(ac, animated: true)
    }

    
}

