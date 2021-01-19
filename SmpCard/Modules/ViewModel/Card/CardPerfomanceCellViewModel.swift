//
//  CardPerfomanceCellViewModel.swift
//  SMPCards
//
//  Created by Максим Жуков on 30.11.2020.
//  Copyright © 2020 Максим Жуков. All rights reserved.
//

import Foundation



class CardPerfomanceCellViewModel: CardPerfomanceCellViewModelType {
    var attribute: SelectableAttribute
    var completeData : CompleteData
    
    func getPerfomance(forSubattribute subattribute: SubAttribute) -> String? {
        guard let  perfomance = completeData.completeTextData[subattribute] else {return nil}
        return perfomance
    }
    
    func getTitle() -> String {
        return attribute.title
    }
    
    
    init(attribute : SelectableAttribute, completeData : CompleteData) {
        self.attribute = attribute
        self.completeData = completeData
    }
    
    
}
