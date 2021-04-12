//
//  File.swift
//  SMPCards
//
//  Created by Максим Жуков on 06.11.2020.
//  Copyright © 2020 Максим Жуков. All rights reserved.
//

import Foundation


protocol PatternsViewModelDelegate: AnyObject {
    func cardComplete(completeData: CompleteData, onRequest: Request)
}

enum Request {
    case create
    case update
}


class PatternsViewModel: PatternsViewModelType, CardViewModelDelegate {

    var storrage: Storrable

    let storrageType = StorageType.pattern
    weak var delegate: PatternsViewModelDelegate?
    var pattensCompleteData = SelectedData()
    private var filteredPatterns = SelectedData()
    
    //MARK:- Data Source
    
    var numberOfPatterns: Int {
        return pattensCompleteData.data.count
    }
    
    
    
    var numberOfFilteredPatterns: Int  {
        return filteredPatterns.data.count
    }
    
    //MARK:- from CardViewModel
    
    func cardComplete(completeData: CompleteData, onRequest: Request) {
        completeData.name = completeData.completeTextData[.name]
        completeData.diagnose = completeData.completeTextData[.diagnose]
        switch onRequest {
        case .create:
            delegate?.cardComplete(completeData: CompleteData(completeTextData: completeData.completeTextData, completeSelectableData: completeData.completeSelectableData, indicator: completeData.indicator),
                    onRequest: .create)
            if let _ = completeData.completeTextData[.diagnose], !isContainDiagnosis(completeData: completeData) {
                completeData.id = "\(completeData.completeTextData[.diagnose]!)" + "\(UUID().uuidString)"
                pattensCompleteData.data.append(completeData)
                storrage.create(completeData: completeData)
            }
        case .update:
            if let id = completeData.id {
                storrage.update(completeData: completeData, indexPathRow: getIndexPathRow(forCompleteDataID: id))
            }
        }
        
    }
   
    //MARK:- Store

    func fetchFromLocalStorrage(completion: @escaping (StorrageResponse) -> Void) {
        storrage.fetchFromLocalStorrage( selectedData: pattensCompleteData, completion: completion)
    }
    
    func fetchStorredData(completion: @escaping (_: StorrageResponse) -> Void) {
        storrage.fetch(selectedData: pattensCompleteData, completion: completion)
    }
    
    func fetchUpdatedData(completion: @escaping (_: StorrageResponse) -> Void) {
        let newData = SelectedData()
        storrage.fetch(selectedData: newData) { response in
            self.pattensCompleteData = newData
            completion(response)
        }
    }
    
   func deleteRecord(forIndexPath indexPath: IndexPath, completion: @escaping (StorrageResponse) -> Void) {
        storrage.delete(completeData: pattensCompleteData.data[indexPath.row])
        pattensCompleteData.data.remove(at: indexPath.row)
        completion(.success)
    }
    
    //MARK:- View Model

    func emptyCardViewModel() -> CardViewModelType? {
        return CardViewModel(completeData: CompleteData(), request: .create, from: .pattern)
    }
    
    func cardViewModel(forIndexPath indexPath: IndexPath, isFiltered: Bool, request: Request) -> CardViewModelType? {
        if isFiltered {
            return CardViewModel(completeData:  filteredPatterns.data[indexPath.row], request: request, from: .pattern)
        }
        return CardViewModel(completeData:  pattensCompleteData.data[indexPath.row], request: request, from: .pattern)
    }
    
    func cellViewModel(forIndexPath indexPath: IndexPath, isFiltering: Bool) -> PatternsCellViewModelType? {
        if let diagnosis = isFiltering ? filteredPatterns.data[indexPath.row].completeTextData[.diagnose] : pattensCompleteData.data[indexPath.row].completeTextData[.diagnose] {
            return PatternsCellViewModel(dataDiagnosis: diagnosis)
        }
        return nil
    }
    
    //MARK:- init

    init() {
        storrage = StoreDataManager(withStorageType: storrageType)
    }
}

extension PatternsViewModel {
    private func isContainDiagnosis(completeData: CompleteData) -> Bool {
        var result = false
        pattensCompleteData.data.forEach { (completeDataItem) in
            let diagnosis = completeData.completeTextData[.diagnose]
            let currentDianosis = completeDataItem.completeTextData[.diagnose]
            if diagnosis?.lowercased()  == currentDianosis?.lowercased() {
                result = true
            }
        }
        return result
    }
    
    func filterContentForSearchText(_ searchText: String, completion: @escaping (_ response: Result<String, Error>) -> Void) {
        filteredPatterns.data.removeAll()
        storrage.find( selectedData: filteredPatterns,  request: searchText, completion: completion)
    }
    
    private func getIndexPathRow(forCompleteDataID id: String) -> Int {
        for item in 0..<pattensCompleteData.data.count {
            if pattensCompleteData.data[item].id == id {
                return item
            }
        }
        return 0
    }
}
