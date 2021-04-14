//
//  SelectableFieldViewModel.swift
//  SmpCard
//
//  Created by Maxim Zhukov on 03.03.2021.
//  Copyright © 2021 SMP. All rights reserved.
//

import Foundation

class SelectableFieldViewModel: SelectableFieldViewModelType {
 
    var rows: SelectRowsOfSubattribute!
    
    var numberOfItemInSection: Int {
        return rows.data.count
    }
    
    func sendData(indexPathRow: Int) {
        rows.data[indexPathRow].isSelected.toggle()
    }
    
    func cellViewModel(forIndexPath indexPath: IndexPath) -> SelectableFieldCellViewModelType? {
        guard indexPath.row < rows.data.count else {return nil}
        return SelectableFieldCellViewModel(data: rows.data[indexPath.row])
    }
    
    init(data: SelectRowsOfSubattribute) {
        self.rows = data
    }
    
}
