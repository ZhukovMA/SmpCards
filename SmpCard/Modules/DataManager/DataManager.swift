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
    case assistanceProvided
    case additionalAction
    case consumption
}



class DataManager {
    static let shared = DataManager()
    
    func getTextOfSelectableAttribute(completeData: CompleteData, selectableAttribute: SelectableAttributeEnum, forPreview: Bool) -> String {
        var result = String()
        let sections = getSubattributesOfSection(selectableAttribute: selectableAttribute)
        sections?.selectableValues.forEach { (subAttribute) in
            if  completeData.completeSelectableData.contains(subAttribute),
                let title = DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: subAttribute, requestOfSubattributeData: .title) as? String {
                if result.isEmpty {
                    result += title
                } else {
                    result += ", \(title)"
                }
            }
        }
        sections?.textValues.forEach({ (subAttribute) in
            if  let text = completeData.completeTextData[subAttribute] {
                if let title = DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: subAttribute, requestOfSubattributeData: .title) as? String {
                    if result.isEmpty {
                        result += title + ": " + text
                    } else  {
                        result += ", " + title + ": "  + text
                    }
                } else {
                    if result.isEmpty {
                        result += text
                    } else  {
                        result += ", \(text)"
                    }
                }
            }
            if subAttribute == .assistanceProvided {
                if let indicator = completeData.indicator, !completeData.indicatorIsEmpty {
                    result += "\n"
                    result += "Время\t\tАД\t\tЧСС\tЧДД\tSpO₂\tT°C\n"
                    indicator.forEach { indicatorItem in
                        if !indicatorItem.data.isEmpty {
                            getIndicatorsText(indicatorItem: indicatorItem, result: &result, forPreview: forPreview)
                        }
                    }
                }
            }
        })
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
    
    func getSelectableSections(selectableAttribute: SelectableAttributeEnum, completeData: CompleteData) -> [SectionSubattributes] {
        var sections = [SectionSubattributes]()
        var section = SectionSubattributes()
        switch selectableAttribute {
        case .gotSick:
            section.rows.append(SelectRowOfSubattribute(
                title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .gotSickBeforeAnHour,
                                                                      requestOfSubattributeData: .title) as? String,
                subattribut: .gotSickBeforeAnHour,
                isSelected: completeData.completeSelectableData.contains(.gotSickBeforeAnHour)))
            section.rows.append(SelectRowOfSubattribute(title:
                DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .gotSick1_3Hours,
                                                               requestOfSubattributeData: .title) as? String,
                                                        subattribut: .gotSick1_3Hours,
                                                        isSelected: completeData.completeSelectableData.contains(.gotSick1_3Hours)))
            section.rows.append(SelectRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .gotSick3_6Hours,
                                                                                                              requestOfSubattributeData: .title) as? String,
                                                        subattribut: .gotSick3_6Hours,
                                                        isSelected: completeData.completeSelectableData.contains(.gotSick3_6Hours)))
            section.rows.append(SelectRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .gotSick6_12Hours,
                                                                                                              requestOfSubattributeData: .title) as? String,
                                                        subattribut: .gotSick6_12Hours,
                                                        isSelected: completeData.completeSelectableData.contains(.gotSick6_12Hours)))
            section.rows.append(SelectRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .gotSickMoreADay,
                                                                                                              requestOfSubattributeData: .title) as? String,
                                                        subattribut: .gotSickMoreADay,
                                                        isSelected: completeData.completeSelectableData.contains(.gotSickMoreADay)))
            sections.append(section)
      
        case .condition:
            section.rows.append(SelectRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .conditionIsSatisfactory,
                                                                                                              requestOfSubattributeData: .title) as? String,
                                                        subattribut: .conditionIsSatisfactory,
                                                        isSelected: completeData.completeSelectableData.contains(.conditionIsSatisfactory)))
            section.rows.append(SelectRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .conditionIsOfModerateSeverity,
                                                                                                              requestOfSubattributeData: .title) as? String,
                                                        subattribut: .conditionIsOfModerateSeverity,
                                                        isSelected: completeData.completeSelectableData.contains(.conditionIsOfModerateSeverity)))
            section.rows.append(SelectRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .conditionIsHeavy,
                                                                                                              requestOfSubattributeData: .title) as? String,
                                                        subattribut: .conditionIsHeavy,
                                                        isSelected: completeData.completeSelectableData.contains(.conditionIsHeavy)))
            section.rows.append(SelectRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .conditionIsTerminal,
                                                                                                              requestOfSubattributeData: .title) as? String,
                                                        subattribut: .conditionIsTerminal,
                                                        isSelected: completeData.completeSelectableData.contains(.conditionIsTerminal)))
            section.rows.append(SelectRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .conditionIsDeath,
                                                                                                              requestOfSubattributeData: .title) as? String,
                                                        subattribut: .conditionIsDeath,
                                                        isSelected: completeData.completeSelectableData.contains(.conditionIsDeath)))
            sections.append(section)
        case .consciousness:
            section.rows.append(SelectRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .consciousnessIsClear,
                                                                                                              requestOfSubattributeData: .title) as? String,
                                                        subattribut: .consciousnessIsClear,
                                                        isSelected: completeData.completeSelectableData.contains(.consciousnessIsClear)))
            section.rows.append(SelectRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .consciousnessIsStunning,
                                                                                                              requestOfSubattributeData: .title) as? String,
                                                        subattribut: .consciousnessIsStunning,
                                                        isSelected: completeData.completeSelectableData.contains(.consciousnessIsStunning)))
            section.rows.append(SelectRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .consciousnessIsSopor,
                                                                                                              requestOfSubattributeData: .title) as? String,
                                                        subattribut: .consciousnessIsSopor,
                                                        isSelected: completeData.completeSelectableData.contains(.consciousnessIsSopor)))
            section.rows.append(SelectRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .consciousnessIsComa1,
                                                                                                              requestOfSubattributeData: .title) as? String,
                                                        subattribut: .consciousnessIsComa1,
                                                        isSelected: completeData.completeSelectableData.contains(.consciousnessIsComa1)))
            section.rows.append(SelectRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .consciousnessIsComa2,
                                                                                                              requestOfSubattributeData: .title) as? String,
                                                        subattribut: .consciousnessIsComa2,
                                                        isSelected: completeData.completeSelectableData.contains(.consciousnessIsComa2)))
            section.rows.append(SelectRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .consciousnessIsComa3,
                                                                                                              requestOfSubattributeData: .title) as? String,
                                                        subattribut: .consciousnessIsComa3,
                                                        isSelected: completeData.completeSelectableData.contains(.consciousnessIsComa3)))
            sections.append(section)
        case .position:
            section.rows.append(SelectRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .positionIsActive,
                                                                                                              requestOfSubattributeData: .title) as? String,
                                                        subattribut: .positionIsActive,
                                                        isSelected: completeData.completeSelectableData.contains(.positionIsActive)))
            section.rows.append(SelectRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .positionIsPassive,
                                                                                                              requestOfSubattributeData: .title) as? String,
                                                        subattribut: .positionIsPassive,
                                                        isSelected: completeData.completeSelectableData.contains(.positionIsPassive)))
            section.rows.append(SelectRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .positionIsForced,
                                                                                                              requestOfSubattributeData: .title) as? String,
                                                        subattribut: .positionIsForced,
                                                        isSelected: completeData.completeSelectableData.contains(.positionIsForced)))
            section.rows.append(TextRowOfSubattribute(title: nil,
                                                      subattribut: .positionText,
                                                      text: completeData.completeTextData[.positionText],
                                                      limit: 10))
            sections.append(section)
        case .skin:
            section.rows.append(SelectRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .skinIsDry,
                                                                                                              requestOfSubattributeData: .title) as? String,
                                                        subattribut: .skinIsDry,
                                                        isSelected: completeData.completeSelectableData.contains(.skinIsDry)))
            section.rows.append(SelectRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .skinIsWet,
                                                                                                              requestOfSubattributeData: .title) as? String,
                                                        subattribut: .skinIsWet,
                                                        isSelected: completeData.completeSelectableData.contains(.skinIsWet)))
            sections.append(section)
            var section1 = SectionSubattributes()
            section1.rows.append(SelectRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .skinIsWarm,
                                                                                                               requestOfSubattributeData: .title) as? String,
                                                         subattribut: .skinIsWarm,
                                                         isSelected: completeData.completeSelectableData.contains(.skinIsWarm)))
            section1.rows.append(SelectRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .skinIsCold,
                                                                                                               requestOfSubattributeData: .title) as? String,
                                                         subattribut: .skinIsCold,
                                                         isSelected: completeData.completeSelectableData.contains(.skinIsCold)))
            sections.append(section1)
            var section2 = SectionSubattributes()
            section2.rows.append(SelectRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .skinIsPhisiologicalColor,
                                                                                                               requestOfSubattributeData: .title) as? String,
                                                         subattribut: .skinIsPhisiologicalColor,
                                                         isSelected: completeData.completeSelectableData.contains(.skinIsPhisiologicalColor)))
            section2.rows.append(SelectRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .skinIsPale,
                                                                                                               requestOfSubattributeData: .title) as? String,
                                                         subattribut: .skinIsPale,
                                                         isSelected: completeData.completeSelectableData.contains(.skinIsPale)))
            section2.rows.append(SelectRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .skinIsHyperemic,
                                                                                                               requestOfSubattributeData: .title) as? String,
                                                         subattribut: .skinIsHyperemic,
                                                         isSelected: completeData.completeSelectableData.contains(.skinIsHyperemic)))
            section2.rows.append(SelectRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .skinIsCyanotic,
                                                                                                               requestOfSubattributeData: .title) as? String,
                                                         subattribut: .skinIsCyanotic,
                                                         isSelected: completeData.completeSelectableData.contains(.skinIsCyanotic)))
            sections.append(section2)
            var section3 = SectionSubattributes()
            section3.rows.append(SelectRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .skinIsJaundice,
                                                                                                               requestOfSubattributeData: .title) as? String,
                                                         subattribut: .skinIsJaundice,
                                                         isSelected: completeData.completeSelectableData.contains(.skinIsJaundice)))
            section3.rows.append(SelectRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .skinIsAcrocyanosis,
                                                                                                               requestOfSubattributeData: .title) as? String,
                                                         subattribut: .skinIsAcrocyanosis,
                                                         isSelected: completeData.completeSelectableData.contains(.skinIsAcrocyanosis)))
            section3.rows.append(SelectRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .skinIsMarbling,
                                                                                                               requestOfSubattributeData: .title) as? String,
                                                         subattribut: .skinIsMarbling,
                                                         isSelected: completeData.completeSelectableData.contains(.skinIsMarbling)))
            sections.append(section3)
        case .rash:
            section.rows.append(SelectRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .hasNotRash,
                                                                                                              requestOfSubattributeData: .title) as? String,
                                                        subattribut: .hasNotRash,
                                                        isSelected: completeData.completeSelectableData.contains(.hasNotRash)))
            section.rows.append(SelectRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .hasRash,
                                                                                                              requestOfSubattributeData: .title) as? String,
                                                        subattribut: .hasRash,
                                                        isSelected: completeData.completeSelectableData.contains(.hasRash)))
            section.rows.append(TextRowOfSubattribute(title: nil,
                                                      subattribut: .rashText,
                                                      text: completeData.completeTextData[.rashText],
                                                      limit: 33))
            sections.append(section)
        case .edema:
            section.rows.append(SelectRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .hasNotEdema,
                                                                                                              requestOfSubattributeData: .title) as? String,
                                                        subattribut: .hasNotEdema,
                                                        isSelected: completeData.completeSelectableData.contains(.hasNotEdema)))
            section.rows.append(SelectRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .hasEdema,
                                                                                                              requestOfSubattributeData: .title) as? String,
                                                        subattribut: .hasEdema,
                                                        isSelected: completeData.completeSelectableData.contains(.hasEdema)))
            section.rows.append(TextRowOfSubattribute(title: nil,
                                                      subattribut: .edemaText,
                                                      text: completeData.completeTextData[.edemaText],
                                                      limit: 28))
            sections.append(section)
        case .behavior:
            section.rows.append(SelectRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .behaviorIsCalm,
                                                                                                              requestOfSubattributeData: .title) as? String,
                                                        subattribut: .behaviorIsCalm,
                                                        isSelected: completeData.completeSelectableData.contains(.behaviorIsCalm)))
            section.rows.append(SelectRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .behaviorIsAgitated,
                                                                                                              requestOfSubattributeData: .title) as? String,
                                                        subattribut: .behaviorIsAgitated,
                                                        isSelected: completeData.completeSelectableData.contains(.behaviorIsAgitated)))
            section.rows.append(SelectRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .behaviorIsAggressive,
                                                                                                              requestOfSubattributeData: .title) as? String,
                                                        subattribut: .behaviorIsAggressive,
                                                        isSelected: completeData.completeSelectableData.contains(.behaviorIsAggressive)))
            section.rows.append(SelectRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .behaviorIsDepressive,
                                                                                                              requestOfSubattributeData: .title) as? String,
                                                        subattribut: .behaviorIsDepressive,
                                                        isSelected: completeData.completeSelectableData.contains(.behaviorIsDepressive)))
            sections.append(section)
            var section1 = SectionSubattributes()
            section1.rows.append(SelectRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .behaviorIsKontacten,
                                                                                                               requestOfSubattributeData: .title) as? String,
                                                         subattribut: .behaviorIsKontacten,
                                                         isSelected: completeData.completeSelectableData.contains(.behaviorIsKontacten)))
            section1.rows.append(SelectRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .behaviorIsNotKontacten,
                                                                                                               requestOfSubattributeData: .title) as? String,
                                                         subattribut: .behaviorIsNotKontacten,
                                                         isSelected: completeData.completeSelectableData.contains(.behaviorIsNotKontacten)))
            section1.rows.append(SelectRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .behaviorIsAmnesia,
                                                                                                               requestOfSubattributeData: .title) as? String,
                                                         subattribut: .behaviorIsAmnesia,
                                                         isSelected: completeData.completeSelectableData.contains(.behaviorIsAmnesia)))
            section1.rows.append(SelectRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .behaviorIsataxia,
                                                                                                               requestOfSubattributeData: .title) as? String,
                                                         subattribut: .behaviorIsataxia,
                                                         isSelected: completeData.completeSelectableData.contains(.behaviorIsataxia)))
            sections.append(section1)
        case .pupils:
            section.rows.append(SelectRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .pupilsIsODIsEqualOS,
                                                                                                              requestOfSubattributeData: .title) as? String,
                                                        subattribut: .pupilsIsODIsEqualOS,
                                                        isSelected: completeData.completeSelectableData.contains(.pupilsIsODIsEqualOS)))
            section.rows.append(SelectRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .pupilsIsODIsNotEqualOS,
                                                                                                              requestOfSubattributeData: .title) as? String,
                                                        subattribut: .pupilsIsODIsNotEqualOS,
                                                        isSelected: completeData.completeSelectableData.contains(.pupilsIsODIsNotEqualOS)))
            sections.append(section)
            var section1 = SectionSubattributes()
            section1.rows.append(SelectRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .pupilsIsNormal,
                                                                                                               requestOfSubattributeData: .title) as? String,
                                                         subattribut: .pupilsIsNormal,
                                                         isSelected: completeData.completeSelectableData.contains(.pupilsIsNormal)))
            section1.rows.append(SelectRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .pupilsIsWide,
                                                                                                               requestOfSubattributeData: .title) as? String,
                                                         subattribut: .pupilsIsWide,
                                                         isSelected: completeData.completeSelectableData.contains(.pupilsIsWide)))
            section1.rows.append(SelectRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .pupilsIsNarrow,
                                                                                                               requestOfSubattributeData: .title) as? String,
                                                         subattribut: .pupilsIsNarrow,
                                                         isSelected: completeData.completeSelectableData.contains(.pupilsIsNarrow)))
            section1.rows.append(SelectRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .pupilsIsAnisocoria,
                                                                                                               requestOfSubattributeData: .title) as? String,
                                                         subattribut: .pupilsIsAnisocoria,
                                                         isSelected: completeData.completeSelectableData.contains(.pupilsIsAnisocoria)))
            sections.append(section1)
        case .reactionToLight:
            section.rows.append(SelectRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .reactionToLightIsAlive,
                                                                                                              requestOfSubattributeData: .title) as? String,
                                                        subattribut: .reactionToLightIsAlive,
                                                        isSelected: completeData.completeSelectableData.contains(.reactionToLightIsAlive)))
            section.rows.append(SelectRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .reactionToLightIsHoly,
                                                                                                              requestOfSubattributeData: .title) as? String,
                                                        subattribut: .reactionToLightIsHoly,
                                                        isSelected: completeData.completeSelectableData.contains(.reactionToLightIsHoly)))
            section.rows.append(SelectRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .reactionToLightIsNone,
                                                                                                              requestOfSubattributeData: .title) as? String,
                                                        subattribut: .reactionToLightIsNone,
                                                        isSelected: completeData.completeSelectableData.contains(.reactionToLightIsNone)))
            sections.append(section)
        case .nystagm:
            section.rows.append(SelectRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .hasNotNystagm,
                                                                                                              requestOfSubattributeData: .title) as? String,
                                                        subattribut: .hasNotNystagm,
                                                        isSelected: completeData.completeSelectableData.contains(.hasNotNystagm)))
            section.rows.append(SelectRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .hasNystagm,
                                                                                                              requestOfSubattributeData: .title) as? String,
                                                        subattribut: .hasNystagm,
                                                        isSelected: completeData.completeSelectableData.contains(.hasNystagm)))
            section.rows.append(TextRowOfSubattribute(title: nil,
                                                      subattribut: .nystagmText,
                                                      text: completeData.completeTextData[.nystagmText],
                                                      limit: 15))
            sections.append(section)
        case .meningealSymptom:
            section.rows.append(SelectRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .hasNotMeningealSymptom,
                                                                                                              requestOfSubattributeData: .title) as? String,
                                                        subattribut: .hasNotMeningealSymptom,
                                                        isSelected: completeData.completeSelectableData.contains(.hasNotMeningealSymptom)))
            sections.append(section)
            var section1 = SectionSubattributes()
            section1.rows.append(SelectRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .regedivnostZatilochnihMuscle,
                                                                                                               requestOfSubattributeData: .title) as? String,
                                                         subattribut: .regedivnostZatilochnihMuscle,
                                                         isSelected: completeData.completeSelectableData.contains(.regedivnostZatilochnihMuscle)))
            section1.rows.append(SelectRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .kernig,
                                                                                                               requestOfSubattributeData: .title) as? String,
                                                         subattribut: .kernig,
                                                         isSelected: completeData.completeSelectableData.contains(.kernig)))
            section1.rows.append(SelectRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .brudzinski,
                                                                                                               requestOfSubattributeData: .title) as? String,
                                                         subattribut: .brudzinski,
                                                         isSelected: completeData.completeSelectableData.contains(.brudzinski)))
            sections.append(section1)
        case .focalSymptoms:
            section.rows.append(SelectRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .hasNotFocalSymptoms,
                                                                                                              requestOfSubattributeData: .title) as? String,
                                                        subattribut: .hasNotFocalSymptoms,
                                                        isSelected: completeData.completeSelectableData.contains(.hasNotFocalSymptoms)))
            section.rows.append(SelectRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .hasFocalSymptoms,
                                                                                                              requestOfSubattributeData: .title) as? String,
                                                        subattribut: .hasFocalSymptoms,
                                                        isSelected: completeData.completeSelectableData.contains(.hasFocalSymptoms)))
            section.rows.append(TextRowOfSubattribute(title: nil,
                                                      subattribut: .focalSymptomsText,
                                                      text: completeData.completeTextData[.focalSymptomsText],
                                                      limit: 117))
            sections.append(section)
        case .breath:
            section.rows.append(SelectRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .breathFeel,
                                                                                                              requestOfSubattributeData: .title) as? String,
                                                        subattribut: .breathFeel,
                                                        isSelected: completeData.completeSelectableData.contains(.breathFeel)))
            section.rows.append(SelectRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .breathNotFeel,
                                                                                                              requestOfSubattributeData: .title) as? String,
                                                        subattribut: .breathNotFeel,
                                                        isSelected: completeData.completeSelectableData.contains(.breathNotFeel)))
            sections.append(section)
        case .separatedFromNasalPassages:
            section.rows.append(SelectRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .hasNotSeparatedFromNasalPassages,
                                                                                                              requestOfSubattributeData: .title) as? String,
                                                        subattribut: .hasNotSeparatedFromNasalPassages,
                                                        isSelected: completeData.completeSelectableData.contains(.hasNotSeparatedFromNasalPassages)))
            section.rows.append(SelectRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .hasSeparatedFromNasalPassages,
                                                                                                              requestOfSubattributeData: .title) as? String,
                                                        subattribut: .hasSeparatedFromNasalPassages,
                                                        isSelected: completeData.completeSelectableData.contains(.hasSeparatedFromNasalPassages)))
            sections.append(section)
        case .dyspnea:
            section.rows.append(SelectRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .dyspneaIsInspiratory,
                                                                                                              requestOfSubattributeData: .title) as? String,
                                                        subattribut: .dyspneaIsInspiratory,
                                                        isSelected: completeData.completeSelectableData.contains(.dyspneaIsInspiratory)))
            section.rows.append(SelectRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .dyspneaIsExpiratory,
                                                                                                              requestOfSubattributeData: .title) as? String,
                                                        subattribut: .dyspneaIsExpiratory,
                                                        isSelected: completeData.completeSelectableData.contains(.dyspneaIsExpiratory)))
            section.rows.append(SelectRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .dyspneaIsmixed,
                                                                                                              requestOfSubattributeData: .title) as? String,
                                                        subattribut: .dyspneaIsmixed,
                                                        isSelected: completeData.completeSelectableData.contains(.dyspneaIsmixed)))
            section.rows.append(SelectRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .dyspneaIsPotalogic,
                                                                                                              requestOfSubattributeData: .title) as? String,
                                                        subattribut: .dyspneaIsPotalogic,
                                                        isSelected: completeData.completeSelectableData.contains(.dyspneaIsPotalogic)))
            sections.append(section)
        case .percussionSound:
            section.rows.append(SelectRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .percussionSoundIsPulmonary,
                                                                                                              requestOfSubattributeData: .title) as? String,
                                                        subattribut: .percussionSoundIsPulmonary,
                                                        isSelected: completeData.completeSelectableData.contains(.percussionSoundIsPulmonary)))
            section.rows.append(SelectRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .percussionSoundIsShortened,
                                                                                                              requestOfSubattributeData: .title) as? String,
                                                        subattribut: .percussionSoundIsShortened,
                                                        isSelected: completeData.completeSelectableData.contains(.percussionSoundIsShortened)))
            section.rows.append(SelectRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .percussionSoundIsTympanic,
                                                                                                              requestOfSubattributeData: .title) as? String,
                                                        subattribut: .percussionSoundIsTympanic,
                                                        isSelected: completeData.completeSelectableData.contains(.percussionSoundIsTympanic)))
            section.rows.append(SelectRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .percussionSoundIsDull,
                                                                                                              requestOfSubattributeData: .title) as? String,
                                                        subattribut: .percussionSoundIsDull,
                                                        isSelected: completeData.completeSelectableData.contains(.percussionSoundIsDull)))
            section.rows.append(SelectRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .percussionSoundIsBoxboardAbove,
                                                                                                              requestOfSubattributeData: .title) as? String,
                                                        subattribut: .percussionSoundIsBoxboardAbove,
                                                        isSelected: completeData.completeSelectableData.contains(.percussionSoundIsBoxboardAbove)))
            section.rows.append(TextRowOfSubattribute(title: nil,
                                                      subattribut: .percussionSoundText,
                                                      text: completeData.completeTextData[.percussionSoundText],
                                                      limit: 21))
            sections.append(section)
        case .auscultationBreath:
            section.rows.append(SelectRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .auscultationBreathIsPuerile,
                                                                                                              requestOfSubattributeData: .title) as? String,
                                                        subattribut: .auscultationBreathIsPuerile,
                                                        isSelected: completeData.completeSelectableData.contains(.auscultationBreathIsPuerile)))
            section.rows.append(SelectRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .auscultationBreathIsVesicular,
                                                                                                              requestOfSubattributeData: .title) as? String,
                                                        subattribut: .auscultationBreathIsVesicular,
                                                        isSelected: completeData.completeSelectableData.contains(.auscultationBreathIsVesicular)))
            section.rows.append(SelectRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .auscultationBreathIsBronchial,
                                                                                                              requestOfSubattributeData: .title) as? String,
                                                        subattribut: .auscultationBreathIsBronchial,
                                                        isSelected: completeData.completeSelectableData.contains(.auscultationBreathIsBronchial)))
            section.rows.append(SelectRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .auscultationBreathIsHard,
                                                                                                              requestOfSubattributeData: .title) as? String,
                                                        subattribut: .auscultationBreathIsHard,
                                                        isSelected: completeData.completeSelectableData.contains(.auscultationBreathIsHard)))
            section.rows.append(SelectRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .auscultationBreathIsTenatic,
                                                                                                              requestOfSubattributeData: .title) as? String,
                                                        subattribut: .auscultationBreathIsTenatic,
                                                        isSelected: completeData.completeSelectableData.contains(.auscultationBreathIsTenatic)))
            section.rows.append(SelectRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .auscultationBreathIsWeakened,
                                                                                                              requestOfSubattributeData: .title) as? String,
                                                        subattribut: .auscultationBreathIsWeakened,
                                                        isSelected: completeData.completeSelectableData.contains(.auscultationBreathIsWeakened)))
            section.rows.append(SelectRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .auscultationBreathNone,
                                                                                                              requestOfSubattributeData: .title) as? String,
                                                        subattribut: .auscultationBreathNone,
                                                        isSelected: completeData.completeSelectableData.contains(.auscultationBreathNone)))
            section.rows.append(TextRowOfSubattribute(title: nil,
                                                      subattribut: .auscultationBreathText,
                                                      text: completeData.completeTextData[.auscultationBreathText],
                                                      limit: 21))
            sections.append(section)
        case .rale:
            section.rows.append(SelectRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .hasNotRale,
                                                                                                              requestOfSubattributeData: .title) as? String,
                                                        subattribut: .hasNotRale,
                                                        isSelected: completeData.completeSelectableData.contains(.hasNotRale)))
            section.rows.append(SelectRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .dryRale,
                                                                                                              requestOfSubattributeData: .title) as? String,
                                                        subattribut: .dryRale,
                                                        isSelected: completeData.completeSelectableData.contains(.dryRale)))
            section.rows.append(SelectRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .wetRaleSmallbubble,
                                                                                                              requestOfSubattributeData: .title) as? String,
                                                        subattribut: .wetRaleSmallbubble,
                                                        isSelected: completeData.completeSelectableData.contains(.wetRaleSmallbubble)))
            section.rows.append(SelectRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .wetRaleMediumbubble,
                                                                                                              requestOfSubattributeData: .title) as? String,
                                                        subattribut: .wetRaleMediumbubble,
                                                        isSelected: completeData.completeSelectableData.contains(.wetRaleMediumbubble)))
            section.rows.append(SelectRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .wetRaleLargebubble,
                                                                                                              requestOfSubattributeData: .title) as? String,
                                                        subattribut: .wetRaleLargebubble,
                                                        isSelected: completeData.completeSelectableData.contains(.wetRaleLargebubble)))
            section.rows.append(TextRowOfSubattribute(title: nil,
                                                      subattribut: .raleText,
                                                      text: completeData.completeTextData[.raleText],
                                                      limit: 24))
            sections.append(section)
        case .pleuralFrictionNoise:
            section.rows.append(SelectRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .hasNotPleuralFrictionNoise,
                                                                                                              requestOfSubattributeData: .title) as? String,
                                                        subattribut: .hasNotPleuralFrictionNoise,
                                                        isSelected: completeData.completeSelectableData.contains(.hasNotPleuralFrictionNoise)))
            section.rows.append(SelectRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .hasPleuralFrictionNoise,
                                                                                                              requestOfSubattributeData: .title) as? String,
                                                        subattribut: .hasPleuralFrictionNoise,
                                                        isSelected: completeData.completeSelectableData.contains(.hasPleuralFrictionNoise)))
            sections.append(section)
        case .heartTones:
            section.rows.append(SelectRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .heartTonesIsResonant,
                                                                                                              requestOfSubattributeData: .title) as? String,
                                                        subattribut: .heartTonesIsResonant,
                                                        isSelected: completeData.completeSelectableData.contains(.heartTonesIsResonant)))
            section.rows.append(SelectRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .heartTonesIsPriglasheny,
                                                                                                              requestOfSubattributeData: .title) as? String,
                                                        subattribut: .heartTonesIsPriglasheny,
                                                        isSelected: completeData.completeSelectableData.contains(.heartTonesIsPriglasheny)))
            section.rows.append(SelectRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .heartTonesIsDeaf,
                                                                                                              requestOfSubattributeData: .title) as? String,
                                                        subattribut: .heartTonesIsDeaf,
                                                        isSelected: completeData.completeSelectableData.contains(.heartTonesIsDeaf)))
            sections.append(section)
        case .noise:
            section.rows.append(SelectRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .noiseIsSystolic,
                                                                                                              requestOfSubattributeData: .title) as? String,
                                                        subattribut: .noiseIsSystolic,
                                                        isSelected: completeData.completeSelectableData.contains(.noiseIsSystolic)))
            section.rows.append(SelectRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .noiseIsDiastolic,
                                                                                                              requestOfSubattributeData: .title) as? String,
                                                        subattribut: .noiseIsDiastolic,
                                                        isSelected: completeData.completeSelectableData.contains(.noiseIsDiastolic)))
            section.rows.append(SelectRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .noiseIsAccent,
                                                                                                              requestOfSubattributeData: .title) as? String,
                                                        subattribut: .noiseIsAccent,
                                                        isSelected: completeData.completeSelectableData.contains(.noiseIsAccent)))
            section.rows.append(TextRowOfSubattribute(title: nil,
                                                      subattribut: .noiseText,
                                                      text: completeData.completeTextData[.noiseText],
                                                      limit: 17))
            sections.append(section)
        case .noiseOfFrictionPericard:
            section.rows.append(SelectRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .hasNotNoiseOfFrictionPericard,
                                                                                                              requestOfSubattributeData: .title) as? String,
                                                        subattribut: .hasNotNoiseOfFrictionPericard,
                                                        isSelected: completeData.completeSelectableData.contains(.hasNotNoiseOfFrictionPericard)))
            section.rows.append(SelectRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .hasNoiseOfFrictionPericard,
                                                                                                              requestOfSubattributeData: .title) as? String,
                                                        subattribut: .hasNoiseOfFrictionPericard,
                                                        isSelected: completeData.completeSelectableData.contains(.hasNoiseOfFrictionPericard)))
            sections.append(section)
        case .tongue:
            section.rows.append(SelectRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .tongueIsWet,
                                                                                                              requestOfSubattributeData: .title) as? String,
                                                        subattribut: .tongueIsWet,
                                                        isSelected: completeData.completeSelectableData.contains(.tongueIsWet)))
            section.rows.append(SelectRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .tongueIsDry,
                                                                                                              requestOfSubattributeData: .title) as? String,
                                                        subattribut: .tongueIsDry,
                                                        isSelected: completeData.completeSelectableData.contains(.tongueIsDry)))
            section.rows.append(SelectRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .tongueIsOverlaid,
                                                                                                              requestOfSubattributeData: .title) as? String,
                                                        subattribut: .tongueIsOverlaid,
                                                        isSelected: completeData.completeSelectableData.contains(.tongueIsOverlaid)))
            section.rows.append(TextRowOfSubattribute(title: nil,
                                                      subattribut: .tongueText,
                                                      text: completeData.completeTextData[.tongueText],
                                                      limit: 18))
            sections.append(section)
        case .stomach:
            section.rows.append(SelectRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .stomachIsSoft,
                                                                                                              requestOfSubattributeData: .title) as? String,
                                                        subattribut: .stomachIsSoft,
                                                        isSelected: completeData.completeSelectableData.contains(.stomachIsSoft)))
            section.rows.append(SelectRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .stomachIsTense,
                                                                                                              requestOfSubattributeData: .title) as? String,
                                                        subattribut: .stomachIsTense,
                                                        isSelected: completeData.completeSelectableData.contains(.stomachIsTense)))
            sections.append(section)
            var section1 = SectionSubattributes()
            section1.rows.append(SelectRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .stomachIsPainful,
                                                                                                               requestOfSubattributeData: .title) as? String,
                                                         subattribut: .stomachIsPainful,
                                                         isSelected: completeData.completeSelectableData.contains(.stomachIsPainful)))
            section1.rows.append(SelectRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .stomachIsNotPainful,
                                                                                                               requestOfSubattributeData: .title) as? String,
                                                         subattribut: .stomachIsNotPainful,
                                                         isSelected: completeData.completeSelectableData.contains(.stomachIsNotPainful)))
            section1.rows.append(TextRowOfSubattribute(title: nil,
                                                       subattribut: .stomachText,
                                                       text: completeData.completeTextData[.stomachText],
                                                       limit: 57))
            sections.append(section1)
        case .positiveSymptom:
            section.rows.append(SelectRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .positiveSymptomOfSpijarski,
                                                                                                              requestOfSubattributeData: .title) as? String,
                                                        subattribut: .positiveSymptomOfSpijarski,
                                                        isSelected: completeData.completeSelectableData.contains(.positiveSymptomOfSpijarski)))
            sections.append(section)
            var section1 = SectionSubattributes()
            section1.rows.append(SelectRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .positiveSymptomOfRazdolsky,
                                                                                                               requestOfSubattributeData: .title) as? String,
                                                         subattribut: .positiveSymptomOfRazdolsky,
                                                         isSelected: completeData.completeSelectableData.contains(.positiveSymptomOfRazdolsky)))
            section1.rows.append(SelectRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .positiveSymptomOfObraztsov,
                                                                                                               requestOfSubattributeData: .title) as? String,
                                                         subattribut: .positiveSymptomOfObraztsov,
                                                         isSelected: completeData.completeSelectableData.contains(.positiveSymptomOfObraztsov)))
            section1.rows.append(SelectRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .positiveSymptomOfSidkovskogo,
                                                                                                               requestOfSubattributeData: .title) as? String,
                                                         subattribut: .positiveSymptomOfSidkovskogo,
                                                         isSelected: completeData.completeSelectableData.contains(.positiveSymptomOfSidkovskogo)))
            section1.rows.append(SelectRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .positiveSymptomRovsinga,
                                                                                                               requestOfSubattributeData: .title) as? String,
                                                         subattribut: .positiveSymptomRovsinga,
                                                         isSelected: completeData.completeSelectableData.contains(.positiveSymptomRovsinga)))
            section1.rows.append(SelectRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .positiveSymptomOfShchetkinBlumberg,
                                                                                                               requestOfSubattributeData: .title) as? String,
                                                         subattribut: .positiveSymptomOfShchetkinBlumberg,
                                                         isSelected: completeData.completeSelectableData.contains(.positiveSymptomOfShchetkinBlumberg)))
            section1.rows.append(SelectRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .positiveSymptomOfRozanov,
                                                                                                               requestOfSubattributeData: .title) as? String,
                                                         subattribut: .positiveSymptomOfRozanov,
                                                         isSelected: completeData.completeSelectableData.contains(.positiveSymptomOfRozanov)))
            sections.append(section1)
            section.rows.append(SelectRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .positiveSymptomMerphy,
                                                                                                              requestOfSubattributeData: .title) as? String,
                                                        subattribut: .positiveSymptomMerphy,
                                                        isSelected: completeData.completeSelectableData.contains(.positiveSymptomMerphy)))
            section.rows.append(SelectRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .positiveSymptomOfOrtner,
                                                                                                              requestOfSubattributeData: .title) as? String,
                                                        subattribut: .positiveSymptomOfOrtner,
                                                        isSelected: completeData.completeSelectableData.contains(.positiveSymptomOfOrtner)))
            section.rows.append(SelectRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .positiveSymptomOfGrekov,
                                                                                                              requestOfSubattributeData: .title) as? String,
                                                        subattribut: .positiveSymptomOfGrekov,
                                                        isSelected: completeData.completeSelectableData.contains(.positiveSymptomOfGrekov)))
            sections.append(section)
            var section2 = SectionSubattributes()
            section2.rows.append(SelectRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .positiveSymptomOfMayoRobson,
                                                                                                               requestOfSubattributeData: .title) as? String,
                                                         subattribut: .positiveSymptomOfMayoRobson,
                                                         isSelected: completeData.completeSelectableData.contains(.positiveSymptomOfMayoRobson)))
            sections.append(section2)
            section2.rows.append(SelectRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .positiveSymptomOfValya,
                                                                                                               requestOfSubattributeData: .title) as? String,
                                                         subattribut: .positiveSymptomOfValya,
                                                         isSelected: completeData.completeSelectableData.contains(.positiveSymptomOfValya)))
            section2.rows.append(SelectRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .positiveSymptomOfSklyarov,
                                                                                                               requestOfSubattributeData: .title) as? String,
                                                         subattribut: .positiveSymptomOfSklyarov,
                                                         isSelected: completeData.completeSelectableData.contains(.positiveSymptomOfSklyarov)))
            sections.append(section2)
        case .dyspepsia:
            section.rows.append(SelectRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .dyspepsiaNausea,
                                                                                                              requestOfSubattributeData: .title) as? String,
                                                        subattribut: .dyspepsiaNausea,
                                                        isSelected: completeData.completeSelectableData.contains(.dyspepsiaNausea)))
            section.rows.append(SelectRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .dyspepsiaVomiting,
                                                                                                              requestOfSubattributeData: .title) as? String,
                                                        subattribut: .dyspepsiaVomiting,
                                                        isSelected: completeData.completeSelectableData.contains(.dyspepsiaVomiting)))
            section.rows.append(TextRowOfSubattribute(title: nil,
                                                      subattribut: .dyspepsiaText,
                                                      text: completeData.completeTextData[.dyspepsiaText],
                                                      limit: 12))
            sections.append(section)
        case .chair:
            section.rows.append(SelectRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .chairIsFormed,
                                                                                                              requestOfSubattributeData: .title) as? String,
                                                        subattribut: .chairIsFormed,
                                                        isSelected: completeData.completeSelectableData.contains(.chairIsFormed)))
            section.rows.append(SelectRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .chairIsZapor,
                                                                                                              requestOfSubattributeData: .title) as? String,
                                                        subattribut: .chairIsZapor,
                                                        isSelected: completeData.completeSelectableData.contains(.chairIsZapor)))
            section.rows.append(SelectRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .chairIsLiquid,
                                                                                                              requestOfSubattributeData: .title) as? String,
                                                        subattribut: .chairIsLiquid,
                                                        isSelected: completeData.completeSelectableData.contains(.chairIsLiquid)))
            section.rows.append(TextRowOfSubattribute(title: nil,
                                                      subattribut: .chairText,
                                                      text: completeData.completeTextData[.chairText],
                                                      limit: 37))
            sections.append(section)
        case .diuresis:
            section.rows.append(SelectRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .diuresisIsSufficient,
                                                                                                              requestOfSubattributeData: .title) as? String,
                                                        subattribut: .diuresisIsSufficient,
                                                        isSelected: completeData.completeSelectableData.contains(.diuresisIsSufficient)))
            section.rows.append(SelectRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .diuresisIsreduced,
                                                                                                              requestOfSubattributeData: .title) as? String,
                                                        subattribut: .diuresisIsreduced,
                                                        isSelected: completeData.completeSelectableData.contains(.diuresisIsreduced)))
            section.rows.append(SelectRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .diuresisIspolyuria,
                                                                                                              requestOfSubattributeData: .title) as? String,
                                                        subattribut: .diuresisIspolyuria,
                                                        isSelected: completeData.completeSelectableData.contains(.diuresisIspolyuria)))
            section.rows.append(SelectRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .diuresisIshematuria,
                                                                                                              requestOfSubattributeData: .title) as? String,
                                                        subattribut: .diuresisIshematuria,
                                                        isSelected: completeData.completeSelectableData.contains(.diuresisIshematuria)))
            section.rows.append(SelectRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .diuresisIsAnuria,
                                                                                                              requestOfSubattributeData: .title) as? String,
                                                        subattribut: .diuresisIsAnuria,
                                                        isSelected: completeData.completeSelectableData.contains(.diuresisIsAnuria)))
            sections.append(section)

        case .perfomance:
            section.rows.append(TextRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .adBeforeMedHelp,
                                                                                                            requestOfSubattributeData: .title) as? String,
                                                      subattribut: .adBeforeMedHelp,
                                                      text: completeData.completeTextData[.adBeforeMedHelp],
                                                      limit: nil))
            section.rows.append(TextRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .adAfterMedHelp,
                                                                                                            requestOfSubattributeData: .title) as? String,
                                                      subattribut: .adAfterMedHelp,
                                                      text: completeData.completeTextData[.adAfterMedHelp],
                                                      limit: nil))
            sections.append(section)
            var section2 = SectionSubattributes()
            section2.rows.append(TextRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .chssBeforeMedHelp,
                                                                                                             requestOfSubattributeData: .title) as? String,
                                                       subattribut: .chssBeforeMedHelp,
                                                       text: completeData.completeTextData[.chssBeforeMedHelp],
                                                       limit: nil))
            section2.rows.append(TextRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .chssAfterMedHelp,
                                                                                                             requestOfSubattributeData: .title) as? String,
                                                       subattribut: .chssAfterMedHelp,
                                                       text: completeData.completeTextData[.chssAfterMedHelp],
                                                       limit: nil))
            sections.append(section2)
            var section3 = SectionSubattributes()
            section3.rows.append(TextRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .pBeforeMedHelp,
                                                                                                             requestOfSubattributeData: .title) as? String,
                                                       subattribut: .pBeforeMedHelp,
                                                       text: completeData.completeTextData[.pBeforeMedHelp],
                                                       limit: nil))
            section3.rows.append(TextRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .pAfterMedHelp,
                                                                                                             requestOfSubattributeData: .title) as? String,
                                                       subattribut: .pAfterMedHelp,
                                                       text: completeData.completeTextData[.pAfterMedHelp],
                                                       limit: nil))
            sections.append(section3)
            var section4 = SectionSubattributes()
            section4.rows.append(TextRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .chddBeforeMedHelp,
                                                                                                             requestOfSubattributeData: .title) as? String,
                                                       subattribut: .chddBeforeMedHelp,
                                                       text: completeData.completeTextData[.chddBeforeMedHelp],
                                                       limit: nil))
            section4.rows.append(TextRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .chddAfterMedHelp,
                                                                                                             requestOfSubattributeData: .title) as? String,
                                                       subattribut: .chddAfterMedHelp,
                                                       text: completeData.completeTextData[.chddAfterMedHelp],
                                                       limit: nil))
            sections.append(section4)
            var section5 = SectionSubattributes()
            section5.rows.append(TextRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .tBeforeMedHelp,
                                                                                                             requestOfSubattributeData: .title) as? String,
                                                       subattribut: .tBeforeMedHelp,
                                                       text: completeData.completeTextData[.tBeforeMedHelp],
                                                       limit: nil))
            section5.rows.append(TextRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .tAfterMedHelp,
                                                                                                             requestOfSubattributeData: .title) as? String,
                                                       subattribut: .tAfterMedHelp,
                                                       text: completeData.completeTextData[.tAfterMedHelp],
                                                       limit: nil))
            sections.append(section5)
            var section6 = SectionSubattributes()
            section6.rows.append(TextRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .spOBeforeMedHelp,
                                                                                                             requestOfSubattributeData: .title) as? String,
                                                       subattribut: .spOBeforeMedHelp,
                                                       text: completeData.completeTextData[.spOBeforeMedHelp],
                                                       limit: nil))
            section6.rows.append(TextRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .spOAfterMedHelp,
                                                                                                             requestOfSubattributeData: .title) as? String,
                                                       subattribut: .spOAfterMedHelp,
                                                       text: completeData.completeTextData[.spOAfterMedHelp],
                                                       limit: nil))
            sections.append(section6)
            var section7 = SectionSubattributes()
            section7.rows.append(TextRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .glukozaBeforeMedHelp,
                                                                                                             requestOfSubattributeData: .title) as? String,
                                                       subattribut: .glukozaBeforeMedHelp,
                                                       text: completeData.completeTextData[.glukozaBeforeMedHelp],
                                                       limit: nil))
            section7.rows.append(TextRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .glukozaAfterMedHelp,
                                                                                                             requestOfSubattributeData: .title) as? String,
                                                       subattribut: .glukozaAfterMedHelp,
                                                       text: completeData.completeTextData[.glukozaAfterMedHelp],
                                                       limit: nil))
            sections.append(section7)

        case .assistanceProvided:
            section.rows.append(TextRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .assistanceProvided,
                                                                                                            requestOfSubattributeData: .title) as? String,
                                                      subattribut: .assistanceProvided,
                                                      text: completeData.completeTextData[.assistanceProvided],
                                                      limit: nil))
            sections.append(section)
            completeData.indicator?.forEach { item in
                var newSection = SectionSubattributes()
                newSection.rows.append(TextRowOfSubattribute(title: "Время",
                                                             subattribut: .timeIndicator,
                                                             text: item.data[.timeIndicator],
                                                             limit: nil))
                newSection.rows.append(TextRowOfSubattribute(title: "АД",
                                                             subattribut: .aDtimeIndicator,
                                                             text: item.data[.aDtimeIndicator],
                                                             limit: nil))
                newSection.rows.append(TextRowOfSubattribute(title: "ЧСС",
                                                             subattribut: .chssIndicator,
                                                             text: item.data[.chssIndicator],
                                                             limit: nil))
                newSection.rows.append(TextRowOfSubattribute(title: "ЧДД",
                                                             subattribut: .chddIndicator,
                                                             text: item.data[.chddIndicator],
                                                             limit: nil))
                newSection.rows.append(TextRowOfSubattribute(title: "SpO₂",
                                                             subattribut: .spoIndicator,
                                                             text: item.data[.spoIndicator],
                                                             limit: nil))
                newSection.rows.append(TextRowOfSubattribute(title: "T°C",
                                                             subattribut: .tempIndicator,
                                                             text: item.data[.tempIndicator],
                                                             limit: nil))
                sections.append(newSection)
            }
        case .additionalAction:
            section.rows.append(SelectRowOfSubattribute(
                title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .resuscitation,
                                                                      requestOfSubattributeData: .title) as? String,
                subattribut: .resuscitation,
                isSelected: completeData.completeSelectableData.contains(.resuscitation)))
            section.rows.append(SelectRowOfSubattribute(title:
                DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .ivl_vvl,
                                                               requestOfSubattributeData: .title) as? String,
                                                        subattribut: .ivl_vvl,
                                                        isSelected: completeData.completeSelectableData.contains(.ivl_vvl)))
            section.rows.append(SelectRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .nebulizer,
                                                                                                              requestOfSubattributeData: .title) as? String,
                                                        subattribut: .nebulizer,
                                                        isSelected: completeData.completeSelectableData.contains(.nebulizer)))
            section.rows.append(SelectRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .intubationAndlaryngitis,
                                                                                                              requestOfSubattributeData: .title) as? String,
                                                        subattribut: .intubationAndlaryngitis,
                                                        isSelected: completeData.completeSelectableData.contains(.intubationAndlaryngitis)))
            section.rows.append(SelectRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .conicotomy,
                                                                                                              requestOfSubattributeData: .title) as? String,
                                                        subattribut: .conicotomy,
                                                        isSelected: completeData.completeSelectableData.contains(.conicotomy)))
            section.rows.append(SelectRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .trachestomy,
                                                                                                              requestOfSubattributeData: .title) as? String,
                                                        subattribut: .trachestomy,
                                                        isSelected: completeData.completeSelectableData.contains(.trachestomy)))
            section.rows.append(SelectRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .eit,
                                                                                                              requestOfSubattributeData: .title) as? String,
                                                        subattribut: .eit,
                                                        isSelected: completeData.completeSelectableData.contains(.eit)))
            section.rows.append(SelectRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .thrombolysis,
                                                                                                              requestOfSubattributeData: .title) as? String,
                                                        subattribut: .thrombolysis,
                                                        isSelected: completeData.completeSelectableData.contains(.thrombolysis)))
            section.rows.append(SelectRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .catheterMoch,
                                                                                                              requestOfSubattributeData: .title) as? String,
                                                        subattribut: .catheterMoch,
                                                        isSelected: completeData.completeSelectableData.contains(.catheterMoch)))
            section.rows.append(SelectRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .pills,
                                                                                                              requestOfSubattributeData: .title) as? String,
                                                        subattribut: .pills,
                                                        isSelected: completeData.completeSelectableData.contains(.pills)))
            section.rows.append(SelectRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .rinsingStomach,
                                                                                                              requestOfSubattributeData: .title) as? String,
                                                        subattribut: .rinsingStomach,
                                                        isSelected: completeData.completeSelectableData.contains(.rinsingStomach)))
            section.rows.append(SelectRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .pulseoximetry,
                                                                                                              requestOfSubattributeData: .title) as? String,
                                                        subattribut: .pulseoximetry,
                                                        isSelected: completeData.completeSelectableData.contains(.pulseoximetry)))
            section.rows.append(SelectRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .infusion,
                                                                                                              requestOfSubattributeData: .title) as? String,
                                                        subattribut: .infusion,
                                                        isSelected: completeData.completeSelectableData.contains(.infusion)))
            section.rows.append(SelectRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .catheterVV,
                                                                                                              requestOfSubattributeData: .title) as? String,
                                                        subattribut: .catheterVV,
                                                        isSelected: completeData.completeSelectableData.contains(.catheterVV)))
            section.rows.append(SelectRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .ostBlodRan,
                                                                                                              requestOfSubattributeData: .title) as? String,
                                                        subattribut: .ostBlodRan,
                                                        isSelected: completeData.completeSelectableData.contains(.ostBlodRan)))
            section.rows.append(SelectRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .bandage,
                                                                                                              requestOfSubattributeData: .title) as? String,
                                                        subattribut: .bandage,
                                                        isSelected: completeData.completeSelectableData.contains(.bandage)))
            section.rows.append(SelectRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .immobilization,
                                                                                                              requestOfSubattributeData: .title) as? String,
                                                        subattribut: .immobilization,
                                                        isSelected: completeData.completeSelectableData.contains(.immobilization)))
            section.rows.append(SelectRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .defibrillation,
                                                                                                              requestOfSubattributeData: .title) as? String,
                                                        subattribut: .defibrillation,
                                                        isSelected: completeData.completeSelectableData.contains(.defibrillation)))
            section.rows.append(SelectRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .nasalTamponade,
                                                                                                              requestOfSubattributeData: .title) as? String,
                                                        subattribut: .nasalTamponade,
                                                        isSelected: completeData.completeSelectableData.contains(.nasalTamponade)))
            section.rows.append(SelectRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .conicotomy,
                                                                                                              requestOfSubattributeData: .title) as? String,
                                                        subattribut: .conicotomy,
                                                        isSelected: completeData.completeSelectableData.contains(.conicotomy)))
            section.rows.append(SelectRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .ecgMonitor,
                                                                                                              requestOfSubattributeData: .title) as? String,
                                                        subattribut: .ecgMonitor,
                                                        isSelected: completeData.completeSelectableData.contains(.ecgMonitor)))
            section.rows.append(SelectRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .injections,
                                                                                                              requestOfSubattributeData: .title) as? String,
                                                        subattribut: .injections,
                                                        isSelected: completeData.completeSelectableData.contains(.injections)))
            section.rows.append(SelectRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .inhalation,
                                                                                                              requestOfSubattributeData: .title) as? String,
                                                        subattribut: .inhalation,
                                                        isSelected: completeData.completeSelectableData.contains(.inhalation)))
            section.rows.append(SelectRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .troponin,
                                                                                                              requestOfSubattributeData: .title) as? String,
                                                        subattribut: .troponin,
                                                        isSelected: completeData.completeSelectableData.contains(.troponin)))
            section.rows.append(SelectRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .glucoseMonitoring,
                                                                                                              requestOfSubattributeData: .title) as? String,
                                                        subattribut: .glucoseMonitoring,
                                                        isSelected: completeData.completeSelectableData.contains(.glucoseMonitoring)))
            section.rows.append(SelectRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .expenditure,
                                                                                                              requestOfSubattributeData: .title) as? String,
                                                        subattribut: .expenditure,
                                                        isSelected: completeData.completeSelectableData.contains(.expenditure)))
            sections.append(section)

        case .consumption:
            section.rows.append(TextRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .masks,
                                                                                                            requestOfSubattributeData: .title) as? String,
                                                      subattribut: .masks,
                                                      text: completeData.completeTextData[.masks],
                                                      limit: nil))
            section.rows.append(TextRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .gloves,
                                                                                                            requestOfSubattributeData: .title) as? String,
                                                      subattribut: .gloves,
                                                      text: completeData.completeTextData[.gloves],
                                                      limit: nil))
            section.rows.append(TextRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .napkins,
                                                                                                            requestOfSubattributeData: .title) as? String,
                                                      subattribut: .napkins,
                                                      text: completeData.completeTextData[.napkins],
                                                      limit: nil))
            section.rows.append(TextRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .siz,
                                                                                                            requestOfSubattributeData: .title) as? String,
                                                      subattribut: .siz,
                                                      text: completeData.completeTextData[.siz],
                                                      limit: nil))
            section.rows.append(TextRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .catheterPerefirichesky,
                                                                                                            requestOfSubattributeData: .title) as? String,
                                                      subattribut: .catheterPerefirichesky,
                                                      text: completeData.completeTextData[.catheterPerefirichesky],
                                                      limit: nil))
            section.rows.append(TextRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .catheterUrinary,
                                                                                                            requestOfSubattributeData: .title) as? String,
                                                      subattribut: .catheterUrinary,
                                                      text: completeData.completeTextData[.catheterUrinary],
                                                      limit: nil))
            section.rows.append(TextRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .bandages,
                                                                                                            requestOfSubattributeData: .title) as? String,
                                                      subattribut: .bandages,
                                                      text: completeData.completeTextData[.bandages],
                                                      limit: nil))
            section.rows.append(TextRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .infusionSystem,
                                                                                                            requestOfSubattributeData: .title) as? String,
                                                      subattribut: .infusionSystem,
                                                      text: completeData.completeTextData[.infusionSystem],
                                                      limit: nil))
            section.rows.append(TextRowOfSubattribute(title: nil,
                                                      subattribut: .consumptionText,
                                                      text: completeData.completeTextData[.consumptionText],
                                                      limit: nil))
            sections.append(section)
        }
        return  sections
    }
}
