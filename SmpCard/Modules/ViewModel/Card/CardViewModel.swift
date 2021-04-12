//
//  CardView§Model.swift
//  SmpCard
//
//  Created by Maxim Zhukov on 20.02.2021.
//  Copyright © 2021 SMP. All rights reserved.
//

import Foundation

enum From {
    case main
    case pattern
}

protocol CardViewModelDelegate: AnyObject {
    func cardComplete(completeData: CompleteData, onRequest: Request)
}


class CardViewModel: CardViewModelType {
    
    weak var delegate: CardViewModelDelegate?
    var card: Card
    var completeData: CompleteData
    var currentRequest: Request
    
    //MARK:- from additional controller
    
    func cellViewModel(forIndexPath indexPath: Int) -> CardCellViewModelType? {
        return CardCellViewModel(blockOfAttributes: card.blocksOfAttributes[indexPath], completeData: completeData)
        
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
        if from == .pattern {
            let timeIntervalSince1970 = Date().timeIntervalSince1970
            self.completeData.completeTextData[.date] = String(timeIntervalSince1970)
        }
        self.card = Card(completeData: self.completeData)
    }
}

extension Date {
    var unixTime: Int64 {
        return Int64(self.timeIntervalSince1970 * 100000)
    }
}
