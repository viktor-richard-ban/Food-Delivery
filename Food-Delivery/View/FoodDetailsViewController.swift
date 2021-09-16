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
    @IBOutlet weak var roundedOrderView: UIView!
    
    @IBOutlet weak var minusStepperButton: UIButton!
    @IBOutlet weak var plusStepperButton: UIButton!
    @IBOutlet weak var stepperLabel: UILabel!
    
    var foodModel: FoodModel!
    var stepperCounter = 1 {
        didSet {
            stepperLabel.text = "\(stepperCounter)"
        }
    }
    
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
        roundedOrderView.roundCorners(corners: [.topLeft], radius: 50)
    }
    
    @IBAction func stepperButtonAction(_ sender: UIButton) {
        if sender.titleLabel?.text == "-" && stepperCounter > 1 {
            stepperCounter -= 1
        } else if sender.titleLabel?.text == "+" && stepperCounter < 5 {
            stepperCounter += 1
        }
    }
    
    @IBAction func orderButtonAction(_ sender: Any) {
        // Call viewModel's order method
    }
    
    @IBAction func menuButtonAction(_ sender: Any) {
        // Navigate to the corresponding screen
    }
}
