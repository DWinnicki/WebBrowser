//
//  ViewController.swift
//  WebBrowser
//
//  Created by David Winnicki on 2017-06-09.
//  Copyright © 2017 Winnicki. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, UITextFieldDelegate, WKNavigationDelegate {

    // Mark: - Outlets and actions
    @IBOutlet weak var webViewContrainer: UIWebView!
    
    @IBAction func buttonBackTouched(_ sender: UIButton) {
        webView?.goBack()
    }
    
    @IBAction func buttonForwardTouched(_ sender: UIButton) {
        webView?.goForward()
    }
    
    @IBAction func buttonRefreshTouched(_ sender: UIButton) {
        webView?.reload()
    }
    // Mark: - Instance variables
    var webView: WKWebView?
    
    // Mark: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView = WKWebView(frame: view.bounds)
        webViewContrainer.addSubview(webView!)
        webView?.navigationDelegate = self
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if let url = textField.text {
            webView?.loadUrl(address: "https://\(url)")
        }
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension WKWebView {
    func loadUrl(address: String) {
        if let url = URL(string: address) {
            load(URLRequest(url: url))
        }
    }
}

