//
//  BottomPanelView.swift
//  DCAP
//
//  Created by Sean Zhang on 11/15/17.
//  Copyright © 2017 Sean Zhang. All rights reserved.
//

import Foundation
import UIKit

class SnackBarView: UIView {
    
    var shouldSetupConstraints = true
    
    override func updateConstraints() {
        if(shouldSetupConstraints){
            self.setupViews()
            shouldSetupConstraints = false
        }
        
        super.updateConstraints()
    }
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "VIEW CART"
        label.backgroundColor = .green
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var leftLabel: UILabel = {
        let label = UILabel()
        label.text = "$4.21"
        label.backgroundColor = .green
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var rightImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect.zero)
        imageView.backgroundColor = .red
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    var expandButton: UIButton = {
        let button = UIButton(type: UIButtonType.system)
        button.setTitle("", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.clear
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews(){
        addSubview(titleLabel)
        titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        titleLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        addSubview(leftLabel)
        leftLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        leftLabel.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        leftLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        leftLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        addSubview(rightImageView)
        rightImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        rightImageView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        rightImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        rightImageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        addSubview(expandButton)
        expandButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        expandButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        expandButton.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        expandButton.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
         
    }
    
    
}

