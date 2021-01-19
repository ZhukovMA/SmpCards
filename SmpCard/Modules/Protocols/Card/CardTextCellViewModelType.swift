//
//  File.swift
//  SMPCards
//
//  Created by Максим Жуков on 19.11.2020.
//  Copyright © 2020 Максим Жуков. All rights reserved.
//

import Foundation

protocol CardTextCellViewModelType: CardCellViewModelType {
    func getLimitOfText() -> Int?
    func getTitle() -> String
    func getAttributeData() -> String?
    func sendData(data: inout String)
}
