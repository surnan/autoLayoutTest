//
//  SwipingController.swift
//  AutoLayout
//
//  Created by admin on 12/7/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

class SwipingController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let collectionCellID = "cellID"
//    let imageNames = ["bear_first", "heart_second", "leaf_third"]
//    let headerStrings = ["\n\n\nWelcome Hero", "\n\n\nJoin us Today!!", "\n\n\nEarn Prizes"]
    
    let pages = [
        Page(imageName: "bear_first", headerText: "Welcome Hero", bodyText: "ABCDEFGHIJKL"),
        Page(imageName: "heart_second", headerText: "Join us Today!!", bodyText: "MNOPQRSTUVWX"),
        Page(imageName: "leaf_third", headerText: "Earn Prizes", bodyText: "YZABCDEFG"),
        ]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: collectionCellID)
        collectionView.register(PageCell.self , forCellWithReuseIdentifier: collectionCellID)
        collectionView.backgroundColor = UIColor.white
        collectionView.isPagingEnabled = true //snapping behavior on edges
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return imageNames.count
        return pages.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collectionCellID, for: indexPath) as! PageCell
        
        let page = pages[indexPath.item]
        cell.page = page
        
        //        cell.backgroundColor = indexPath.item % 2 == 0 ? UIColor.blue : UIColor.green
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
