//
//  CardTableViewCellViewModelType.swift
//  SMPCards
//
//  Created by Максим Жуков on 03.11.2020.
//  Copyright © 2020 Максим Жуков. All rights reserved.
//

import Foundation

protocol  CardCellViewModelType {}

protocol CardSelectableCellViewModelType: CardCellViewModelType {
    func getTitle() -> String
      func getAttributeData() -> String?
    var shouldReduceFont: Bool {get}

}
