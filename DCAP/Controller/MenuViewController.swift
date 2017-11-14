//
//  MenuViewController.swift
//  DCAP
//
//  Created by Sean Zhang on 11/5/17.
//  Copyright © 2017 Sean Zhang. All rights reserved.
//

import Foundation
import UIKit

class MenuViewController: UITableViewController {
    
    let menuItems = ["Home", "About Us", "Menu", "Order Now"]
    
    
    override func viewDidLoad() {
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        setupViews()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = menuItems[indexPath.row]
        cell.backgroundColor = .white
        return cell
    }
    
    func setupViews() {
        
    }
}
