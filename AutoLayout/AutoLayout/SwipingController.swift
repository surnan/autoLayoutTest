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
        Page(imageName: "bear_first", headerText: "Welcome Hero", bodyText: "ABCDEFGHIJKL ABCDEFGHIJKL ABCDEFGHIJKL"),
        Page(imageName: "heart_second", headerText: "Join us Today!!", bodyText: "MNOPQRSTUVWX MNOPQRSTUVWX MNOPQRSTUVWX"),
        Page(imageName: "leaf_third", headerText: "Earn Prizes", bodyText: "YZABCDEFG YZABCDEFG YZABCDEFG"),
        Page(imageName: "bear_first", headerText: "Welcome Hero", bodyText: "ABCDEFGHIJKL ABCDEFGHIJKL ABCDEFGHIJKL"),
        Page(imageName: "heart_second", headerText: "Join us Today!!", bodyText: "MNOPQRSTUVWX MNOPQRSTUVWX MNOPQRSTUVWX"),
        Page(imageName: "leaf_third", headerText: "Earn Prizes", bodyText: "YZABCDEFG YZABCDEFG YZABCDEFG"),
        ]
    
    let previousButton: UIButton = {
        let button = UIButton()
        button.setTitle("Prev", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(UIColor.gray, for: .normal)
        button.addTarget(self, action: #selector(handlePreviousButton), for: .touchUpInside)
        return button
    }()
    
    let nextButton: UIButton = {
        let button = UIButton()
        button.setTitle("Next", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(UIColor.mainPink, for: .normal)
        button.addTarget(self, action: #selector(handleNextButton), for: .touchUpInside)
        return button
    }()
    
    
    @objc func handleNextButton(){
        let nextIndex = min(pageControl.currentPage + 1, pages.count)
        let indexPath = IndexPath(row: nextIndex, section: 0)
        pageControl.currentPage = nextIndex
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    @objc func handlePreviousButton(){
        let nextIndex = max(pageControl.currentPage - 1, 0)
        let indexPath = IndexPath(row: nextIndex, section: 0)
        pageControl.currentPage = nextIndex
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    lazy var pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = pages.count
        pc.currentPageIndicatorTintColor = UIColor.mainPink
        pc.pageIndicatorTintColor = UIColor.gray
        return pc
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: collectionCellID)
        collectionView.register(PageCell.self , forCellWithReuseIdentifier: collectionCellID)
        collectionView.backgroundColor = UIColor.white
        collectionView.isPagingEnabled = true //snapping behavior on edges
        setupBottomControls()
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
    
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        let x = targetContentOffset.pointee.x
        
//        print(x, view.frame, x/view.frame.width)
        
        pageControl.currentPage =  Int(x / view.frame.width)
        
        
    }
    
    
    //MARK:- My functions
    func setupBottomControls(){
        //        previousButton.frame = CGRect(x: 0, y: 0, width: 200, height: 50) //not valid with auto-layout
        
        let bottomControlsStackView = UIStackView(arrangedSubviews: [previousButton, pageControl, nextButton])
        bottomControlsStackView.distribution = .fillEqually
        
        bottomControlsStackView.translatesAutoresizingMaskIntoConstraints = false
        [bottomControlsStackView].forEach{view.addSubview($0)}
        
        
        
        NSLayoutConstraint.activate([
            bottomControlsStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bottomControlsStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            bottomControlsStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            bottomControlsStackView.heightAnchor.constraint(equalToConstant: 50)
            ])
    }
}
