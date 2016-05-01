//
//  HomeViewController.swift
//  iVegetables
//
//  Created by dev on 16/5/1.
//  Copyright © 2016年 Sun. All rights reserved.
//

import Foundation
import UIKit



class HomeViewController: BaseViewController, GuideViewDelegate {
    
    @IBOutlet private var guideContainer: UIView!
    @IBOutlet private var webView: UIWebView!
    
    var homeViewDelegate: HomeViewDelegate?
    
    override func updateUserView() {
        
        let viewController = self.childViewControllers.first as! GuideViewController
        viewController.guideViewDelegate = self
    }
    
    func webViewDidStartLoad(webView: UIWebView) {
        homeViewDelegate?.hostStartLoad()
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        homeViewDelegate?.hostFinishLoad()
        self.performSelector(#selector(removeGuide), withObject: nil, afterDelay: 1)
    }
    
    func webView(webView: UIWebView, didFailLoadWithError error: NSError?) {
        print(error)
    }
    
    func netAvailable() {
        connect()
    }
}

extension HomeViewController {
    
    func connect() {
        if let url = NSURL(string: Host) {
            let request = NSURLRequest(URL: url)
            webView.loadRequest(request)
        }
    }
    
    func removeGuide() {
        UIView.animateWithDuration(1) { 
            self.guideContainer.alpha = 0
            self.guideContainer.removeFromSuperview()
        }
    }
    
}