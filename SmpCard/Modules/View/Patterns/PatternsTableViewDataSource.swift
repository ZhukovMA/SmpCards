//
//  PatternsTableViewDataSource.swift
//  SmpCard
//
//  Created by Maxim Zhukov on 17.02.2021.
//  Copyright © 2021 SMP. All rights reserved.
//

import UIKit

extension PatternsTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if patternSearchController.isFiltering {
            return viewModel.numberOfFilteredPatterns
        }
        return viewModel.numberOfPatterns
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! PatternsTableViewCell
        cell.viewModel = viewModel.cellViewModel(forIndexPath: indexPath, isFiltering: patternSearchController.isFiltering)
        return cell
    }
}
