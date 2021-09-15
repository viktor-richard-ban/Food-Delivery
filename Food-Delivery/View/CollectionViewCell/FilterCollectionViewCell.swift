//
//  FilterCollectionViewCell.swift
//  Food-Delivery
//
//  Created by Bán Viktor on 2021. 09. 15..
//

import UIKit

class FilterCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var roundedBackgroundView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    
    static let reuseIdentifier = "FilterCollectionViewCell"

    override func layoutSubviews() {
        super.layoutSubviews()
        roundedBackgroundView?.layer.cornerRadius = 10
        roundedBackgroundView?.roundCorners(corners: [.topLeft, .bottomRight], radius: 25)
    }

}
