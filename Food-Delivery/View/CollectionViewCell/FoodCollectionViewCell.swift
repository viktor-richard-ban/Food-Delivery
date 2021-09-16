//
//  FoodCollectionViewCell.swift
//  Food-Delivery
//
//  Created by Bán Viktor on 2021. 09. 15..
//

import UIKit

class FoodCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var roundedBackgroundView: UIView!
    @IBOutlet weak var foodImageView: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    static let reuseIdentifier = "FoodCollectionViewCell"
    
    override func layoutSubviews() {
        roundedBackgroundView.layer.cornerRadius = 25
    }

}
