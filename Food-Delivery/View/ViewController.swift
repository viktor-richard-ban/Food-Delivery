//
//  ViewController.swift
//  Food-Delivery
//
//  Created by Bán Viktor on 2021. 09. 15..
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var filterCollectionView: UICollectionView!
    @IBOutlet weak var foodCollectionView: UICollectionView!
    
    var viewModel = MainViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        filterCollectionView.delegate = self
        filterCollectionView.dataSource = self
        
        foodCollectionView.delegate = self
        foodCollectionView.dataSource = self
        
        registerCell()
    }
    
    private func registerCell() {
        let filterImageNib = UINib(nibName: "FilterImageCollectionViewCell", bundle: nil)
        filterCollectionView.register(filterImageNib, forCellWithReuseIdentifier: FilterImageCollectionViewCell.reuseIdentifier)
        
        let filterNib = UINib(nibName: "FilterCollectionViewCell", bundle: nil)
        filterCollectionView.register(filterNib, forCellWithReuseIdentifier: FilterCollectionViewCell.reuseIdentifier)
        
        let foodNib = UINib(nibName: "FoodCollectionViewCell", bundle: nil)
        foodCollectionView.register(foodNib, forCellWithReuseIdentifier: FoodCollectionViewCell.reuseIdentifier)
    }
    
    private func updateUI() {
        filterCollectionView.reloadData()
    }

}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case filterCollectionView:
            return viewModel.filterModels.count + 1 //Filter image
        case foodCollectionView:
            return viewModel.foodModels.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case filterCollectionView:
            if indexPath.row == 0 {
                return createFilterImageCell(for: indexPath)
            }
            return createFilterCell(for: indexPath)
        case foodCollectionView:
            return createFoodCell(for: indexPath)
        default:
            return UICollectionViewCell()
        }
    }
    
    private func createFilterImageCell(for indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = filterCollectionView.dequeueReusableCell(withReuseIdentifier: FilterImageCollectionViewCell.reuseIdentifier, for: indexPath) as? FilterImageCollectionViewCell {
            return cell
        }
        
        return UICollectionViewCell()
    }
    
    private func createFilterCell(for indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = filterCollectionView.dequeueReusableCell(withReuseIdentifier: FilterCollectionViewCell.reuseIdentifier, for: indexPath) as? FilterCollectionViewCell {
            let filterModel = viewModel.filterModels[indexPath.row-1]
            
            cell.titleLabel.text = filterModel.title
            
            if filterModel.isActive {
                cell.titleLabel.textColor = UIColor(named: "TextColorA")
                cell.roundedBackgroundView.backgroundColor = UIColor(named: "BgColorA")
            }
            
            return cell
        }
        
        return UICollectionViewCell()
    }
    
    private func createFoodCell(for indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = foodCollectionView.dequeueReusableCell(withReuseIdentifier: FoodCollectionViewCell.reuseIdentifier, for: indexPath) as? FoodCollectionViewCell {
            let foodModel = viewModel.foodModels[indexPath.row]
            cell.roundedBackgroundView.backgroundColor = UIColor(hex: foodModel.color)
            cell.nameLabel.text = foodModel.name
            cell.priceLabel.text = "$\(foodModel.price).00"
            cell.foodImageView.image = UIImage(named: foodModel.image)
            return cell
        }
        
        return UICollectionViewCell()
    }
}
