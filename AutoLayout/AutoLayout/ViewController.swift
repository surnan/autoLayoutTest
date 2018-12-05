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
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
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
    
    let topImageContainerView: UIView = {
        let image = UIView()
        image.backgroundColor = UIColor.blue
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let previousButton: UIButton = {
        let button = UIButton()
        button.setTitle("Prev", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(UIColor.gray, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let nextButton: UIButton = {
        let button = UIButton()
        button.setTitle("Next", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(UIColor.mainPink, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let pageControl: UIPageControl = {
       let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = 4
        pc.currentPageIndicatorTintColor = UIColor.mainPink
        pc.pageIndicatorTintColor = UIColor.gray
        return pc
    }()
    
    
    fileprivate func setupLayout() {
        NSLayoutConstraint.activate([
            topImageContainerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            topImageContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5),
            topImageContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topImageContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            bearImageView.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor),
            bearImageView.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor),
            bearImageView.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.6),
            
            descriptionTextView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor, constant: 60),
            descriptionTextView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            descriptionTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            descriptionTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        topImageContainerView.addSubview(bearImageView)
        [descriptionTextView, topImageContainerView].forEach{view.addSubview($0)}
        setupLayout()
        setupBottomControls()
    }
    
    
    func setupBottomControls(){
//        previousButton.frame = CGRect(x: 0, y: 0, width: 200, height: 50) //not valid with auto-layout
        
        let greenView = UIView(); greenView.backgroundColor = UIColor.green
        
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
    
    func setupTextField(textField: UITextField) -> UITextField{
        let tempTextField = textField
        tempTextField.clearsOnBeginEditing = true
        let memeTextAttributes:[NSAttributedString.Key: Any] = [
            NSAttributedString.Key.strokeColor: UIColor.black,
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-CondensedBlack", size: 40)!,
            NSAttributedString.Key.strokeWidth: -4.6
        ]
        tempTextField.defaultTextAttributes = memeTextAttributes
        tempTextField.textAlignment = .center
//        tempTextField.delegate = self
        return tempTextField
    }
}
