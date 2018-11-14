//
//  Items.swift
//  Shajuni
//
//  Created by SOUMEN GHOSH on 24/2/18.
//  Copyright © 2018 Sg106. All rights reserved.
//

import UIKit

struct Items {
    var image: UIImage
    var title: String
    var shortMsg: String
    var price: String
    
    init(image: UIImage, title: String, shortMsg: String, price: String) {
        self.image = image
        self.title = title
        self.shortMsg = shortMsg
        self.price = price
    }
}
