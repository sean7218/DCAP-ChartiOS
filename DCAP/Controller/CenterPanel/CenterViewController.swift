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
    
    var delegate: CenterViewControllerDelegate?
    
    
    override func viewDidLoad() {
        setupViews()
    }
    
    func setupViews(){
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
    }
    // MARK: Button actions
    
    @objc func menuTapped() {
        print("MenuTapped")
        delegate?.toggleLeftPanel?()
    }
    
    @objc func popTapped() {
        let popViewController = PopViewController()
        self.present(popViewController, animated: true, completion: nil)
        //self.navigationController?.pushViewController(popViewController, animated: true)
    }
    
}

extension CenterViewController: PopViewControllerDelegate {
    func didSelect(_ opt: String) {
        print("opt")
  
    }
}
extension CenterViewController: SidePanelViewControllerDelegate {
    
    func didSelect(_ page: Page) {
        print("Selecting the page already")
        delegate?.collapseSidePanels?()
    }
}
