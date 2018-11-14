//
//  FeaturedOuterCell.swift
//  Shajuni
//
//  Created by SOUMEN GHOSH on 25/2/18.
//  Copyright © 2018 Sg106. All rights reserved.
//

import UIKit

class FeaturedOuterCell: UICollectionViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    
    private let cellID = "cellID"
    var imagesArray = [Home]()
    
    
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
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupHomeItem()
        setup()
    }
    
    
    func setupHomeItem() {
        let home1 = Home(imageView: #imageLiteral(resourceName: "outF1"))
        let home2 = Home(imageView: #imageLiteral(resourceName: "outF2"))
        let home4 = Home(imageView: #imageLiteral(resourceName: "outf4"))
        let home5 = Home(imageView: #imageLiteral(resourceName: "outf5"))
        let home6 = Home(imageView: #imageLiteral(resourceName: "outf6"))
        
        imagesArray = [home1, home2, home4, home5, home6]
    }
    
    
    
    func setup() {
        featuredCollectionView.backgroundColor = .white
        featuredCollectionView.register(OuterCell.self,  forCellWithReuseIdentifier: cellID)
        
        featuredCollectionView.delegate = self
        featuredCollectionView.dataSource = self
        
        addSubview(featuredCollectionView)
        featuredCollectionView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingRight: 0, paddingBottom: 0, width: 0, height: 0)
        self.featuredCollectionView.startScrolling()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imagesArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = featuredCollectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! OuterCell
        cell.home = imagesArray[indexPath.item]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width, height: frame.height)
    }
    
}


class OuterCell: UICollectionViewCell {
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




















