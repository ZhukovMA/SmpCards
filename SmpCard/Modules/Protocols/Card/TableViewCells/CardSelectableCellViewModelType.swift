//
//  a.swift
//  SmpCard
//
//  Created by Maxim Zhukov on 05.03.2021.
//  Copyright © 2021 SMP. All rights reserved.
//

import Foundation

protocol CardTableViewCellViewModelType {}

protocol CardSelectableCellViewModelType: CardTableViewCellViewModelType {
    func getTitle() -> String
    func getAttributeData() -> String?
    var selectableField: SelectableFieldViewModelType? { get }
    func sendData(data: inout String)
    func getLimitOfText() -> Int?
    var hasAdditionalTextField: Bool {get}
    func sendSelectableData(indexPathRow: Int)
    
}
