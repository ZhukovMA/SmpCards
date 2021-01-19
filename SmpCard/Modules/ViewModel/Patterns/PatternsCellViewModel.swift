//
//  File.swift
//  SMPCards
//
//  Created by Максим Жуков on 08.11.2020.
//  Copyright © 2020 Максим Жуков. All rights reserved.
//

import Foundation

class PatternsCellViewModel: PatternsCellViewModelType {
    var dataDiagnosis: String!
    
    var diagnosisCode: Int {
        return 0 // check
    }
    
    var diagnosis: String {
        return dataDiagnosis // check
    }
    
    init(dataDiagnosis: String?) {
        self.dataDiagnosis = dataDiagnosis
    }
}
