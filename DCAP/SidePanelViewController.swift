//
//  SidePanelViewController.swift
//  DCAP
//
//  Created by Sean Zhang on 11/9/17.
//  Copyright © 2017 Sean Zhang. All rights reserved.
//
import UIKit
import Foundation

class SidePanelViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var delegate: SidePanelViewControllerDelegate?
    
    var animals: Array<Animal>!
    
    enum CellIdentifiers {
        static let AnimalCell = "AnimalCell"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.reloadData()
    }
}

// MARK: Table View Data Source

extension SidePanelViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.AnimalCell, for: indexPath) as! AnimalCell
        cell.configureForAnimal(animals[indexPath.row])
        return cell
    }
}

// Mark: Table View Delegate

extension SidePanelViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let animal = animals[indexPath.row]
        delegate?.didSelectAnimal(animal)
    }
}



protocol SidePanelViewControllerDelegate {
    func didSelectAnimal(_ animal: Animal)
}

