//
//  IntroduceViewController.swift
//  iVegetables
//
//  Created by dev on 16/5/11.
//  Copyright © 2016年 Sun. All rights reserved.
//

import Foundation
import UIKit

class IntroduceViewController: BaseViewController {
    
    @IBOutlet private weak var collectionView: UICollectionView!
    
    let bounds = UIScreen.mainScreen().bounds
    
    let identifier = "IntroduceCell"
    var introduceDelegate: IntroduceViewDelegate?

    func useBegan() {
        introduceDelegate?.startUsing()
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numberOfPages
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(identifier, forIndexPath: indexPath)
//        cell.imageWithPage(indexPath.item)
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return bounds.size
    }
}

extension UICollectionViewCell {
    func imageWithPage(pageNumber: Int) {
        var buttonHidden: Bool
        var imageName: String
        switch pageNumber {
        case 0:
            buttonHidden = false
            imageName = FirstPage
        case 1:
            buttonHidden = false
            imageName = SecondPage
        default:
            buttonHidden = true
            imageName = LastPage
        }
        
        let imageView = UIImageView.init(frame: bounds)
        imageView.image = UIImage(named: imageName)
        addSubview(imageView)
        
        if !buttonHidden {
            let buttonRect = CGRectMake(CGRectGetWidth(bounds)/4, CGRectGetMaxY(bounds) - 60, CGRectGetWidth(bounds)/2, 40)
            let button = UIButton.init(type: UIButtonType.Custom)
            button.frame = buttonRect
            button.setTitle("开始使用", forState: UIControlState.Normal)
            button.addTarget(self, action: #selector(IntroduceViewController.useBegan), forControlEvents: UIControlEvents.TouchUpInside)
            addSubview(button)
        }
    }
}