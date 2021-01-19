//
//  CollectionViewModelType.swift
//  SMPCards
//
//  Created by Максим Жуков on 02.11.2020.
//  Copyright © 2020 Максим Жуков. All rights reserved.
//

import Foundation

protocol MainViewModelType {
 func fetchUpdatedData(completion: @escaping (_: StorrageResponse) -> Void)

    func signOut( completion: @escaping (_ response: Result<String, Error>) -> Void) 
    func fetchFromLocalStorrage(completion: @escaping (StorrageResponse) -> Void)
    func filterContentForSearchText(_ searchText: String, completion: @escaping (_ response: Result<String, Error>) -> Void)
    func deleteRecord(forIndexPath indexPath: IndexPath, completion: @escaping (StorrageResponse) -> Void)
    func fetchStorredData(completion: @escaping (_: StorrageResponse) -> Void)
    func cellViewModel(forIndexPath indexPath: IndexPath, isFiltering: Bool) -> MainCellViewModelType?
    func patternsViewModel() -> PatternsViewModelType?
    func cardViewModel(forIndexPath indexPath: IndexPath, isFiltered: Bool) -> CardViewModelType?
    var numberOfProfiles: Int { get }
    var numberOfFilteredProfiles: Int {get}

}
