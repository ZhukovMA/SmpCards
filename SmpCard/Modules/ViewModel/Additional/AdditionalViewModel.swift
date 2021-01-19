//
//  File.swift
//  SMPCards
//
//  Created by Максим Жуков on 16.11.2020.
//  Copyright © 2020 Максим Жуков. All rights reserved.
//

import Foundation

class AdditionalViewModel: AdditionalViewModelType  {

   
    var selectableAttribute: SelectableAttribute
    var completeData: CompleteData
    
    var numberOfSection: Int {
        return selectableAttribute.sections.count
    }
    
    func numberOfRowInSection(section: Int) -> Int {
        return selectableAttribute.sections[section].rows.count
    }
    
    var isAssistanceProvided:Bool {
        return selectableAttribute.attribute == .assistanceProvided
    }
  
    func getSelectedIndexPaths() -> [IndexPath] {
        var indexPaths = [IndexPath]()
        for sectionIndex in 0..<selectableAttribute.sections.count {
            for rowIndex in 0..<selectableAttribute.sections[sectionIndex].rows.count {
                if let row = selectableAttribute.sections[sectionIndex].rows[rowIndex] as? SelectRowOfSubattribute, row.isSelected {
                    indexPaths.append(IndexPath(row: rowIndex, section: sectionIndex))
                }
            }
        }
        return indexPaths
    }

    
    
    func cellIsActive(forIndexPath indexPath: IndexPath) -> Bool {
        guard let row = selectableAttribute.sections[indexPath.section].rows[indexPath.row] as? SelectRowOfSubattribute else { return false }
        return row.isSelected
    }
    
    func sectionIsMultiple(forIndexPath indexPath: IndexPath) -> Bool {
        return selectableAttribute.sections[indexPath.section].isMultiple
    }
    
    private func generateOutputString() {
        let outputString = DataManager.shared.getTextOfSelectableAttribute(completeData: completeData, selectableAttribute: selectableAttribute.attribute, forPreview: false)
        if selectableAttribute.attribute == .consumption {
            completeData.completeTextData[.expenditure] = outputString
        }
        selectableAttribute.attributeData = outputString
    }
    
    
    func sendCompleteData() {
        generateOutputString()
    }
    
    func addIndicatorItem() {
        if let _ = completeData.indicator {
            completeData.indicator!.append(IndicatorItem())
            if !completeData.indicator!.isEmpty {
                completeData.indicator![completeData.indicator!.count-1] =  completeData.indicator![completeData.indicator!.count - 2]
            }
        } else {
            completeData.indicator = [IndicatorItem]()
            completeData.indicator!.append(IndicatorItem())
        }
        selectableAttribute.sections = DataManager.shared.getSelectableSections(selectableAttribute: .assistanceProvided, completeData: completeData)
    }
      
    
    
    //MARK:- from controller
    
    func addSubAttribute(forIndexPath indexPath: IndexPath) {
        if var selectRow =  selectableAttribute.sections[indexPath.section].rows[indexPath.row] as? SelectRowOfSubattribute {
            selectRow.isSelected = true
            selectableAttribute.sections[indexPath.section].rows[indexPath.row] = selectRow
            completeData.completeSelectableData.insert(selectRow.subattribut)
        }
    }

    func removeSubAttribute(forIndexPath indexPath: IndexPath) {
        if var selectRow =  selectableAttribute.sections[indexPath.section].rows[indexPath.row] as? SelectRowOfSubattribute {
            selectRow.isSelected = false
            selectableAttribute.sections[indexPath.section].rows[indexPath.row] = selectRow
            completeData.completeSelectableData.remove(selectRow.subattribut)
        }
    }
    
    //MARK:- create cell viewModel
    
   
    
    func  cellViewModel(forIndexPath indexPath: IndexPath) -> AdditionalCell? {
        if let row = selectableAttribute.sections[indexPath.section].rows[indexPath.row] as? SelectRowOfSubattribute {
            return AdditionalSelectableCellViewModel(title: row.title)
        } else if let row = selectableAttribute.sections[indexPath.section].rows[indexPath.row] as? TextRowOfSubattribute {
            return AdditionalTextCellViewModel(textRow: row, completeData:  completeData, isNumberic: isNumberic(title: row.title))
        }
        return nil
    }
        
    init(selectableAttribute: SelectableAttribute, completeData: CompleteData) {
        self.selectableAttribute = selectableAttribute
        self.completeData = completeData
    }
    
}


extension AdditionalViewModel {
    private func isNumberic(title: String?) -> Bool {
           var isNumberic: Bool
           switch selectableAttribute.attribute {
           case .consumption, .perfomance:
               isNumberic = title != nil ? true : false
           default:
               isNumberic = false
           }
           return isNumberic
       }
}

