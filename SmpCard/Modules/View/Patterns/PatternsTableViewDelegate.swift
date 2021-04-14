//
//  PatternsTableViewDelegate.swift
//  SmpCard
//
//  Created by Maxim Zhukov on 17.02.2021.
//  Copyright © 2021 SMP. All rights reserved.
//

import UIKit

extension PatternsTableViewController {
    
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cardController = CardPageViewController()
        cardController.viewModel = viewModel.cardViewModel(forIndexPath: indexPath, isFiltered: patternSearchController.isFiltering, request: .create)
        cardController.viewModel?.delegate = viewModel as? CardViewModelDelegate
        navigationController?.pushViewController(cardController, animated: false)
    }
    
     func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let contextDelete = UIContextualAction(style: .destructive, title: "Удалить") {  (contextualAction, view, boolValue) in
            self.viewModel.deleteRecord(forIndexPath: indexPath, completion: self.completion)
            tableView.reloadData()
        }
        let contextUpdate = UIContextualAction(style: .normal, title: "Изменить") { [unowned self] (action, view, boolValue) in
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .horizontal
            let cardController = CardPageViewController()
            cardController.viewModel = self.viewModel.cardViewModel(forIndexPath: indexPath, isFiltered: self.patternSearchController.isFiltering, request: .update)
            cardController.viewModel?.delegate = self.viewModel as? CardViewModelDelegate
            self.navigationController?.pushViewController(cardController, animated: false)
        }
        contextUpdate.backgroundColor = #colorLiteral(red: 0, green: 0.5898008943, blue: 1, alpha: 1)
        let swipeActions = UISwipeActionsConfiguration(actions: [contextUpdate, contextDelete])
        
        return swipeActions
    }
    
     func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row + 1 == viewModel.numberOfPatterns {
            if !isReachedTheEndOfTable {
                isReachedTheEndOfTable = true
                viewModel.fetchStorredData(completion: completion)
            }
        }
    }
}
