//
//  TableAttributeRowHeaderViewModelType.swift
//  SmpCard
//
//  Created by Maxim Zhukov on 30.03.2021.
//  Copyright © 2021 SMP. All rights reserved.
//

import Foundation

protocol TableAttributeRowHeaderViewModelType {
    var numberOfColumn: Int {get}
    func columnTitle(index: Int) -> String?
    var hasRowsTitles: Bool {get}
}
