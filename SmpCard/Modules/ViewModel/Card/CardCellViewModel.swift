//
//  CardCollectionViewCellViewModel.swift
//  SmpCard
//
//  Created by Maxim Zhukov on 20.02.2021.
//  Copyright © 2021 SMP. All rights reserved.
//

import Foundation

enum CardCellType {
    case text
    case selectable
    case table
}

class CardCellViewModel: CardCellViewModelType {

    var attribute = [Attribute]()
    
    weak var delegate: CardViewModelDelegate?
    var blockOfAttributes: BlockOfAttributes
    var completeData: CompleteData

    func numberOfRowInSection(section: Int) -> Int{
        return blockOfAttributes.attributes.count
    }

    func getTitle(forIndexPathRow indexPathRow: Int) -> String? {
        if let attr = blockOfAttributes.attributes[indexPathRow] as? SelectableAttribute {
            return attr.title
        }
        return nil
    }
    
    
    func isTextCell(indexPathRow: Int) -> Bool {
        if let _ = blockOfAttributes.attributes[indexPathRow] as? TextAttribute {
            return true
        }
        return false
    }
    
    func isDateCell(indexPathRow: Int) -> Bool {
         if let a = blockOfAttributes.attributes[indexPathRow] as? TextAttribute {
            return a.subattribut == .date ? true : false
         }
         return false
     }
    
    func getCellType(indexPathRow: Int) -> CardCellType {
        if let _ = blockOfAttributes.attributes[indexPathRow] as? SelectableAttribute {
            return .selectable
        } else if let _ = blockOfAttributes.attributes[indexPathRow] as? TextAttribute {
            return .text
        } else {
            return .table
        }
    }
    

    
    //MARK:- from additional controller
    
    func cellViewModel(forIndexPathRow indexPathRow: Int) -> CardTableViewCellViewModelType? {
        if let attribute = blockOfAttributes.attributes[indexPathRow] as? SelectableAttribute{
            return CardSelectableCellViewModel(selectableAttribute: attribute, completeData: completeData)
        } else if let attribute = blockOfAttributes.attributes[indexPathRow] as? TextAttribute {
            return CardTextCellViewModel(attribute: attribute, completeData : completeData)
        } else if let attribute = blockOfAttributes.attributes[indexPathRow] as? TableAttribute {
            return CardTableCellViewModel(attribute: attribute, completeData: completeData)
        } else{ return nil }
    }
    
    
    func previewViewModel() -> PreviewViewModelType? {
        return PreviewViewModel(completeData: completeData)
    }

    
    
    init(blockOfAttributes: BlockOfAttributes, completeData: CompleteData) {
        self.blockOfAttributes = blockOfAttributes
    
        self.completeData = completeData
    }
    

}
