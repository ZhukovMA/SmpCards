//
//  PerfomanceViewModelType.swift
//  SMPCards
//
//  Created by Максим Жуков on 30.11.2020.
//  Copyright © 2020 Максим Жуков. All rights reserved.
//

import Foundation



protocol PerfomanceViewModelType {
    func sendCompleteData()
//    func cellViewModel(forIndexPath indexPath: IndexPath) -> PerfomanceCellViewModelType?
    func numberOfRowInSection(section: Int) -> Int
    var numberOfSection: Int  {get}
    
//    func addSubAttribute(forIndexPath indexPath: IndexPath)
//    func removeSubAttribute(forIndexPath indexPath: IndexPath)
}
