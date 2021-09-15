//
//  ViewController.swift
//  Food-Delivery
//
//  Created by Bán Viktor on 2021. 09. 15..
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var filterCollectionView: UICollectionView!
    
    var viewModel = MainViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        filterCollectionView.delegate = self
        filterCollectionView.dataSource = self
        
        registerCell()
    }
    
    private func registerCell() {
        let nib = UINib(nibName: "FilterCollectionViewCell", bundle: nil)
        filterCollectionView.register(nib, forCellWithReuseIdentifier: FilterCollectionViewCell.reuseIdentifier)
    }
    
    private func updateUI() {
        filterCollectionView.reloadData()
    }

}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.filterModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = filterCollectionView.dequeueReusableCell(withReuseIdentifier: FilterCollectionViewCell.reuseIdentifier, for: indexPath) as? FilterCollectionViewCell {
            let filterModel = viewModel.filterModels[indexPath.row]
            
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
