//
//  ItemShoeCell.swift
//  Shajuni
//
//  Created by SOUMEN GHOSH on 1/3/18.
//  Copyright © 2018 Sg106. All rights reserved.
//

import UIKit

class ItemShoeCell: UICollectionViewCell {
    
    var item: Items? {
        didSet {
            self.imageView.image = item?.image
            self.title.text = item?.title
            self.shortMsg.text = item?.shortMsg
//            self.price.text = item?.price
        }
    }
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.layer.masksToBounds = true
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    let title: UILabel = {
        let tl = UILabel()
        tl.translatesAutoresizingMaskIntoConstraints = false
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
    
    let seeSimilarButton: UIButton = {
        let tl = UIButton()
        tl.translatesAutoresizingMaskIntoConstraints = false
        tl.setTitle("See similar", for: .normal)
        tl.setTitleColor(UIColor.white, for: .normal)
        tl.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        tl.layer.cornerRadius = 15
        tl.layer.masksToBounds = true
        return tl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
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
        title.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10).isActive = true
        title.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        title.heightAnchor.constraint(equalToConstant: 50).isActive = true
        title.widthAnchor.constraint(equalToConstant: 170).isActive = true
    }
    
    func setupShortMsg() {
        addSubview(shortMsg)
        shortMsg.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 5).isActive = true
        shortMsg.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        shortMsg.heightAnchor.constraint(equalToConstant: 40).isActive = true
        shortMsg.widthAnchor.constraint(equalToConstant: 180).isActive = true
    }
    
    func setupPrice() {
        addSubview(seeSimilarButton)
//        seeSimilarButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15).isActive = true
        seeSimilarButton.topAnchor.constraint(equalTo: shortMsg.bottomAnchor, constant: 5).isActive = true
        seeSimilarButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        seeSimilarButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
