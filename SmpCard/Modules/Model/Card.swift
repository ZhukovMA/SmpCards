//
//  Attribute.swift
//  SMPCards
//
//  Created by Максим Жуков on 14.11.2020.
//  Copyright © 2020 Максим Жуков. All rights reserved.
//

import Foundation

enum SubAttribute: String, Codable{
    case numberOfCard
    
    case name
    
    case diagnose
    
    case date
    
    case Complaints
    
    case gotSickBeforeAnHour
    case gotSick1_3Hours
    case gotSick3_6Hours
    case gotSick6_12Hours
    case gotSickMoreADay
    
    case anamnesis
    
    case allergologicalAnamnesis
    
    case conditionIsSatisfactory
    case conditionIsOfModerateSeverity
    case conditionIsHeavy
    case conditionIsTerminal
    case conditionIsDeath
    
    case consciousnessIsClear
    case consciousnessIsStunning
    case consciousnessIsSopor
    case consciousnessIsComa1
    case consciousnessIsComa2
    case consciousnessIsComa3
    
    case shkg
    
    case positionIsActive
    case positionIsPassive
    case positionIsForced
    case positionText

    
    case skinIsDry
    case skinIsWet
    case skinIsWarm
    case skinIsCold
    case skinIsPhisiologicalColor
    case skinIsPale
    case skinIsHyperemic
    case skinIsCyanotic
    case skinIsJaundice
    case skinIsAcrocyanosis
    case skinIsMarbling
    
    case lymphonoduses
    
    case hasRash
    case hasNotRash
    case rashText
    
    case visibleMucous
    
    case hasEdema
    case hasNotEdema
    case edemaText
    
    case turgorOfTissue
    
    case behaviorIsCalm
    case behaviorIsAgitated
    case behaviorIsAggressive
    case behaviorIsDepressive
    case behaviorIsKontacten
    case behaviorIsNotKontacten
    case behaviorIsAmnesia
    case behaviorIsataxia
    
    case speech
    
    case pupilsIsODIsEqualOS
    case pupilsIsODIsNotEqualOS
    case pupilsIsNormal
    case pupilsIsWide
    case pupilsIsNarrow
    case pupilsIsAnisocoria
    
    case reactionToLightIsAlive
    case reactionToLightIsHoly
    case reactionToLightIsNone
    
    case hasNystagm
    case hasNotNystagm
    case nystagmText
    
    case regedivnostZatilochnihMuscle
    case kernig
    case brudzinski
    case hasNotMeningealSymptom
    
    case hasFocalSymptoms
    case hasNotFocalSymptoms
    case focalSymptomsText
    
    case breathFeel
    case breathNotFeel
    
    
    case hasSeparatedFromNasalPassages
    case hasNotSeparatedFromNasalPassages
    
    case pharynx
    
    case tonsils
    
    case chdd
    
    case dyspneaIsInspiratory
    case dyspneaIsExpiratory
    case dyspneaIsmixed
    case dyspneaIsPotalogic
    
    case percussionSoundIsPulmonary
    case percussionSoundIsShortened
    case percussionSoundIsTympanic
    case percussionSoundIsDull
    case percussionSoundIsBoxboardAbove
    case percussionSoundText
    
    case auscultationBreathIsPuerile
    case auscultationBreathIsVesicular
    case auscultationBreathIsBronchial
    case auscultationBreathIsHard
    case auscultationBreathIsTenatic
    case auscultationBreathIsWeakened
    case auscultationBreathNone
    case auscultationBreathText
    
    case hasNotRale
    case dryRale
    case wetRaleSmallbubble
    case wetRaleMediumbubble
    case wetRaleLargebubble
    case raleText
    
    case hasPleuralFrictionNoise
    case hasNotPleuralFrictionNoise
    
    case cough
    
    case heartContractions
    
    case heartTonesIsResonant
    case heartTonesIsPriglasheny
    case heartTonesIsDeaf
    
    case noiseIsSystolic
    case noiseIsDiastolic
    case noiseIsAccent
    case noiseText
    
    case pulse
    
    case deficit
    
    
    case hasNoiseOfFrictionPericard
    case hasNotNoiseOfFrictionPericard
    
    
    case normalAD
    
    case maxAD
    
    case tongueIsWet
    case tongueIsDry
    case tongueIsOverlaid
    case tongueText
    
    case stomachIsSoft
    case stomachIsTense
    case stomachIsPainful
    case stomachIsNotPainful
    case stomachText
    
    case stomachShape
    
    
    
    case positiveSymptomOfSidkovskogo
    case positiveSymptomRovsinga
    case positiveSymptomMerphy
    case positiveSymptomOfOrtner
    case positiveSymptomOfMayoRobson
    case positiveSymptomOfObraztsov
    case positiveSymptomOfRazdolsky
    case positiveSymptomOfShchetkinBlumberg
    case positiveSymptomOfValya
    case positiveSymptomOfSklyarov
    case positiveSymptomOfGrekov
    case positiveSymptomOfRozanov
    case positiveSymptomOfSpijarski
    
    case liver
    
    case hepaticDullness
    
    case spleen
    
    case dyspepsiaNausea
    case dyspepsiaVomiting
    case dyspepsiaText
    
    case chairIsFormed
    case chairIsZapor
    case chairIsLiquid
    case chairText
    
    case chairPeriodicity
    
    
    case kidneys
    
    case smPounding
    
    case diuresisIsSufficient
    case diuresisIsreduced
    case diuresisIspolyuria
    case diuresisIshematuria
    case diuresisIsAnuria
    
    
    case menses
    
    case delay
    
    case additionalData
    
    case ecgBeforeMedicalCare
    
    case ecgAfterMedicalCare
    
    case assistanceProvided
    case timeIndicator
    case aDtimeIndicator
    case chssIndicator
    case chddIndicator
    case spoIndicator
    case tempIndicator


    
    case adBeforeMedHelp
    case adAfterMedHelp
    case chssBeforeMedHelp
    case chssAfterMedHelp
    case pBeforeMedHelp
    case pAfterMedHelp
    case chddBeforeMedHelp
    case chddAfterMedHelp
    case tBeforeMedHelp
    case tAfterMedHelp
    case spOBeforeMedHelp
    case spOAfterMedHelp
    case glukozaBeforeMedHelp
    case glukozaAfterMedHelp
    
    
    case resuscitation
    case ivl_vvl
    case nebulizer
    case intubationAndlaryngitis
    case conicotomy
    case trachestomy
    case eit
    case thrombolysis
    case catheterMoch
    case pills
    case rinsingStomach
    case pulseoximetry
    case infusion
    case catheterVV
    case ostBlodRan
    case bandage
    case immobilization
    case defibrillation
    case nasalTamponade
    case ecgMonitor
    case injections
    case inhalation
    case troponin
    case glucoseMonitoring
    case expenditure
    
    case masks
    case gloves
    case napkins
    case siz
    case catheterPerefirichesky
    case catheterUrinary
    case bandages
    case infusionSystem
    case consumptionText
}





protocol RowOfSubattribute {}

class TextRowOfSubattribute: RowOfSubattribute {
    var title: String?
    let subattribut: SubAttribute
    var text: String?
    let limit: Int?
    init(title: String?, subattribut: SubAttribute, text: String?, limit: Int?) {
        self.limit = limit
        self.title = title
        self.subattribut = subattribut
        self.text = text
    }
}


struct SelectRowOfSubattribute: RowOfSubattribute {
    let title: String?
    let subattribut: SubAttribute
    var isSelected: Bool
    init(title: String?, subattribut: SubAttribute, isSelected: Bool) {
        self.title = title
        self.subattribut = subattribut
        self.isSelected = isSelected
    }
}

struct SectionSubattributes {
    var rows = [RowOfSubattribute]()
    var isMultiple: Bool = true

}

protocol Attribute {}



class TextAttribute: Attribute {
    var title: String!
    var subattribut: SubAttribute
    var attributData: String?
    var limit: Int?
    init(title: String?, subattribut: SubAttribute, attributData: String?, limit: Int?) {
        self.title = title
        self.subattribut = subattribut
        self.attributData = attributData
        self.limit = limit
    }
}


class SelectableAttribute: Attribute {
    var title: String!
    var attribute: SelectableAttributeEnum
    var sections = [SectionSubattributes]()
    var attributeData: String?
    init(title: String?, attribute: SelectableAttributeEnum, attributeData: String?) {
        self.title = title
        self.attribute = attribute
        self.attributeData = attributeData
    }
}

class IndicatorItem: Codable {
    var data = [SubAttribute: String]()
}


class CompleteData: Codable {
    var id: String!
    var name: String?
    var diagnose: String!
    var completeTextData = [SubAttribute: String]()
    var completeSelectableData =  Set<SubAttribute>()
    var indicator: [IndicatorItem]?
    
    init(completeTextData: [SubAttribute: String], completeSelectableData:  Set<SubAttribute>,  indicator: [IndicatorItem]?) {
        self.completeTextData = completeTextData
        self.completeSelectableData = completeSelectableData
        self.indicator = indicator
    }
    
     init() {}

     var indicatorIsEmpty: Bool {
        var result = true
        if let indicator = indicator {
            indicator.forEach { indicatorItem in
                if !indicatorItem.data.isEmpty {
                    result = false
                }
            }
        }
        return result
    }
}


class Card {
    
    var profile = [Attribute]()
    var attributes = [Attribute]()
    
    init(completeData: CompleteData) {
        profile.append(TextAttribute(title: "Номер карты",
                                     subattribut: .numberOfCard ,
                                     attributData: completeData.completeTextData[.numberOfCard],
                                     limit: nil))
        profile.append(TextAttribute(title: "Диагноз",
                                     subattribut: .diagnose ,
                                     attributData: completeData.completeTextData[.diagnose],
                                     limit: nil))
        profile.append(TextAttribute(title: "ФИО",
                                     subattribut: .name ,
                                     attributData: completeData.completeTextData[.name],
                                     limit: nil))
        
        var completeDate = ""
        if let date = completeData.completeTextData[.date] {
            let date = Date(timeIntervalSince1970: TimeInterval(Double(date) ?? Date().timeIntervalSince1970))
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd MMMM, yyyy | HH:mm"
            dateFormatter.locale = Locale(identifier: "RU")
            completeDate = dateFormatter.string(from: date as Date)
            
        }
        profile.append(TextAttribute(title: "Дата",
                                     subattribut: .date ,
                                     attributData: completeDate,
                                     limit: nil))
        
        attributes.append(TextAttribute(title: "Жалобы",
                                        subattribut: .Complaints ,
                                        attributData: completeData.completeTextData[.Complaints],
                                     limit: 450))
        
        attributes.append(SelectableAttribute(title: "Заболел",
                                              attribute: .gotSick,
                                              attributeData: DataManager.shared.getTextOfSelectableAttribute(completeData: completeData, selectableAttribute: .gotSick, forPreview: false)))
        
        attributes.append(TextAttribute(title: "Анамнез болезни и жизни",
                                        subattribut: .anamnesis ,
                                        attributData: completeData.completeTextData[.anamnesis],
                                     limit: 680))
        attributes.append(TextAttribute(title: "Алергологический анамнез",
                                        subattribut: .allergologicalAnamnesis ,
                                        attributData: completeData.completeTextData[.allergologicalAnamnesis],
                                     limit: 380))
        
        attributes.append(SelectableAttribute(title: "Общее состояние",
                                              attribute: .condition,
                                              attributeData: DataManager.shared.getTextOfSelectableAttribute(completeData: completeData, selectableAttribute: .condition, forPreview: false)))
        
        attributes.append(SelectableAttribute(title: "Сознание",
                                              attribute: .consciousness,
                                              attributeData: DataManager.shared.getTextOfSelectableAttribute(completeData: completeData, selectableAttribute: .consciousness, forPreview: false)))
        
        attributes.append(TextAttribute(title: "ШКГ",
                                        subattribut: .shkg ,
                                        attributData: completeData.completeTextData[.shkg],
                                     limit: 500))
        
        attributes.append(SelectableAttribute(title: "Положение",
                                              attribute: .position,
                                              attributeData: DataManager.shared.getTextOfSelectableAttribute(completeData: completeData, selectableAttribute: .position, forPreview: false)))
        
        
        attributes.append(SelectableAttribute(title: "Кожные покровы",
                                              attribute: .skin,
                                              attributeData: DataManager.shared.getTextOfSelectableAttribute(completeData: completeData, selectableAttribute: .skin, forPreview: false)))
        
        
        attributes.append(TextAttribute(title: "Лимфоузлы",
                                        subattribut: .lymphonoduses ,
                                        attributData: completeData.completeTextData[.lymphonoduses],
                                     limit: 27))
        
        attributes.append(SelectableAttribute(title: "Сыпь",
                                              attribute: .rash,
                                              attributeData: DataManager.shared.getTextOfSelectableAttribute(completeData: completeData, selectableAttribute: .rash, forPreview: false)))
        
        
        
        attributes.append(TextAttribute(title: "Видимые слизистые",
                                        subattribut: .visibleMucous ,
                                        attributData: completeData.completeTextData[.visibleMucous],
                                     limit: 30))
        
        attributes.append(SelectableAttribute(title: "Отеки",
                                              attribute: .edema,
                                              attributeData: DataManager.shared.getTextOfSelectableAttribute(completeData: completeData, selectableAttribute:.edema, forPreview: false)))
        
        
        attributes.append(TextAttribute(title: "Тургор тканей",
                                        subattribut: .turgorOfTissue ,
                                        attributData: completeData.completeTextData[.turgorOfTissue],
                                     limit: 28))
        
        attributes.append(SelectableAttribute(title: "Поведение",
                                              attribute: .behavior,
                                              attributeData: DataManager.shared.getTextOfSelectableAttribute(completeData: completeData, selectableAttribute:.behavior, forPreview: false)))
        
        
        attributes.append(TextAttribute(title: "Речь",
                                        subattribut: .speech ,
                                        attributData: completeData.completeTextData[.speech],
                                     limit: 13))
        
        attributes.append(SelectableAttribute(title: "Зрачки",
                                              attribute: .pupils,
                                              attributeData: DataManager.shared.getTextOfSelectableAttribute(completeData: completeData, selectableAttribute:.pupils, forPreview: false)))
        
        
        attributes.append(SelectableAttribute(title: "Реакция на свет",
                                              attribute: .reactionToLight,
                                              attributeData: DataManager.shared.getTextOfSelectableAttribute(completeData: completeData, selectableAttribute:.reactionToLight, forPreview: false)))
        
        
        attributes.append(SelectableAttribute(title: "Нистагм",
                                              attribute: .nystagm,
                                              attributeData: DataManager.shared.getTextOfSelectableAttribute(completeData: completeData, selectableAttribute:.nystagm, forPreview: false)))

        
        attributes.append(SelectableAttribute(title: "Минингеальные симптомы",
                                              attribute: .meningealSymptom,
                                              attributeData: DataManager.shared.getTextOfSelectableAttribute(completeData: completeData, selectableAttribute: .meningealSymptom, forPreview: false)))

        
        attributes.append(SelectableAttribute(title: "Очаговые симптомы",
                                              attribute: .focalSymptoms,
                                              attributeData: DataManager.shared.getTextOfSelectableAttribute(completeData: completeData, selectableAttribute: .focalSymptoms, forPreview: false)))

        
        attributes.append(SelectableAttribute(title: "Носовое дыхание",
                                              attribute: .breath,
                                              attributeData: DataManager.shared.getTextOfSelectableAttribute(completeData: completeData, selectableAttribute: .breath, forPreview: false)))
        

        attributes.append(SelectableAttribute(title: "Отделяемое из носовых ходов",
                                              attribute: .separatedFromNasalPassages,
                                              attributeData: DataManager.shared.getTextOfSelectableAttribute(completeData: completeData, selectableAttribute: .separatedFromNasalPassages, forPreview: false)))
        
        
        attributes.append(TextAttribute(title: "Зев",
                                        subattribut: .pharynx ,
                                        attributData: completeData.completeTextData[.pharynx],
                                     limit: 46))
        attributes.append(TextAttribute(title: "Миндалины",
                                        subattribut: .tonsils ,
                                        attributData: completeData.completeTextData[.tonsils],
                                     limit: 16))
        attributes.append(TextAttribute(title: "ЧДД",
                                        subattribut: .chdd ,
                                        attributData: completeData.completeTextData[.chdd],
                                     limit: 3))
        

        
        
        attributes.append(SelectableAttribute(title: "Одышка",
                                              attribute: .dyspnea,
                                              attributeData: DataManager.shared.getTextOfSelectableAttribute(completeData: completeData, selectableAttribute: .dyspnea, forPreview: false)))
        

        attributes.append(SelectableAttribute(title: "Перкуторный звук",
                                              attribute: .percussionSound,
                                              attributeData: DataManager.shared.getTextOfSelectableAttribute(completeData: completeData, selectableAttribute: .percussionSound, forPreview: false)))
        

        attributes.append(SelectableAttribute(title: "Аускультативно дыхание",
                                              attribute: .auscultationBreath,
                                              attributeData: DataManager.shared.getTextOfSelectableAttribute(completeData: completeData, selectableAttribute: .auscultationBreath, forPreview: false)))
        

        attributes.append(SelectableAttribute(title: "Хрипы",
                                              attribute: .rale,
                                              attributeData: DataManager.shared.getTextOfSelectableAttribute(completeData: completeData, selectableAttribute: .rale, forPreview: false)))
        

        attributes.append(SelectableAttribute(title: "Шум трения плевры",
                                              attribute: .pleuralFrictionNoise,
                                              attributeData: DataManager.shared.getTextOfSelectableAttribute(completeData: completeData, selectableAttribute: .pleuralFrictionNoise, forPreview: false)))
        
        
        
        attributes.append(TextAttribute(title: "Кашель, мокрота",
                                        subattribut: .cough ,
                                        attributData: completeData.completeTextData[.cough],
                                     limit: 30))
        attributes.append(TextAttribute(title: "Сердечные сокращения",
                                        subattribut: .heartContractions ,
                                        attributData: completeData.completeTextData[.heartContractions],
                                     limit: 62))
        

        
        attributes.append(SelectableAttribute(title: "Тоны сердца",
                                              attribute: .heartTones,
                                              attributeData: DataManager.shared.getTextOfSelectableAttribute(completeData: completeData, selectableAttribute: .heartTones, forPreview: false)))
        
        
        

        attributes.append(SelectableAttribute(title: "Шум",
                                              attribute: .noise,
                                              attributeData: DataManager.shared.getTextOfSelectableAttribute(completeData: completeData, selectableAttribute: .noise, forPreview: false)))
        
        
        attributes.append(TextAttribute(title: "Пульс",
                                        subattribut: .pulse ,
                                        attributData: completeData.completeTextData[.pulse],
                                     limit: 13))
        attributes.append(TextAttribute(title: "Дефицит пульса",
                                        subattribut: .deficit ,
                                        attributData: completeData.completeTextData[.deficit],
                                     limit: 32))
        

        attributes.append(SelectableAttribute(title: "Шум трения перикарда",
                                              attribute: .noiseOfFrictionPericard,
                                              attributeData: DataManager.shared.getTextOfSelectableAttribute(completeData: completeData, selectableAttribute: .noiseOfFrictionPericard, forPreview: false)))
        
        
        attributes.append(TextAttribute(title: "Привычное АД",
                                        subattribut: .normalAD ,
                                        attributData: completeData.completeTextData[.normalAD],
                                     limit: 36))
        attributes.append(TextAttribute(title: "Макс. АД",
                                        subattribut: .maxAD ,
                                        attributData: completeData.completeTextData[.maxAD],
                                     limit: 39))
        

        attributes.append(SelectableAttribute(title: "Язык",
                                              attribute: .tongue,
                                              attributeData: DataManager.shared.getTextOfSelectableAttribute(completeData: completeData, selectableAttribute: .tongue, forPreview: false)))
        
        
        

        attributes.append(SelectableAttribute(title: "Живот",
                                              attribute: .stomach,
                                              attributeData: DataManager.shared.getTextOfSelectableAttribute(completeData: completeData, selectableAttribute: .stomach, forPreview: false)))
        
        
        attributes.append(TextAttribute(title: "Форма живота",
                                        subattribut: .stomachShape ,
                                        attributData: completeData.completeTextData[.stomachShape],
                                     limit: 21))
        
   
        attributes.append(SelectableAttribute(title: "Положительные симптомы",
                                              attribute: .positiveSymptom,
                                              attributeData: DataManager.shared.getTextOfSelectableAttribute(completeData: completeData,selectableAttribute: .positiveSymptom, forPreview: false)))
        
        
        attributes.append(TextAttribute(title: "Печень",
                                        subattribut: .liver ,
                                        attributData: completeData.completeTextData[.liver],
                                     limit: 37))
        attributes.append(TextAttribute(title: "Печеночная тупость",
                                        subattribut: .hepaticDullness ,
                                        attributData: completeData.completeTextData[.hepaticDullness],
                                     limit: 25))
        attributes.append(TextAttribute(title: "Селезенка",
                                        subattribut: .spleen ,
                                        attributData: completeData.completeTextData[.spleen],
                                     limit: 34))
        

        attributes.append(SelectableAttribute(title: "Диспепсия",
                                              attribute: .dyspepsia,
                                              attributeData: DataManager.shared.getTextOfSelectableAttribute(completeData: completeData,selectableAttribute: .dyspepsia, forPreview: false)))
        
        
        

        attributes.append(SelectableAttribute(title: "Стул",
                                              attribute: .chair,
                                              attributeData: DataManager.shared.getTextOfSelectableAttribute(completeData: completeData, selectableAttribute: .chair, forPreview: false)))
        
        
        attributes.append(TextAttribute(title: "Стул раз/сутки",
                                        subattribut: .chairPeriodicity ,
                                        attributData: completeData.completeTextData[.chairPeriodicity],
                                     limit: 5))
        attributes.append(TextAttribute(title: "Почки",
                                        subattribut: .kidneys ,
                                        attributData: completeData.completeTextData[.kidneys],
                                     limit: 44))
        attributes.append(TextAttribute(title: "С-м покалачивания",
                                        subattribut: .smPounding ,
                                        attributData: completeData.completeTextData[.smPounding],
                                     limit: 46))
        
   
        attributes.append(SelectableAttribute(title: "Диурез",
                                              attribute: .diuresis,
                                              attributeData: DataManager.shared.getTextOfSelectableAttribute(completeData: completeData,selectableAttribute: .diuresis, forPreview: false)))
        
        
        attributes.append(TextAttribute(title: "Menses",
                                        subattribut: .menses ,
                                        attributData: completeData.completeTextData[.menses],
                                     limit: 19))
        attributes.append(TextAttribute(title: "Задержка",
                                        subattribut: .delay ,
                                        attributData: completeData.completeTextData[.delay],
                                     limit: 10))
        attributes.append(TextAttribute(title: "Доп. данные,локальный статус",
                                        subattribut: .additionalData ,
                                        attributData: completeData.completeTextData[.additionalData],
                                     limit: 630))
        
        attributes.append(SelectableAttribute(title: "Показатели до и после",
                                              attribute: .perfomance,
                                              attributeData: nil))
        
        attributes.append(TextAttribute(title: "Экг до помощи",
                                        subattribut: .ecgBeforeMedicalCare ,
                                        attributData: completeData.completeTextData[.ecgBeforeMedicalCare],
                                     limit: 500))
        attributes.append(TextAttribute(title: "Экг после помощи",
                                        subattribut: .ecgAfterMedicalCare ,
                                        attributData: completeData.completeTextData[.ecgAfterMedicalCare],
                                     limit: 500))
     //-----------------------------------
        attributes.append(SelectableAttribute(title: "Дополнительно применено",
                                              attribute: .additionalAction,
                                              attributeData: DataManager.shared.getTextOfSelectableAttribute(completeData: completeData, selectableAttribute: .additionalAction, forPreview: false)))
        
        
        attributes.append(SelectableAttribute(title: "Оказаная помощь",
                                              attribute: .assistanceProvided,
                                              attributeData: DataManager.shared.getTextOfSelectableAttribute(completeData: completeData,  selectableAttribute: .assistanceProvided, forPreview: false)))
        
        attributes.append(SelectableAttribute(title: "Расход",
                                              attribute: .consumption,
                                              attributeData: DataManager.shared.getTextOfSelectableAttribute(completeData: completeData,  selectableAttribute: .consumption, forPreview: false)))
        
    }
}
