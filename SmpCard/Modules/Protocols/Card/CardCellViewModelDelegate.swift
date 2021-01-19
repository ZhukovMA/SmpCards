//
//  File.swift
//  SMPCards
//
//  Created by Максим Жуков on 14.11.2020.
//  Copyright © 2020 Максим Жуков. All rights reserved.
//

import Foundation

protocol CardPerfomanceCellViewModelType: CardCellViewModelType {
    func getTitle() -> String
    func getPerfomance(forSubattribute subattribute: SubAttribute) -> String?
}
