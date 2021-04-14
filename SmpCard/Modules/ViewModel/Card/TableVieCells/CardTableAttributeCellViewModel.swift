//
//  CardTableCellViewModel.swift
//  SmpCard
//
//  Created by Maxim Zhukov on 22.03.2021.
//  Copyright © 2021 SMP. All rights reserved.
//

import Foundation

class CardTableCellViewModel: CardTableCellViewModelType {
    
   
    
   
    var attribute: TableAttribute
    var completeData : CompleteData
    
    var tableType: TableType {
        return attribute.type
    }
    
    
    var hasAdditionalText: Bool {
        return attribute.additionalData != nil
    }
    
    var tableViewModel: TableAttributeViewModelType {
        return TableAttributeViewModel(table: attribute.table,  completeData: completeData, tableAttribute: attribute.attribute)
    }
    
    func sendAdditionalData(data: String) {
        attribute.additionalData?.text = data.isEmpty ? nil : data
        completeData.completeTextData[attribute.additionalData!.subattribut] =  data.isEmpty ? nil : data
    }

    var additionalData: String? {
        return attribute.additionalData?.text
    }
    
    func getTitle() -> String {
        return attribute.title
    }
    
    
    init(attribute : TableAttribute, completeData : CompleteData) {
        self.attribute = attribute
        self.completeData = completeData
    }
    
}
