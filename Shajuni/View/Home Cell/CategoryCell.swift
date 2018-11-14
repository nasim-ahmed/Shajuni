//
//  CategoryCell.swift
//  Shajuni
//
//  Created by SOUMEN GHOSH on 23/2/18.
//  Copyright © 2018 Sg106. All rights reserved.
//

import UIKit

class CategoryCell: UICollectionViewCell {
  
    
    var product: Category? {
        didSet {
            self.productName.text = product?.productName
            
            self.productNumber.text = product?.productNumber
//            self.backgroundImage.image = product?.backImage
            guard let categoryImageUrl = product?.backImage else {return}
            
            backgroundImage.loadImage(urlString: categoryImageUrl)
            
        }
    }
    
    
    let productName: UILabel = {
        let name = UILabel()
        name.translatesAutoresizingMaskIntoConstraints = false
        name.font = UIFont(name: "Times New Roman", size: 32)
        name.textColor = UIColor(displayP3Red: 239/255, green: 79/255, blue: 117/255, alpha: 1)
        //        name.text = "new product"
        return name
    }()
    
    let productNumber: UILabel = {
        let num = UILabel()
        num.translatesAutoresizingMaskIntoConstraints = false
        num.font = UIFont(name: "Times New Roman", size: 20)
        //        num.text = "220 items"
        return num
    }()
    
    let productDetails: UILabel = {
        let det = UILabel()
        det.translatesAutoresizingMaskIntoConstraints = false
        det.font = UIFont(name: "Times New Roman", size: 24)
        det.textColor = UIColor(displayP3Red: 239/255, green: 79/255, blue: 117/255, alpha: 1)
        //        det.text = "Alexander Wang Weara"
        return det
    }()
    
    let backgroundImage: CustomImageView = {
        let back = CustomImageView()
        back.translatesAutoresizingMaskIntoConstraints = false
        back.contentMode = .scaleToFill
        //        back.image = #imageLiteral(resourceName: "Bitmap")
        return back
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    func setup() {
        
        addSubview(backgroundImage)
        addSubview(productName)
        addSubview(productNumber)
        addSubview(productDetails)
        
        
        backgroundImage.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingRight: 0, paddingBottom: 0, width: 0, height: 0)
        productName.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 30, paddingLeft: 50, paddingRight: 0, paddingBottom: 0, width: 180, height: 40)
        
        productNumber.anchor(top: productName.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 10, paddingLeft: 50, paddingRight: 10, paddingBottom: 0, width: 0, height: 20)
        
        productDetails.anchor(top: productNumber.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 10, paddingLeft: 50, paddingRight: 10, paddingBottom: 0, width: 0, height: 30)
        
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
