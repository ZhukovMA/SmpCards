//
//  StoreDataManager.swift
//  SmpCard
//
//  Created by Максим Жуков on 09.12.2020.
//  Copyright © 2020 SMP. All rights reserved.
//

import Foundation
import FirebaseFirestoreSwift

enum StorageType: String {
    case pattern
    case history
}

enum StorrageResponse {
    case cloudIsUnavailable
    case cloudComplete
    case realmIsEmpty
    case cloudFetchedData
    case success
    case realmComplete
}

protocol Storrable {
    func find( selectedData: SelectedData,  request: String, completion: @escaping (_ response: Result<String, Error>) -> Void)
    func fetch(selectedData: SelectedData, completion: @escaping (_ response: StorrageResponse) -> Void)
    func fetchFromLocalStorrage( selectedData: SelectedData, completion: @escaping (_ response: StorrageResponse) -> Void)
    func create(completeData: CompleteData)
    func update(completeData: CompleteData, indexPathRow: Int)
    func delete(completeData: CompleteData)
}

class StoreDataManager: Storrable {
    
    let queue = DispatchQueue(label: "background")
    var firestoreManager: CloudStorage!
    var realmManager: LocalStorage!
    
    func find(selectedData: SelectedData, request: String,  completion: @escaping (_ response: Result<String, Error>) -> Void) {
        queue.async {
            self.firestoreManager.find(selectedData: selectedData, letter: request, completion:  completion)
        }
    }
    
    func fetchFromLocalStorrage( selectedData: SelectedData, completion: @escaping (_ response: StorrageResponse) -> Void) {
        queue.async {
            let preCount = selectedData.data.count
            self.realmManager.fetch(selectedData: selectedData)
            let newCount = selectedData.data.count
            if selectedData.data.isEmpty {
                completion(.realmIsEmpty)
            } else if preCount == newCount {
                completion(.realmComplete)
            }  else {
                completion(.success)
            }
        }
    }
    
    func create(completeData: CompleteData) {
        queue.async {
            self.realmManager.create(completeData: completeData, indexPathRow: 0)
            self.firestoreManager.add(completeData: completeData)
        }
    }
    
    func update(completeData: CompleteData, indexPathRow: Int) {
        queue.async {
            self.realmManager.update(completeData: completeData,  indexPathRow: 0)
            self.firestoreManager.update(completeData: completeData)
        }
    }
    
    func delete(completeData: CompleteData) {
        queue.async {
            self.realmManager.delete(completeData: completeData,  indexPathRow: 0)
            self.firestoreManager.delete(completeData: completeData)
        }
    }
    
    //MARK:- Fetching from cloud with reload local storrage
    
    func fetch(selectedData: SelectedData,  completion: @escaping (_ response: StorrageResponse) -> Void) {
        let _selectedData = SelectedData()
        let lastId = selectedData.data.last?.id
        self.firestoreManager.fetch(selectedData: _selectedData, lastId: lastId) { result in
            switch result {
            case .success(_):
                if !_selectedData.data.isEmpty {
                    self.queue.async {
                        self.realmManager.updateStorage(selectedData: _selectedData)
                    }
                }
                selectedData.data += _selectedData.data
                if _selectedData.data.isEmpty {
                    completion(.cloudComplete)
                } else {
                    completion(.cloudFetchedData)
                }
            case .failure(_):
                completion(.cloudIsUnavailable)
            }
        }
    }
    
    
    init(withStorageType storageType: StorageType) {
        firestoreManager = FirestoreManager(withStorageType: storageType)
        realmManager = RealmManager(withStorageType: storageType)
    }
}

extension StoreDataManager {
    private func removeFile(url: URL) {
        let fileManager = FileManager.default
        try? fileManager.removeItem(at: url)
    }
    
    private func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
