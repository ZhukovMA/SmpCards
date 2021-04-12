//
//  CardCellViewModel.swift
//  SMPCards
//
//  Created by Максим Жуков on 03.11.2020.
//  Copyright © 2020 Максим Жуков. All rights reserved.
//

import Foundation

class CardTextCellViewModel: CardTextCellViewModelType {
    
    var completeData : CompleteData
    var attribute: TextAttribute
    
    func getLimitOfText() -> Int? {
        attribute.limit
    }
    
    private func ruToEng(data: inout String) {
        switch data.first {
        case "У":
            data.remove(at: data.startIndex)
            data.insert("Y", at: data.startIndex)
        case "К":
            data.remove(at: data.startIndex)
            data.insert("K", at: data.startIndex)
        case "Е":
            data.remove(at: data.startIndex)
            data.insert("E", at: data.startIndex)
        case "Н":
            data.remove(at: data.startIndex)
            data.insert("H", at: data.startIndex)
        case "Х":
            data.remove(at: data.startIndex)
            data.insert("X", at: data.startIndex)
        case "В":
            data.remove(at: data.startIndex)
            data.insert("B", at: data.startIndex)
        case "А":
            data.remove(at: data.startIndex)
            data.insert("A", at: data.startIndex)
        case "Р":
            data.remove(at: data.startIndex)
            data.insert("P", at: data.startIndex)
        case "О":
            data.remove(at: data.startIndex)
            data.insert("O", at: data.startIndex)
        case "С":
            data.remove(at: data.startIndex)
            data.insert("C", at: data.startIndex)
        case "М":
            data.remove(at: data.startIndex)
            data.insert("M", at: data.startIndex)
        case "Т":
            data.remove(at: data.startIndex)
            data.insert("T", at: data.startIndex)
        case "З":
            data.remove(at: data.startIndex)
            data.insert("Z", at: data.startIndex)
        default:
            return
        }
    }
    
    
    
    func sendData(data: inout String) {
        if attribute.subattribut == .diagnose {
            ruToEng(data: &data)
        }
        attribute.attributData = data
        completeData.completeTextData[attribute.subattribut] = data
    }
    
    func getTitle() -> String {
        return attribute.title
    }
    func getAttributeData() -> String? {
        return attribute.attributData
    }
    
    init(attribute : TextAttribute, completeData : CompleteData) {
        self.attribute = attribute
        self.completeData = completeData
    }
    
    
}
