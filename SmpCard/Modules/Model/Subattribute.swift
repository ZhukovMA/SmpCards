//
//  Subattribute.swift
//  SmpCard
//
//  Created by Maxim Zhukov on 22.03.2021.
//  Copyright © 2021 SMP. All rights reserved.
//

import Foundation

enum SubAttribute: String, Codable {
    
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
    case syringe
    case siz
    case catheterPerefirichesky
    case catheterUrinary
    case bandages
    case infusionSystem
    case consumptionText
}
