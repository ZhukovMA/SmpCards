//
//  PreviewViewModel.swift
//  SMPCards
//
//  Created by Максим Жуков on 12.11.2020.
//  Copyright © 2020 Максим Жуков. All rights reserved.
//

import Foundation

struct NextData {
    var dataWithFrame = [(FrameOfSubAttribute, String)]()
    var shouldReduce = false
}


class PreviewViewModel: PreviewViewModelType {
    func getTempFileURL() -> URL {
        return tempPDFUrl
    }
    
    
    private func addTheUnitsOfMeasurement(text: inout String, subAttr: SubAttribute) {
        switch subAttr {
        case  .chssAfterMedHelp, .chssBeforeMedHelp:
            text += "'"
        case  .chddBeforeMedHelp, .chddAfterMedHelp:
             text += "'"
        case  .spOAfterMedHelp, .spOBeforeMedHelp:
             text += "%"
        case  .adBeforeMedHelp, .adAfterMedHelp:
             text +=  " мм. рт. cт."
        case .tBeforeMedHelp, .tAfterMedHelp:
            text +=  "°С"
        case .pBeforeMedHelp, .pAfterMedHelp:
            text +=  "'"
        case .glukozaAfterMedHelp, .glukozaBeforeMedHelp:
             text +=  " ммоль/л"
        default:
            break
        }
    }
    
    
    private func shouldReduce(subAttribute: SubAttribute) -> Bool {
        if subAttribute == .adBeforeMedHelp ||
            subAttribute == .adAfterMedHelp ||
            subAttribute == .stomachIsNotPainful{
            return true
        }
        return false
    }
    
    var completeData: CompleteData!
    var tempPDFUrl: URL!
    
    func getNextDate() ->  NextData? {
        var nextData: NextData!
        if !completeData.completeSelectableData.isEmpty {
            if let data = completeData.completeSelectableData.first {
                nextData = NextData()
                if let frames = getFrames(data) {
                    frames.forEach { (frame) in
                        let fullText = getFullTextOfCompleteSelectableData(frame: frame, subAttribute: data)
                        nextData.dataWithFrame.append((frame, fullText))
                    }
                }
                completeData.completeSelectableData.remove(data)
            }
        } else if !completeData.completeTextData.isEmpty {
            if let data = completeData.completeTextData.first {
                nextData = NextData()
                nextData.shouldReduce = shouldReduce(subAttribute: data.key)
                if let frames = getFrames(data.key) {
                    frames.forEach { frame in
                        let fullText = getFullTextOfCompleteTextData(frame: frame, subAttribute: data.key, text: data.value)
                        nextData.dataWithFrame.append((frame, fullText))
                    }
                }
                completeData.completeTextData.removeValue(forKey: data.key)
            }
        }
        return nextData
    }
    
    private func getFrames(_ subattr: SubAttribute) -> [FrameOfSubAttribute]? {
        if let frame = DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: subattr, requestOfSubattributeData: .frame),
            let completeFrame = frame as? [FrameOfSubAttribute] {
            return completeFrame
        }
        return nil
    }
    
    private func getFullTextOfCompleteSelectableData(frame:FrameOfSubAttribute, subAttribute: SubAttribute) -> String {
        if subAttribute == .breathFeel || subAttribute == .breathNotFeel || subAttribute == .stomachIsNotPainful, let text = DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: subAttribute, requestOfSubattributeData: .title) as? String {
            return text
        } else {
            return "V"
        }
    }
    
    
    private func getFullTextOfCompleteTextData(frame:FrameOfSubAttribute, subAttribute: SubAttribute, text: String) -> String {
        var _text = String()
//        if subAttribute == .assistanceProvided {
//            _text += DataManager.shared.getTextOfSelectableAttribute(completeData: completeData, selectableAttribute: .assistanceProvided, forPreview: true)
//        } else {
            _text = getTextOfCompleteTextData(frame: frame, data: text)
//        }
        addTheUnitsOfMeasurement(text: &_text, subAttr: subAttribute)
        return _text
    }
    
    private func getTextOfCompleteTextData(frame: FrameOfSubAttribute, data: String) -> String {
        var text: String!
        if frame.isMain {
            text =  getParagraph(lenght: frame.paragraphLenght) + data
        } else {
            text = "V"
        }
        return text
    }
    
    private func getParagraph(lenght: Int) -> String {
        var paragraph = String()
        for _ in 0..<lenght {
            paragraph += " "
        }
        return paragraph
    }
    
    func getDocumentsDirectory() -> URL {
         let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
         return paths[0]
     }
    
    
    
    
     func getEmptyPDFUrl() -> URL {
        let url = Bundle.main.url(forResource: "document", withExtension: "pdf")!
        let fileManager = FileManager.default
        let path = getDocumentsDirectory().path + "/temp.pdf"
        if fileManager.fileExists(atPath: path) {
            removeFile(url: URL(fileURLWithPath: path))
        }
        let destination = getDocumentsDirectory().appendingPathComponent("temp.pdf", isDirectory: false)
        try? fileManager.copyItem(at: url, to: destination)
        tempPDFUrl = destination
        return destination
    }
   

    
    func handleDesapear() {
        removeFile(url: tempPDFUrl)
    }
    
    private func removeFile(url: URL) {
        let fileManager = FileManager.default
        try? fileManager.removeItem(at: url)
    }
    
    init(completeData: CompleteData) {
        self.completeData = CompleteData()
        self.completeData.completeSelectableData = completeData.completeSelectableData
        self.completeData.completeTextData = completeData.completeTextData
        self.completeData.indicator = completeData.indicator
    }
}
