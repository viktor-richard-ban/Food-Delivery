//
//  OrderTableViewCell.swift
//  Food-Delivery
//
//  Created by Bán Viktor on 2021. 09. 17..
//

import UIKit
import RxSwift
import RxCocoa

class OrderTableViewCell: UITableViewCell {

    @IBOutlet weak var foodView: UIView!
    @IBOutlet weak var foodImageView: UIImageView!
    @IBOutlet weak var stepperView: UIView!
    @IBOutlet weak var stepperLabel: UILabel!
    
    var disposeBag = DisposeBag()
    
    var orderViewModel: OrderViewModel? {
        didSet {
            if let orderViewModel = orderViewModel {
                foodView.backgroundColor = UIColor(hex: orderViewModel.foodModel.color)
                foodImageView.image = UIImage(named: orderViewModel.foodModel.image)
                
                orderViewModel.quantity.subscribe { (quantity:Int) in
                    self.stepperLabel.text = "\(quantity)"
                }.disposed(by: disposeBag)
            }
        }
    }
    
    static let reuseIdentifier = "OrderCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        foodView.layer.cornerRadius = 25
        stepperView.roundCorners(corners: [.topRight, .bottomLeft], radius: 15)
        stepperView.backgroundColor = UIColor(white: 0.98, alpha: 0.85)
    }
    
    @IBAction func stepperButtonAction(_ sender: UIButton) {
        if sender.titleLabel?.text == "-" {
            orderViewModel?.decreeseQuantity()
        } else if sender.titleLabel?.text == "+" {
            orderViewModel?.increeseQuantity()
        }
    }
}
