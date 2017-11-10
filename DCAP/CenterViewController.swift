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
    
    @IBOutlet weak private var imageView: UIImageView!
    @IBOutlet weak private var titleLabel: UILabel!
    @IBOutlet weak private var creatorLabel: UILabel!
    
    var delegate: CenterViewControllerDelegate?
    
    // MARK: Button actions
    
    @IBAction func kittiesTapped(_ sender: Any) {
        delegate?.toggleLeftPanel?()
    }
    
    @IBAction func puppiesTapped(_ sender: Any) {
        delegate?.toggleRightPanel?()
    }
}

extension CenterViewController: SidePanelViewControllerDelegate {
    
    func didSelectAnimal(_ animal: Animal) {
        imageView.image = animal.image
        titleLabel.text = animal.title
        creatorLabel.text = animal.creator
        
        delegate?.collapseSidePanels?()
    }
}
