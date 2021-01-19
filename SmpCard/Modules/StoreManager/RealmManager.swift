//
//  StoreDataManager.swift
//  SmpCard
//
//  Created by Максим Жуков on 09.12.2020.
//  Copyright © 2020 SMP. All rights reserved.
//

import Foundation
import RealmSwift

class ManageObjects: Object {
    var objects = List<ManageObjectItem>()
}

class ManageObjectsHistory:  ManageObjects {}

class ManageObjectsPattern: ManageObjects {}

class  ManageObjectItem: Object {
    var id: String!
    var selectedData = List<SubAttributeClass>()
    var textData = List<DictItem>()
}

class DictItem: Object {
    @objc dynamic var key: SubAttributeClass? = SubAttributeClass()
    @objc dynamic var value = ""
}

class SubAttributeClass : Object {
    @objc dynamic var privateSubAttribute: String = ""
    var subAttribute: SubAttribute {
        get { return SubAttribute(rawValue: privateSubAttribute)! }
        set { privateSubAttribute = newValue.rawValue }
    }
}

protocol LocalStorage {
    func delete(completeData: CompleteData,  indexPathRow: Int)
    func updateStorage(selectedData: SelectedData)
    func fetch(selectedData: SelectedData)
    func create(completeData: CompleteData,  indexPathRow: Int?)
    func update(completeData: CompleteData,  indexPathRow: Int)
    func prepareForUpload(selectedData: SelectedData)
}

class RealmManager: LocalStorage {
    var storageType: StorageType
    let realmStorrageType: ManageObjects.Type
    
    func delete(completeData: CompleteData,  indexPathRow: Int) {
        autoreleasepool {
            let realm = try! Realm()
            let  storredData = realm.objects(realmStorrageType).first?.objects
            try! realm.write {
                storredData?.remove(at: indexPathRow)
            }
        }
    }
    
    private func clearStorage() {
        let realm = try! Realm()
        try! realm.write {
            realm.deleteAll()
        }
    }
    
    
    func updateStorage(selectedData: SelectedData) {
        let realm = try! Realm()
        let storredData = realm.objects(realmStorrageType).first?.objects
        if  storageType == .pattern && selectedData.data.count > 1 {
            try! realm.write {
                storredData?.removeAll()
            }
        } 
        autoreleasepool {
            selectedData.data.forEach { (completeDataItem) in
                if let date =  completeDataItem.completeTextData[.date] {
                    let object = storredData?.filter("ANY textData.value = %@", date).first
                    if object == nil {
                        self.create(completeData: completeDataItem)
                    }
                }
            }
        }
    }
    
    
    func create(completeData: CompleteData, indexPathRow: Int? = nil) {
        let manageObjectItem = ManageObjectItem()
        completeData.completeTextData.forEach { (key, value) in
            let dictItem = DictItem()
            let sa = SubAttributeClass()
            sa.subAttribute = key
            dictItem.key = sa
            dictItem.value = value
            manageObjectItem.textData.append(dictItem)
        }
        completeData.completeSelectableData.forEach { (subAttr) in
            let sac = SubAttributeClass()
            sac.subAttribute = subAttr
            manageObjectItem.selectedData.append(sac)
        }
        autoreleasepool {
            let realm = try! Realm()
            let storredData = realm.objects(realmStorrageType).first?.objects
            try! realm.write {
                if let data = storredData {
                    if let indxPath = indexPathRow {
                        data.insert(manageObjectItem, at: indxPath)
                    } else {
                        data.append(manageObjectItem)
                    }
                } else {
                    let newManageObject = realmStorrageType == ManageObjectsHistory.self ? ManageObjectsHistory() : ManageObjectsPattern()
                    newManageObject.objects.append(manageObjectItem)
                    realm.add(newManageObject)
                }
            }
        }
    }
    
    func update(completeData: CompleteData,  indexPathRow: Int) {
        delete(completeData: completeData,  indexPathRow: indexPathRow)
        create(completeData: completeData,  indexPathRow: indexPathRow)
    }
    
    func prepareForUpload(selectedData: SelectedData) {
        putSelectedData( selectedData: selectedData)
    }
    
    
    private func putSelectedData( selectedData: SelectedData) {
        let realm = try! Realm()
        let storredData = realm.objects(realmStorrageType).first?.objects
        storredData?.forEach { (manageObjectItem) in
            let completeData = CompleteData()
            manageObjectItem.id = completeData.id
            manageObjectItem.selectedData.forEach { (subAttributeClassItem) in
                completeData.completeSelectableData.insert(subAttributeClassItem.subAttribute)
            }
            manageObjectItem.textData.forEach { (dictItem) in
                if let subattr = dictItem.key {
                    completeData.completeTextData[subattr.subAttribute] = dictItem.value
                }
            }
            selectedData.data.append(completeData)
        }
    }
    
    
    func fetch(selectedData: SelectedData) {
        autoreleasepool {
            putSelectedData( selectedData: selectedData)
        }
    }
    
    init(withStorageType storageType: StorageType) {
        switch storageType {
        case .history:
            realmStorrageType = ManageObjectsHistory.self
        case .pattern:
            realmStorrageType = ManageObjectsPattern.self
        }
        self.storageType = storageType
    }
}
