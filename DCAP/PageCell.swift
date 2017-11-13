//
//  PageCell.swift
//  DCAP
//
//  Created by Sean Zhang on 11/11/17.
//  Copyright © 2017 Sean Zhang. All rights reserved.
//

import UIKit


class PageCell: UITableViewCell {
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews(){
        addSubview(pageNameLabel)
        pageNameLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        pageNameLabel.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        pageNameLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        pageNameLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        addSubview(pageImageView)
        pageNameLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        pageNameLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        pageNameLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        pageNameLabel.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    var pageImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    var pageNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Option 1"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    func configureForPage(_ page: Page) {
        pageImageView.image = page.image
        pageNameLabel.text = page.title
    }
    
}
