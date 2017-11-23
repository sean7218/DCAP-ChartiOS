//
//  FilterViewController.swift
//  DCAP
//
//  Created by Sean Zhang on 11/20/17.
//  Copyright © 2017 Sean Zhang. All rights reserved.
//

import UIKit

class FilterView: UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var delegate: FilterViewDelegate?
    
    @objc func closeFilterView(){
        delegate?.closeFilterView()
    }
    
    var menuSlideAnchor: NSLayoutConstraint?
    var menuWidth: CGFloat?
    let menuSlider: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var cancelButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("X", for: .normal)
        
        button.addTarget(self, action: #selector(closeFilterView), for: .touchUpInside)
        return button
    }()
    
    var resetButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("RESET", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        
        return button
    }()
    
    lazy var doneButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("DONE", for: .normal)
        button.tintColor = UIColor.black
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(closeFilterView), for: .touchUpInside)
        button.backgroundColor = UIColor.blue
        return button
    }()
    
    var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = .red
        cv.isPagingEnabled = true
        cv.showsHorizontalScrollIndicator = false
        return cv
    }()
    
    
    lazy var filterViewMenu: FilterViewMenu = {
        let sv = FilterViewMenu()
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        self.menuWidth = 100
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "FilterCell")
        filterViewMenu.delegate = self
        
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupViews(){
        

        addSubview(cancelButton)
        NSLayoutConstraint.activate([
            cancelButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            cancelButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            cancelButton.widthAnchor.constraint(equalToConstant: 50),
            cancelButton.heightAnchor.constraint(equalToConstant: 30)
            ])
        addSubview(resetButton)
        NSLayoutConstraint.activate([
            resetButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            resetButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
            resetButton.widthAnchor.constraint(equalToConstant: 50),
            resetButton.heightAnchor.constraint(equalToConstant: 30)
            ])
        addSubview(filterViewMenu)
        NSLayoutConstraint.activate([
            filterViewMenu.topAnchor.constraint(equalTo: cancelButton.bottomAnchor, constant: 5),
            filterViewMenu.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            filterViewMenu.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
            filterViewMenu.heightAnchor.constraint(equalToConstant: 50)
            ])
        addSubview(menuSlider)
        NSLayoutConstraint.activate([
            menuSlider.topAnchor.constraint(equalTo: filterViewMenu.bottomAnchor, constant: 1),
            menuSlider.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            menuSlider.widthAnchor.constraint(equalToConstant: menuWidth!),
            menuSlider.heightAnchor.constraint(equalToConstant: 3)
            ])
        addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: menuSlider.bottomAnchor, constant: 10),
            collectionView.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            collectionView.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
            collectionView.heightAnchor.constraint(equalToConstant: 200)
            ])
        addSubview(doneButton)
        NSLayoutConstraint.activate([
            doneButton.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 10),
            doneButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            doneButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
            doneButton.heightAnchor.constraint(equalToConstant: 50)
            ])
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FilterCell", for: indexPath)
        cell.backgroundColor = indexPath.item % 2 == 0 ? .red : .green
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: frame.width-40, height: 200)
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func scrollToMenu(Atindex index: Int) {
            collectionView.selectItem(at: IndexPath.init(item: index, section: 0), animated: true, scrollPosition: UICollectionViewScrollPosition.centeredHorizontally)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let x = scrollView.contentOffset.x
        
        
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let x = targetContentOffset.pointee.x
        let indexItem = Int(x/(frame.width-40))
        //print(x, frame.width-40, x/(frame.width-40))
        filterViewMenu.collectionView.selectItem(at: IndexPath.init(item: indexItem, section: 0), animated: true, scrollPosition: .centeredHorizontally)
       // let indx = Int(x/(frame.width-40))
        
        //print(indx)
    }

}

extension FilterView: FilterViewMenuDelegate {
    func buttonClicked(indx: Int) {
        print("The Menu Button has clicked \(indx)")
        let indexPath = IndexPath(item: indx, section: 0)
        self.collectionView.scrollToItem(at: indexPath, at: UICollectionViewScrollPosition.centeredHorizontally, animated: true)
    }
    
    
}
