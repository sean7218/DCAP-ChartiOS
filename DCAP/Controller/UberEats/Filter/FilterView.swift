//
//  FilterViewController.swift
//  DCAP
//
//  Created by Sean Zhang on 11/20/17.
//  Copyright © 2017 Sean Zhang. All rights reserved.
//

import UIKit

class FilterView: UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var delegate: FilterViewDelegate?
    
    @objc func closeFilterView(){
        delegate?.closeFilterView()
    }
    
    lazy var cancelButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("X", for: .normal)
        
        button.addTarget(self, action: #selector(closeFilterView), for: .touchUpInside)
        return button
    }()
    
    var resetButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("RESET", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        
        return button
    }()
    
    lazy var sortButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Sort", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        
        button.addTarget(self, action: #selector(swipeToSection(_:)), for: .touchUpInside)
        return button
    }()
    lazy var priceButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Price", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        button.addTarget(self, action: #selector(swipeToSection(_:)), for: .touchUpInside)
        
        return button
    }()
    lazy var dietaryButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Dietary", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        button.addTarget(self, action: #selector(swipeToSection(_:)), for: .touchUpInside)
        return button
    }()
    
    lazy var doneButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("DONE", for: .normal)
        button.tintColor = UIColor.black
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(closeFilterView), for: .touchUpInside)
        button.backgroundColor = UIColor.blue
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
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "FilterCell")
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupViews(){
        

        addSubview(cancelButton)
        NSLayoutConstraint.activate([
            cancelButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            cancelButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            cancelButton.widthAnchor.constraint(equalToConstant: 50),
            cancelButton.heightAnchor.constraint(equalToConstant: 30)
            ])
        addSubview(resetButton)
        NSLayoutConstraint.activate([
            resetButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            resetButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
            resetButton.widthAnchor.constraint(equalToConstant: 50),
            resetButton.heightAnchor.constraint(equalToConstant: 30)
            ])
        addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: cancelButton.bottomAnchor, constant: 5),
            stackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            stackView.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
            stackView.heightAnchor.constraint(equalToConstant: 50)
            ])
        addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 10),
            collectionView.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            collectionView.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
            collectionView.heightAnchor.constraint(equalToConstant: 200)
            ])
        addSubview(doneButton)
        NSLayoutConstraint.activate([
            doneButton.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 10),
            doneButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            doneButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
            doneButton.heightAnchor.constraint(equalToConstant: 50)
            ])
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FilterCell", for: indexPath)
        cell.backgroundColor = indexPath.item % 2 == 0 ? .red : .green
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: frame.width-40, height: 200)
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let x = targetContentOffset.pointee.x
        print(x, frame.width-40, x/(frame.width-40))
        
        let indx = Int(x/(frame.width-40))
        
        print(indx)
        
        switch indx {
        case 0:
            sortButton.isHighlighted = true
            priceButton.isHighlighted = false
            dietaryButton.isHighlighted = false
        case 1:
            sortButton.isHighlighted = false
            priceButton.isHighlighted = true
            dietaryButton.isHighlighted = false
        case 2:
            sortButton.isHighlighted = false
            priceButton.isHighlighted = false
            dietaryButton.isHighlighted = true
        default:
            sortButton.isHighlighted = false
            priceButton.isHighlighted = false
            dietaryButton.isHighlighted = false
        }
        
    }
    
    @objc func swipeToSection(_ sender: Any) {
        let button = sender as! UIButton
        let name = button.titleLabel?.text
        var ind: Int
        switch name! {
        case "Sort":
            ind = 0
        case "Price":
            ind = 1
        case "Dietary":
            ind = 2
        default:
            ind = 1
        }
        let indexPath = IndexPath(item: ind, section: 0)
        collectionView.scrollToItem(at: indexPath, at: UICollectionViewScrollPosition.centeredHorizontally, animated: true)
    }

}
