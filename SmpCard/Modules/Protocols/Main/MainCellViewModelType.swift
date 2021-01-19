//
//  CollectionViewCellViewModelType.swift
//  SMPCards
//
//  Created by Максим Жуков on 02.11.2020.
//  Copyright © 2020 Максим Жуков. All rights reserved.
//

import Foundation

protocol MainCellViewModelType {
    var numberOfCard: String? {get}
    
    var date: String? {get}
    
    var diagnosis:String? {get}
    
    var name: String? {get}
}
