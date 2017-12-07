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
    
    lazy var leftButton: UIButton = {
        let button = UIButton(type: .system)
        button.frame = CGRect(x: 0, y: 0, width: 50, height: 150)
        button.setTitle( "Menu", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var popButton: UIButton = {
        let button = UIButton(type: .system)
        button.frame = CGRect(x: 0, y: 0, width: 50, height: 150)
        button.setTitle( "Pop", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var bottomButton: UIButton = {
        let button = UIButton(type: .system)
        button.frame = CGRect(x: 0, y: 0, width: 50, height: 150)
        button.setTitle( "Bottom", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var rightBarButtonItem: UIBarButtonItem = {
        let button = UIBarButtonItem(title: "Pop", style: UIBarButtonItemStyle.done, target: #selector(popTapped), action: nil)
        return button
    }()
    
    var delegate: CenterViewControllerDelegate?
    
    
    override func viewDidLoad() {
        setupViews()
    }
    
    func setupViews(){
        
        self.navigationItem.rightBarButtonItem = rightBarButtonItem
        
        
        view.addSubview(leftButton)
        leftButton.addTarget(self, action: #selector(menuTapped), for: .touchUpInside)
        leftButton.topAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        leftButton.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        leftButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        leftButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        view.addSubview(popButton)
        popButton.addTarget(self, action: #selector(popTapped), for: .touchUpInside)
        popButton.topAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        popButton.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        popButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        popButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        view.addSubview(bottomButton)

        bottomButton.topAnchor.constraint(equalTo: view.bottomAnchor, constant: -50).isActive = true
        bottomButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        bottomButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        bottomButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    // MARK: Button actions
    
    @objc func menuTapped() {
        print("MenuTapped")
        delegate?.toggleLeftPanel?()
    }
    
    var popViewController: PopViewController?
    
    @objc func popTapped() {
        print("pop tapped")
        popViewController = PopViewController()
        self.popViewController?.delegate = self
//        self.popViewController?.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
//        self.popViewController?.modalTransitionStyle = .crossDissolve
//        self.present(popViewController!, animated: true, completion: nil)
        
        self.popViewController?.modalPresentationStyle = .popover
        self.popViewController?.preferredContentSize = CGSize(width: 500, height: 600)
        self.popViewController?.popoverPresentationController?.sourceView = self.view
        self.popViewController?.popoverPresentationController?.sourceRect = CGRect(x: 300, y: 300, width: 50, height: 50)
        self.present(popViewController!, animated: true, completion: nil)
        
        
    }
    
    var isBottomPanelShown: Bool?

    

    
}

extension CenterViewController: PopViewControllerDelegate {
    func didSelect(_ opt: String) {
        print(opt)
  
    }
}
extension CenterViewController: SidePanelViewControllerDelegate {
    
    func didSelect(_ page: Page) {
        print("Selecting the page already")
        delegate?.collapseSidePanels?()
    }
}
