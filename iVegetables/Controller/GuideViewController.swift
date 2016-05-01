//
//  GuideViewController.swift
//  iVegetables
//
//  Created by dev on 16/4/30.
//  Copyright © 2016年 Sun. All rights reserved.
//

import Foundation
import UIKit

class GuideViewController: BaseViewController {
    
    override func loadUserView() {
        
    }
    
}

extension GuideViewController {
    
    private func reachability() -> Bool {
        let reach = Reachability.reachabilityForInternetConnection()
        let status = reach.currentReachabilityStatus()
        if !(status == NetworkStatus.ReachableViaWiFi ||
            status == NetworkStatus.ReachableViaWiFi) {
            return false
        }
        return true
    }
    
}