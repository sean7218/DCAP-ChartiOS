//
//  PopViewControllerDelegate.swift
//  DCAP
//
//  Created by Sean Zhang on 11/13/17.
//  Copyright © 2017 Sean Zhang. All rights reserved.
//

import UIKit

@objc
protocol PopViewControllerDelegate {
    @objc optional func didSelect(_ opt: String)

}
