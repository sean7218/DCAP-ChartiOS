//
//  RSSViewController.swift
//  DCAP
//
//  Created by Sean Zhang on 11/2/17.
//  Copyright © 2017 Sean Zhang. All rights reserved.
//

import Foundation
import UIKit

class HomeViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var menuButton: UIButton = {
        let button = UIButton(type: UIButtonType.system)
        button.setTitle("Menu", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc func slideMenuIn(){
        
    }
    
    func setupNavigationBar(){
       let navBar = self.navigationController?.navigationBar
        self.navigationController?.navigationBar.addSubview(menuButton)
    
        menuButton.addTarget(self, action: #selector(slideMenuIn), for: .touchUpInside)
        menuButton.rightAnchor.constraint(equalTo: (navBar?.rightAnchor)!, constant: -10).isActive = true
        menuButton.centerYAnchor.constraint(equalTo: (navBar?.centerYAnchor)!, constant: 0).isActive = true
        menuButton.widthAnchor.constraint(equalToConstant: 70).isActive = true
        menuButton.heightAnchor.constraint(equalToConstant: 70).isActive = true
    }
    override func viewDidLoad() {
        
        collectionView?.register(FoodTile.self, forCellWithReuseIdentifier: "Tile")
        collectionView?.register(HeaderTile.self,
                                 forSupplementaryViewOfKind: UICollectionElementKindSectionHeader,
                                 withReuseIdentifier: "Header")
        collectionView?.backgroundColor = .white
        setupNavigationBar()
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Tile", for: indexPath) as! FoodTile
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionElementKindSectionHeader {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "Header", for: indexPath)
            return header
        } else {
            let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "Footer", for: indexPath)
            return footer
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (view.frame.width), height: 100)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        print("Transitioning to another view")
    }
    
    
}

class HeaderTile: UICollectionViewCell {
    
    var avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.red
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupViews(){
        addSubview(avatarImageView)
        avatarImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        avatarImageView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        avatarImageView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        avatarImageView.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
    }
}
class FoodTile: UICollectionViewCell {
    
    var tileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .orange
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews(){
        
        addSubview(tileImageView)
        tileImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        tileImageView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        tileImageView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        tileImageView.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
    }
    
}


