//
//  CenterViewController.swift
//  DCAP
//
//  Created by Sean Zhang on 11/9/17.
//  Copyright © 2017 Sean Zhang. All rights reserved.
//

import UIKit

import UIKit

class CenterViewController: UIViewController {
    
    var leftButton: UIButton = {
        let button = UIButton(type: .system)
        button.frame = CGRect(x: 50, y: 50, width: 150, height: 150)
        button.setTitle( "Menu", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var delegate: CenterViewControllerDelegate?
    
    override func viewDidLoad() {
        setupViews()
    }
    
    func setupViews(){
        view.addSubview(leftButton)
        leftButton.addTarget(self, action: #selector(menuTapped), for: .touchUpInside)
        leftButton.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        leftButton.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        leftButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        leftButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    // MARK: Button actions
    
    @objc func menuTapped() {
        delegate?.toggleLeftPanel?()
    }
    
}

extension CenterViewController: SidePanelViewControllerDelegate {
    
    func didSelect(_ page: String) {

        delegate?.collapseSidePanels?()
    }
}
