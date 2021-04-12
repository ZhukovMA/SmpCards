//
//  Attributes.swift
//  SmpCard
//
//  Created by Maxim Zhukov on 22.03.2021.
//  Copyright © 2021 SMP. All rights reserved.
//

import Foundation

protocol Attribute {}

class TextAttribute: Attribute {
    var title: String!
    var subattribut: SubAttribute
    var attributData: String?
    var limit: Int?
    init(title: String?, subattribut: SubAttribute, attributData: String?, limit: Int?) {
        self.title = title
        self.subattribut = subattribut
        self.attributData = attributData
        self.limit = limit
    }
}

class SelectableAttribute: Attribute {
    var title: String!
    var attribute: SelectableAttributeEnum
    var selectableRows: SelectRowsOfSubattribute?
    var textRow: TextRowOfSubattribute?
    init(title: String?, selectableRows: SelectRowsOfSubattribute? = nil, textRow: TextRowOfSubattribute? = nil, attribute: SelectableAttributeEnum) {
        self.title = title
        self.selectableRows = selectableRows
        self.textRow = textRow
        self.attribute = attribute
    }
}

enum TableType {
    case staticTable
    case dynamicTable
}

class TableAttribute: Attribute {
    var title: String!
    var type: TableType
    var attribute: SelectableAttributeEnum
    var table = Table()
    var additionalData: TextRowOfSubattribute?
    init(title: String?, attribute: SelectableAttributeEnum, type: TableType) {
        self.title = title
        self.attribute = attribute
        self.type = type
    }
}

class Table {
    var columnsTitle: [String]!
    var rowsTitle: [String]? = nil
    var data = [[TextRowOfSubattribute?]]()
}



class SelectRowsOfSubattribute {
    var data = [SelectRowOfSubattribute]()
}


class TextRowOfSubattribute {
    var subattribut: SubAttribute!
    var text: String? = nil
    var limit: Int? = nil
    init(subattribut: SubAttribute, text: String? = nil) {
        self.subattribut = subattribut
        self.text = text
    }
    
    init() {
        subattribut = .none
    }
    
    
}


class SelectRowOfSubattribute {
    let title: String
    let subattribut: SubAttribute
    var isSelected: Bool = false
    init(title: String, subattribut: SubAttribute, isSelected: Bool) {
        self.title = title
        self.subattribut = subattribut
        self.isSelected = isSelected
    }
}
