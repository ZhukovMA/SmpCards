//
//  Pattern.swift
//  SMPCards
//
//  Created by Максим Жуков on 08.11.2020.
//  Copyright © 2020 Максим Жуков. All rights reserved.
//

import Foundation

protocol PatternsViewModelType {
    func fetchUpdatedData(completion: @escaping (_: StorrageResponse) -> Void) 
    func filterContentForSearchText(_ searchText: String, completion: @escaping (_ response: Result<String, Error>) -> Void)
    func fetchFromLocalStorrage(completion: @escaping (StorrageResponse) -> Void)
    var numberOfFilteredPatterns: Int {get}
    func fetchStorredData(completion: @escaping (_: StorrageResponse) -> Void)
    func deleteRecord(forIndexPath indexPath: IndexPath, completion: @escaping (StorrageResponse) -> Void)
    var delegate: PatternsViewModelDelegate? {get set}
    func cellViewModel(forIndexPath indexPath: IndexPath, isFiltering: Bool) -> PatternsCellViewModelType?
    var numberOfPatterns: Int {get}
    func emptyCardViewModel() -> CardViewModelType?
    func cardViewModel(forIndexPath indexPath: IndexPath, isFiltered: Bool) -> CardViewModelType?
}
