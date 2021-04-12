//
//  TableAttributeRowViewModel.swift
//  SmpCard
//
//  Created by Maxim Zhukov on 28.03.2021.
//  Copyright © 2021 SMP. All rights reserved.
//

import Foundation

class TableAttributeRowContentViewModel: TableAttributeRowContentViewModelType {
   
    
    var rowData: [TextRowOfSubattribute?]
    var title: String?
    var _numberOfRow: Int!
    var numberOfColumn: Int {
        return rowData.count
    }
    
    var numberOfRow: Int {
        return _numberOfRow
    }
    
    var rowTitle: String? {
        return title
    }
    
    func getData(column: Int) -> String? {
        rowData[column]?.text
    }
    
    var hasRowsTitles: Bool {
        return title != nil
    }
    
  
    init(rowData: [TextRowOfSubattribute?], title: String?, _numberOfRow: Int) {
        self.rowData = rowData
        self.title = title
        self._numberOfRow = _numberOfRow
    }
}
