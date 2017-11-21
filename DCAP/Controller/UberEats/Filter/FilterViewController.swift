//
//  FilterViewController.swift
//  DCAP
//
//  Created by Sean Zhang on 11/20/17.
//  Copyright © 2017 Sean Zhang. All rights reserved.
//

import UIKit

class FilterViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var cancelButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("X", for: .normal)
        button.backgroundColor = .red
        return button
    }()
    
    var resetButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("RESET", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        button.backgroundColor = .yellow
        return button
    }()
    
    var sortButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Sort", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        button.backgroundColor = .gray
        return button
    }()
    var priceButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Price", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        button.backgroundColor = .blue
        return button
    }()
    var dietaryButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Dietary", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        button.backgroundColor = .red
        return button
    }()
    
    let doneButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("DONE", for: .normal)
        button.tintColor = UIColor.black
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .blue
        return button
    }()
    
    var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = .red
        cv.isPagingEnabled = true
        cv.showsHorizontalScrollIndicator = false
        return cv
    }()
    
    
    lazy var stackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [sortButton, priceButton, dietaryButton])
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = .horizontal
        sv.distribution = .fillEqually
        sv.spacing = 10
        sv.alignment = .center
        sv.backgroundColor = .blue
        return sv
    }()
    
    override func viewDidLoad() {
        view.backgroundColor = UIColor(white: 1, alpha: 0.2)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "FilterCell")
        setupViews()
    }
    
    fileprivate func setupViews(){
        view.addSubview(cancelButton)
        NSLayoutConstraint.activate([
            cancelButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
            cancelButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            cancelButton.widthAnchor.constraint(equalToConstant: 50),
            cancelButton.heightAnchor.constraint(equalToConstant: 50)
            ])
        view.addSubview(resetButton)
        NSLayoutConstraint.activate([
            resetButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
            resetButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            resetButton.widthAnchor.constraint(equalToConstant: 50),
            resetButton.heightAnchor.constraint(equalToConstant: 50)
            ])
        view.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: cancelButton.bottomAnchor, constant: 5),
            stackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            stackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            stackView.heightAnchor.constraint(equalToConstant: 50)
            ])
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 10),
            collectionView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            collectionView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            collectionView.heightAnchor.constraint(equalToConstant: 200)
            ])
        view.addSubview(doneButton)
        NSLayoutConstraint.activate([
            doneButton.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 10),
            doneButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            doneButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            doneButton.heightAnchor.constraint(equalToConstant: 50)
            ])
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FilterCell", for: indexPath)
        cell.backgroundColor = .yellow
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width-35, height: 195)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    

}
