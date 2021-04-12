//
//  CardTableCellViewModel.swift
//  SmpCard
//
//  Created by Maxim Zhukov on 22.03.2021.
//  Copyright © 2021 SMP. All rights reserved.
//

import Foundation

class CardTableCellViewModel: CardTableCellViewModelType {
    
    var hasAdditionalText: Bool {
        return attribute.additionalData != nil
    }
    
   
    var attribute: TableAttribute
    var completeData : CompleteData
    
    var tableType: TableType {
        return attribute.type
    }
    
    
    func getTableData(row: Int, subattribute: SubAttribute) -> String? {
//        guard let  tableData = completeData.table?[row].data[subattribute] else {return nil}
//        return tableData
        return nil
    }
    
    var tableViewModel: TableAttributeViewModelType {
        return TableAttributeViewModel(table: attribute.table,  completeData: completeData, tableAttribute: attribute.attribute)
    }
    var numberOfRow: Int {
//        return completeData.table?.count ?? 0
        return 0
    }
    
    func getTitle() -> String {
        return attribute.title
    }
    
    func sendData(row: Int, column: SubAttribute, data: String) {

    }
    
    init(attribute : TableAttribute, completeData : CompleteData) {
        self.attribute = attribute
        self.completeData = completeData
    }
    
}
