//
//  ViewController.swift
//  DCAP
//
//  Created by Sean Zhang on 11/2/17.
//  Copyright © 2017 Sean Zhang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var menuButton: UIButton = {
        let button = UIButton(type: UIButtonType.system)
        button.setTitle("Menu", for: .normal)
        button.addTarget(self, action: #selector(gotoHome), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var menu: MenuViewController = {
        let vc = MenuViewController()
        return vc
    }()
    
    var home: HomeViewController = {
        let flow = UICollectionViewFlowLayout()
        let vc = HomeViewController(collectionViewLayout: flow)
        return vc
    }()
    
    @objc func gotoHome(){
        self.navigationController?.pushViewController(home, animated: true)
        self.navigationController?.pushViewController(menu, animated: true)
        self.navigationController?.view.frame.origin.x = 60.3
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.view.addSubview(menuButton)
        menuButton.topAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        menuButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        menuButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        menuButton.widthAnchor.constraint(equalToConstant: 150).isActive = true
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    


}

