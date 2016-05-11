//
//  HomeViewController.swift
//  iVegetables
//
//  Created by dev on 16/5/1.
//  Copyright © 2016年 Sun. All rights reserved.
//

import Foundation
import UIKit

class HomeViewController: BaseViewController, GuideViewDelegate, IntroduceViewDelegate {
    
    @IBOutlet private var guideContainer: UIView!
    @IBOutlet private var introduceContainer: UIView!
    @IBOutlet private var webView: UIWebView!
    
    var homeViewDelegate: HomeViewDelegate?
    
    override func loadUserView() {
        
        let userDefault = NSUserDefaults.standardUserDefaults()
        let flag = userDefault.boolForKey(HadUseThisApp)
        if flag {
            introduceContainer.alpha = 0
        } else {
            userDefault.setBool(true, forKey: HadUseThisApp)
        }
    }
    
    override func updateUserView() {
        
        let introduceViewController = self.childViewControllers.first as! IntroduceViewController
        introduceViewController.introduceDelegate = self
        
        let guideViewController = self.childViewControllers.last as! GuideViewController
        guideViewController.guideViewDelegate = self
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
    
    func startUsing() {
        removeIntroduce()
    }
}

extension HomeViewController {
    
    func connect() {
        if let url = NSURL(string: Host) {
            let request = NSURLRequest(URL: url)
            webView.loadRequest(request)
            webView.scrollView.bounces = false
        }
    }
    
    func removeGuide() {
        UIView.animateWithDuration(2) {
            self.view.alpha = 1
            self.guideContainer.alpha = 0
            self.guideContainer.removeFromSuperview()
        }
    }
    
    func removeIntroduce() {
        UIView.animateWithDuration(2) {
            self.view.alpha = 1
            self.introduceContainer.alpha = 0
            self.introduceContainer.removeFromSuperview()
        }
    }
}