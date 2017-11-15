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
    
    var delegate: PopViewControllerDelegate?
    
    override func viewDidLoad() {
        view.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        view.backgroundColor = UIColor.init(red: 120/255, green: 125/255, blue: 111/255, alpha: 0.6)
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
