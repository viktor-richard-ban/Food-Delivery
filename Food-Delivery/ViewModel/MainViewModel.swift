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
    
}
