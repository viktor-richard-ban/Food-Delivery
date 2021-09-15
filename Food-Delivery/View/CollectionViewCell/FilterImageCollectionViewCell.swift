//
//  FilterImageCollectionViewCell.swift
//  Food-Delivery
//
//  Created by Bán Viktor on 2021. 09. 15..
//

import UIKit

class FilterImageCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var roundedBackgroundView: UIView!
    
    static let reuseIdentifier = "FilterImageCollectionViewCell"

    override func layoutSubviews() {
        super.layoutSubviews()
        roundedBackgroundView?.layer.cornerRadius = 10
        roundedBackgroundView?.roundCorners(corners: [.topLeft, .bottomRight], radius: 25)
    }

}
