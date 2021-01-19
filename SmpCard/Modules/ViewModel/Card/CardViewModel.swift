//
//  CardViewModel.swift
//  SMPCards
//
//  Created by Максим Жуков on 03.11.2020.
//  Copyright © 2020 Максим Жуков. All rights reserved.
//

import Foundation

enum From {
    case main
    case pattern
}

protocol CardViewModelDelegate: AnyObject {
    func cardComplete(completeData: CompleteData, onRequest: Request)
}




class CardViewModel: CardViewModelType  {
    
    weak var delegate: CardViewModelDelegate?
    var card: Card
    var completeData: CompleteData
    var currentRequest: Request
    
    var numberOfRow: Int {
        return card.attributes.count
    }

    func getTitle(forIndexPath indexPath: IndexPath) -> String? {
        if let attr = card.attributes[indexPath.row] as? SelectableAttribute {
            return attr.title
        }
        return nil
    }
    
    
    func isTextCell(indexPath: IndexPath) -> Bool {
        if let _ = card.attributes[indexPath.row] as? TextAttribute {
            return true
        }
        return false
    }
    
    func isDateCell(indexPath: IndexPath) -> Bool {
         if let a = card.profile[indexPath.row] as? TextAttribute {
            return a.subattribut == .date ? true : false
         }
         return false
     }
    
    

    
    //MARK:- from additional controller
    
    func cellViewModel(forIndexPath indexPath: IndexPath) -> CardCellViewModelType? {
        if indexPath.section == 0 {
            if let attribute = card.profile[indexPath.row] as? TextAttribute {
                return CardTextCellViewModel(attribute: attribute, completeData : completeData)
            }
        } else {
            if let attribute = card.attributes[indexPath.row] as? SelectableAttribute {
                if attribute.attribute == .perfomance {
                    return CardPerfomanceCellViewModel(attribute: attribute, completeData: completeData)
                }
                return CardSelectableCellViewModel(attribute: attribute, completeData: completeData)
            } else if let attribute = card.attributes[indexPath.row] as? TextAttribute {
                return CardTextCellViewModel(attribute: attribute, completeData : completeData)
            }
        }
        return nil
    }
    
    
    func additionalViewModel(forIndexPath indexPath: IndexPath) -> AdditionalViewModelType? {
        if let attribute = card.attributes[indexPath.row] as? SelectableAttribute {
            if !attribute.sections.isEmpty {
                return AdditionalViewModel(selectableAttribute: attribute, completeData: completeData)
            } else {
                let sections = DataManager.shared.getSelectableSections(selectableAttribute: attribute.attribute, completeData: completeData)
                attribute.sections = sections
                card.attributes[indexPath.row] = attribute
                return AdditionalViewModel(selectableAttribute: attribute, completeData: completeData)
            }
        } 
        return nil
    }
    
    
    func previewViewModel() -> PreviewViewModelType? {
        return PreviewViewModel(completeData: completeData)
    }
    
    func returnData() {
        delegate?.cardComplete(completeData: completeData, onRequest: currentRequest)
    }
    
    //MARK:- init
    
    init(completeData: CompleteData, request: Request, from: From) {
        self.currentRequest = request
        self.completeData = completeData
        switch from {
        case .pattern:
            let timeIntervalSince1970 = Date().timeIntervalSince1970
            self.completeData.completeTextData[.date] = String(timeIntervalSince1970)
        default:
            break
        }
        self.card = Card(completeData: self.completeData)
        
    }
}


extension Date {
    var unixTime: Int64 {
        return Int64(self.timeIntervalSince1970 * 100000)
    }
}

