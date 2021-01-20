//
//  File.swift
//  SMPCards
//
//  Created by Максим Жуков on 17.11.2020.
//  Copyright © 2020 Максим Жуков. All rights reserved.
//

import Foundation



class AdditionalTextCellViewModel: AdditionalTextCellViewModelType {
    var row: TextRowOfSubattribute
    var completeData: CompleteData
    var isNumberic: Bool
    

    func isNumbericKeyboard() -> Bool {
        return isNumberic
    }

    func getLimitOfText() -> Int? {
        return row.limit
    }
    
    private func correctPerfomanceText( text: inout String?) {
        guard let _ = text else {return}
        switch row.subattribut {
        case  .chssAfterMedHelp, .chssBeforeMedHelp, .chddBeforeMedHelp, .chddAfterMedHelp,  .spOAfterMedHelp, .spOBeforeMedHelp,  .adBeforeMedHelp, .adAfterMedHelp, .tBeforeMedHelp, .tAfterMedHelp, .pBeforeMedHelp, .pAfterMedHelp, .glukozaAfterMedHelp, .glukozaBeforeMedHelp, .timeIndicator, .tempIndicator, .aDtimeIndicator, .spoIndicator, .chddIndicator, .chssIndicator:
            adjustPerfomanceValue(text: &text!)
        default:
            break
        }
    }
    
    func adjustPerfomanceValue(text: inout String) {
          while !text.isEmpty {
              if text.last! < "0" || text.last! > "9" {
                  text.removeLast()
              } else {
                  break
              }
          }
      }
    
    func sendText(text:  String?, section: Int) {
        var currentText = text
        correctPerfomanceText(text: &currentText)
        switch row.subattribut {
        case .timeIndicator, .chssIndicator, .chddIndicator, .spoIndicator, .aDtimeIndicator, .tempIndicator:
            completeData.indicator?[section-1].data[row.subattribut] = currentText
        default:
             completeData.completeTextData[row.subattribut] = currentText
        }
        row.text = currentText
    }
    
    func getTitle() -> String {
        if let title = row.title {
            return  title
        }
         return  "Дополнительно"
    }
    
    func getText() -> String? {
        return row.text
    }
    
    init(textRow: TextRowOfSubattribute, completeData: CompleteData, isNumberic: Bool) {
        self.isNumberic = isNumberic
        self.row = textRow
        self.completeData = completeData
    }
}

