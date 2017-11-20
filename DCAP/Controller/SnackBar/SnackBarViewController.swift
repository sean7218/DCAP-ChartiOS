//
//  BottomPanelViewController.swift
//  DCAP
//
//  Created by Sean Zhang on 11/15/17.
//  Copyright © 2017 Sean Zhang. All rights reserved.
//

import UIKit


class SnackBarViewController: UIViewController {
    
    var height:CGFloat = 50
    
    var barView: UIView = {
        let view = SnackBarView(frame: CGRect.zero)
        view.backgroundColor = .blue
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        setupViews()
    }
    func setupViews() {
        
        view.addSubview(barView)
        barView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        barView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        barView.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        barView.heightAnchor.constraint(equalToConstant: height).isActive = true
    }
}
