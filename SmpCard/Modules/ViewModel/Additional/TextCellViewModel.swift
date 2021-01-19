//
//  File.swift
//  SMPCards
//
//  Created by Максим Жуков on 17.11.2020.
//  Copyright © 2020 Максим Жуков. All rights reserved.
//

import Foundation



class AdditionalTextCellViewModel: AdditionalTextCellViewModelType {
    var row: TextRowOfSubattribute
    var completeData: CompleteData
    var isNumberic: Bool
    

    func isNumbericKeyboard() -> Bool {
        return isNumberic
    }

    func getLimitOfText() -> Int? {
        return row.limit
    }
    
    func sendText(text: String?, section: Int) {
        switch row.subattribut {
        case .timeIndicator, .chssIndicator, .chddIndicator, .spoIndicator, .aDtimeIndicator, .tempIndicator:
            completeData.indicator?[section-1].data[row.subattribut] = text
        default:
             completeData.completeTextData[row.subattribut] = text
        }
        row.text = text
    }
    
    func getTitle() -> String {
        if let title = row.title {
            return  title
        }
         return  "Уточнение"
    }
    
    func getText() -> String? {
        return row.text
    }
    
    init(textRow: TextRowOfSubattribute, completeData: CompleteData, isNumberic: Bool) {
        self.isNumberic = isNumberic
        self.row = textRow
        self.completeData = completeData
    }
}

