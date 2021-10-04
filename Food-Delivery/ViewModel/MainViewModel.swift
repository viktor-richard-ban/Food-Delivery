//
//  MainViewModel.swift
//  Food-Delivery
//
//  Created by Bán Viktor on 2021. 09. 15..
//

import Foundation
import RxSwift
import RxCocoa

class MainViewModel {
    
    private var foods : BehaviorRelay<[FoodModel]>
    
    var filterModels: [FilterModel] = [
        FilterModel(title: "Asian", isActive: true),
        FilterModel(title: "Italian", isActive: false),
        FilterModel(title: "American", isActive: false),
        FilterModel(title: "Hungarian", isActive: false)
    ]
    
    init() {
        let foodModels: [FoodModel] = [
            FoodModel(name: "Udon Soup With Chicket", price: 13, color: "#FAA87F", image: "food_01"),
            FoodModel(name: "Ramen Soup with Pork", price: 12, color: "#EFB761", image: "food_02"),
            FoodModel(name: "Coca Cola", price: 3, color: "#76D7EE", image: "food_03"),
            FoodModel(name: "Diet Coca Cola", price: 4, color: "#FAA87F", image: "food_01")
        ]
        foods = .init(value: foodModels)
    }
    
    func getFoods() -> Observable<[FoodModel]> {
        return foods.asObservable()
    }
    
}
