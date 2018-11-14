//
//  OuterWearsController.swift
//  Shajuni
//
//  Created by SOUMEN GHOSH on 24/2/18.
//  Copyright © 2018 Sg106. All rights reserved.
//

import UIKit

class OuterWearsController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    
    private let featuredOuterCellID = "featuredOuterCellID"
    private let itemsOuterCellID = "itemsOuterCellID"
    
    var items = [Items]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNav()
        setupItems()
    }
    
    func setupNav() {
        collectionView?.backgroundColor = UIColor(displayP3Red: 239/255, green: 79/255, blue: 117/255, alpha: 1)
        
        // title
        navigationItem.titleView = UIImageView.init(image: UIImage(named: "logo"))
    }
    func setupItems() {
        let item1 = Items(image: #imageLiteral(resourceName: "out1"), title: "H & M", shortMsg: "Sequined dress", price: "$2699")
        let item2 = Items(image: #imageLiteral(resourceName: "out2"), title: "Givency", shortMsg: "Beaded mesh dress", price: "$16999")
        let item3 = Items(image: #imageLiteral(resourceName: "out3"), title: "Max Azria", shortMsg: "Long Dress", price: "$12199")
        let item4 = Items(image: #imageLiteral(resourceName: "out4"), title: "H & M", shortMsg: "Wrap dress", price: "$2999")
        let item5 = Items(image: #imageLiteral(resourceName: "out5"), title: "American Eagle", shortMsg: "Lovely Jacket", price: "$3499")
        let item6 = Items(image: #imageLiteral(resourceName: "out6"), title: "Skinny", shortMsg: "Tight fitting dress", price: "$10999")
        
        items = [item1, item2, item3, item4, item5, item6]
    }
    
    func setupA() {
        collectionView?.register(FeaturedOuterCell.self, forCellWithReuseIdentifier: featuredOuterCellID)
    }
    
    func setupB() {
        collectionView?.register(ItemOuterCell.self, forCellWithReuseIdentifier: itemsOuterCellID)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item == 0 {
            setupA()
            let cellA = collectionView.dequeueReusableCell(withReuseIdentifier: featuredOuterCellID, for: indexPath) as! FeaturedOuterCell
            
            return cellA
        } else {
            setupB()
            let cellB = collectionView.dequeueReusableCell(withReuseIdentifier: itemsOuterCellID, for: indexPath) as! ItemOuterCell
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




