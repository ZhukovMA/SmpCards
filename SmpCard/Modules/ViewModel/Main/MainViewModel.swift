//
//  ViewModel.swift
//  SMPCards
//
//  Created by Максим Жуков on 02.11.2020.
//  Copyright © 2020 Максим Жуков. All rights reserved.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct Profile {
    let numberOfCard:String?
    let date:String?
    let diagnosis:String?
    let name:String?
}

class SelectedData {
    var data = [CompleteData]()
}


class MainViewModel: MainViewModelType, PatternsViewModelDelegate, CardViewModelDelegate {
    
    var storrage: Storrable
    
    let storrageType = StorageType.history
    private var historyCompleteData = SelectedData()
    private var filteredProfiles = SelectedData()
    
    //MARK:- from CardViewModel
    
    func cardComplete(completeData: CompleteData, onRequest: Request) {
        completeData.name = completeData.completeTextData[.name]
        completeData.diagnose = completeData.completeTextData[.diagnose]
        switch onRequest {
        case .create:
            completeData.id = "\(Int64(Double(completeData.completeTextData[.date]!)!))" + "\(UUID().uuidString)"
            historyCompleteData.data.insert(completeData, at: 0)
            storrage.create(completeData: completeData)
        case .update:
            if let id = completeData.id {
                storrage.update(completeData: completeData, indexPathRow: getIndexPathRow(forCompleteDataID: id))
            }
        }
    }
    
    //MARK:- View Model
    
    func patternsViewModel() -> PatternsViewModelType? {
        return PatternsViewModel()
    }
    
    func cardViewModel(forIndexPath indexPath: IndexPath, isFiltered: Bool) -> CardViewModelType? {
        if isFiltered {
            return CardViewModel(completeData:  filteredProfiles.data[indexPath.row], request: .update, from: .main)
        }
        return CardViewModel(completeData:  historyCompleteData.data[indexPath.row], request: .update, from: .main)
    }
    
    func cellViewModel(forIndexPath indexPath: IndexPath, isFiltering: Bool) -> MainCellViewModelType?  {
        var numberOfCard:String?
        var date:String?
        var diagnosis:String?
        var name:String?
        
        //vvvvvvvvvvvvvvvvvvv
        if historyCompleteData.data[indexPath.row].indicator != nil {
            if historyCompleteData.data[indexPath.row].indicator!.count > 3 &&  historyCompleteData.data[indexPath.row].indicator![2].data.count > 3 {
            print(1)
            }
        }
        //^^^^^^^^^^^^^^^^^^^
        
        if let diagnosisInSelected = isFiltering ? filteredProfiles.data[indexPath.row].completeTextData[.diagnose] : historyCompleteData.data[indexPath.row].completeTextData[.diagnose] {
            diagnosis = diagnosisInSelected
        }
        if let dateInSelected = isFiltering ? filteredProfiles.data[indexPath.row].completeTextData[.date] :  historyCompleteData.data[indexPath.row].completeTextData[.date] {
            date = dateInSelected
        }
        if let numberOfCardInSelected =  isFiltering ? filteredProfiles.data[indexPath.row].completeTextData[.numberOfCard] : historyCompleteData.data[indexPath.row].completeTextData[.numberOfCard] {
            numberOfCard = numberOfCardInSelected
        }
        if let nameInSelected = isFiltering ? filteredProfiles.data[indexPath.row].completeTextData[.name] :  historyCompleteData.data[indexPath.row].completeTextData[.name] {
            name = nameInSelected
        }
        
        return MainCellVIewModel(profile: Profile(numberOfCard: numberOfCard, date: date, diagnosis: diagnosis, name: name))
    }
    
    //MARK:- Data Source
    
    var numberOfFilteredProfiles: Int {
        return filteredProfiles.data.count
    }
    
    var numberOfProfiles: Int {
        return  historyCompleteData.data.count
        
    }
    
    //MARK:- Store
    
    func fetchFromLocalStorrage(completion: @escaping (StorrageResponse) -> Void) {
        storrage.fetchFromLocalStorrage( selectedData: historyCompleteData, completion: completion)
    }
    
    func fetchStorredData(completion: @escaping (_: StorrageResponse) -> Void) {
        storrage.fetch(selectedData: historyCompleteData, completion: completion)
    }
    func fetchUpdatedData(completion: @escaping (StorrageResponse) -> Void) {
        let newData = SelectedData()
        storrage.fetch(selectedData: newData) { response in
            self.historyCompleteData = newData
            completion(response)
        }
    }
    
    func deleteRecord(forIndexPath indexPath: IndexPath, completion: @escaping (StorrageResponse) -> Void) {
        storrage.delete(completeData: historyCompleteData.data[indexPath.row])
        historyCompleteData.data.remove(at: indexPath.row)
        completion(.success)
    }
    
    //MARK:- Auth
  
    func signOut( completion: @escaping (_ response: Result<String, Error>) -> Void) {
        AuthService.shared.signOut(completion: completion)
    }
    
    //MARK:- init
    
    init() {
        storrage = StoreDataManager(withStorageType: storrageType)
    }
    
}

extension MainViewModel {
    
    func filterContentForSearchText(_ searchText: String, completion: @escaping (_ response: Result<String, Error>) -> Void) {
        filteredProfiles.data.removeAll()
        storrage.find( selectedData: filteredProfiles,  request: searchText, completion: completion)
    }
    
    private func getIndexPathRow(forCompleteDataID id: String) -> Int {
        for item in 0..<historyCompleteData.data.count {
            if historyCompleteData.data[item].id == id {
                return item
            }
        }
        return 0
    }
}
