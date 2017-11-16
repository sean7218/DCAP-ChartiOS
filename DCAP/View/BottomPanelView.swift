//
//  BottomPanelView.swift
//  DCAP
//
//  Created by Sean Zhang on 11/15/17.
//  Copyright © 2017 Sean Zhang. All rights reserved.
//

import Foundation
import UIKit

class BottomPanelView: UIView {
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "$4.21"
        label.backgroundColor = .green
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var expandButton: UIButton = {
        let button = UIButton(type: UIButtonType.system)
        button.setTitle("expand", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .red
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(titleLabel)
        let vert = NSLayoutConstraint.constraints(withVisualFormat: "H:|-[v0]-|", options: [], metrics: nil, views: ["v0": titleLabel])
        let hori = NSLayoutConstraint.constraints(withVisualFormat: "V:|-[v0]-|", options: [], metrics: nil, views: ["v0" : titleLabel])
        NSLayoutConstraint.activate([vert, hori])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

