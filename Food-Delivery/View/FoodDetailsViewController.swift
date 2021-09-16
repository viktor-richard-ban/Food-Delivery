//
//  FoodDetailsViewController.swift
//  Food-Delivery
//
//  Created by Bán Viktor on 2021. 09. 16..
//

import UIKit

class FoodDetailsViewController: UIViewController {
    
    @IBOutlet weak var foodView: UIView!
    @IBOutlet weak var foodImageView: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var roundedFoodView: UIView!
    @IBOutlet weak var roundedIngredientsView: UIView!
    @IBOutlet weak var orderView: UIView!
    
    var foodModel: FoodModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        foodView.backgroundColor = UIColor(hex: foodModel.color)
        foodImageView.image = UIImage(named: foodModel.image)
        priceLabel.text = "$\(foodModel.price).00"
        nameLabel.text = foodModel.name
        
        roundedFoodView.backgroundColor = UIColor(hex: foodModel.color)
        
        setupUI()
    }
    
    private func setupUI() {
        roundedFoodView.roundCorners(corners: [.bottomLeft], radius: 50)
        roundedIngredientsView.roundCorners(corners: [.bottomLeft], radius: 50)
        orderView.roundCorners(corners: [.topLeft], radius: 50)
    }
    
}
