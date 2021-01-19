//
//  a.swift
//  SMPCards
//
//  Created by Максим Жуков on 17.11.2020.
//  Copyright © 2020 Максим Жуков. All rights reserved.
//

import Foundation

class AdditionalSelectableCellViewModel: AdditionalSelectableCellViewModelType {
    
    
    var title: String?

    func getTitle() -> String? {
        return title
    }

    
    init(title: String?) {
        self.title = title
    }
}
