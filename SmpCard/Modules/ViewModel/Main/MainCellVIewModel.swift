//
//  CellVIewModel.swift
//  SMPCards
//
//  Created by Максим Жуков on 02.11.2020.
//  Copyright © 2020 Максим Жуков. All rights reserved.
//

import Foundation

class MainCellVIewModel: MainCellViewModelType {
    var profile: Profile
    
    
    var numberOfCard: String? {
        return profile.numberOfCard
    }
    
    var date: String? {
        var completeDate: String? =  profile.date
        if let date = completeDate, let millisecond = Double(date) {
            let date = Date(timeIntervalSince1970: TimeInterval(millisecond))
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd MMMM YYYY, HH:mm"
            dateFormatter.locale = Locale(identifier: "RU")
            completeDate = dateFormatter.string(from: date as Date)
        } 
        return completeDate
    }
    
    var diagnosis:String? {
        return profile.diagnosis
    }
    
    var name: String? {
        return profile.name
    }
    
    init(profile: Profile) {
        self.profile = profile
    }
}
