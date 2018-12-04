//
//  ViewController.swift
//  AutoLayout
//
//  Created by admin on 12/4/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let bearImageView: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "bear_first"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let descriptionTextView: UITextView = {
       let textView = UITextView()
        textView.text = "Welcome, Hero"
        textView.font = UIFont.boldSystemFont(ofSize: 18)
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    fileprivate func setupLayout() {
        NSLayoutConstraint.activate([
            bearImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            bearImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            bearImageView.widthAnchor.constraint(equalToConstant: 200),
            bearImageView.heightAnchor.constraint(equalToConstant: 200),
            
            descriptionTextView.topAnchor.constraint(equalTo: bearImageView.bottomAnchor, constant: 120),
            descriptionTextView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            descriptionTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            descriptionTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        [bearImageView, descriptionTextView].forEach{view.addSubview($0)}
        setupLayout()
    }
}

