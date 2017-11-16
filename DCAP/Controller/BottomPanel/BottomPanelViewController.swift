//
//  BottomPanelViewController.swift
//  DCAP
//
//  Created by Sean Zhang on 11/15/17.
//  Copyright © 2017 Sean Zhang. All rights reserved.
//

import UIKit


class BottomPanelViewController: UIViewController {
    
    var bottomView: UIView = {
        let view = BottomPanelView()
        return view
    }()
    
    var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50)
        view.backgroundColor = .red
        return view
    }()
    
    override func viewDidLoad() {
        setupViews()
    }
    func setupViews() {
        //
        view.addSubview(containerView)
        containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        containerView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        containerView.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        containerView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        view.addSubview(bottomView)
        bottomView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        bottomView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        bottomView.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        bottomView.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
}
