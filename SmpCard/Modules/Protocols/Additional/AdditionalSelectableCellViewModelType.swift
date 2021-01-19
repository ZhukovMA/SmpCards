//
//  File.swift
//  SMPCards
//
//  Created by Максим Жуков on 17.11.2020.
//  Copyright © 2020 Максим Жуков. All rights reserved.
//

import Foundation

protocol AdditionalCell {}

protocol AdditionalSelectableCellViewModelType: AdditionalCell {
    func getTitle() -> String?
}

protocol AdditionalTextCellViewModelType: AdditionalCell {
    func getLimitOfText() -> Int?
    func getTitle() -> String
    func isNumbericKeyboard() -> Bool
    func getText() -> String?
    func sendText(text: String?, section: Int)
}
