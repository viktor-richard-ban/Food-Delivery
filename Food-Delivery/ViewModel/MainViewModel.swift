//
//  MainViewModel.swift
//  Food-Delivery
//
//  Created by Bán Viktor on 2021. 09. 15..
//

import Foundation

class MainViewModel {
    
    var filterModels: [FilterModel] = [
        FilterModel(title: "Asian", isActive: true),
        FilterModel(title: "Italian", isActive: false),
        FilterModel(title: "American", isActive: false),
        FilterModel(title: "Hungarian", isActive: false)
    ]
    
    var foodModels: [FoodModel] = [
        FoodModel(name: "Udon Soup With Chicket", price: 13),
        FoodModel(name: "Ramen Soup with Pork", price: 12),
        FoodModel(name: "Coca Cola", price: 3),
        FoodModel(name: "Diet Coca Cola", price: 4)
    ]
    
}
