//
//  AdditionalViewModel.swift
//  SMPCards
//
//  Created by Максим Жуков on 16.11.2020.
//  Copyright © 2020 Максим Жуков. All rights reserved.
//

import Foundation


protocol AdditionalViewModelType {
    func sendCompleteData()
    func addIndicatorItem()
    var isAssistanceProvided:Bool {get}
    func cellViewModel(forIndexPath indexPath: IndexPath) -> AdditionalCell?
    func getSelectedIndexPaths() -> [IndexPath]
    func numberOfRowInSection(section: Int) -> Int
    var numberOfSection: Int  {get}
    func cellIsActive(forIndexPath indexPath: IndexPath) -> Bool
    
    func addSubAttribute(forIndexPath indexPath: IndexPath)
    func removeSubAttribute(forIndexPath indexPath: IndexPath)

    func sectionIsMultiple(forIndexPath indexPath: IndexPath) -> Bool
}
