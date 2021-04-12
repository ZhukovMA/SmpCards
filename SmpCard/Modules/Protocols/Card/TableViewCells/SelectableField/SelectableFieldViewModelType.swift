//
//  SelectableFieldViewModelType.swift
//  SmpCard
//
//  Created by Maxim Zhukov on 03.03.2021.
//  Copyright © 2021 SMP. All rights reserved.
//

import Foundation

protocol SelectableFieldViewModelType {
    func cellViewModel(forIndexPath indexPath: IndexPath) -> SelectableFieldCellViewModelType?
    var numberOfItemInSection: Int {get}
}
