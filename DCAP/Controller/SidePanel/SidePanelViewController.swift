//
//  SidePanelViewController.swift
//  DCAP
//
//  Created by Sean Zhang on 11/9/17.
//  Copyright © 2017 Sean Zhang. All rights reserved.
//
import UIKit
import Foundation

class SidePanelViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    lazy var tableView: UITableView = {
        let tv = UITableView(frame: UIScreen.main.bounds, style: UITableViewStyle.plain)
        tv.backgroundColor = .white
        tv.delegate = self
        tv.dataSource = self
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.register(PageCell.self, forCellReuseIdentifier: CellIdentifiers.PageCell)
        return tv
    }()
    
    var delegate: SidePanelViewControllerDelegate?
    
    var pages: Array<Page>!
    
    enum CellIdentifiers {
        static let PageCell = "PageCell"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        pages = Page.allPages()
        tableView.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pages.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.PageCell, for: indexPath) as! PageCell
        cell.configureForPage(pages[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let page = pages[indexPath.row]
        delegate?.didSelect(page)
    }
    
    
}







