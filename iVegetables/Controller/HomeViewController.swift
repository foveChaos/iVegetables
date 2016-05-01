//
//  HomeViewController.swift
//  iVegetables
//
//  Created by dev on 16/5/1.
//  Copyright © 2016年 Sun. All rights reserved.
//

import Foundation
import UIKit

class HomeViewController: BaseViewController {
    
    @IBOutlet private weak var guideContainer: UIView!
    @IBOutlet private weak var webView: UIWebView!
    
    override func loadUserView() {
        let url = NSURL(fileURLWithPath: Host)
        let request = NSURLRequest(URL: url)
        webView.loadRequest(request)
    }
    
    func webViewDidStartLoad(webView: UIWebView) {
        
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        
    }
}