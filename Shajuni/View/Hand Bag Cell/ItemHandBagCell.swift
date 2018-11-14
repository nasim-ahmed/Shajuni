//
//  ItemHandBagController.swift
//  Shajuni
//
//  Created by SOUMEN GHOSH on 24/2/18.
//  Copyright © 2018 Sg106. All rights reserved.
//

import UIKit

class ItemHandBagCell: UICollectionViewCell {
    
    var item: Items? {
        didSet {
            self.imageView.image = item?.image
            self.title.text = item?.title
            self.shortMsg.text = item?.shortMsg
            self.price.text = item?.price
        }
    }
    
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.layer.masksToBounds = true
        iv.contentMode = .scaleAspectFill
//        iv.image = #imageLiteral(resourceName: "myDP")
        return iv
    }()
    
    let title: UILabel = {
        let tl = UILabel()
        tl.translatesAutoresizingMaskIntoConstraints = false
//        tl.text = "dummy title baal saal"
        tl.font = UIFont(name: "Times New Roman", size: 30)
        tl.textAlignment = .center
        tl.numberOfLines = 2
//        tl.backgroundColor = .yellow
        return tl
    }()
    
    let shortMsg: UILabel = {
        let tl = UILabel()
        tl.translatesAutoresizingMaskIntoConstraints = false
//        tl.text = "Short Message"
        tl.font = UIFont(name: "Times New Roman", size: 20)
        tl.textAlignment = .center
        tl.textColor = .gray
        tl.numberOfLines = 2
//        tl.backgroundColor = .blue
        return tl
    }()
    
    let price: UILabel = {
        let tl = UILabel()
        tl.translatesAutoresizingMaskIntoConstraints = false
//        tl.text = "$1234"
        tl.font = UIFont(name: "Times New Roman", size: 22)
        tl.textAlignment = .center
        tl.textColor = UIColor(displayP3Red: 239/255, green: 79/255, blue: 117/255, alpha: 1)
        return tl
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        setupImage()
        setupTitle()
        setupShortMsg()
        setupPrice()
    }
    
    func setupImage() {
        addSubview(imageView)
        imageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: topAnchor, constant: 15).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 130).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 130).isActive = true
    }
    
    func setupTitle() {
        addSubview(title)
        title.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 15).isActive = true
        title.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        title.heightAnchor.constraint(equalToConstant: 70).isActive = true
        title.widthAnchor.constraint(equalToConstant: 170).isActive = true
    }
    
    func setupShortMsg() {
        addSubview(shortMsg)
        shortMsg.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 10).isActive = true
        shortMsg.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        shortMsg.heightAnchor.constraint(equalToConstant: 50).isActive = true
        shortMsg.widthAnchor.constraint(equalToConstant: 180).isActive = true
    }
    
    func setupPrice() {
        addSubview(price)
        price.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15).isActive = true
        price.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        price.widthAnchor.constraint(equalToConstant: 80).isActive = true
    }
}
























