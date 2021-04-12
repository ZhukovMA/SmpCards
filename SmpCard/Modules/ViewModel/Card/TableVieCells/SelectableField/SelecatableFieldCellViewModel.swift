//
//  SelecatableFieldCellViewModel.swift
//  SmpCard
//
//  Created by Maxim Zhukov on 03.03.2021.
//  Copyright © 2021 SMP. All rights reserved.
//

import Foundation

class SelectableFieldCellViewModel:  SelectableFieldCellViewModelType {
 
    let row: SelectRowOfSubattribute
    
    var title: String {
        return row.title
    }
    
    var isActive: Bool {
        return row.isSelected
    }
    
    init(data: SelectRowOfSubattribute) {
        self.row = data
    }
}
