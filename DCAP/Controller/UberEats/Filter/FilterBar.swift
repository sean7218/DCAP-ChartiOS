//
//  FilterBar.swift
//  DCAP
//
//  Created by Sean Zhang on 11/21/17.
//  Copyright © 2017 Sean Zhang. All rights reserved.
//

import UIKit

class FilterButton: UIButton {
    
    let customeImageView: UIImageView = {
        let iv = UIImageView(image: nil)
        iv.backgroundColor = .white
        iv.contentMode = .scaleAspectFit
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews(){
        addSubview(customeImageView)
        NSLayoutConstraint.activate([
            customeImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 5),
            customeImageView.topAnchor.constraint(equalTo: topAnchor),
            customeImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            customeImageView.widthAnchor.constraint(equalToConstant: 40)
            ])
    }
}
