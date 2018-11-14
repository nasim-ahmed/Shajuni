//
//  HomeController.swift
//  Shajuni
//
//  Created by SOUMEN GHOSH on 23/2/18.
//  Copyright © 2018 Sg106. All rights reserved.
//

import UIKit
import Firebase

class HomeController: UICollectionViewController, UICollectionViewDelegateFlowLayout, CDRTranslucentSideBarDelegate, UITableViewDelegate, UITableViewDataSource {
    
    private let cellID = "cellID"
    private let cellId = "cellId"
    private let tableViewCelId = "tableCellId"
    

    var products = [Category]()
    var leftSideBar: CDRTranslucentSideBar?
    
    let tableView: UITableView = {
        let tv = UITableView()
        tv.backgroundColor = .white
        tv.alpha = 0.75
        return tv
    }()
    
    let profileImageView: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.layer.cornerRadius = 50
        iv.layer.masksToBounds = true
        return iv
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupProducts()
        setupNav()
        setupLeftSideBar()
        
    }
    
    
    
    func setupNav() {
        // title
        navigationItem.titleView = UIImageView.init(image: UIImage(named: "logo"))
        
//        collectionView?.backgroundColor = UIColor(displayP3Red: 239/255, green: 79/255, blue: 117/255, alpha: 1)
        collectionView?.backgroundColor = .white
        // left bar button
        let menu = #imageLiteral(resourceName: "menu icon").withRenderingMode(.alwaysOriginal)
        let leftBarBut = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.done, target: self, action: #selector(showLeftBar))
        leftBarBut.image = menu
        self.navigationItem.leftBarButtonItem = leftBarBut
        
        // background of navigation
//        navigationController?.navigationBar.barTintColor = UIColor(displayP3Red: 239/255, green: 79/255, blue: 117/255, alpha: 1)
        navigationController?.navigationBar.barTintColor = .white
    }
    
    func setupLeftSideBar() {
        leftSideBar = CDRTranslucentSideBar()
        leftSideBar?.delegate = self
        leftSideBar?.tag = 0
        leftSideBar?.sideBarWidth = view.frame.width * 0.6
        leftSideBar?.translucentAlpha = 0.75
        leftSideBar?.animationDuration = 0.5
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: tableViewCelId)
        tableView.delegate = self
        tableView.dataSource = self

        leftSideBar?.setContentViewIn(tableView)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: tableViewCelId, for: indexPath)
        
        cell.textLabel?.textAlignment = .center
        cell.textLabel?.font = UIFont(name: "Times New Roman", size: 36)
        cell.textLabel?.textColor = .lightGray
        let row = indexPath.row
        
        if row == 0 {
            
            cell.textLabel?.text = "Offers"
        } else if row == 1 {
            cell.textLabel?.text = "Offers"
        } else if row == 2 {
            cell.textLabel?.text = "Cart"
        } else if row == 3 {
            cell.textLabel?.text = "Wishlist"
        } else if row == 4 {
            cell.textLabel?.text = "Outlets"
        } else if row == 5 {
            cell.textLabel?.text = "Blog"
        } else {
            cell.textLabel?.text = "Profile"
        }
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.textLabel?.textColor = UIColor(displayP3Red: 239/255, green: 79/255, blue: 117/255, alpha: 1)
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.textLabel?.textColor = .lightGray
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
    @objc func showLeftBar() {
        leftSideBar?.show()
    }
    var refCategories: DatabaseReference!
    
    func setupProducts() {
//        let pro1 = Category(productName: "Shoes", productNumber: "2250 items", productDetails: "", backImage: #imageLiteral(resourceName: "back1"))
//        let pro2 = Category(productName: "Outerwear", productNumber: "7665 items", productDetails: "", backImage: #imageLiteral(resourceName: "back2"))
//        let pro3 = Category(productName: "Hand Bangs", productNumber: "336 items", productDetails: "", backImage: #imageLiteral(resourceName: "back3"))
//        let pro4 = Category(productName: "High Fashion", productNumber: "9236 items", productDetails: "Alexander Wang Weara", backImage: #imageLiteral(resourceName: "back4"))
//        let pro5 = Category(productName: "Accessories", productNumber: "470 items", productDetails: "", backImage: #imageLiteral(resourceName: "back5"))
//        let pro6 = Category(productName: "Beauty", productNumber: "384 items", productDetails: "", backImage: #imageLiteral(resourceName: "back6"))
//
//        products = [pro1, pro2, pro3, pro4, pro5, pro6]
        
        refCategories = Database.database().reference().child("Categories")
        
        
        refCategories.observe(.value) { (snapshot) in
            //if the reference have some values
            if snapshot.childrenCount > 0 {
                
                //clearing the list
                self.products.removeAll()
                
                //iterating through all the values
                for products in snapshot.children.allObjects as! [DataSnapshot] {
                    //getting values
                    let productObject = products.value as? [String: AnyObject]
                    let productName  = productObject?["name"]
                    let productNumber  = productObject?["number"]
                    let imageUrl = productObject?["url"]
                    
                    //creating artist object with model and fetched values
                    let product = Category(productName: productName as! String, productNumber: productNumber as! String, backImage: imageUrl as! String)
                    
                    //appending it to list
                    self.products.append(product)
                }
                
                //reloading the tableview
                self.collectionView?.reloadData()
                
                
            }
        }
        
    }
    
    
    func setupA() {
        collectionView?.register(HomeCell.self, forCellWithReuseIdentifier: cellID)
    }
    
    func setupB(){
        collectionView?.register(CategoryCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item == 0 {
            setupA()
            let cellA = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! HomeCell
            return cellA
        } else {
            setupB()
            let cellB = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! CategoryCell
            cellB.product = products[indexPath.item - 1]
            return cellB
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if indexPath.item == 0 {
            return CGSize(width: view.frame.width, height: 300)
        } else {
            return CGSize(width: view.frame.width, height: 150)
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = indexPath.item
        
        self.navigationController?.navigationBar.tintColor = .white
        let layout = UICollectionViewFlowLayout()
        
        
        let destination = CategoryDetailViewController(collectionViewLayout: layout)
        navigationController?.pushViewController(destination, animated: true)
        
    }
}


