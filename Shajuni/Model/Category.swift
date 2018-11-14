//
//  Products.swift
//  Shajuni
//
//  Created by SOUMEN GHOSH on 17/2/18.
//  Copyright © 2018 Sg106. All rights reserved.
//

import UIKit

struct Category {
    
    var productName: String
    var productNumber: String
    var backImage: String
    
    init(productName: String, productNumber: String, backImage: String){
        self.productName = productName
        self.productNumber = productNumber
        self.backImage = backImage
    }
    
}
