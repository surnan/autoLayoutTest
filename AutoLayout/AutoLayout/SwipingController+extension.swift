//
//  SwipingController+extension.swift
//  AutoLayout
//
//  Created by admin on 12/9/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

extension SwipingController {
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        collectionViewLayout.invalidateLayout()  //Makes it collectionView re-draw itself
        
        coordinator.animate(alongsideTransition: { [unowned self](_) in
            self.collectionViewLayout.invalidateLayout()

            //accomdate for page zero because weird bug
            if self.pageControl.currentPage == 0 {
                self.collectionView.contentOffset = .zero
            } else {
                //reset the current page
                let indexPath = IndexPath(item: self.pageControl.currentPage, section: 0)
                self.collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            }
        }) { (_) in
        }
    }
}
