//
//  FilterModel.swift
//  Food-Delivery
//
//  Created by Bán Viktor on 2021. 09. 15..
//

import Foundation

class FilterModel {
    
    var title: String
    var isActive: Bool = false
    
    required init(title: String, isActive: Bool = false) {
        self.title = title
        self.isActive = isActive
    }
    
}
