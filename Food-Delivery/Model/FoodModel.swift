//
//  FoodModel.swift
//  Food-Delivery
//
//  Created by Bán Viktor on 2021. 09. 15..
//

import Foundation

class FoodModel {
    
    var name: String
    var price: Int
    var color: String
    var image: String
    
    init(name: String, price: Int, color: String, image: String) {
        self.name = name
        self.price = price
        self.color = color
        self.image = image
    }
    
}
