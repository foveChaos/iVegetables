//
//  GuideViewController.swift
//  iVegetables
//
//  Created by dev on 16/4/30.
//  Copyright © 2016年 Sun. All rights reserved.
//

import Foundation
import UIKit

struct AboutAlert {
    var title: String?
    var message: String?
    var style: UIAlertControllerStyle {
        return UIAlertControllerStyle.Alert
    }
    
}

typealias VoidBlock = () -> Void

class GuideViewController: BaseViewController, HomeViewDelegate {
    
    @IBOutlet private weak var messageLabel: UILabel!
    
    var guideViewDelegate: GuideViewDelegate?
    
    override func updateUserView() {
        
        let viewController = self.parentViewController as! HomeViewController
        viewController.homeViewDelegate = self
        
        guard netAvailable() else {
            var alert = AboutAlert()
            alert.message = I001
            alertMake(alert, block: {
                exit(0)
            })
            return
        }
        
        guideViewDelegate?.netAvailable()
    }
    
    func hostFinishLoad() {
        messageLabel.text = "欢迎使用！"
    }
}

extension GuideViewController {
    
    func netAvailable() -> Bool {
        let reach = Reachability.reachabilityForInternetConnection()
        let status = reach.currentReachabilityStatus()
        if !(status == NetworkStatus.ReachableViaWiFi ||
            status == NetworkStatus.ReachableViaWiFi) {
            return false
        }
        return true
    }
    
    func alertMake(property: AboutAlert, block:VoidBlock) {
        let alertController = UIAlertController(title: property.title, message: property.message, preferredStyle: property.style)
        let okAction = UIAlertAction(title: "好的", style: UIAlertActionStyle.Default) { (okAction) in
            block()
        }
        alertController.addAction(okAction)
        if let viewController = self.parentViewController {
            viewController.presentViewController(alertController, animated: true, completion: nil)
        }
    }
}