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

    @IBAction func useBegan() {
        introduceDelegate?.startUsing()
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numberOfPages
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(identifier, forIndexPath: indexPath) as! IntroduceCell
        cell.viewForPage(indexPath.item)
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return bounds.size
    }
}

class IntroduceCell: UICollectionViewCell {
    
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var button: UIButton!
    
    func viewForPage(pageNumber: Int) {
        var buttonHidden: Bool
        var imageName: String
        switch pageNumber {
        case 0:
            buttonHidden = true
            imageName = FirstPage
        case 1:
            buttonHidden = true
            imageName = SecondPage
        default:
            buttonHidden = false
            imageName = LastPage
        }

        imageView.image = UIImage(named: imageName)
        button.hidden = buttonHidden
    }
}