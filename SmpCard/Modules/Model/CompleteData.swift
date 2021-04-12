//
//  CompleteData.swift
//  SmpCard
//
//  Created by Maxim Zhukov on 22.03.2021.
//  Copyright © 2021 SMP. All rights reserved.
//

import Foundation


class IndicatorItem: Codable {
    var data = [SubAttribute: String]()
}

class CompleteData: Codable {
    var id: String!
    var name: String?
    var diagnose: String!
    var completeTextData = [SubAttribute: String]()
    var completeSelectableData =  Set<SubAttribute>()
    var indicator: [IndicatorItem]?
    
    init(completeTextData: [SubAttribute: String], completeSelectableData:  Set<SubAttribute>,  indicator: [IndicatorItem]?) {
        self.completeTextData = completeTextData
        self.completeSelectableData = completeSelectableData
        self.indicator = indicator
    }
    
    init() {}
    
//    var indicatorIsEmpty: Bool {
//        var result = true
//        if let indicator = indicator {
//            indicator.forEach { indicatorItem in
//                if !indicatorItem.data.isEmpty {
//                    result = false
//                }
//            }
//        }
//        return result
//    }
}
