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
    override func viewDidLoad() {
        
        collectionView?.register(FoodTile.self, forCellWithReuseIdentifier: "Tile")
        collectionView?.register(HeaderTile.self,
                                 forSupplementaryViewOfKind: UICollectionElementKindSectionHeader,
                                 withReuseIdentifier: "Header")
        collectionView?.backgroundColor = .white
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
        return CGSize(width: (view.frame.width/2 - 10), height: (view.frame.width/2 - 10))
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
        let imageView = UIImageView(image: #imageLiteral(resourceName: "food_bowl"))
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


