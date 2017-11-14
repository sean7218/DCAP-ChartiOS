//
//  Page.swift
//  DCAP
//
//  Created by Sean Zhang on 11/11/17.
//  Copyright © 2017 Sean Zhang. All rights reserved.
//

import UIKit

struct Page {
    let image: UIImage?
    let title: String?
    
    init(title: String, image: UIImage?) {
        self.title = title
        self.image = image
    }
    
    static func allPages() -> Array<Page> {
        return [
            Page(title: "Page 1", image: nil),
            Page(title: "Page 2", image: nil),
            Page(title: "Page 3", image: nil),
            Page(title: "Page 4", image: nil),
            Page(title: "Page 5", image: nil)
            
        ]
    }
}
