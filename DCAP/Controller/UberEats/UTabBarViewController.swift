//
//  UTabBarViewController.swift
//  DCAP
//
//  Created by Sean Zhang on 11/19/17.
//  Copyright © 2017 Sean Zhang. All rights reserved.
//

import UIKit

class UTabBarViewController: UITabBarController {
    
    lazy var homeNavController: UINavigationController = {
        let nav = UINavigationController(rootViewController: self.homeViewController)
        return nav
    }()
    
    lazy var homeViewController: UHomeViewController = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let vc = UHomeViewController(collectionViewLayout: layout)
        vc.tabBarItem = UITabBarItem(tabBarSystemItem: UITabBarSystemItem.contacts, tag: 1)
        return vc
    }()
    
    let searchViewController: USearchViewController = {
        let vc = USearchViewController()
        vc.tabBarItem = UITabBarItem(tabBarSystemItem: UITabBarSystemItem.downloads, tag: 2)
        return vc
    }()
    
    lazy var orderViewController: UOrderViewController = {
        let vc = UOrderViewController()
        vc.tabBarItem = UITabBarItem(tabBarSystemItem: UITabBarSystemItem.favorites, tag: 3)
        return vc
    }()
    let userViewController: UUserViewController = {
        let vc = UUserViewController()
        vc.tabBarItem = UITabBarItem(tabBarSystemItem: UITabBarSystemItem.history, tag: 4)
        return vc
    }()
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        
        self.setViewControllers([homeNavController,
                                 searchViewController,
                                 orderViewController,
                                 userViewController], animated: true)
        
    }
    
    fileprivate func setupViewControllers(){
    
    }
}
