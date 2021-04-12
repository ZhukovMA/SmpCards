//
//  TableAttributeRowViewModel.swift
//  SmpCard
//
//  Created by Maxim Zhukov on 27.03.2021.
//  Copyright © 2021 SMP. All rights reserved.
//

import Foundation

class TableAttributeViewModel: TableAttributeViewModelType {
    var tableAttribute: SelectableAttributeEnum
    var table: Table
    var completeData: CompleteData
    
    var numberOfRow: Int {
        return table.data.count
    }
    
    func  contentCellViewModel(row: Int) -> TableAttributeRowContentViewModelType? {
        return TableAttributeRowContentViewModel(rowData: table.data[row], title: table.rowsTitle?[row], _numberOfRow: row)
    }
    
    var  headerCellViewModel: TableAttributeRowHeaderViewModelType? {
        return TableAttributeRowHeaderViewModel(titles: table.columnsTitle, _hasRowsTitles: table.rowsTitle != nil)
    }
    
    func addRow() {
        table.data.append(Array( table.data.last!))
        if let _ = completeData.indicator {
            let indicatorItem = IndicatorItem()
            completeData.indicator!.append(indicatorItem)
        } else {
            completeData.indicator = Array(repeating: IndicatorItem(), count: 2)
        }
    }
    
    func sendData(data: String, row: Int, column: Int) {
        table.data[row][column]?.text = data
        switch tableAttribute {
        case .indicator:
            if let _ = completeData.indicator {
                completeData.indicator![row].data[table.data[row][column]!.subattribut] = data
            } else {
                completeData.indicator = [IndicatorItem()]
                completeData.indicator![row].data[table.data[row][column]!.subattribut] = data
            }
        default:
            completeData.completeTextData[table.data[row][column]!.subattribut] = data
        }
    }
    
    init(table: Table, completeData: CompleteData,   tableAttribute: SelectableAttributeEnum) {
        self.table = table
        self.completeData = completeData
        self.tableAttribute = tableAttribute
    }
}
