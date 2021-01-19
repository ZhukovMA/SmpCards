//
//  DataManagerGetSubattributesOfSection.swift
//  SmpCard
//
//  Created by Максим Жуков on 09.01.2021.
//  Copyright © 2021 SMP. All rights reserved.
//

import Foundation

extension DataManager {
    func getSubattributesOfSection(selectableAttribute: SelectableAttributeEnum) -> (selectableValues: [SubAttribute], textValues: [SubAttribute])? {
        switch selectableAttribute {
        case .gotSick:
            return ([.gotSickBeforeAnHour,
                     .gotSick1_3Hours,
                     .gotSick3_6Hours,
                     .gotSick6_12Hours,
                     .gotSickMoreADay],[])
        case .condition:
            return ([.conditionIsSatisfactory,
                     .conditionIsOfModerateSeverity,
                     .conditionIsHeavy,
                     .conditionIsTerminal,
                     .conditionIsDeath,],[])
        case .consciousness:
            return ([.consciousnessIsClear,
                     .consciousnessIsStunning,
                     .consciousnessIsSopor,
                     .consciousnessIsComa1,
                     .consciousnessIsComa2,
                     .consciousnessIsComa3,],[])
        case .position:
            return (
                [.positionIsActive,
                 .positionIsPassive,
                 .positionIsForced,],
                [.positionText])
        case .skin:
            return (
                [.skinIsDry,
                 .skinIsWet,
                 .skinIsWarm,
                 .skinIsCold,
                 .skinIsPhisiologicalColor,
                 .skinIsPale,
                 .skinIsHyperemic,
                 .skinIsCyanotic,
                 .skinIsJaundice,
                 .skinIsAcrocyanosis,
                 .skinIsMarbling],
                [])
        case .rash:
            return (
                [.hasRash,
                 .hasNotRash,],
                [.rashText])
        case .edema:
            return (
                [.hasEdema,
                 .hasNotEdema,],
                [.edemaText])
        case .behavior:
            return (
                [.behaviorIsCalm,
                 .behaviorIsAgitated,
                 .behaviorIsAggressive,
                 .behaviorIsDepressive,
                 .behaviorIsKontacten,
                 .behaviorIsNotKontacten,
                 .behaviorIsAmnesia,
                 .behaviorIsataxia],
                [])
        case .pupils:
            return (
                [.pupilsIsODIsEqualOS,
                 .pupilsIsODIsNotEqualOS,
                 .pupilsIsNormal,
                 .pupilsIsWide,
                 .pupilsIsNarrow,
                 .pupilsIsAnisocoria
                ],
                [])
        case .reactionToLight:
            return (
                [.reactionToLightIsAlive,
                 .reactionToLightIsHoly,
                 .reactionToLightIsNone],
                [])
        case .nystagm:
            return (
                [.hasNystagm,
                 .hasNotNystagm,
                ],
                [.nystagmText])
        case .meningealSymptom:
            return (
                [.regedivnostZatilochnihMuscle,
                 .kernig,
                 .brudzinski,
                 .hasNotMeningealSymptom
                ],
                [])
        case .focalSymptoms:
            return (
                [.hasFocalSymptoms,
                 .hasNotFocalSymptoms,
                ],
                [.focalSymptomsText])
        case .breath:
            return (
                [ .breathFeel,
                  .breathNotFeel
                ],
                [])
        case .separatedFromNasalPassages:
            return (
                [ .hasSeparatedFromNasalPassages,
                  .hasNotSeparatedFromNasalPassages],
                [])
        case .dyspnea:
            return (
                [ .dyspneaIsInspiratory,
                  .dyspneaIsExpiratory,
                  .dyspneaIsmixed,
                  .dyspneaIsPotalogic],
                [])
        case .percussionSound:
            return (
                [ .percussionSoundIsPulmonary,
                  .percussionSoundIsShortened,
                  .percussionSoundIsTympanic,
                  .percussionSoundIsDull,
                  .percussionSoundIsBoxboardAbove,
                ],
                [.percussionSoundText])
        case .auscultationBreath:
            return (
                [ .auscultationBreathIsPuerile,
                  .auscultationBreathIsVesicular,
                  .auscultationBreathIsBronchial,
                  .auscultationBreathIsHard,
                  .auscultationBreathIsTenatic,
                  .auscultationBreathIsWeakened,
                  .auscultationBreathNone,
                ],
                [.auscultationBreathText])
        case .rale:
            return (
                [ .hasNotRale,
                  .dryRale,
                  .wetRaleSmallbubble,
                  .wetRaleMediumbubble,
                  .wetRaleLargebubble,
                ],
                [.raleText])
        case .pleuralFrictionNoise:
            return (
                [ .hasPleuralFrictionNoise,
                  .hasNotPleuralFrictionNoise],
                [])
        case .heartTones:
            return (
                [ .heartTonesIsResonant,
                  .heartTonesIsPriglasheny,
                  .heartTonesIsDeaf],
                [])
        case .noise:
            return (
                [ .noiseIsSystolic,
                  .noiseIsDiastolic,
                  .noiseIsAccent,
                ],
                [.noiseText])
        case .noiseOfFrictionPericard:
            return (
                [ .hasNoiseOfFrictionPericard,
                  .hasNotNoiseOfFrictionPericard
                ],
                [])
        case .tongue:
            return (
                [ .tongueIsWet,
                  .tongueIsDry,
                  .tongueIsOverlaid,
                  .tongueText],
                [.tongueText])
        case .stomach:
            return (
                [ .stomachIsSoft,
                  .stomachIsTense,
                  .stomachIsPainful,
                  .stomachIsNotPainful,
                ],
                [.stomachText])
        case .positiveSymptom:
            return (
                [ .positiveSymptomOfSidkovskogo,
                  .positiveSymptomRovsinga,
                  .positiveSymptomMerphy,
                  .positiveSymptomOfOrtner,
                  .positiveSymptomOfMayoRobson,
                  .positiveSymptomOfObraztsov,
                  .positiveSymptomOfRazdolsky,
                  .positiveSymptomOfShchetkinBlumberg,
                  .positiveSymptomOfValya,
                  .positiveSymptomOfSklyarov,
                  .positiveSymptomOfGrekov,
                  .positiveSymptomOfRozanov,
                  .positiveSymptomOfSpijarski],
                [])
        case .dyspepsia:
            return (
                [ .dyspepsiaNausea,
                  .dyspepsiaVomiting,
                ],
                [.dyspepsiaText])
        case .chair:
            return (
                [ .chairIsFormed,
                  .chairIsZapor,
                  .chairIsLiquid,
                ],
                [.chairText])
        case .diuresis:
            return (
                [ .diuresisIsSufficient,
                  .diuresisIsreduced,
                  .diuresisIspolyuria,
                  .diuresisIshematuria,
                  .diuresisIsAnuria
                ],
                [])
        case .additionalAction:
            return(
                [ .resuscitation,
                   .ivl_vvl,
                   .nebulizer,
                   .intubationAndlaryngitis,
                   .conicotomy,
                   .trachestomy,
                   .eit,
                   .thrombolysis,
                   .catheterMoch,
                   .pills,
                   .rinsingStomach,
                   .pulseoximetry,
                   .infusion,
                   .catheterVV,
                   .ostBlodRan,
                   .bandage,
                   .immobilization,
                   .defibrillation,
                   .nasalTamponade,
                   .ecgMonitor,
                   .injections,
                   .inhalation,
                   .troponin,
                   .glucoseMonitoring,
                   .expenditure],
                 [])
        case .assistanceProvided:
            return (
                [],
                [ .assistanceProvided])
        case .consumption:
            return (
                [],
                [ .masks,
                  .gloves,
                  .napkins,
                  .siz,
                  .catheterPerefirichesky,
                  .catheterUrinary,
                  .bandages,
                  .infusionSystem,
                  .consumptionText])
        default:
            return nil
        }
    }
    
}
