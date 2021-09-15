//
//  FoodCollectionViewCell.swift
//  Food-Delivery
//
//  Created by Bán Viktor on 2021. 09. 15..
//

import UIKit

class FoodCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var roundedBackgroundView: UIView!
    
    static let reuseIdentifier = "FoodCollectionViewCell"
    
    override func layoutSubviews() {
        roundedBackgroundView.layer.cornerRadius = 25
    }

}
