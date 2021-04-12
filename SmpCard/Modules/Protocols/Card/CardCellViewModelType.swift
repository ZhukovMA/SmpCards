//
//  1.swift
//  SmpCard
//
//  Created by Maxim Zhukov on 21.02.2021.
//  Copyright © 2021 SMP. All rights reserved.
//

import Foundation

protocol CardCellViewModelType: AnyObject {
    func numberOfRowInSection(section: Int) -> Int
    var delegate: CardViewModelDelegate? {get set}
    func getTitle(forIndexPathRow indexPathRow: Int) -> String?
    func cellViewModel(forIndexPathRow indexPathRow: Int) -> CardTableViewCellViewModelType?
    func isDateCell(indexPathRow: Int) -> Bool
    func getCellType(indexPathRow: Int) -> CardCellType
}

