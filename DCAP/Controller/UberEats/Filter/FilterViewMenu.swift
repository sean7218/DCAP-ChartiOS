//
//  FilterViewMenuBar.swift
//  DCAP
//
//  Created by Sean Zhang on 11/22/17.
//  Copyright © 2017 Sean Zhang. All rights reserved.
//

import UIKit

class FilterViewMenuCell: UICollectionViewCell {
    
    lazy var menuLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 13)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    override var isHighlighted: Bool {
        didSet {
            menuLabel.textColor = isHighlighted ? UIColor.red : UIColor.black
        }
    }
    
    override var isSelected: Bool {
        didSet {
            menuLabel.textColor = isSelected ? UIColor.red : UIColor.black
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupViews(){
        addSubview(menuLabel)
        NSLayoutConstraint.activate([
            menuLabel.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            menuLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            menuLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),
            menuLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
            ])
    }
    
}

class FilterViewMenu: UIView, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "FilterViewMenuCell", for: indexPath) as! FilterViewMenuCell
        let title = menuItems[indexPath.row]
        cell.backgroundColor = .white
        cell.menuLabel.text = title
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (frame.width/3), height: frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = .yellow
        cv.delegate = self
        cv.dataSource = self
        cv.register(FilterViewMenuCell.self, forCellWithReuseIdentifier: "FilterViewMenuCell")
        return cv
    }()

    var menuItems = ["Sort", "Price", "Dietary"]
    
    private func setupViews() {
        addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            collectionView.leftAnchor.constraint(equalTo: leftAnchor, constant: 0),
            collectionView.rightAnchor.constraint(equalTo: rightAnchor, constant: 0),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
            ])
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        collectionView.selectItem(at: IndexPath.init(item: 0, section: 0), animated: true, scrollPosition: .centeredHorizontally)
        setupViews()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var delegate: FilterViewMenuDelegate?
    @objc func swipeToSection(_ sender: Any) {
        let button = sender as! UIButton
        let name = button.titleLabel?.text
        var index: Int
        switch name! {
        case "Sort":
            index = 0
        case "Price":
            index = 1
        case "Dietary":
            index = 2
        default:
            index = 1
        }
        delegate?.buttonClicked(indx: index)
    }
    
}


