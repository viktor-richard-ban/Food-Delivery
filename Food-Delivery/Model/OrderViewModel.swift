//
//  OrderModel.swift
//  Food-Delivery
//
//  Created by Bán Viktor on 2021. 09. 22..
//

import Foundation
import RxSwift
import RxCocoa

class OrderViewModel {
    
    let foodModel: FoodModel
    var quantity: BehaviorRelay<Int> = BehaviorRelay<Int>(value: 1)
    
    var disposeBag = DisposeBag()
    
    required init(with foodModel: FoodModel) {
        self.foodModel = foodModel
    }
    
    func increeseQuantity() {
        if quantity.value < 5 {
            quantity.accept( quantity.value + 1)
        }
    }
    
    func decreeseQuantity() {
        if quantity.value > 1 {
            quantity.accept( quantity.value - 1)
        }
    }
    
}
