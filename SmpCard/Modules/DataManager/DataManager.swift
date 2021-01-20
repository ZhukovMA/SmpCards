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
            section.rows.append(makeSelectableRow(subAttribute: .gotSickBeforeAnHour, completeData: completeData))
            section.rows.append(makeSelectableRow(subAttribute: .gotSick1_3Hours, completeData: completeData))
            section.rows.append(makeSelectableRow(subAttribute: .gotSick3_6Hours, completeData: completeData))
            section.rows.append(makeSelectableRow(subAttribute: .gotSick6_12Hours, completeData: completeData))
            section.rows.append(makeSelectableRow(subAttribute: .gotSickMoreADay, completeData: completeData))
            sections.append(section)
            
        case .condition:
            section.rows.append(makeSelectableRow(subAttribute: .conditionIsSatisfactory, completeData: completeData))
            section.rows.append(makeSelectableRow(subAttribute: .conditionIsOfModerateSeverity, completeData: completeData))
            section.rows.append(makeSelectableRow(subAttribute: .conditionIsHeavy, completeData: completeData))
            section.rows.append(makeSelectableRow(subAttribute: .conditionIsTerminal, completeData: completeData))
            section.rows.append(makeSelectableRow(subAttribute: .conditionIsDeath, completeData: completeData))
            sections.append(section)
        case .consciousness:
            section.rows.append(makeSelectableRow(subAttribute: .consciousnessIsClear, completeData: completeData))
            section.rows.append(makeSelectableRow(subAttribute: .consciousnessIsStunning, completeData: completeData))
            section.rows.append(makeSelectableRow(subAttribute: .consciousnessIsSopor, completeData: completeData))
            section.rows.append(makeSelectableRow(subAttribute: .consciousnessIsComa1, completeData: completeData))
            section.rows.append(makeSelectableRow(subAttribute: .consciousnessIsComa2, completeData: completeData))
            section.rows.append(makeSelectableRow(subAttribute: .consciousnessIsComa3, completeData: completeData))
            sections.append(section)
        case .position:
            section.rows.append(makeSelectableRow(subAttribute: .positionIsActive, completeData: completeData))
            section.rows.append(makeSelectableRow(subAttribute: .positionIsPassive, completeData: completeData))
            section.rows.append(makeSelectableRow(subAttribute: .positionIsForced, completeData: completeData))
            section.rows.append(makeTextRow(subAttribute: .positionText, completeData: completeData, limit: 10))
            sections.append(section)
        case .skin:
            section.rows.append(makeSelectableRow(subAttribute: .skinIsDry, completeData: completeData))
            section.rows.append(makeSelectableRow(subAttribute: .skinIsWet, completeData: completeData))
            sections.append(section)
            var section1 = SectionSubattributes()
            section1.rows.append(makeSelectableRow(subAttribute: .skinIsWarm, completeData: completeData))
            section1.rows.append(makeSelectableRow(subAttribute: .skinIsCold, completeData: completeData))
            sections.append(section1)
            var section2 = SectionSubattributes()
            section2.rows.append(makeSelectableRow(subAttribute: .skinIsPhisiologicalColor, completeData: completeData))
            section2.rows.append(makeSelectableRow(subAttribute: .skinIsPale, completeData: completeData))
            section2.rows.append(makeSelectableRow(subAttribute: .skinIsHyperemic, completeData: completeData))
            section2.rows.append(makeSelectableRow(subAttribute: .skinIsCyanotic, completeData: completeData))
            sections.append(section2)
            var section3 = SectionSubattributes()
            section3.rows.append(makeSelectableRow(subAttribute: .skinIsJaundice, completeData: completeData))
            section3.rows.append(makeSelectableRow(subAttribute: .skinIsAcrocyanosis, completeData: completeData))
            section3.rows.append(makeSelectableRow(subAttribute: .skinIsMarbling, completeData: completeData))
            sections.append(section3)
        case .rash:
            section.rows.append(makeSelectableRow(subAttribute: .hasNotRash, completeData: completeData))
            section.rows.append(makeSelectableRow(subAttribute: .hasRash, completeData: completeData))
            section.rows.append(makeTextRow(subAttribute: .rashText, completeData: completeData, limit: 33))
            sections.append(section)
        case .edema:
            section.rows.append(makeSelectableRow(subAttribute: .hasNotEdema, completeData: completeData))
            section.rows.append(makeSelectableRow(subAttribute: .hasEdema, completeData: completeData))
            section.rows.append(makeTextRow(subAttribute: .edemaText, completeData: completeData, limit: 28))
            sections.append(section)
        case .behavior:
            section.rows.append(makeSelectableRow(subAttribute: .behaviorIsCalm, completeData: completeData))
            section.rows.append(makeSelectableRow(subAttribute: .behaviorIsAgitated, completeData: completeData))
            section.rows.append(makeSelectableRow(subAttribute: .behaviorIsAggressive, completeData: completeData))
            section.rows.append(makeSelectableRow(subAttribute: .behaviorIsDepressive, completeData: completeData))
            sections.append(section)
            var section1 = SectionSubattributes()
            section1.rows.append(makeSelectableRow(subAttribute: .behaviorIsKontacten, completeData: completeData))
            section1.rows.append(makeSelectableRow(subAttribute: .behaviorIsNotKontacten, completeData: completeData))
            section1.rows.append(makeSelectableRow(subAttribute: .behaviorIsAmnesia, completeData: completeData))
            section1.rows.append(makeSelectableRow(subAttribute: .behaviorIsataxia, completeData: completeData))
            sections.append(section1)
        case .pupils:
            section.rows.append(makeSelectableRow(subAttribute: .pupilsIsODIsEqualOS, completeData: completeData))
            section.rows.append(makeSelectableRow(subAttribute: .pupilsIsODIsNotEqualOS, completeData: completeData))
            sections.append(section)
            var section1 = SectionSubattributes()
            section1.rows.append(makeSelectableRow(subAttribute: .pupilsIsNormal, completeData: completeData))
            section1.rows.append(makeSelectableRow(subAttribute: .pupilsIsWide, completeData: completeData))
            section1.rows.append(makeSelectableRow(subAttribute: .pupilsIsNarrow, completeData: completeData))
            section1.rows.append(makeSelectableRow(subAttribute: .pupilsIsAnisocoria, completeData: completeData))
            sections.append(section1)
        case .reactionToLight:
            section.rows.append(makeSelectableRow(subAttribute: .reactionToLightIsAlive, completeData: completeData))
            section.rows.append(makeSelectableRow(subAttribute: .reactionToLightIsHoly, completeData: completeData))
            section.rows.append(makeSelectableRow(subAttribute: .reactionToLightIsNone, completeData: completeData))
            sections.append(section)
        case .nystagm:
            section.rows.append(makeSelectableRow(subAttribute: .hasNotNystagm, completeData: completeData))
            section.rows.append(makeSelectableRow(subAttribute: .hasNystagm, completeData: completeData))
            section.rows.append(makeTextRow(subAttribute: .nystagmText, completeData: completeData, limit: 15))
            sections.append(section)
        case .meningealSymptom:
            section.rows.append(makeSelectableRow(subAttribute: .hasNotMeningealSymptom, completeData: completeData))
            sections.append(section)
            var section1 = SectionSubattributes()
            section1.rows.append(makeSelectableRow(subAttribute: .regedivnostZatilochnihMuscle, completeData: completeData))
            section1.rows.append(makeSelectableRow(subAttribute: .kernig, completeData: completeData))
            section1.rows.append(makeSelectableRow(subAttribute: .brudzinski, completeData: completeData))
            sections.append(section1)
        case .focalSymptoms:
            section.rows.append(makeSelectableRow(subAttribute: .hasNotFocalSymptoms, completeData: completeData))
            section.rows.append(makeSelectableRow(subAttribute: .hasFocalSymptoms, completeData: completeData))
            section.rows.append(makeTextRow(subAttribute: .focalSymptomsText, completeData: completeData, limit: 117))
            sections.append(section)
        case .breath:
            section.rows.append(makeSelectableRow(subAttribute: .breathFeel, completeData: completeData))
            section.rows.append(makeSelectableRow(subAttribute: .breathNotFeel, completeData: completeData))
            sections.append(section)
        case .separatedFromNasalPassages:
            section.rows.append(makeSelectableRow(subAttribute: .hasNotSeparatedFromNasalPassages, completeData: completeData))
            section.rows.append(makeSelectableRow(subAttribute: .hasSeparatedFromNasalPassages, completeData: completeData))
            sections.append(section)
        case .dyspnea:
            section.rows.append(makeSelectableRow(subAttribute: .dyspneaIsInspiratory, completeData: completeData))
            section.rows.append(makeSelectableRow(subAttribute: .dyspneaIsExpiratory, completeData: completeData))
            section.rows.append(makeSelectableRow(subAttribute: .dyspneaIsmixed, completeData: completeData))
            section.rows.append(makeSelectableRow(subAttribute: .dyspneaIsPotalogic, completeData: completeData))
            sections.append(section)
        case .percussionSound:
            section.rows.append(makeSelectableRow(subAttribute: .percussionSoundIsPulmonary, completeData: completeData))
            section.rows.append(makeSelectableRow(subAttribute: .percussionSoundIsShortened, completeData: completeData))
            section.rows.append(makeSelectableRow(subAttribute: .percussionSoundIsTympanic, completeData: completeData))
            section.rows.append(makeSelectableRow(subAttribute: .percussionSoundIsDull, completeData: completeData))
            section.rows.append(makeSelectableRow(subAttribute: .percussionSoundIsBoxboardAbove, completeData: completeData))
            section.rows.append(makeTextRow(subAttribute: .percussionSoundText, completeData: completeData, limit: 21))
            sections.append(section)
        case .auscultationBreath:
            section.rows.append(makeSelectableRow(subAttribute: .auscultationBreathIsPuerile, completeData: completeData))
            section.rows.append(makeSelectableRow(subAttribute: .auscultationBreathIsVesicular, completeData: completeData))
            section.rows.append(makeSelectableRow(subAttribute: .auscultationBreathIsBronchial, completeData: completeData))
            section.rows.append(makeSelectableRow(subAttribute: .auscultationBreathIsHard, completeData: completeData))
            section.rows.append(makeSelectableRow(subAttribute: .auscultationBreathIsTenatic, completeData: completeData))
            section.rows.append(makeSelectableRow(subAttribute: .auscultationBreathIsWeakened, completeData: completeData))
            section.rows.append(makeSelectableRow(subAttribute: .auscultationBreathNone, completeData: completeData))
            section.rows.append(makeTextRow(subAttribute: .auscultationBreathText, completeData: completeData, limit: 21))
            sections.append(section)
        case .rale:
            section.rows.append(makeSelectableRow(subAttribute: .hasNotRale, completeData: completeData))
            section.rows.append(makeSelectableRow(subAttribute: .dryRale, completeData: completeData))
            section.rows.append(makeSelectableRow(subAttribute: .wetRaleSmallbubble, completeData: completeData))
            section.rows.append(makeSelectableRow(subAttribute: .wetRaleMediumbubble, completeData: completeData))
            section.rows.append(makeSelectableRow(subAttribute: .wetRaleLargebubble, completeData: completeData))
            section.rows.append(makeTextRow(subAttribute: .raleText, completeData: completeData, limit: 24))
            sections.append(section)
        case .pleuralFrictionNoise:
            section.rows.append(makeSelectableRow(subAttribute: .hasNotPleuralFrictionNoise, completeData: completeData))
            section.rows.append(makeSelectableRow(subAttribute: .hasPleuralFrictionNoise, completeData: completeData))
            sections.append(section)
        case .heartTones:
            section.rows.append(makeSelectableRow(subAttribute: .heartTonesIsResonant, completeData: completeData))
            section.rows.append(makeSelectableRow(subAttribute: .heartTonesIsPriglasheny, completeData: completeData))
            section.rows.append(makeSelectableRow(subAttribute: .heartTonesIsDeaf, completeData: completeData))
            sections.append(section)
        case .noise:
            section.rows.append(makeSelectableRow(subAttribute: .noiseIsSystolic, completeData: completeData))
            section.rows.append(makeSelectableRow(subAttribute: .noiseIsDiastolic, completeData: completeData))
            section.rows.append(makeSelectableRow(subAttribute: .noiseIsAccent, completeData: completeData))
            section.rows.append(makeTextRow(subAttribute: .noiseText, completeData: completeData, limit: 17))
            sections.append(section)
        case .noiseOfFrictionPericard:
            section.rows.append(makeSelectableRow(subAttribute: .hasNotNoiseOfFrictionPericard, completeData: completeData))
            section.rows.append(makeSelectableRow(subAttribute: .hasNoiseOfFrictionPericard, completeData: completeData))
            sections.append(section)
        case .tongue:
            section.rows.append(makeSelectableRow(subAttribute: .tongueIsWet, completeData: completeData))
            section.rows.append(makeSelectableRow(subAttribute: .tongueIsDry, completeData: completeData))
            section.rows.append(makeSelectableRow(subAttribute: .tongueIsOverlaid, completeData: completeData))
            section.rows.append(makeTextRow(subAttribute: .tongueText, completeData: completeData, limit: 18))
            sections.append(section)
        case .stomach:
            section.rows.append(makeSelectableRow(subAttribute: .stomachIsSoft, completeData: completeData))
            section.rows.append(makeSelectableRow(subAttribute: .stomachIsTense, completeData: completeData))
            sections.append(section)
            var section1 = SectionSubattributes()
            section1.rows.append(makeSelectableRow(subAttribute: .stomachIsPainful, completeData: completeData))
            section1.rows.append(makeSelectableRow(subAttribute: .stomachIsNotPainful, completeData: completeData))
            section1.rows.append(makeTextRow(subAttribute: .stomachText, completeData: completeData, limit: 57))
            sections.append(section1)
        case .positiveSymptom:
            section.rows.append(makeSelectableRow(subAttribute: .positiveSymptomOfSpijarski, completeData: completeData))
            sections.append(section)
            var section1 = SectionSubattributes()
            section1.rows.append(makeSelectableRow(subAttribute: .positiveSymptomOfRazdolsky, completeData: completeData))
            section1.rows.append(makeSelectableRow(subAttribute: .positiveSymptomOfObraztsov, completeData: completeData))
            section1.rows.append(makeSelectableRow(subAttribute: .positiveSymptomOfSidkovskogo, completeData: completeData))
            section1.rows.append(makeSelectableRow(subAttribute: .positiveSymptomRovsinga, completeData: completeData))
            section1.rows.append(makeSelectableRow(subAttribute: .positiveSymptomOfShchetkinBlumberg, completeData: completeData))
            section1.rows.append(makeSelectableRow(subAttribute: .positiveSymptomOfRozanov, completeData: completeData))
            sections.append(section1)
            section.rows.append(makeSelectableRow(subAttribute: .positiveSymptomMerphy, completeData: completeData))
            section.rows.append(makeSelectableRow(subAttribute: .positiveSymptomOfOrtner, completeData: completeData))
            section.rows.append(makeSelectableRow(subAttribute: .positiveSymptomOfGrekov, completeData: completeData))
            sections.append(section)
            var section2 = SectionSubattributes()
            section2.rows.append(makeSelectableRow(subAttribute: .positiveSymptomOfMayoRobson, completeData: completeData))
            sections.append(section2)
            section2.rows.append(makeSelectableRow(subAttribute: .positiveSymptomOfValya, completeData: completeData))
            section2.rows.append(makeSelectableRow(subAttribute: .positiveSymptomOfSklyarov, completeData: completeData))
            sections.append(section2)
        case .dyspepsia:
            section.rows.append(makeSelectableRow(subAttribute: .dyspepsiaNausea, completeData: completeData))
            section.rows.append(makeSelectableRow(subAttribute: .dyspepsiaVomiting, completeData: completeData))
            section.rows.append(makeTextRow(subAttribute: .dyspepsiaText, completeData: completeData, limit: 12))
            sections.append(section)
        case .chair:
            section.rows.append(makeSelectableRow(subAttribute: .chairIsFormed, completeData: completeData))
            section.rows.append(makeSelectableRow(subAttribute: .chairIsZapor, completeData: completeData))
            section.rows.append(makeSelectableRow(subAttribute: .chairIsLiquid, completeData: completeData))
            section.rows.append(makeTextRow(subAttribute: .chairText, completeData: completeData, limit: 37))
            sections.append(section)
        case .diuresis:
            section.rows.append(makeSelectableRow(subAttribute: .diuresisIsSufficient, completeData: completeData))
            section.rows.append(makeSelectableRow(subAttribute: .diuresisIsreduced, completeData: completeData))
            section.rows.append(makeSelectableRow(subAttribute: .diuresisIspolyuria, completeData: completeData))
            section.rows.append(makeSelectableRow(subAttribute: .diuresisIshematuria, completeData: completeData))
            section.rows.append(makeSelectableRow(subAttribute: .diuresisIsAnuria, completeData: completeData))
            sections.append(section)
            
        case .perfomance:
            section.rows.append(makeTextRow(subAttribute: .adBeforeMedHelp, completeData: completeData, limit: nil))
            section.rows.append(makeTextRow(subAttribute: .adAfterMedHelp, completeData: completeData, limit: nil))
            sections.append(section)
            var section2 = SectionSubattributes()
            section2.rows.append(makeTextRow(subAttribute: .chssBeforeMedHelp,  completeData: completeData, limit: nil))
            section2.rows.append(makeTextRow(subAttribute: .chssAfterMedHelp,  completeData: completeData, limit: nil))
            sections.append(section2)
            var section3 = SectionSubattributes()
            section3.rows.append(makeTextRow(subAttribute: .pBeforeMedHelp,  completeData: completeData, limit: nil))
            section3.rows.append(makeTextRow(subAttribute: .pAfterMedHelp,  completeData: completeData, limit: nil))
            sections.append(section3)
            var section4 = SectionSubattributes()
            section4.rows.append(makeTextRow(subAttribute: .chddBeforeMedHelp,  completeData: completeData, limit: nil))
            section4.rows.append(makeTextRow(subAttribute: .chddAfterMedHelp,  completeData: completeData, limit: nil))
            sections.append(section4)
            var section5 = SectionSubattributes()
            section5.rows.append(makeTextRow(subAttribute: .tBeforeMedHelp,  completeData: completeData, limit: nil))
            section5.rows.append(makeTextRow(subAttribute: .tAfterMedHelp,  completeData: completeData, limit: nil))
            sections.append(section5)
            var section6 = SectionSubattributes()
            section6.rows.append(makeTextRow(subAttribute: .spOBeforeMedHelp,  completeData: completeData, limit: nil))
            section6.rows.append(makeTextRow(subAttribute: .spOAfterMedHelp,  completeData: completeData, limit: nil))
            sections.append(section6)
            var section7 = SectionSubattributes()
            section7.rows.append(makeTextRow(subAttribute: .glukozaBeforeMedHelp,  completeData: completeData, limit: nil))
            section7.rows.append(makeTextRow(subAttribute: .glukozaAfterMedHelp,  completeData: completeData, limit: nil))
            sections.append(section7)
            
        case .assistanceProvided:
            section.rows.append(makeTextRow(subAttribute: .assistanceProvided, completeData: completeData, limit: nil))
            sections.append(section)
            completeData.indicator?.forEach { item in
                var newSection = SectionSubattributes()
                newSection.rows.append(TextRowOfSubattribute(title: "Время", subattribut: .timeIndicator,       text: item.data[.timeIndicator],       limit: nil))
                newSection.rows.append(TextRowOfSubattribute(title: "АД", subattribut: .aDtimeIndicator,       text: item.data[.aDtimeIndicator],       limit: nil))
                newSection.rows.append(TextRowOfSubattribute(title: "ЧСС", subattribut: .chssIndicator,       text: item.data[.chssIndicator],       limit: nil))
                newSection.rows.append(TextRowOfSubattribute(title: "ЧДД",subattribut: .chddIndicator,       text: item.data[.chddIndicator],       limit: nil))
                newSection.rows.append(TextRowOfSubattribute(title: "SpO₂",       subattribut: .spoIndicator,       text: item.data[.spoIndicator],       limit: nil))
                newSection.rows.append(TextRowOfSubattribute(title: "T°C",       subattribut: .tempIndicator,       text: item.data[.tempIndicator],       limit: nil))
                sections.append(newSection)
            }
        case .additionalAction:
            section.rows.append(makeSelectableRow(subAttribute: .resuscitation, completeData: completeData))
            section.rows.append(makeSelectableRow(subAttribute: .ivl_vvl, completeData: completeData))
            section.rows.append(makeSelectableRow(subAttribute: .nebulizer, completeData: completeData))
            section.rows.append(makeSelectableRow(subAttribute: .intubationAndlaryngitis, completeData: completeData))
            section.rows.append(makeSelectableRow(subAttribute: .conicotomy, completeData: completeData))
            section.rows.append(makeSelectableRow(subAttribute: .trachestomy, completeData: completeData))
            section.rows.append(makeSelectableRow(subAttribute: .eit, completeData: completeData))
            section.rows.append(makeSelectableRow(subAttribute: .thrombolysis, completeData: completeData))
            section.rows.append(makeSelectableRow(subAttribute: .catheterMoch, completeData: completeData))
            section.rows.append(makeSelectableRow(subAttribute: .pills, completeData: completeData))
            section.rows.append(makeSelectableRow(subAttribute: .rinsingStomach, completeData: completeData))
            section.rows.append(makeSelectableRow(subAttribute: .pulseoximetry, completeData: completeData))
            section.rows.append(makeSelectableRow(subAttribute: .infusion, completeData: completeData))
            section.rows.append(makeSelectableRow(subAttribute: .catheterVV, completeData: completeData))
            section.rows.append(makeSelectableRow(subAttribute: .ostBlodRan, completeData: completeData))
            section.rows.append(makeSelectableRow(subAttribute: .bandage, completeData: completeData))
            section.rows.append(makeSelectableRow(subAttribute: .immobilization, completeData: completeData))
            section.rows.append(makeSelectableRow(subAttribute: .defibrillation, completeData: completeData))
            section.rows.append(makeSelectableRow(subAttribute: .nasalTamponade, completeData: completeData))
            section.rows.append(makeSelectableRow(subAttribute: .conicotomy, completeData: completeData))
            section.rows.append(makeSelectableRow(subAttribute: .ecgMonitor, completeData: completeData))
            section.rows.append(makeSelectableRow(subAttribute: .injections, completeData: completeData))
            section.rows.append(makeSelectableRow(subAttribute: .inhalation, completeData: completeData))
            section.rows.append(makeSelectableRow(subAttribute: .troponin, completeData: completeData))
            section.rows.append(makeSelectableRow(subAttribute: .glucoseMonitoring, completeData: completeData))
            section.rows.append(makeSelectableRow(subAttribute: .expenditure, completeData: completeData))
            sections.append(section)
            
        case .consumption:
            section.rows.append(makeTextRow(subAttribute: .masks, completeData: completeData, limit: nil))
            section.rows.append(makeTextRow(subAttribute: .gloves, completeData: completeData, limit: nil))
            section.rows.append(makeTextRow(subAttribute: .napkins, completeData: completeData, limit: nil))
            section.rows.append(makeTextRow(subAttribute: .siz, completeData: completeData, limit: nil))
            section.rows.append(makeTextRow(subAttribute: .catheterPerefirichesky, completeData: completeData, limit: nil))
            section.rows.append(makeTextRow(subAttribute: .catheterUrinary, completeData: completeData, limit: nil))
            section.rows.append(makeTextRow(subAttribute: .bandages, completeData: completeData, limit: nil))
            section.rows.append(makeTextRow(subAttribute: .infusionSystem, completeData: completeData, limit: nil))
            section.rows.append(makeTextRow(subAttribute: .consumptionText, completeData: completeData, limit: nil))
            sections.append(section)
        }
        return  sections
    }
    
    private func makeTextRow(subAttribute: SubAttribute, completeData: CompleteData, limit: Int?) -> TextRowOfSubattribute {
        return TextRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: .infusionSystem,
                                                                                           requestOfSubattributeData: .title) as? String,
                                     subattribut: .infusionSystem,
                                     text: completeData.completeTextData[.infusionSystem],
                                     limit: nil)
    }
    
    private func makeSelectableRow(subAttribute: SubAttribute, completeData: CompleteData) -> SelectRowOfSubattribute {
        return SelectRowOfSubattribute(title: DataManager.shared.getSubAttributeTitleOrFrame(subAttribute: subAttribute,
                                                                                             requestOfSubattributeData: .title) as? String,
                                       subattribut: subAttribute,
                                       isSelected: completeData.completeSelectableData.contains(subAttribute))
    }
    
}
