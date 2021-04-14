//
//  CardTableAttributeRowViewModelType.swift
//  SmpCard
//
//  Created by Maxim Zhukov on 27.03.2021.
//  Copyright © 2021 SMP. All rights reserved.
//

import Foundation

protocol TableAttributeViewModelType {
    var numberOfRow: Int {get}
    func  contentCellViewModel(row: Int) -> TableAttributeRowContentViewModelType?
    var  headerCellViewModel: TableAttributeRowHeaderViewModelType? {get}
    func addRow()
    func sendData(data: String, row: Int, column: Int)
}
