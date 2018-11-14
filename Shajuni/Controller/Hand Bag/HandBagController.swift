//
//  HandBagController.swift
//  Shajuni
//
//  Created by SOUMEN GHOSH on 24/2/18.
//  Copyright © 2018 Sg106. All rights reserved.
//

import UIKit

class HandBagController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    private let featuredHandBagCellID = "featuredHandBagCellID"
    private let itemHandBagCellID = "itemHandBagCellID"
    
    var items = [Items]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNav()
        setupItems()
    }
    
    func setupItems() {
        let item1 = Items(image: #imageLiteral(resourceName: "bag1"), title: "Dolce & Gabana", shortMsg: "Small Lucia Bag", price: "$2640")
        let item2 = Items(image: #imageLiteral(resourceName: "bag2"), title: "DoDUA", shortMsg: "Simple Lady Bag", price: "$1765")
        let item3 = Items(image: #imageLiteral(resourceName: "bag3"), title: "J.W. Anderson", shortMsg: "Medium Leather Shoulder Bag", price: "$1095")
        let item4 = Items(image: #imageLiteral(resourceName: "bag4"), title: "Marc Jacobs", shortMsg: "Smalled Nomad Satchel", price: "$2499")
        
        items = [item1, item2, item3, item4]
    }
    
    func setupNav() {
        collectionView?.backgroundColor = UIColor(displayP3Red: 239/255, green: 79/255, blue: 117/255, alpha: 1)
        
        // title
        navigationItem.titleView = UIImageView.init(image: UIImage(named: "logo"))
    }
    
    func setupA() {
        collectionView?.register(FeaturedHandBagCell.self, forCellWithReuseIdentifier: featuredHandBagCellID)
    }
    
    func setupB() {
        collectionView?.register(ItemHandBagCell.self, forCellWithReuseIdentifier: itemHandBagCellID)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item == 0 {
            setupA()
            let cellA = collectionView.dequeueReusableCell(withReuseIdentifier: featuredHandBagCellID, for: indexPath) as! FeaturedHandBagCell
            return cellA
        } else {
            setupB()
            let cellB = collectionView.dequeueReusableCell(withReuseIdentifier: itemHandBagCellID, for: indexPath) as! ItemHandBagCell
            cellB.backgroundColor = .white
            cellB.item = items[indexPath.item - 1]
            return cellB
        }
        
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.item == 0 {
            return CGSize(width: view.frame.width, height: 300)
        } else {
            return CGSize(width: (view.frame.width * 0.5) - 2.5, height: 330)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 0, bottom: 5, right: 0)
    }

    
}
