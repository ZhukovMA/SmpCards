//
//  CardViewControllerViewModelType.swift
//  SMPCards
//
//  Created by Максим Жуков on 03.11.2020.
//  Copyright © 2020 Максим Жуков. All rights reserved.
//

import Foundation

protocol CardViewModelType: AnyObject {
    var delegate: CardViewModelDelegate? {get set}
    func getTitle(forIndexPath indexPath: IndexPath) -> String?
    func returnData()
    func cellViewModel(forIndexPath indexPath: IndexPath) -> CardCellViewModelType?
    func previewViewModel() -> PreviewViewModelType?
    func additionalViewModel(forIndexPath indexPath: IndexPath) -> AdditionalViewModelType?
    func isDateCell(indexPath: IndexPath) -> Bool
    func isTextCell(indexPath: IndexPath) -> Bool
    var numberOfRow: Int  {get}
}
