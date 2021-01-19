//
//  FirestoreManager.swift
//  SmpCard
//
//  Created by Максим Жуков on 26.12.2020.
//  Copyright © 2020 SMP. All rights reserved.
//

import Foundation
import Firebase

protocol CloudStorage {
    func find( selectedData: SelectedData, letter: String, completion: @escaping (_ response: Result<String, Error>) -> Void)
    func delete(completeData: CompleteData)
    func update(completeData: CompleteData)
    func add(completeData: CompleteData)
    func fetch(selectedData: SelectedData, lastId: String?, completion: @escaping (_ response: Result<String, Error>) -> Void)
}

class FirestoreManager: CloudStorage {
    let firestore = Firestore.firestore()
    var storageType: StorageType
    
    func update(completeData: CompleteData) {
       add(completeData: completeData)
    }
    
    func delete(completeData: CompleteData) {
        if let currentUser = Auth.auth().currentUser?.uid, let id = completeData.id {
            firestore.collection("users/\(currentUser)/\(storageType.rawValue)").document(id).delete()
        }
    }
    
    func add(completeData: CompleteData) {
        do {
            if let currentUser = Auth.auth().currentUser?.uid, let id = completeData.id {
                try firestore.collection("users/\(currentUser)/\(storageType.rawValue)").document(id).setData(from: completeData)
            }
        } catch  {
            print(error.localizedDescription)
        }
    }
    
    private func nextLetter(str: inout String) {
        if let lastChar = str.unicodeScalars.last {
            let nextUnicode = lastChar.value + 1
            if let charactUnicode = UnicodeScalar(nextUnicode) {
                str.removeLast()
                str.append(Character(UnicodeScalar(charactUnicode)))
            }
        }
    }
    
    func find( selectedData: SelectedData, letter: String, completion: @escaping (_ response: Result<String, Error>) -> Void) {
        var _nextLetter = letter
        nextLetter(str: &_nextLetter)
        if let currentUser = Auth.auth().currentUser?.uid {
            let attribute = storageType == .history ? "name" : "diagnose"
            firestore.collection("users/\(currentUser)/\(storageType.rawValue)").whereField(attribute, isGreaterThanOrEqualTo: letter).whereField(attribute, isLessThan: _nextLetter).getDocuments { (query, error) in
                if let _error = error {
                    completion(.failure(_error))
                }
                guard let documents = query?.documents else {  return }
                selectedData.data = documents.compactMap { (query) -> CompleteData? in
                    return try? query.data(as: CompleteData.self)
                }
                completion(.success(""))
            }
        }
    }
    
    func fetch(selectedData: SelectedData, lastId: String?, completion: @escaping (_ response: Result<String, Error>) -> Void) {
        let _lastId = lastId ?? "?"
        if let currentUser = Auth.auth().currentUser?.uid {
            let descending = storageType == .history ? true : false
            firestore.collection("users/\(currentUser)/\(storageType.rawValue)").order(by: "id", descending: descending).start(after: [_lastId]).limit(to: 40).getDocuments { query, error in
                if let _error = error {
                    completion(.failure(_error))
                }
                guard let documents = query?.documents else { return }
                
                selectedData.data = documents.compactMap { (query) -> CompleteData? in
                    return try? query.data(as: CompleteData.self)
                }
                completion(.success(""))
            }
        }
    }
    
    init(withStorageType storageType: StorageType) {
        let settings = FirestoreSettings()
        settings.isPersistenceEnabled = false
        firestore.settings = settings
        self.storageType = storageType
    }
}
