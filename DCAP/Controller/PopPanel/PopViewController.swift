//
//  PopViewController.swift
//  DCAP
//
//  Created by Sean Zhang on 11/13/17.
//  Copyright © 2017 Sean Zhang. All rights reserved.
//

import UIKit

class PopViewController: UIViewController {
    

    var firstOptionButton: UIButton = {
        let button = UIButton(type: UIButtonType.system)
        button.setTitle("Option 1", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.frame = CGRect(x: 50, y: 200, width: 300, height: 100)
        return button
    }()
    
    var containerView: UIView = {
        let view = UIView(frame: CGRect.zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .red
        
        return view
    }()
    
    var delegate: PopViewControllerDelegate?
    
    override func viewDidLoad() {
        
        view.backgroundColor = .clear
        
        view.addSubview(containerView)
        containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        containerView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        containerView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        view.addSubview(firstOptionButton)
        firstOptionButton.addTarget(self, action: #selector(selectOption), for: .touchUpInside)
        firstOptionButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        firstOptionButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        firstOptionButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        firstOptionButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    @objc func selectOption(){
        print("seletOption[PopViewController]")

        delegate?.didSelect!("option one selected")
        dismiss(animated: true, completion: nil)
    }
    
}
