//
//  PageCell.swift
//  AutoLayout
//
//  Created by admin on 12/8/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

class PageCell: UICollectionViewCell {
    
    
    let bearImageView: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "bear_first"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let topImageContainerView: UIView = {
        let image = UIView()
        image.backgroundColor = UIColor.blue
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    
    let descriptionTextView: UITextView = {
        let textView = UITextView()
        
        let attributedText2 = NSMutableAttributedString(string: "Welcome, HERO", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)])
        
        attributedText2.append(NSAttributedString(string: "\n\n\nAre you ready to begin your journey?!?!  Before setting out on your first quest, look around town and see if there are any merchants or trainers willing to assist a young adventurer ready to make his/her name", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13), NSMutableAttributedString.Key.foregroundColor: UIColor.gray]))
        
        
        textView.attributedText = attributedText2
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.purple
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    fileprivate func setupLayout() {
        
        [bearImageView, descriptionTextView].forEach{topImageContainerView.addSubview($0)}
        addSubview(topImageContainerView)
        
        NSLayoutConstraint.activate([
            topImageContainerView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            topImageContainerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5),
            topImageContainerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            topImageContainerView.leadingAnchor.constraint(equalTo: leadingAnchor),
//            topImageContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),  <--- removed "view" from each
            
            bearImageView.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor),
            bearImageView.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor),
            bearImageView.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.6),
            
            descriptionTextView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor, constant: 60),
            descriptionTextView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            descriptionTextView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            descriptionTextView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            ])
    }
    
    
}
