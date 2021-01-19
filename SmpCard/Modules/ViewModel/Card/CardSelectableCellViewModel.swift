//
//  CardCellViewModel.swift
//  SMPCards
//
//  Created by Максим Жуков on 03.11.2020.
//  Copyright © 2020 Максим Жуков. All rights reserved.
//

import Foundation

class CardSelectableCellViewModel: CardSelectableCellViewModelType {
    var shouldReduceFont: Bool {
        if attribute.attribute == .assistanceProvided, let indicator = completeData.indicator, !indicator.isEmpty {
                   return true
               }
               return false
    }
    
    
    
    
     var attribute: SelectableAttribute!
    var completeData: CompleteData!
    func getTitle() -> String {
        return attribute.title
    }
    func getAttributeData() -> String? {
        return attribute.attributeData
    }
    
  
    
    init(attribute : SelectableAttribute, completeData: CompleteData) {
        self.attribute = attribute
        self.completeData = completeData
    }
    
    
    
}
