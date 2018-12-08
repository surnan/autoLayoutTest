//
//  SwipingController.swift
//  AutoLayout
//
//  Created by admin on 12/7/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit


let collectionCellID = "cellID"

class SwipingController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: collectionCellID)
        collectionView.register(PageCell.self , forCellWithReuseIdentifier: collectionCellID)
        
        
        collectionView.backgroundColor = UIColor.white
        collectionView.isPagingEnabled = true //snapping behavior on edges
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collectionCellID, for: indexPath)
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
