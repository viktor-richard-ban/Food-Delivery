//
//  OrderViewController.swift
//  Food-Delivery
//
//  Created by Bán Viktor on 2021. 09. 17..
//

import UIKit
import RxSwift
import RxCocoa

class OrderViewController: UIViewController {
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var roundedOrderView: UIView!
    @IBOutlet weak var costLabel: UILabel!
    
    var viewModel: OrderListViewModel = OrderListViewModel()
    
    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rx.setDelegate(self).disposed(by: disposeBag)
        
        viewModel.getTotalCost().map {
            return "$\($0)"
        }.bind(to: costLabel.rx.text).disposed(by: disposeBag)
        
        setupUI()
        bindTableView()
    }
    
    private func setupUI() {
        contentView.roundCorners(corners: [.bottomLeft], radius: 50)
        roundedOrderView.roundCorners(corners: [.topLeft], radius: 50)
        
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.width, height: 20))
        footerView.backgroundColor = UIColor.white
        tableView.tableFooterView = footerView
    }
    
    private func bindTableView() {
        tableView.register(UINib(nibName: "OrderTableViewCell", bundle: nil), forCellReuseIdentifier: OrderTableViewCell.reuseIdentifier)
        
        viewModel.getOrders().bind(to: tableView.rx.items(cellIdentifier: OrderTableViewCell.reuseIdentifier, cellType: OrderTableViewCell.self)) { (row,orderViewModel,cell) in
            cell.orderViewModel = orderViewModel
        }.disposed(by: disposeBag)
    }
    
    @IBAction func confirmOrderAction(_ sender: Any) {
        //
    }
}

extension OrderViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}
