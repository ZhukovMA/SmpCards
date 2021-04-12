//
//  CardIndicatorCellViewModelType.swift
//  SmpCard
//
//  Created by Maxim Zhukov on 22.03.2021.
//  Copyright © 2021 SMP. All rights reserved.
//

import Foundation

protocol CardTableCellViewModelType: CardTableViewCellViewModelType {
    func getTitle() -> String
    func sendData(row: Int, column: SubAttribute, data: String) 
    var tableViewModel: TableAttributeViewModelType {get}
    var tableType: TableType {get}
    var hasAdditionalText: Bool {get}
}
