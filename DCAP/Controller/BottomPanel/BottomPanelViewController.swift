//
//  BottomPanelViewController.swift
//  DCAP
//
//  Created by Sean Zhang on 11/15/17.
//  Copyright © 2017 Sean Zhang. All rights reserved.
//

import UIKit


class BottomPanelViewController: UIViewController {
    
    var height:CGFloat = 50
    
    var bottomView: UIView = {
        let view = BottomPanelView(frame: CGRect.zero)
        view.backgroundColor = .blue
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    deinit {
        print("------------------------I am deinit now")
    }
    override func viewDidLoad() {
        setupViews()
    }
    func setupViews() {
        
        view.addSubview(bottomView)
        bottomView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        bottomView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        bottomView.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        bottomView.heightAnchor.constraint(equalToConstant: height).isActive = true
    }
}
