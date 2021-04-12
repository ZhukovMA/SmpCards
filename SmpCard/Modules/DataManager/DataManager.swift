//
//  File.swift
//  SMPCards
//
//  Created by Максим Жуков on 23.11.2020.
//  Copyright © 2020 Максим Жуков. All rights reserved.
//

import Foundation

enum SelectableAttributeEnum {
    case gotSick
    case condition
    case consciousness
    case position
    case skin
    case rash
    case edema
    case behavior
    case pupils
    case reactionToLight
    case nystagm
    case meningealSymptom
    case focalSymptoms
    case breath
    case separatedFromNasalPassages
    case dyspnea
    case percussionSound
    case auscultationBreath
    case rale
    case pleuralFrictionNoise
    case heartTones
    case noise
    case noiseOfFrictionPericard
    case tongue
    case stomach
    case positiveSymptom
    case dyspepsia
    case chair
    case diuresis
    case perfomance
//    case assistanceProvided
    case additionalAction
    case consumption
    case indicator
}



class DataManager {
    static let shared = DataManager()
    
    func getTextOfSelectableAttribute(completeData: CompleteData, selectableAttribute: SelectableAttributeEnum, forPreview: Bool) -> String {
        var result = String()
//        let sections = getSubattributesOfSection(selectableAttribute: selectableAttribute)
//        sections?.selectableValues.forEach { (subAttribute) in
//            if  completeData.completeSelectableData.contains(subAttribute),
//                let title = DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: subAttribute, requestOfSubattributeData: .title) as? String {
//                if result.isEmpty {
//                    result += title
//                } else {
//                    result += ", \(title)"
//                }
//            }
//        }
//        sections?.textValues.forEach({ (subAttribute) in
//            if  let text = completeData.completeTextData[subAttribute] {
//                if let title = DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: subAttribute, requestOfSubattributeData: .title) as? String {
//                    if result.isEmpty {
//                        result += title + ": " + text
//                    } else  {
//                        result += ", " + title + ": "  + text
//                    }
//                } else {
//                    if result.isEmpty {
//                        result += text
//                    } else  {
//                        result += ", \(text)"
//                    }
//                }
//            }
//            if subAttribute == .assistanceProvided {
//                if let indicator = completeData.indicator, !completeData.indicatorIsEmpty {
//                    result += "\n"
//                    result += "Время\t\tАД\t\tЧСС\tЧДД\tSpO₂\tT°C\n"
//                    indicator.forEach { indicatorItem in
//                        if !indicatorItem.data.isEmpty {
//                            getIndicatorsText(indicatorItem: indicatorItem, result: &result, forPreview: forPreview)
//                        }
//                    }
//                }
//            }
//        })
        return result
    }
    
    private func getIndicatorsText(indicatorItem: IndicatorItem, result: inout String, forPreview: Bool) {
        var time: String?
        var ad:String?
        var chdd:String?
        var chss:String?
        var spo:String?
        var temp:String?
        if let _time = indicatorItem.data[.timeIndicator] {
            time = _time
        }
        if let _ad = indicatorItem.data[.aDtimeIndicator] {
            ad = _ad + (forPreview ? "мм. рт. ст." : "")
        }
        if let _chss = indicatorItem.data[.chssIndicator] {
            chss = _chss + (forPreview ? "'" : "")
        }
        if let _chdd = indicatorItem.data[.chddIndicator] {
            chdd = _chdd + (forPreview ? "'" : "")
        }
        if let _spo = indicatorItem.data[.spoIndicator] {
            spo = _spo + (forPreview ? "%" : "")
        }
        if let _temp = indicatorItem.data[.tempIndicator] {
            temp = _temp + (forPreview ?  "°C" : "")
        }
        result += "\(time ?? "\t")\t   \(ad ?? "\t")\t \(chss ?? "\t")   \t \(chdd ?? "\t")    \t \(spo ?? "\t")   \t\(temp ?? "    ")\n"
    }
    
    
    
    
    func makeTable(tableAttribute: TableAttribute, completeData: CompleteData) {
        var  table = [[SubAttribute]]()
        switch tableAttribute.attribute {
        case .perfomance:
            let rowTitle  = ["Ад/мм.рт.ст.","ЧСС/мин.","Р/мин.", "ЧДД/мин.", "Т/С", "SpO/%", "Глюкоза/ммоль/л"]
            tableAttribute.table.rowsTitle = rowTitle
            let columnsTitles = ["До", "После"]
            tableAttribute.table.columnsTitle = columnsTitles
            tableAttribute.table.data = Array(repeating: Array(repeating: TextRowOfSubattribute(), count: columnsTitles.count), count: rowTitle.count)
            table.append( [.adBeforeMedHelp, .adAfterMedHelp])
            table.append( [.chssBeforeMedHelp, .chssAfterMedHelp])
            table.append( [.pBeforeMedHelp, .pAfterMedHelp,])
            table.append([.chddBeforeMedHelp,.chddAfterMedHelp])
            table.append([.tBeforeMedHelp, .tAfterMedHelp])
            table.append([.spOBeforeMedHelp, .spOAfterMedHelp])
            table.append([.glukozaBeforeMedHelp, .glukozaAfterMedHelp])
        case .consumption:
            let rowTitle = ["Маски","Перчатки.","Салфетки", "Шприц", "СИЗ", "Катетер Переферический", "Бинты", "Глюкометрия", "Инфузионная система"]
            tableAttribute.table.rowsTitle = rowTitle
            let columnsTitles = [ "количество"]
            tableAttribute.table.columnsTitle = columnsTitles
            tableAttribute.additionalData = makeTextRow(subAttribute: .consumptionText, completeData: completeData)
            tableAttribute.table.data = Array(repeating: Array(repeating: TextRowOfSubattribute(), count: 1), count: rowTitle.count)
            let rows: [SubAttribute] = [.masks, .gloves, .syringe, .siz, .catheterPerefirichesky, .catheterUrinary, .bandages, .infusionSystem,]
            rows.forEach {
                table.append([$0])
            }
                                                                                                                
        case .indicator:
            let columnsTitles = ["Время", "Ад", "ЧСС", "ЧДД", "SpO", "T"]
            tableAttribute.table.columnsTitle = columnsTitles
            let indicatorColumns: [SubAttribute] = [.timeIndicator, .aDtimeIndicator, .chssIndicator, .chddIndicator, .spoIndicator, .tempIndicator,]
            let numberOfRow =  completeData.indicator?.count ?? 1
            tableAttribute.table.data = Array(repeating: Array(repeating: TextRowOfSubattribute(), count: indicatorColumns.count), count: numberOfRow)
            guard let indicator = completeData.indicator  else { return }
            for indicatorIndex in 0..<indicator.count {
                if !indicator[indicatorIndex].data.isEmpty {
                    for colIndex in 0..<indicatorColumns.count {
                        tableAttribute.table.data[indicatorIndex][colIndex] = makeTextRow(subAttribute: indicatorColumns[colIndex], completeData: completeData)
                    }
                }
            }
            return
        default:
            return
        }
        for  rowIndex in 0..<table.count {
            for columnsIndex in 0..<table.first!.count {
                tableAttribute.table.data[rowIndex][columnsIndex] = makeTextRow(subAttribute: table[rowIndex][columnsIndex], completeData: completeData)
            }
        }
    }


    
    func getSelectableRows(selectableAttribute: SelectableAttributeEnum, completeData: CompleteData) -> (SelectRowsOfSubattribute, TextRowOfSubattribute?) {
        let selectRows = SelectRowsOfSubattribute()
        var textRow: TextRowOfSubattribute?
        switch selectableAttribute {
        case .gotSick:
            selectRows.data.append(makeSelectableRow(subAttribute: .gotSickBeforeAnHour, completeData: completeData))
            selectRows.data.append(makeSelectableRow(subAttribute: .gotSick1_3Hours, completeData: completeData))
            selectRows.data.append(makeSelectableRow(subAttribute: .gotSick3_6Hours, completeData: completeData))
            selectRows.data.append(makeSelectableRow(subAttribute: .gotSick6_12Hours, completeData: completeData))
            selectRows.data.append(makeSelectableRow(subAttribute: .gotSickMoreADay, completeData: completeData))
        case .condition:
            selectRows.data.append(makeSelectableRow(subAttribute: .conditionIsSatisfactory, completeData: completeData))
            selectRows.data.append(makeSelectableRow(subAttribute: .conditionIsOfModerateSeverity, completeData: completeData))
            selectRows.data.append(makeSelectableRow(subAttribute: .conditionIsHeavy, completeData: completeData))
            selectRows.data.append(makeSelectableRow(subAttribute: .conditionIsTerminal, completeData: completeData))
            selectRows.data.append(makeSelectableRow(subAttribute: .conditionIsDeath, completeData: completeData))
        case .consciousness:
            selectRows.data.append(makeSelectableRow(subAttribute: .consciousnessIsClear, completeData: completeData))
            selectRows.data.append(makeSelectableRow(subAttribute: .consciousnessIsStunning, completeData: completeData))
            selectRows.data.append(makeSelectableRow(subAttribute: .consciousnessIsSopor, completeData: completeData))
            selectRows.data.append(makeSelectableRow(subAttribute: .consciousnessIsComa1, completeData: completeData))
            selectRows.data.append(makeSelectableRow(subAttribute: .consciousnessIsComa2, completeData: completeData))
            selectRows.data.append(makeSelectableRow(subAttribute: .consciousnessIsComa3, completeData: completeData))
        case .position:
            selectRows.data.append(makeSelectableRow(subAttribute: .positionIsActive, completeData: completeData))
            selectRows.data.append(makeSelectableRow(subAttribute: .positionIsPassive, completeData: completeData))
            selectRows.data.append(makeSelectableRow(subAttribute: .positionIsForced, completeData: completeData))
            textRow = makeTextRow(subAttribute: .positionText, completeData: completeData, limit: 10)
        case .skin:
            selectRows.data.append(makeSelectableRow(subAttribute: .skinIsDry, completeData: completeData))
            selectRows.data.append(makeSelectableRow(subAttribute: .skinIsWet, completeData: completeData))
            selectRows.data.append(makeSelectableRow(subAttribute: .skinIsWarm, completeData: completeData))
            selectRows.data.append(makeSelectableRow(subAttribute: .skinIsCold, completeData: completeData))
            selectRows.data.append(makeSelectableRow(subAttribute: .skinIsPhisiologicalColor, completeData: completeData))
            selectRows.data.append(makeSelectableRow(subAttribute: .skinIsPale, completeData: completeData))
            selectRows.data.append(makeSelectableRow(subAttribute: .skinIsHyperemic, completeData: completeData))
            selectRows.data.append(makeSelectableRow(subAttribute: .skinIsCyanotic, completeData: completeData))
            selectRows.data.append(makeSelectableRow(subAttribute: .skinIsJaundice, completeData: completeData))
            selectRows.data.append(makeSelectableRow(subAttribute: .skinIsAcrocyanosis, completeData: completeData))
            selectRows.data.append(makeSelectableRow(subAttribute: .skinIsMarbling, completeData: completeData))
        case .rash:
            selectRows.data.append(makeSelectableRow(subAttribute: .hasNotRash, completeData: completeData))
            selectRows.data.append(makeSelectableRow(subAttribute: .hasRash, completeData: completeData))
            textRow = makeTextRow(subAttribute: .rashText, completeData: completeData, limit: 33)
        case .edema:
            selectRows.data.append(makeSelectableRow(subAttribute: .hasNotEdema, completeData: completeData))
            selectRows.data.append(makeSelectableRow(subAttribute: .hasEdema, completeData: completeData))
           textRow = makeTextRow(subAttribute: .edemaText, completeData: completeData, limit: 28)
        case .behavior:
            selectRows.data.append(makeSelectableRow(subAttribute: .behaviorIsCalm, completeData: completeData))
            selectRows.data.append(makeSelectableRow(subAttribute: .behaviorIsAgitated, completeData: completeData))
            selectRows.data.append(makeSelectableRow(subAttribute: .behaviorIsAggressive, completeData: completeData))
            selectRows.data.append(makeSelectableRow(subAttribute: .behaviorIsDepressive, completeData: completeData))
            selectRows.data.append(makeSelectableRow(subAttribute: .behaviorIsKontacten, completeData: completeData))
            selectRows.data.append(makeSelectableRow(subAttribute: .behaviorIsNotKontacten, completeData: completeData))
            selectRows.data.append(makeSelectableRow(subAttribute: .behaviorIsAmnesia, completeData: completeData))
            selectRows.data.append(makeSelectableRow(subAttribute: .behaviorIsataxia, completeData: completeData))
        case .pupils:
            selectRows.data.append(makeSelectableRow(subAttribute: .pupilsIsODIsEqualOS, completeData: completeData))
            selectRows.data.append(makeSelectableRow(subAttribute: .pupilsIsODIsNotEqualOS, completeData: completeData))
            selectRows.data.append(makeSelectableRow(subAttribute: .pupilsIsNormal, completeData: completeData))
            selectRows.data.append(makeSelectableRow(subAttribute: .pupilsIsWide, completeData: completeData))
            selectRows.data.append(makeSelectableRow(subAttribute: .pupilsIsNarrow, completeData: completeData))
            selectRows.data.append(makeSelectableRow(subAttribute: .pupilsIsAnisocoria, completeData: completeData))
        case .reactionToLight:
            selectRows.data.append(makeSelectableRow(subAttribute: .reactionToLightIsAlive, completeData: completeData))
            selectRows.data.append(makeSelectableRow(subAttribute: .reactionToLightIsHoly, completeData: completeData))
            selectRows.data.append(makeSelectableRow(subAttribute: .reactionToLightIsNone, completeData: completeData))
        case .nystagm :
            selectRows.data.append(makeSelectableRow(subAttribute: .hasNotNystagm, completeData: completeData))
            selectRows.data.append(makeSelectableRow(subAttribute: .hasNystagm, completeData: completeData))
           textRow = makeTextRow(subAttribute: .nystagmText, completeData: completeData, limit: 15)
        case .meningealSymptom:
            selectRows.data.append(makeSelectableRow(subAttribute: .hasNotMeningealSymptom, completeData: completeData))
            selectRows.data.append(makeSelectableRow(subAttribute: .regedivnostZatilochnihMuscle, completeData: completeData))
            selectRows.data.append(makeSelectableRow(subAttribute: .kernig, completeData: completeData))
            selectRows.data.append(makeSelectableRow(subAttribute: .brudzinski, completeData: completeData))
        case .focalSymptoms:
            selectRows.data.append(makeSelectableRow(subAttribute: .hasNotFocalSymptoms, completeData: completeData))
            selectRows.data.append(makeSelectableRow(subAttribute: .hasFocalSymptoms, completeData: completeData))
           textRow = makeTextRow(subAttribute: .focalSymptomsText, completeData: completeData, limit: 117)
        case .breath:
            selectRows.data.append(makeSelectableRow(subAttribute: .breathFeel, completeData: completeData))
            selectRows.data.append(makeSelectableRow(subAttribute: .breathNotFeel, completeData: completeData))
        case .separatedFromNasalPassages:
            selectRows.data.append(makeSelectableRow(subAttribute: .hasNotSeparatedFromNasalPassages, completeData: completeData))
            selectRows.data.append(makeSelectableRow(subAttribute: .hasSeparatedFromNasalPassages, completeData: completeData))
        case .dyspnea:
            selectRows.data.append(makeSelectableRow(subAttribute: .dyspneaIsInspiratory, completeData: completeData))
            selectRows.data.append(makeSelectableRow(subAttribute: .dyspneaIsExpiratory, completeData: completeData))
            selectRows.data.append(makeSelectableRow(subAttribute: .dyspneaIsmixed, completeData: completeData))
            selectRows.data.append(makeSelectableRow(subAttribute: .dyspneaIsPotalogic, completeData: completeData))
        case .percussionSound:
            selectRows.data.append(makeSelectableRow(subAttribute: .percussionSoundIsPulmonary, completeData: completeData))
            selectRows.data.append(makeSelectableRow(subAttribute: .percussionSoundIsShortened, completeData: completeData))
            selectRows.data.append(makeSelectableRow(subAttribute: .percussionSoundIsTympanic, completeData: completeData))
            selectRows.data.append(makeSelectableRow(subAttribute: .percussionSoundIsDull, completeData: completeData))
            selectRows.data.append(makeSelectableRow(subAttribute: .percussionSoundIsBoxboardAbove, completeData: completeData))
           textRow = makeTextRow(subAttribute: .percussionSoundText, completeData: completeData, limit: 21)
        case .auscultationBreath :
            selectRows.data.append(makeSelectableRow(subAttribute: .auscultationBreathIsPuerile, completeData: completeData))
            selectRows.data.append(makeSelectableRow(subAttribute: .auscultationBreathIsVesicular, completeData: completeData))
            selectRows.data.append(makeSelectableRow(subAttribute: .auscultationBreathIsBronchial, completeData: completeData))
            selectRows.data.append(makeSelectableRow(subAttribute: .auscultationBreathIsHard, completeData: completeData))
            selectRows.data.append(makeSelectableRow(subAttribute: .auscultationBreathIsTenatic, completeData: completeData))
            selectRows.data.append(makeSelectableRow(subAttribute: .auscultationBreathIsWeakened, completeData: completeData))
            selectRows.data.append(makeSelectableRow(subAttribute: .auscultationBreathNone, completeData: completeData))
           textRow = makeTextRow(subAttribute: .auscultationBreathText, completeData: completeData, limit: 21)
        case .rale:
            selectRows.data.append(makeSelectableRow(subAttribute: .hasNotRale, completeData: completeData))
            selectRows.data.append(makeSelectableRow(subAttribute: .dryRale, completeData: completeData))
            selectRows.data.append(makeSelectableRow(subAttribute: .wetRaleSmallbubble, completeData: completeData))
            selectRows.data.append(makeSelectableRow(subAttribute: .wetRaleMediumbubble, completeData: completeData))
            selectRows.data.append(makeSelectableRow(subAttribute: .wetRaleLargebubble, completeData: completeData))
           textRow = makeTextRow(subAttribute: .raleText, completeData: completeData, limit: 24)
        case .pleuralFrictionNoise:
            selectRows.data.append(makeSelectableRow(subAttribute: .hasNotPleuralFrictionNoise, completeData: completeData))
            selectRows.data.append(makeSelectableRow(subAttribute: .hasPleuralFrictionNoise, completeData: completeData))
        case .heartTones:
            selectRows.data.append(makeSelectableRow(subAttribute: .heartTonesIsResonant, completeData: completeData))
            selectRows.data.append(makeSelectableRow(subAttribute: .heartTonesIsPriglasheny, completeData: completeData))
            selectRows.data.append(makeSelectableRow(subAttribute: .heartTonesIsDeaf, completeData: completeData))
        case .noise:
            selectRows.data.append(makeSelectableRow(subAttribute: .noiseIsSystolic, completeData: completeData))
            selectRows.data.append(makeSelectableRow(subAttribute: .noiseIsDiastolic, completeData: completeData))
            selectRows.data.append(makeSelectableRow(subAttribute: .noiseIsAccent, completeData: completeData))
           textRow = makeTextRow(subAttribute: .noiseText, completeData: completeData, limit: 17)
        case .noiseOfFrictionPericard:
            selectRows.data.append(makeSelectableRow(subAttribute: .hasNotNoiseOfFrictionPericard, completeData: completeData))
            selectRows.data.append(makeSelectableRow(subAttribute: .hasNoiseOfFrictionPericard, completeData: completeData))
        case .tongue:
            selectRows.data.append(makeSelectableRow(subAttribute: .tongueIsWet, completeData: completeData))
            selectRows.data.append(makeSelectableRow(subAttribute: .tongueIsDry, completeData: completeData))
            selectRows.data.append(makeSelectableRow(subAttribute: .tongueIsOverlaid, completeData: completeData))
           textRow = makeTextRow(subAttribute: .tongueText, completeData: completeData, limit: 18)
        case .stomach:
            selectRows.data.append(makeSelectableRow(subAttribute: .stomachIsSoft, completeData: completeData))
            selectRows.data.append(makeSelectableRow(subAttribute: .stomachIsTense, completeData: completeData))
            selectRows.data.append(makeSelectableRow(subAttribute: .stomachIsPainful, completeData: completeData))
            selectRows.data.append(makeSelectableRow(subAttribute: .stomachIsNotPainful, completeData: completeData))
           textRow = makeTextRow(subAttribute: .stomachText, completeData: completeData, limit: 57)
        case .positiveSymptom:
            selectRows.data.append(makeSelectableRow(subAttribute: .positiveSymptomOfSpijarski, completeData: completeData))
            selectRows.data.append(makeSelectableRow(subAttribute: .positiveSymptomOfRazdolsky, completeData: completeData))
            selectRows.data.append(makeSelectableRow(subAttribute: .positiveSymptomOfObraztsov, completeData: completeData))
            selectRows.data.append(makeSelectableRow(subAttribute: .positiveSymptomOfSidkovskogo, completeData: completeData))
            selectRows.data.append(makeSelectableRow(subAttribute: .positiveSymptomRovsinga, completeData: completeData))
            selectRows.data.append(makeSelectableRow(subAttribute: .positiveSymptomOfShchetkinBlumberg, completeData: completeData))
            selectRows.data.append(makeSelectableRow(subAttribute: .positiveSymptomOfRozanov, completeData: completeData))
            selectRows.data.append(makeSelectableRow(subAttribute: .positiveSymptomMerphy, completeData: completeData))
            selectRows.data.append(makeSelectableRow(subAttribute: .positiveSymptomOfOrtner, completeData: completeData))
            selectRows.data.append(makeSelectableRow(subAttribute: .positiveSymptomOfGrekov, completeData: completeData))
            selectRows.data.append(makeSelectableRow(subAttribute: .positiveSymptomOfMayoRobson, completeData: completeData))
            selectRows.data.append(makeSelectableRow(subAttribute: .positiveSymptomOfValya, completeData: completeData))
            selectRows.data.append(makeSelectableRow(subAttribute: .positiveSymptomOfSklyarov, completeData: completeData))
        case .dyspepsia:
            selectRows.data.append(makeSelectableRow(subAttribute: .dyspepsiaNausea, completeData: completeData))
            selectRows.data.append(makeSelectableRow(subAttribute: .dyspepsiaVomiting, completeData: completeData))
           textRow = makeTextRow(subAttribute: .dyspepsiaText, completeData: completeData, limit: 12)
        case .chair:
            selectRows.data.append(makeSelectableRow(subAttribute: .chairIsFormed, completeData: completeData))
            selectRows.data.append(makeSelectableRow(subAttribute: .chairIsZapor, completeData: completeData))
            selectRows.data.append(makeSelectableRow(subAttribute: .chairIsLiquid, completeData: completeData))
           textRow = makeTextRow(subAttribute: .chairText, completeData: completeData, limit: 37)
        case .diuresis:
            selectRows.data.append(makeSelectableRow(subAttribute: .diuresisIsSufficient, completeData: completeData))
            selectRows.data.append(makeSelectableRow(subAttribute: .diuresisIsreduced, completeData: completeData))
            selectRows.data.append(makeSelectableRow(subAttribute: .diuresisIspolyuria, completeData: completeData))
            selectRows.data.append(makeSelectableRow(subAttribute: .diuresisIshematuria, completeData: completeData))
            selectRows.data.append(makeSelectableRow(subAttribute: .diuresisIsAnuria, completeData: completeData))
            

//        case .assistanceProvided:
//           textRow = makeTextRow(subAttribute: .assistanceProvided, completeData: completeData, limit: nil))
//            completeData.indicator?.forEach { item in
//                var newSection = SectionSubattributes()
//                newSection.rows.append(TextRowOfSubattribute( subattribut: .timeIndicator,       text: item.data[.timeIndicator],       limit: nil))
//                newSection.rows.append(TextRowOfSubattribute( subattribut: .aDtimeIndicator,       text: item.data[.aDtimeIndicator],       limit: nil))
//                newSection.rows.append(TextRowOfSubattribute( subattribut: .chssIndicator,       text: item.data[.chssIndicator],       limit: nil))
//                newSection.rows.append(TextRowOfSubattribute(subattribut: .chddIndicator,       text: item.data[.chddIndicator],       limit: nil))
//                newSection.rows.append(TextRowOfSubattribute( subattribut: .spoIndicator,       text: item.data[.spoIndicator],       limit: nil))
//                newSection.rows.append(TextRowOfSubattribute( subattribut: .tempIndicator,       text: item.data[.tempIndicator],       limit: nil))
//                sections.append(newSection)
//            }
        case .additionalAction:
            selectRows.data.append(makeSelectableRow(subAttribute: .resuscitation, completeData: completeData))
            selectRows.data.append(makeSelectableRow(subAttribute: .ivl_vvl, completeData: completeData))
            selectRows.data.append(makeSelectableRow(subAttribute: .nebulizer, completeData: completeData))
            selectRows.data.append(makeSelectableRow(subAttribute: .intubationAndlaryngitis, completeData: completeData))
            selectRows.data.append(makeSelectableRow(subAttribute: .conicotomy, completeData: completeData))
            selectRows.data.append(makeSelectableRow(subAttribute: .trachestomy, completeData: completeData))
            selectRows.data.append(makeSelectableRow(subAttribute: .eit, completeData: completeData))
            selectRows.data.append(makeSelectableRow(subAttribute: .thrombolysis, completeData: completeData))
            selectRows.data.append(makeSelectableRow(subAttribute: .catheterMoch, completeData: completeData))
            selectRows.data.append(makeSelectableRow(subAttribute: .pills, completeData: completeData))
            selectRows.data.append(makeSelectableRow(subAttribute: .rinsingStomach, completeData: completeData))
            selectRows.data.append(makeSelectableRow(subAttribute: .pulseoximetry, completeData: completeData))
            selectRows.data.append(makeSelectableRow(subAttribute: .infusion, completeData: completeData))
            selectRows.data.append(makeSelectableRow(subAttribute: .catheterVV, completeData: completeData))
            selectRows.data.append(makeSelectableRow(subAttribute: .ostBlodRan, completeData: completeData))
            selectRows.data.append(makeSelectableRow(subAttribute: .bandage, completeData: completeData))
            selectRows.data.append(makeSelectableRow(subAttribute: .immobilization, completeData: completeData))
            selectRows.data.append(makeSelectableRow(subAttribute: .defibrillation, completeData: completeData))
            selectRows.data.append(makeSelectableRow(subAttribute: .nasalTamponade, completeData: completeData))
            selectRows.data.append(makeSelectableRow(subAttribute: .ecgMonitor, completeData: completeData))
            selectRows.data.append(makeSelectableRow(subAttribute: .injections, completeData: completeData))
            selectRows.data.append(makeSelectableRow(subAttribute: .inhalation, completeData: completeData))
            selectRows.data.append(makeSelectableRow(subAttribute: .troponin, completeData: completeData))
            selectRows.data.append(makeSelectableRow(subAttribute: .glucoseMonitoring, completeData: completeData))

        default:
            print("unnecessary case")
        }
        return  (selectRows, textRow)
    }
    
    private func makeTextRow(subAttribute: SubAttribute, completeData: CompleteData, limit: Int? = nil) -> TextRowOfSubattribute {
        return TextRowOfSubattribute(subattribut: subAttribute,
                                     text: completeData.completeTextData[.infusionSystem])
    }
    
    private func makeSelectableRow(subAttribute: SubAttribute, completeData: CompleteData) -> SelectRowOfSubattribute {
        return SelectRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: subAttribute,
                                                                                             requestOfSubattributeData: .title) as! String,
                                       subattribut: subAttribute,
                                       isSelected: completeData.completeSelectableData.contains(subAttribute))
    }
    
}
