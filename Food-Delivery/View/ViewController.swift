//
//  ViewController.swift
//  Food-Delivery
//
//  Created by Bán Viktor on 2021. 09. 15..
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    @IBOutlet weak var filterCollectionView: UICollectionView!
    @IBOutlet weak var foodCollectionView: UICollectionView!
    
    var viewModel = MainViewModel()
    var selectedFoodModel: FoodModel?
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.tintColor = UIColor.black
        
        filterCollectionView.delegate = self
        filterCollectionView.dataSource = self
        
        foodCollectionView.rx.setDelegate(self).disposed(by: disposeBag)
        
        bindFoodCollectionView()
        
        registerCell()
    }
    
    private func registerCell() {
        let filterImageNib = UINib(nibName: "FilterImageCollectionViewCell", bundle: nil)
        filterCollectionView.register(filterImageNib, forCellWithReuseIdentifier: FilterImageCollectionViewCell.reuseIdentifier)
        
        let filterNib = UINib(nibName: "FilterCollectionViewCell", bundle: nil)
        filterCollectionView.register(filterNib, forCellWithReuseIdentifier: FilterCollectionViewCell.reuseIdentifier)
        
    }
    
    private func bindFoodCollectionView() {
        let foodNib = UINib(nibName: "FoodCollectionViewCell", bundle: nil)
        foodCollectionView.register(foodNib, forCellWithReuseIdentifier: FoodCollectionViewCell.reuseIdentifier)
        
        //Bind data objects to the collection view
        viewModel.getFoods().bind(to: foodCollectionView.rx.items(cellIdentifier: FoodCollectionViewCell.reuseIdentifier, cellType: FoodCollectionViewCell.self)) { (row,foodModel,cell) in
            cell.foodModel = foodModel
        }.disposed(by: disposeBag)
        
        //Handle tap event on the cell
        foodCollectionView.rx.itemSelected.subscribe { [weak self](indexPath: IndexPath) in
            if let cell = self?.foodCollectionView.cellForItem(at: indexPath) as? FoodCollectionViewCell {
                self?.selectedFoodModel = cell.foodModel
                self?.performSegue(withIdentifier: "FoodDetails", sender: self)
            }
        }.disposed(by: disposeBag)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "FoodDetails" {
            if let target = segue.destination as? FoodDetailsViewController {
                target.foodModel = selectedFoodModel
            }
        }
    }
    
    @IBAction func menuButtonAction(_ sender: UIButton) {
        // Navigate to the corresponding screen
        switch sender.tag {
        case 0:
            break
        case 1:
            break
        case 2:
            performSegue(withIdentifier: "Order", sender: self)
        default:
            break
        }
    }

}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case filterCollectionView:
            return viewModel.filterModels.count + 1 //Filter image
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
}
