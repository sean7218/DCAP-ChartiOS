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
        
        view.addSubview(bottomButton)
        bottomButton.addTarget(self, action: #selector(bottomBannerTapped), for: .touchUpInside)
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
    
    @objc func popTapped() {
        let popViewController = PopViewController()
        popViewController.delegate = self
        self.present(popViewController, animated: true, completion: nil)
    }
    
    var isBottomPanelShown: Bool?
    var bottomPanelViewController: BottomPanelViewController?
    
    @objc func bottomBannerTapped(){
        if (bottomPanelViewController != nil) {
            isBottomPanelShown = true
        } else {
            isBottomPanelShown = false
        }
        if (!isBottomPanelShown!){
            bottomPanelViewController = BottomPanelViewController()
            let bottomBanner = bottomPanelViewController?.view
            self.view.addSubview(bottomBanner!)
            bottomBanner?.backgroundColor = .gray
            bottomBanner?.translatesAutoresizingMaskIntoConstraints = true
            
            let ypos:CGFloat = view.frame.height
            bottomBanner?.frame = CGRect(x: 0, y: ypos, width: self.view.frame.width, height: 50)
            UIView.animate(withDuration: 1, animations: {
                
                bottomBanner?.frame = CGRect(x: 0, y: ypos-80, width: self.view.frame.width, height: 50)
                
                
            }, completion: nil)
            isBottomPanelShown = true
        }
        
    }
    
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
