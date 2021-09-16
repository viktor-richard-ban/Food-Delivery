//
//  OrderViewController.swift
//  Food-Delivery
//
//  Created by Bán Viktor on 2021. 09. 17..
//

import UIKit

class OrderViewController: UIViewController {
    
    @IBOutlet weak var roundedOrderView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    private func setupUI() {
        roundedOrderView.roundCorners(corners: [.topLeft], radius: 50)
    }
    
}
