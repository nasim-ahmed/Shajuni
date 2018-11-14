//
//  HomeCell.swift
//  Shajuni
//
//  Created by SOUMEN GHOSH on 23/2/18.
//  Copyright © 2018 Sg106. All rights reserved.
//

import UIKit

class HomeCell: UICollectionViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    private let cellID = "cellID"
    
    var imagesArray = [Home]()
    
    lazy var pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.pageIndicatorTintColor = .lightGray
        pc.currentPageIndicatorTintColor = UIColor(red:0.94, green:0.31, blue:0.46, alpha:1.0)
        pc.numberOfPages = self.imagesArray.count
        pc.addTarget(self, action: #selector(pageControlChanged), for: .valueChanged)
        return pc
    }()
    
    
    
    
    @objc func pageControlChanged(){
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        endEditing(true)
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        let pageNumber = Int(targetContentOffset.pointee.x / frame.width)
        pageControl.currentPage = pageNumber
    
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupHomeItem()
        setup()
    }
    
    
    
    let featuredCollectionView: AutoScrollingCollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = AutoScrollingCollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.scrollInterval = 2
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        cv.backgroundColor = .red
        return cv
    }()
    
   
    
    func setupHomeItem() {
        let home1 = Home(imageView: #imageLiteral(resourceName: "hot1"))
        let home2 = Home(imageView: #imageLiteral(resourceName: "hot2"))
        let home3 = Home(imageView: #imageLiteral(resourceName: "hot3"))
        let home4 = Home(imageView: #imageLiteral(resourceName: "hot4"))
        let home5 = Home(imageView: #imageLiteral(resourceName: "hot5"))
        let home6 = Home(imageView: #imageLiteral(resourceName: "hot6"))
        
        imagesArray = [home1, home2, home3, home4, home5, home6]
    }
    
    func setup() {
        featuredCollectionView.backgroundColor = .white
        featuredCollectionView.register(ItemCell.self,  forCellWithReuseIdentifier: cellID)
        
        featuredCollectionView.delegate = self
        featuredCollectionView.dataSource = self
        
        addSubview(featuredCollectionView)
        featuredCollectionView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingRight: 0, paddingBottom: 0, width: 0, height: 0)
        self.featuredCollectionView.startScrolling()
        
        
        featuredCollectionView.addSubview(pageControl)
        pageControl.anchor(top: nil, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingRight: 0, paddingBottom: 0, width: 0, height: 40)
    }

    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imagesArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = featuredCollectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! ItemCell
        cell.home = imagesArray[indexPath.item]
        
        
        return cell
    }
    
    
   
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width, height: frame.height)
    }
}



class ItemCell: UICollectionViewCell {
    
    var home: Home? {
        didSet {
            self.imageView.image = home?.imageView
        }
    }
    
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.layer.masksToBounds = true
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    func setup() {
        addSubview(imageView)
        imageView.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}








