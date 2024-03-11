//
//  Goods.swift
//  HomeWork6-ShopScreen
//
//  Created by Aleksandr Moroshovskyi on 08.03.2024.
//

import Foundation

class Goods {
    var name: String
    var code: String
    var price: Double
    var currency: String
    var images: [String]
    
    init(name: String, code: String, price: Double, currency: String, images: [String]) {
        self.name = name
        self.code = code
        self.price = price
        self.currency = currency
        self.images = images
    }
}
