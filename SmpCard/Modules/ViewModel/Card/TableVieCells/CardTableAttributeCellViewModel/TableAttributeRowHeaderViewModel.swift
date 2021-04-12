//
//  TableAttributeRowHeaderViewModel.swift
//  SmpCard
//
//  Created by Maxim Zhukov on 30.03.2021.
//  Copyright © 2021 SMP. All rights reserved.
//

import Foundation

class TableAttributeRowHeaderViewModel: TableAttributeRowHeaderViewModelType {
   
    var titles: [String]
    var _hasRowsTitles: Bool
    
    var numberOfColumn: Int {
        return titles.count
    }
    
    func columnTitle(index: Int) -> String? {
        return titles[index]
    }
    
    var hasRowsTitles: Bool {
        return _hasRowsTitles
    }
    
    init(titles: [String], _hasRowsTitles: Bool) {
        self.titles = titles
        self._hasRowsTitles = _hasRowsTitles
    }
}
