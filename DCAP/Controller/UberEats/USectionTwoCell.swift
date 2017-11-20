//
//  URestaurantCell.swift
//  DCAP
//
//  Created by Sean Zhang on 11/19/17.
//  Copyright © 2017 Sean Zhang. All rights reserved.
//

import UIKit

class USectionTwoCell: UICollectionViewCell {
    
    let imageView: UIImageView = {
        let iv = UIImageView(frame: CGRect.zero)
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.backgroundColor = .red
        return iv
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Tennesse Taco Company (Perkins)"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .red
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupViews(){
        addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            imageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 5),
            imageView.rightAnchor.constraint(equalTo: rightAnchor, constant: -5),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -30)
            ])
        addSubview(nameLabel)
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 5),
            nameLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 5),
            nameLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -5),
            nameLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5)
            ])
    }
}
