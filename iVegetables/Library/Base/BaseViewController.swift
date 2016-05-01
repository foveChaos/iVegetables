//
//  BaseViewController.swift
//  iVegetables
//
//  Created by dev on 16/4/30.
//  Copyright © 2016年 Sun. All rights reserved.
//

import Foundation
import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadUserView()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        updateUserView()
    }
    
    
    
    func loadUserView() {
        
    }
    
    func updateUserView() {
        
    }
}