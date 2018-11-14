//
//  ShoesController.swift
//  Shajuni
//
//  Created by SOUMEN GHOSH on 1/3/18.
//  Copyright © 2018 Sg106. All rights reserved.
//

import UIKit

class CategoryDetailViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
 
    private let itemShoeCellID = "itemShoeCellID"
    
    var items = [Items]()
    
    func setupNav() {
        collectionView?.backgroundColor = UIColor(displayP3Red: 239/255, green: 79/255, blue: 117/255, alpha: 1)
        collectionView?.backgroundColor?.withAlphaComponent(0.75)
        // title
        navigationItem.titleView = UIImageView.init(image: UIImage(named: "logo"))
        
    }
    func setupItems() {
        let item1 = Items(image: #imageLiteral(resourceName: "shoe1"), title: "H & M", shortMsg: "Sequined Shoe", price: "$2699")
        let item2 = Items(image: #imageLiteral(resourceName: "shoe2"), title: "Givency", shortMsg: "Beaded mesh Shoe", price: "$16999")
        let item3 = Items(image: #imageLiteral(resourceName: "shoe3"), title: "Max Azria", shortMsg: "Long Shoe", price: "$12199")
        let item4 = Items(image: #imageLiteral(resourceName: "shoe4"), title: "H & M", shortMsg: "Wrap Shoe", price: "$2999")
        let item5 = Items(image: #imageLiteral(resourceName: "shoe5"), title: "American Eagle", shortMsg: "Lovely Shoe", price: "$3499")

        
        items = [item1, item2, item3, item4, item5]
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNav()
        setupItems()
        
        self.navigationController?.navigationBar.tintColor = UIColor(displayP3Red: 239/255, green: 79/255, blue: 117/255, alpha: 1)
    }
    
    
    func setupB() {
        collectionView?.register(ItemShoeCell.self, forCellWithReuseIdentifier: itemShoeCellID)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
            setupB()
            let cellB = collectionView.dequeueReusableCell(withReuseIdentifier: itemShoeCellID, for: indexPath) as! ItemShoeCell
            cellB.backgroundColor = .white
            cellB.item = items[indexPath.item ]
            return cellB

        
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
     
        return CGSize(width: (view.frame.width * 0.5) - 2.5, height: 300)
        
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
