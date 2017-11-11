//
//  PageCell.swift
//  DCAP
//
//  Created by Sean Zhang on 11/11/17.
//  Copyright © 2017 Sean Zhang. All rights reserved.
//

import UIKit


class PageCell: UITableViewCell {
    
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
