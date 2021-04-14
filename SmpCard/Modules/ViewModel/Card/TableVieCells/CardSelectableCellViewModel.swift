//
//  a.swift
//  SmpCard
//
//  Created by Maxim Zhukov on 05.03.2021.
//  Copyright © 2021 SMP. All rights reserved.
//

import Foundation

class CardSelectableCellViewModel: CardSelectableCellViewModelType {
    
   
    
    var selectableAttribute : SelectableAttribute

    var completeData: CompleteData!
    
    
    func getLimitOfText() -> Int? {
        selectableAttribute.textRow?.limit
    }
    
    func getTitle() -> String {
        return selectableAttribute.title
    }
    func getAttributeData() -> String? {
        return  selectableAttribute.textRow?.text
    }
    
    var selectableField: SelectableFieldViewModelType? {
        guard let rows = selectableAttribute.selectableRows else { return nil }
        return SelectableFieldViewModel(data: rows)
    }
    
    func sendData(data: inout String) {
        guard let textRow = selectableAttribute.textRow else {
            return
        }
        completeData.completeTextData[textRow.subattribut] = data
    }
    
    func sendSelectableData(indexPathRow: Int) {
        guard let subattr = selectableAttribute.selectableRows?.data[indexPathRow].subattribut else {return}
        
        if  completeData.completeSelectableData.contains(subattr) {
            completeData.completeSelectableData.remove(subattr)
        } else {
            completeData.completeSelectableData.insert(subattr)
        }
    }
    var hasAdditionalTextField: Bool {
        return selectableAttribute.textRow != nil
    }
    
    init(selectableAttribute : SelectableAttribute, completeData: CompleteData) {
        self.selectableAttribute = selectableAttribute
        self.completeData = completeData
    }
    
}
