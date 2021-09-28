//
//  OrderViewModel.swift
//  Food-Delivery
//
//  Created by Bán Viktor on 2021. 09. 17..
//

import Foundation
import RxSwift
import RxCocoa

class OrderListViewModel {
    
    private var orders : BehaviorRelay<[OrderViewModel]>
    private var totalCost: BehaviorRelay<Int> = BehaviorRelay<Int>(value: 0)
    
    let disposeBag = DisposeBag()
    
    init() {
        let orderArray = [
            OrderViewModel(with: FoodModel(name: "Udon Soup With Chicket", price: 13, color: "#FAA87F", image: "food_01")),
            OrderViewModel(with: FoodModel(name: "Ramen Soup with Pork", price: 12, color: "#EFB761", image: "food_02")),
            OrderViewModel(with: FoodModel(name: "Coca Cola", price: 3, color: "#76D7EE", image: "food_03")),
            OrderViewModel(with: FoodModel(name: "Diet Coca Cola", price: 4, color: "#FAA87F", image: "food_01"))
        ]
        orders = .init(value: orderArray)
        
        for order in orderArray {
            order.quantity.subscribe { [weak self](value:Int) in
                self?.calculateTotalCost()
            }.disposed(by: disposeBag)
        }
    }
    
    private func calculateTotalCost() {
        orders.map { $0.reduce(0) { $0 + ($1.foodModel.price * $1.quantity.value) }}.subscribe { (value:Int) in
            self.totalCost.accept(value)
        }.disposed(by: disposeBag)
        
    }
    
    func getOrders() -> Observable<[OrderViewModel]> {
        return orders.asObservable()
    }
    
    func getTotalCost() -> Observable<Int> {
        return totalCost.asObservable()
        //return orders.map { $0.reduce(0) { $0 + ($1.foodModel.price * $1.quantity.value) }}
    }
    
}
