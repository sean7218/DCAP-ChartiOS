//
//  HomeViewController.swift
//  DCAP
//
//  Created by Sean Zhang on 11/19/17.
//  Copyright © 2017 Sean Zhang. All rights reserved.
//

import UIKit

class UHomeViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var lineView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var filterBar: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        let button = FilterButton(type: .system)
        button.tintColor = UIColor.lightGray
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Sort Restaurants", for: .normal)
        button.addTarget(self, action: #selector(showFilterView), for: .touchUpInside)
        view.addSubview(button)
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
            button.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0),
            button.heightAnchor.constraint(equalToConstant: 30)
            ])
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.5
        view.layer.shadowOffset = CGSize.zero
        view.layer.shadowRadius = 2
        view.layer.shouldRasterize = true
        return view
    }()
    
    var filterViewController: FilterViewController?
    @objc func showFilterView(){
        filterViewController = FilterViewController()
        present(filterViewController!, animated: true, completion: nil)
    }
    var addressButtonView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        let button = UIButton(type: .system)
        button.setTitle("101 Pakway >", for: .normal)
        button.tintColor = UIColor.black
        //button.frame = CGRect(x: 0, y: 0, width: 100, height: 30)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(button)
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: view.topAnchor),
            button.leftAnchor.constraint(equalTo: view.leftAnchor),
            button.rightAnchor.constraint(equalTo: view.rightAnchor),
            button.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
        return view
    }()
    
    let screen = UIScreen.main.bounds
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        collectionView?.backgroundColor = .lightGray
        collectionView?.frame = CGRect(x: 0, y: 120, width: view.frame.width, height: view.frame.height-122)
        self.navigationController?.isNavigationBarHidden = false
        collectionView?.register(UHomeViewCell.self, forCellWithReuseIdentifier: "SectionOneCell")
        collectionView?.register(USectionTwoCell.self, forCellWithReuseIdentifier: "SectionTwoCell")
        setupViews()
    }

    fileprivate func setupViews(){
        
        let navBarHeight = (self.navigationController?.navigationBar.frame.height)! + 44
        self.navigationController!.navigationBar.prefersLargeTitles = false
        
        //self.navigationItem.setRightBarButton(UIBarButtonItem.init(customView: addressButton), animated: true)
       
        self.navigationController?.navigationItem.titleView = addressButtonView
//        self.navigationItem.titleView?.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-1-[v0]-1-|",
//                                                                                     options: NSLayoutFormatOptions(),
//                                                                                     metrics: nil, views: ["v0": addressButton]))
//        self.navigationItem.titleView?.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-1-[v0]-1-|",
//                                                                                     options: NSLayoutFormatOptions(),
//                                                                                     metrics: nil, views: ["v0": addressButton]))
        view.addSubview(lineView)
        NSLayoutConstraint.activate([
            lineView.topAnchor.constraint(equalTo: view.topAnchor, constant: navBarHeight),
            lineView.leftAnchor.constraint(equalTo: view.leftAnchor),
            lineView.rightAnchor.constraint(equalTo: view.rightAnchor),
            lineView.heightAnchor.constraint(equalToConstant: 1)
            ])

        view.addSubview(filterBar)
        NSLayoutConstraint.activate([
            filterBar.topAnchor.constraint(equalTo: view.topAnchor, constant: navBarHeight+1),
            filterBar.leftAnchor.constraint(equalTo: view.leftAnchor),
            filterBar.rightAnchor.constraint(equalTo: view.rightAnchor),
            filterBar.heightAnchor.constraint(equalToConstant: 40)
            ])
        
        
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        return 10
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print(indexPath.section)
        if (indexPath.section == 0) {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SectionOneCell", for: indexPath)
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SectionTwoCell", for: indexPath)
            return cell
        }

    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: screen.width, height: 300)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let edge = UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
        return edge
    }
    
}

class FilterButton: UIButton {
    
    let customeImageView: UIImageView = {
        let iv = UIImageView(image: nil)
        iv.backgroundColor = .white
        iv.contentMode = .scaleAspectFit
        iv.translatesAutoresizingMaskIntoConstraints = false
       return iv
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews(){
        addSubview(customeImageView)
        NSLayoutConstraint.activate([
            customeImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 5),
            customeImageView.topAnchor.constraint(equalTo: topAnchor),
            customeImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            customeImageView.widthAnchor.constraint(equalToConstant: 40)
            ])
    }
}


