//
//  TableAttributeTableCellViewModelType.swift
//  SmpCard
//
//  Created by Maxim Zhukov on 28.03.2021.
//  Copyright © 2021 SMP. All rights reserved.
//

import Foundation

protocol TableAttributeRowContentViewModelType {
    var numberOfColumn: Int {get}
    var rowTitle: String? {get}
    func  getData(column: Int)  -> String?
    var hasRowsTitles: Bool {get}
    var numberOfRow: Int {get}
}
