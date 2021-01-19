//
//  DataManager.swift
//  SMPCards
//
//  Created by Максим Жуков on 16.11.2020.
//  Copyright © 2020 Максим Жуков. All rights reserved.
//

import Foundation

extension String: ResponseSubAttribute {}
extension Array: ResponseSubAttribute {}

protocol ResponseSubAttribute {}

enum  RequestOfSubattributeData {
    case title
    case frame
}

struct FrameOfSubAttribute {
    let x: Double
    let y: Double
    let weight: Double
    let height: Double
    let paragraphLenght: Int
    let lineSpacing: Double
    let isMain: Bool
}

extension DataManager {
    
    func getSubAttributeTitleOrFrame(subAttribute: SubAttribute, requestOfSubattributeData: RequestOfSubattributeData) -> ResponseSubAttribute? {
        switch subAttribute {
        case .Complaints:
            switch requestOfSubattributeData {
            case .title:
                return "Жалобы"
            case .frame:
                return [FrameOfSubAttribute(x: 50, y: 43, weight: 500, height: 30, paragraphLenght: 10, lineSpacing: 3, isMain: true)]
            }
        case .gotSickBeforeAnHour:
            switch requestOfSubattributeData {
            case .title:
                return "до часа"
            case .frame:
                return [FrameOfSubAttribute(x: 77, y: 75.5, weight: 5, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .gotSick1_3Hours:
            switch requestOfSubattributeData {
            case .title:
                return "от 1 до 3 часов"
            case .frame:
                return [FrameOfSubAttribute(x: 113, y: 75.5, weight: 5, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .gotSick3_6Hours:
            switch requestOfSubattributeData {
            case .title:
                return "от 3 до 6 часов"
            case .frame:
                return [FrameOfSubAttribute(x: 152.5, y: 75.5, weight: 5, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .gotSick6_12Hours:
            switch requestOfSubattributeData {
            case .title:
                return "от 6 до 12 часов"
            case .frame:
                return [FrameOfSubAttribute(x: 192.3, y: 75.5, weight: 5, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .gotSickMoreADay:
            switch requestOfSubattributeData {
            case .title:
                return "свыше суток"
            case .frame:
                return [FrameOfSubAttribute(x: 235.4, y: 75.5, weight: 5, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .anamnesis:
            switch requestOfSubattributeData {
            case .title:
                return nil
            case .frame:
                return [FrameOfSubAttribute(x: 48, y: 86.5, weight: 500, height: 51, paragraphLenght: 34, lineSpacing: 1.55, isMain: true)]
            }
        case .allergologicalAnamnesis:
            switch requestOfSubattributeData {
            case .title:
                return nil
            case .frame:
                return [FrameOfSubAttribute(x: 48, y: 137.5, weight: 500, height: 30, paragraphLenght: 66, lineSpacing: 1.42, isMain: true)]
            }
        case .conditionIsSatisfactory:
            switch requestOfSubattributeData {
            case .title:
                return "удовлетворительное"
            case .frame:
                return [FrameOfSubAttribute(x: 179, y: 170.5, weight: 5, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .conditionIsOfModerateSeverity:
            switch requestOfSubattributeData {
            case .title:
                return "средней тяжести"
            case .frame:
                return [FrameOfSubAttribute(x: 254, y: 170.5, weight: 5, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .conditionIsHeavy:
            switch requestOfSubattributeData {
            case .title:
                return "тяжелое"
            case .frame:
                return [FrameOfSubAttribute(x: 318, y: 170.5, weight: 5, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .conditionIsTerminal:
            switch requestOfSubattributeData {
            case .title:
                return "терминальное"
            case .frame:
                return [FrameOfSubAttribute(x: 356, y: 170.5, weight: 5, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .conditionIsDeath:
            switch requestOfSubattributeData {
            case .title:
                return "смерть"
            case .frame:
                return [FrameOfSubAttribute(x: 412, y: 170.5, weight: 5, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .consciousnessIsClear:
            switch requestOfSubattributeData {
            case .title:
                return "ясное"
            case .frame:
                return [FrameOfSubAttribute(x: 81, y: 182.5, weight: 5, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .consciousnessIsStunning:
            switch requestOfSubattributeData {
            case .title:
                return "оглушение"
            case .frame:
                return [FrameOfSubAttribute(x: 110, y: 182.5, weight: 5, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .consciousnessIsSopor:
            switch requestOfSubattributeData {
            case .title:
                return "сопор"
            case .frame:
                return [FrameOfSubAttribute(x: 157, y: 182.5, weight: 5, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .consciousnessIsComa1:
            switch requestOfSubattributeData {
            case .title:
                return "кома 1 ст."
            case .frame:
                return [FrameOfSubAttribute(x: 212.5, y: 182.5, weight: 5, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true), FrameOfSubAttribute(x: 185, y: 182.5, weight: 5, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .consciousnessIsComa2:
            switch requestOfSubattributeData {
            case .title:
                return "кома 2 ст."
            case .frame:
                return [FrameOfSubAttribute(x: 227.5, y: 182.5, weight: 5, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true), FrameOfSubAttribute(x: 185, y: 182.5, weight: 5, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .consciousnessIsComa3:
            switch requestOfSubattributeData {
            case .title:
                return "кома 3 ст."
            case .frame:
                return [FrameOfSubAttribute(x: 244, y: 182.5, weight: 5, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true), FrameOfSubAttribute(x: 185, y: 182.5, weight: 5, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .shkg:
            switch requestOfSubattributeData {
            case .title:
                return nil
            case .frame:
                return [FrameOfSubAttribute(x: 265, y: 183, weight: 5, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: false), FrameOfSubAttribute(x: 289, y: 183, weight: 22, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .positionIsActive:
            switch requestOfSubattributeData {
            case .title:
                return "активное"
            case .frame:
                return [FrameOfSubAttribute(x: 379, y: 182.5, weight: 5, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .positionIsPassive:
            switch requestOfSubattributeData {
            case .title:
                return "пассивное"
            case .frame:
                return [FrameOfSubAttribute(x: 420, y: 182.5, weight: 5, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .positionIsForced:
            switch requestOfSubattributeData {
            case .title:
                return "вынуженное"
            case .frame:
                return [FrameOfSubAttribute(x: 464, y: 182.5, weight: 5, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .positionText:
            switch requestOfSubattributeData {
            case .title:
                return nil
            case .frame:
                return [FrameOfSubAttribute(x: 513, y: 182.5, weight: 33, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .skinIsDry:
            switch requestOfSubattributeData {
            case .title:
                return "сухие"
            case .frame:
                return [FrameOfSubAttribute(x: 103, y: 194.5, weight: 5, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .skinIsWet:
            switch requestOfSubattributeData {
            case .title:
                return "влажные"
            case .frame:
                return [FrameOfSubAttribute(x: 137, y: 194.5, weight: 5, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .skinIsWarm:
            switch requestOfSubattributeData {
            case .title:
                return "теплые"
            case .frame:
                return [FrameOfSubAttribute(x: 180.5, y: 194.5, weight: 5, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .skinIsCold:
            switch requestOfSubattributeData {
            case .title:
                return "холодные"
            case .frame:
                return [FrameOfSubAttribute(x: 218, y: 194.5, weight: 5, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .skinIsPhisiologicalColor:
            switch requestOfSubattributeData {
            case .title:
                return "физиологической окраски"
            case .frame:
                return [FrameOfSubAttribute(x: 265.5, y: 194.5, weight: 5, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .skinIsPale:
            switch requestOfSubattributeData {
            case .title:
                return "бледные"
            case .frame:
                return [FrameOfSubAttribute(x: 361.5, y: 194.5, weight: 5, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .skinIsHyperemic:
            switch requestOfSubattributeData {
            case .title:
                return "гипермированные"
            case .frame:
                return [FrameOfSubAttribute(x: 403.7, y: 194.5, weight: 5, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .skinIsCyanotic:
            switch requestOfSubattributeData {
            case .title:
                return "цианотичные"
            case .frame:
                return [FrameOfSubAttribute(x: 477.5, y: 194.5, weight: 5, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .skinIsJaundice:
            switch requestOfSubattributeData {
            case .title:
                return "желтушные"
            case .frame:
                return [FrameOfSubAttribute(x: 47, y: 205.5, weight: 5, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .skinIsAcrocyanosis:
            switch requestOfSubattributeData {
            case .title:
                return "акроцианоз"
            case .frame:
                return [FrameOfSubAttribute(x: 97, y: 205.5, weight: 5, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .skinIsMarbling:
            switch requestOfSubattributeData {
            case .title:
                return "мраморность"
            case .frame:
                return [FrameOfSubAttribute(x: 148.5, y: 205.5, weight: 5, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .lymphonoduses:
            switch requestOfSubattributeData {
            case .title:
                return nil
            case .frame:
                return [FrameOfSubAttribute(x: 241, y: 206, weight: 98, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .hasNotRash:
            switch requestOfSubattributeData {
            case .title:
                return "нет"
            case .frame:
                return [FrameOfSubAttribute(x: 365, y: 205.5, weight: 5, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .hasRash:
            switch requestOfSubattributeData {
            case .title:
                return "есть"
            case .frame:
                return [FrameOfSubAttribute(x: 389, y: 205.5, weight: 5, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .rashText:
            switch requestOfSubattributeData {
            case .title:
                return nil
            case .frame:
                return [FrameOfSubAttribute(x: 410, y: 206, weight: 137, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .visibleMucous:
            switch requestOfSubattributeData {
            case .title:
                return nil
            case .frame:
                return [FrameOfSubAttribute(x: 113, y: 219.5, weight: 111, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .hasNotEdema:
            switch requestOfSubattributeData {
            case .title:
                return "нет"
            case .frame:
                return [FrameOfSubAttribute(x: 249.5, y: 218.5, weight: 5, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .hasEdema:
            switch requestOfSubattributeData {
            case .title:
                return "есть"
            case .frame:
                return [FrameOfSubAttribute(x: 275, y: 218.5, weight: 5, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .edemaText:
            switch requestOfSubattributeData {
            case .title:
                return nil
            case .frame:
                return [FrameOfSubAttribute(x: 298, y: 219.5, weight: 104, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .turgorOfTissue:
            switch requestOfSubattributeData {
            case .title:
                return nil
            case .frame:
                return [FrameOfSubAttribute(x: 448, y: 219.5, weight: 100, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .behaviorIsCalm:
            switch requestOfSubattributeData {
            case .title:
                return "спокойное"
            case .frame:
                return [FrameOfSubAttribute(x: 143.5, y: 230.5, weight: 5, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .behaviorIsAgitated:
            switch requestOfSubattributeData {
            case .title:
                return "возбужденное"
            case .frame:
                return [FrameOfSubAttribute(x: 191, y: 230.5, weight: 5, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .behaviorIsAggressive:
            switch requestOfSubattributeData {
            case .title:
                return "агрессивное"
            case .frame:
                return [FrameOfSubAttribute(x: 248.5, y: 230.5, weight: 5, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .behaviorIsDepressive:
            switch requestOfSubattributeData {
            case .title:
                return "депрессивное"
            case .frame:
                return [FrameOfSubAttribute(x: 300.5, y: 230.5, weight: 5, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .behaviorIsKontacten:
            switch requestOfSubattributeData {
            case .title:
                return "контактен"
            case .frame:
                return [FrameOfSubAttribute(x: 359.5, y: 230.5, weight: 5, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .behaviorIsNotKontacten:
            switch requestOfSubattributeData {
            case .title:
                return "не контактен"
            case .frame:
                return [FrameOfSubAttribute(x: 405, y: 230.5, weight: 5, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .behaviorIsAmnesia:
            switch requestOfSubattributeData {
            case .title:
                return "амнезия"
            case .frame:
                return [FrameOfSubAttribute(x: 458, y: 230.5, weight: 5, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .behaviorIsataxia:
            switch requestOfSubattributeData {
            case .title:
                return "атаксия"
            case .frame:
                return [FrameOfSubAttribute(x: 499, y: 230.5, weight: 5, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .speech:
            switch requestOfSubattributeData {
            case .title:
                return nil
            case .frame:
                return [FrameOfSubAttribute(x: 64, y: 243, weight: 47, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .pupilsIsODIsEqualOS:
            switch requestOfSubattributeData {
            case .title:
                return "OD = OS"
            case .frame:
                return [FrameOfSubAttribute(x: 141, y: 242.5, weight: 5, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .pupilsIsODIsNotEqualOS:
            switch requestOfSubattributeData {
            case .title:
                return "OD != OS"
            case .frame:
                return [FrameOfSubAttribute(x: 180, y: 242.5, weight: 5, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .pupilsIsNormal:
            switch requestOfSubattributeData {
            case .title:
                return "обычные"
            case .frame:
                return [FrameOfSubAttribute(x: 220.5, y: 242.5, weight: 5, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .pupilsIsWide:
            switch requestOfSubattributeData {
            case .title:
                return "широкие"
            case .frame:
                return [FrameOfSubAttribute(x: 263.5, y: 242.5, weight: 5, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .pupilsIsNarrow:
            switch requestOfSubattributeData {
            case .title:
                return "узкие"
            case .frame:
                return [FrameOfSubAttribute(x: 304, y: 242.5, weight: 5, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .pupilsIsAnisocoria:
            switch requestOfSubattributeData {
            case .title:
                return "анизокория"
            case .frame:
                return [FrameOfSubAttribute(x: 334, y: 242.5, weight: 5, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .reactionToLightIsAlive:
            switch requestOfSubattributeData {
            case .title:
                return "живая"
            case .frame:
                return [FrameOfSubAttribute(x: 439, y: 242.5, weight: 5, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .reactionToLightIsHoly:
            switch requestOfSubattributeData {
            case .title:
                return "вялая"
            case .frame:
                return [FrameOfSubAttribute(x: 471, y: 242.5, weight: 5, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .reactionToLightIsNone:
            switch requestOfSubattributeData {
            case .title:
                return "отсутствует"
            case .frame:
                return [FrameOfSubAttribute(x: 504.5, y: 242.5, weight: 5, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .hasNotNystagm:
            switch requestOfSubattributeData {
            case .title:
                return "нет"
            case .frame:
                return [FrameOfSubAttribute(x: 76, y: 255.5, weight: 5, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .hasNystagm:
            switch requestOfSubattributeData {
            case .title:
                return "есть"
            case .frame:
                return [FrameOfSubAttribute(x: 103, y: 255.5, weight: 5, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .nystagmText:
            switch requestOfSubattributeData {
            case .title:
                return nil
            case .frame:
                return [FrameOfSubAttribute(x: 127.5, y: 255.5, weight: 53, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .hasNotMeningealSymptom:
            switch requestOfSubattributeData {
            case .title:
                return "нет"
            case .frame:
                return [FrameOfSubAttribute(x: 274.5, y: 255.5, weight: 5, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .regedivnostZatilochnihMuscle:
            switch requestOfSubattributeData {
            case .title:
                return "ригидивность затылочных мышц"
            case .frame:
                return [FrameOfSubAttribute(x: 298, y: 255.5, weight: 5, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true), FrameOfSubAttribute(x: 327, y: 255.5, weight: 5, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .kernig:
            switch requestOfSubattributeData {
            case .title:
                return "Кернига"
            case .frame:
                return [FrameOfSubAttribute(x: 298, y: 255.5, weight: 5, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true), FrameOfSubAttribute(x: 436, y: 255.5, weight: 5, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .brudzinski:
            switch requestOfSubattributeData {
            case .title:
                return "Брудзинского"
            case .frame:
                return [FrameOfSubAttribute(x: 298, y: 255.5, weight: 5, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true), FrameOfSubAttribute(x: 474, y: 255.5, weight: 5, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .hasFocalSymptoms:
            switch requestOfSubattributeData {
            case .title:
                return "есть"
            case .frame:
                return [FrameOfSubAttribute(x: 141, y: 266.5, weight: 5, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .hasNotFocalSymptoms:
            switch requestOfSubattributeData {
            case .title:
                return "нет"
            case .frame:
                return [FrameOfSubAttribute(x: 116, y: 266.5, weight: 5, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .focalSymptomsText:
            switch requestOfSubattributeData {
            case .title:
                return nil
            case .frame:
                return [FrameOfSubAttribute(x: 167, y: 266.5, weight: 378, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .breathFeel:
            switch requestOfSubattributeData {
            case .title:
                return "свободное"
            case .frame:
                return [FrameOfSubAttribute(x: 173, y: 279.5, weight: 74, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .breathNotFeel:
            switch requestOfSubattributeData {
            case .title:
                return "затруднено"
            case .frame:
                return [FrameOfSubAttribute(x: 173, y: 279.5, weight: 74, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .hasNotSeparatedFromNasalPassages:
            switch requestOfSubattributeData {
            case .title:
                return "нет"
            case .frame:
                return [FrameOfSubAttribute(x: 351, y: 279, weight: 5, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .hasSeparatedFromNasalPassages:
            switch requestOfSubattributeData {
            case .title:
                return "есть"
            case .frame:
                return [FrameOfSubAttribute(x: 376, y: 279, weight: 5, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .pharynx:
            switch requestOfSubattributeData {
            case .title:
                return nil
            case .frame:
                return [FrameOfSubAttribute(x: 413, y: 279.5, weight: 132, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .tonsils:
            switch requestOfSubattributeData {
            case .title:
                return nil
            case .frame:
                return [FrameOfSubAttribute(x: 72, y: 291.5, weight: 80, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .chdd:
            switch requestOfSubattributeData {
            case .title:
                return nil
            case .frame:
                return [FrameOfSubAttribute(x: 158, y: 291.5, weight: 16, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .dyspneaIsInspiratory:
            switch requestOfSubattributeData {
            case .title:
                return "инспираторная"
            case .frame:
                return [FrameOfSubAttribute(x: 229.5, y: 291.5, weight: 5, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .dyspneaIsExpiratory:
            switch requestOfSubattributeData {
            case .title:
                return "экспираторная"
            case .frame:
                return [FrameOfSubAttribute(x: 292, y: 291.5, weight: 5, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .dyspneaIsmixed:
            switch requestOfSubattributeData {
            case .title:
                return "смешанная"
            case .frame:
                return [FrameOfSubAttribute(x: 352.5, y: 291.5, weight: 5, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .dyspneaIsPotalogic:
            switch requestOfSubattributeData {
            case .title:
                return "патологическое дыхание"
            case .frame:
                return [FrameOfSubAttribute(x: 403.5, y: 291.5, weight: 5, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .percussionSoundIsPulmonary:
            switch requestOfSubattributeData {
            case .title:
                return "легочный"
            case .frame:
                return [FrameOfSubAttribute(x: 108, y: 302.5, weight: 5, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .percussionSoundIsShortened:
            switch requestOfSubattributeData {
            case .title:
                return "укорочен"
            case .frame:
                return [FrameOfSubAttribute(x: 150.5, y: 302.5, weight: 5, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .percussionSoundIsTympanic:
            switch requestOfSubattributeData {
            case .title:
                return "тимпанический"
            case .frame:
                return [FrameOfSubAttribute(x: 192, y: 302.5, weight: 5, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .percussionSoundIsDull:
            switch requestOfSubattributeData {
            case .title:
                return "тупой"
            case .frame:
                return [FrameOfSubAttribute(x: 256.5, y: 302.5, weight: 5, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .percussionSoundIsBoxboardAbove:
            switch requestOfSubattributeData {
            case .title:
                return "коробочный над"
            case .frame:
                return [FrameOfSubAttribute(x: 289, y: 302.5, weight: 5, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .percussionSoundText:
            switch requestOfSubattributeData {
            case .title:
                return nil
            case .frame:
                return [FrameOfSubAttribute(x: 350, y: 303.5, weight: 64, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .auscultationBreathIsPuerile:
            switch requestOfSubattributeData {
            case .title:
                return "пуэрильное"
            case .frame:
                return [FrameOfSubAttribute(x: 504, y: 302.5, weight: 5, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .auscultationBreathIsVesicular:
            switch requestOfSubattributeData {
            case .title:
                return "везикулярное"
            case .frame:
                return [FrameOfSubAttribute(x: 47, y: 315, weight: 5, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .auscultationBreathIsBronchial:
            switch requestOfSubattributeData {
            case .title:
                return "бронхиальное"
            case .frame:
                return [FrameOfSubAttribute(x: 102.5, y: 315, weight: 5, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .auscultationBreathIsHard:
            switch requestOfSubattributeData {
            case .title:
                return "жесткое"
            case .frame:
                return [FrameOfSubAttribute(x: 158.5, y: 315, weight: 5, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .auscultationBreathIsTenatic:
            switch requestOfSubattributeData {
            case .title:
                return "cтенотическое"
            case .frame:
                return [FrameOfSubAttribute(x: 196.5, y: 315, weight: 5, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .auscultationBreathIsWeakened:
            switch requestOfSubattributeData {
            case .title:
                return "ослаблено"
            case .frame:
                return [FrameOfSubAttribute(x: 257, y: 315, weight: 5, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .auscultationBreathNone:
            switch requestOfSubattributeData {
            case .title:
                return "отсутствует"
            case .frame:
                return [FrameOfSubAttribute(x: 305, y: 315, weight: 5, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .auscultationBreathText:
            switch requestOfSubattributeData {
            case .title:
                return nil
            case .frame:
                return [FrameOfSubAttribute(x: 349, y: 315, weight: 63, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .hasNotRale:
            switch requestOfSubattributeData {
            case .title:
                return "нет"
            case .frame:
                return [FrameOfSubAttribute(x: 440, y: 315, weight: 5, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .dryRale:
            switch requestOfSubattributeData {
            case .title:
                return "сухие"
            case .frame:
                return [FrameOfSubAttribute(x: 484.5, y: 315, weight: 5, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true), FrameOfSubAttribute(x: 462, y: 315, weight: 5, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .wetRaleSmallbubble:
            switch requestOfSubattributeData {
            case .title:
                return "влажные-мелкопузырчатые"
            case .frame:
                return [FrameOfSubAttribute(x: 514, y: 315, weight: 5, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true),
                        FrameOfSubAttribute(x: 462, y: 315, weight: 5, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true),
                        FrameOfSubAttribute(x: 46.5 , y: 326.5, weight: 5, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .wetRaleMediumbubble:
            switch requestOfSubattributeData {
            case .title:
                return "влажные-среднепузырчатые"
            case .frame:
                return [FrameOfSubAttribute(x: 514, y: 315, weight: 5, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true),
                        FrameOfSubAttribute(x: 462, y: 315, weight: 5, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true),
                        FrameOfSubAttribute(x: 80.5, y: 326.5, weight: 5, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .wetRaleLargebubble:
            switch requestOfSubattributeData {
            case .title:
                return "влажные-крупнопузырчатые"
            case .frame:
                return [FrameOfSubAttribute(x: 514, y: 315, weight: 5, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true),
                        FrameOfSubAttribute(x: 462, y: 315, weight: 5, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true),
                        FrameOfSubAttribute(x: 118.5, y: 326.5, weight: 5, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .raleText:
            switch requestOfSubattributeData {
            case .title:
                return nil
            case .frame:
                return [FrameOfSubAttribute(x: 195, y: 327.5, weight: 72, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
            
        case .hasNotPleuralFrictionNoise:
            switch requestOfSubattributeData {
            case .title:
                return "нет"
            case .frame:
                return [FrameOfSubAttribute(x: 341, y: 326.5, weight: 5, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .hasPleuralFrictionNoise:
            switch requestOfSubattributeData {
            case .title:
                return "есть"
            case .frame:
                return [FrameOfSubAttribute(x: 366, y: 326.5, weight: 5, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
            
            
        case .cough:
            switch requestOfSubattributeData {
            case .title:
                return nil
            case .frame:
                return [FrameOfSubAttribute(x: 445, y: 327.5, weight: 96, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .heartContractions:
            switch requestOfSubattributeData {
            case .title:
                return nil
            case .frame:
                return [FrameOfSubAttribute(x: 206, y: 339.5, weight: 174, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .heartTonesIsResonant:
            switch requestOfSubattributeData {
            case .title:
                return "звучные"
            case .frame:
                return [FrameOfSubAttribute(x: 429.5, y: 338.5, weight: 5, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .heartTonesIsPriglasheny:
            switch requestOfSubattributeData {
            case .title:
                return "приглушены"
            case .frame:
                return [FrameOfSubAttribute(x: 469, y: 338.5, weight: 5, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .heartTonesIsDeaf:
            switch requestOfSubattributeData {
            case .title:
                return "глухие"
            case .frame:
                return [FrameOfSubAttribute(x: 520.5, y: 338.5, weight: 5, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .noiseIsSystolic:
            switch requestOfSubattributeData {
            case .title:
                return "систолический"
            case .frame:
                return [FrameOfSubAttribute(x: 64, y: 351.5, weight: 5, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .noiseIsDiastolic:
            switch requestOfSubattributeData {
            case .title:
                return "диастолический"
            case .frame:
                return [FrameOfSubAttribute(x: 129, y: 351.5, weight: 5, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .noiseIsAccent:
            switch requestOfSubattributeData {
            case .title:
                return "акцент"
            case .frame:
                return [FrameOfSubAttribute(x: 197, y: 351.5, weight: 5, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .noiseText:
            switch requestOfSubattributeData {
            case .title:
                return nil
            case .frame:
                return [FrameOfSubAttribute(x: 228, y: 352, weight: 60, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .pulse:
            switch requestOfSubattributeData {
            case .title:
                return nil
            case .frame:
                return [FrameOfSubAttribute(x: 312, y: 352, weight: 52, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .deficit:
            switch requestOfSubattributeData {
            case .title:
                return nil
            case .frame:
                return [FrameOfSubAttribute(x: 422, y: 352, weight: 122, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .hasNotNoiseOfFrictionPericard:
            switch requestOfSubattributeData {
            case .title:
                return "нет"
            case .frame:
                return [FrameOfSubAttribute(x: 121.5, y: 362.5, weight: 5, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .hasNoiseOfFrictionPericard:
            switch requestOfSubattributeData {
            case .title:
                return "есть"
            case .frame:
                return [FrameOfSubAttribute(x: 144, y: 362.5, weight: 5, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .normalAD:
            switch requestOfSubattributeData {
            case .title:
                return nil
            case .frame:
                return [FrameOfSubAttribute(x: 218, y: 363, weight: 138, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .maxAD:
            switch requestOfSubattributeData {
            case .title:
                return nil
            case .frame:
                return [FrameOfSubAttribute(x: 391, y: 363, weight: 152, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .tongueIsWet:
            switch requestOfSubattributeData {
            case .title:
                return "влажный"
            case .frame:
                return [FrameOfSubAttribute(x: 137.5, y: 374.5, weight: 5, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .tongueIsDry:
            switch requestOfSubattributeData {
            case .title:
                return "сухой"
            case .frame:
                return [FrameOfSubAttribute(x: 177.5, y: 374.5, weight: 5, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .tongueIsOverlaid:
            switch requestOfSubattributeData {
            case .title:
                return "обложен"
            case .frame:
                return [FrameOfSubAttribute(x: 208, y: 374.5, weight: 5, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .tongueText:
            switch requestOfSubattributeData {
            case .title:
                return nil
            case .frame:
                return [FrameOfSubAttribute(x: 246, y: 375, weight: 71, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .stomachShape:
            switch requestOfSubattributeData {
            case .title:
                return nil
            case .frame:
                return [FrameOfSubAttribute(x: 367, y: 375, weight: 78, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .stomachIsSoft:
            switch requestOfSubattributeData {
            case .title:
                return "мягкий"
            case .frame:
                return [FrameOfSubAttribute(x: 451, y: 374.5, weight: 5, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .stomachIsTense:
            switch requestOfSubattributeData {
            case .title:
                return "напряжен"
            case .frame:
                return [FrameOfSubAttribute(x: 485, y: 374.5, weight: 5, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .stomachIsPainful:
            switch requestOfSubattributeData {
            case .title:
                return "болезненный"
            case .frame:
                return [FrameOfSubAttribute(x: 46.5, y: 386.5, weight: 5, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .stomachIsNotPainful:
            switch requestOfSubattributeData {
            case .title:
                return "безболезненный во всех отделах"
            case .frame:
                return [FrameOfSubAttribute(x: 99, y: 387, weight: 122, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .stomachText:
            switch requestOfSubattributeData {
            case .title:
                return nil
            case .frame:
                return [FrameOfSubAttribute(x: 103, y: 387, weight: 116, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .positiveSymptomOfSidkovskogo:
            switch requestOfSubattributeData {
            case .title:
                return "Ситковского"
            case .frame:
                return [FrameOfSubAttribute(x: 314, y: 386.5, weight: 5, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .positiveSymptomRovsinga:
            switch requestOfSubattributeData {
            case .title:
                return "Ровзинга"
            case .frame:
                return [FrameOfSubAttribute(x: 365, y: 386.5, weight: 5, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .positiveSymptomMerphy:
            switch requestOfSubattributeData {
            case .title:
                return "Мерфи"
            case .frame:
                return [FrameOfSubAttribute(x: 406, y: 386.5, weight: 5, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .positiveSymptomOfOrtner:
            switch requestOfSubattributeData {
            case .title:
                return "Ортнера"
            case .frame:
                return [FrameOfSubAttribute(x: 443.5, y: 386.5, weight: 5, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .positiveSymptomOfMayoRobson:
            switch requestOfSubattributeData {
            case .title:
                return "Мейо-Робсона"
            case .frame:
                return [FrameOfSubAttribute(x: 483, y: 386.5, weight: 5, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .positiveSymptomOfObraztsov:
            switch requestOfSubattributeData {
            case .title:
                return "Образцова"
            case .frame:
                return [FrameOfSubAttribute(x: 46.5, y: 399.5, weight: 5, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .positiveSymptomOfRazdolsky:
            switch requestOfSubattributeData {
            case .title:
                return "Раздольского"
            case .frame:
                return [FrameOfSubAttribute(x: 94.5, y: 399.5, weight: 5, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .positiveSymptomOfShchetkinBlumberg:
            switch requestOfSubattributeData {
            case .title:
                return "Щеткина-Блюмберга"
            case .frame:
                return [FrameOfSubAttribute(x: 149.5, y: 399.5, weight: 5, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .positiveSymptomOfValya:
            switch requestOfSubattributeData {
            case .title:
                return "Валя"
            case .frame:
                return [FrameOfSubAttribute(x: 227, y: 399.5, weight: 5, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .positiveSymptomOfSklyarov:
            switch requestOfSubattributeData {
            case .title:
                return "Склярова"
            case .frame:
                return [FrameOfSubAttribute(x: 256, y: 399.5, weight: 5, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .positiveSymptomOfGrekov:
            switch requestOfSubattributeData {
            case .title:
                return "Грекова"
            case .frame:
                return [FrameOfSubAttribute(x: 299, y: 399.5, weight: 5, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .positiveSymptomOfRozanov:
            switch requestOfSubattributeData {
            case .title:
                return "Розанова"
            case .frame:
                return [FrameOfSubAttribute(x: 339, y: 399.5, weight: 5, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .positiveSymptomOfSpijarski:
            switch requestOfSubattributeData {
            case .title:
                return "Спижарского"
            case .frame:
                return [FrameOfSubAttribute(x: 381.5, y: 399.5, weight: 5, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .liver:
            switch requestOfSubattributeData {
            case .title:
                return nil
            case .frame:
                return [FrameOfSubAttribute(x: 71, y: 411, weight: 142, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .hepaticDullness:
            switch requestOfSubattributeData {
            case .title:
                return nil
            case .frame:
                return [FrameOfSubAttribute(x: 280, y: 411, weight: 95, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .spleen:
            switch requestOfSubattributeData {
            case .title:
                return nil
            case .frame:
                return [FrameOfSubAttribute(x: 411, y: 411, weight: 133, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .dyspepsiaNausea:
            switch requestOfSubattributeData {
            case .title:
                return "тошнота"
            case .frame:
                return [FrameOfSubAttribute(x: 84, y: 422.5, weight: 5, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .dyspepsiaVomiting:
            switch requestOfSubattributeData {
            case .title:
                return "рвота"
            case .frame:
                return [FrameOfSubAttribute(x: 123, y: 422.5, weight: 5, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .dyspepsiaText:
            switch requestOfSubattributeData {
            case .title:
                return nil
            case .frame:
                return [FrameOfSubAttribute(x: 152, y: 422.5, weight: 43, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .chairIsFormed:
            switch requestOfSubattributeData {
            case .title:
                return "оформленный"
            case .frame:
                return [FrameOfSubAttribute(x: 246, y: 422.5, weight: 5, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .chairIsZapor:
            switch requestOfSubattributeData {
            case .title:
                return "запор"
            case .frame:
                return [FrameOfSubAttribute(x: 304, y: 422.5, weight: 5, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .chairIsLiquid:
            switch requestOfSubattributeData {
            case .title:
                return "жидкий"
            case .frame:
                return [FrameOfSubAttribute(x: 333.5, y: 422.5, weight: 5, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .chairText:
            switch requestOfSubattributeData {
            case .title:
                return nil
            case .frame:
                return [FrameOfSubAttribute(x: 365, y: 423, weight: 132, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .chairPeriodicity:
            switch requestOfSubattributeData {
            case .title:
                return nil
            case .frame:
                return [FrameOfSubAttribute(x: 526, y: 423, weight: 19, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .kidneys:
            switch requestOfSubattributeData {
            case .title:
                return nil
            case .frame:
                return [FrameOfSubAttribute(x: 166, y: 434.5, weight: 154, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .smPounding:
            switch requestOfSubattributeData {
            case .title:
                return nil
            case .frame:
                return [FrameOfSubAttribute(x: 387, y: 434.5, weight: 163, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .diuresisIsSufficient:
            switch requestOfSubattributeData {
            case .title:
                return "достаточный"
            case .frame:
                return [FrameOfSubAttribute(x: 72.5, y: 446.5, weight: 5, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .diuresisIsreduced:
            switch requestOfSubattributeData {
            case .title:
                return "снижен"
            case .frame:
                return [FrameOfSubAttribute(x: 126, y: 446.5, weight: 5, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .diuresisIspolyuria:
            switch requestOfSubattributeData {
            case .title:
                return "полиурия"
            case .frame:
                return [FrameOfSubAttribute(x: 162.5, y: 446.5, weight: 5, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .diuresisIshematuria:
            switch requestOfSubattributeData {
            case .title:
                return "гематурия"
            case .frame:
                return [FrameOfSubAttribute(x: 204.5, y: 446.5, weight: 5, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .diuresisIsAnuria:
            switch requestOfSubattributeData {
            case .title:
                return "анурия"
            case .frame:
                return [FrameOfSubAttribute(x: 251.5, y: 446.5, weight: 5, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .menses:
            switch requestOfSubattributeData {
            case .title:
                return nil
            case .frame:
                return [FrameOfSubAttribute(x: 396, y: 447, weight: 75, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .delay:
            switch requestOfSubattributeData {
            case .title:
                return nil
            case .frame:
                return [FrameOfSubAttribute(x: 507, y: 447, weight: 37, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .additionalData:
            switch requestOfSubattributeData {
            case .title:
                return nil
            case .frame:
                return [FrameOfSubAttribute(x: 48, y: 459, weight: 500, height: 51, paragraphLenght: 58, lineSpacing: 3.7, isMain: true)]
            }
        case .ecgBeforeMedicalCare:
            switch requestOfSubattributeData {
            case .title:
                return ""
            case .frame:
                return [FrameOfSubAttribute(x: 228, y: 508.5, weight: 317, height: 60, paragraphLenght: 44, lineSpacing: 2.4, isMain: true)]
            }
        case .ecgAfterMedicalCare:
            switch requestOfSubattributeData {
            case .title:
                return ""
            case .frame:
                return [FrameOfSubAttribute(x: 228, y: 564, weight: 317, height: 60, paragraphLenght: 23, lineSpacing: 2.5, isMain: true)]
            }
        case .assistanceProvided:
            switch requestOfSubattributeData {
            case .title:
                return nil
            case .frame:
                return [FrameOfSubAttribute(x: 258, y: 625, weight: 290, height: 136, paragraphLenght: 1, lineSpacing: 3.75, isMain: true)]
            }
        case .adBeforeMedHelp:
            switch requestOfSubattributeData {
            case .title:
                return "АД до тепрапии:"
            case .frame:
                return [FrameOfSubAttribute(x: 96, y: 523, weight: 56, height: 31, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .adAfterMedHelp:
            switch requestOfSubattributeData {
            case .title:
                return "АД после тепрапии:"
            case .frame:
                return [FrameOfSubAttribute(x: 154, y: 523, weight: 67, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .chssBeforeMedHelp:
            switch requestOfSubattributeData {
            case .title:
                return "ЧСС до тепрапии:"
            case .frame:
                return [FrameOfSubAttribute(x: 98, y: 535, weight: 56, height: 31, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .chssAfterMedHelp:
            switch requestOfSubattributeData {
            case .title:
                return "ЧСС после тепрапии:"
            case .frame:
                return [FrameOfSubAttribute(x: 154, y: 535, weight: 67, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .pBeforeMedHelp:
            switch requestOfSubattributeData {
            case .title:
                return "P до тепрапии:"
            case .frame:
                return [FrameOfSubAttribute(x: 98, y: 546, weight: 56, height: 31, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
            
        case .pAfterMedHelp:
            switch requestOfSubattributeData {
            case .title:
                return "P после тепрапии:"
            case .frame:
                return [FrameOfSubAttribute(x: 154, y: 546, weight: 67, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .chddBeforeMedHelp:
            switch requestOfSubattributeData {
            case .title:
                return "ЧДД до тепрапии:"
            case .frame:
                return [FrameOfSubAttribute(x: 98, y: 558, weight: 56, height: 31, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .chddAfterMedHelp:
            switch requestOfSubattributeData {
            case .title:
                return "ЧДД после тепрапии:"
            case .frame:
                return [FrameOfSubAttribute(x: 154, y: 558, weight: 67, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .tBeforeMedHelp:
            switch requestOfSubattributeData {
            case .title:
                return "T°C до тепрапии:"
            case .frame:
                return [FrameOfSubAttribute(x: 98, y: 570, weight: 56, height: 31, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .tAfterMedHelp:
            switch requestOfSubattributeData {
            case .title:
                return "T°C после тепрапии:"
            case .frame:
                return [FrameOfSubAttribute(x: 154, y: 570, weight: 67, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .spOBeforeMedHelp:
            switch requestOfSubattributeData {
            case .title:
                return "Сатурация до тепрапии:"
            case .frame:
                return [FrameOfSubAttribute(x: 98, y: 581, weight: 56, height: 31, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .spOAfterMedHelp:
            switch requestOfSubattributeData {
            case .title:
                return "Сатурация после тепрапии"
            case .frame:
                return [FrameOfSubAttribute(x: 154, y: 581, weight: 67, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .glukozaBeforeMedHelp:
            switch requestOfSubattributeData {
            case .title:
                return "Глюкоза до тепрапии:"
            case .frame:
                return [FrameOfSubAttribute(x: 98, y: 594, weight: 56, height: 31, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .glukozaAfterMedHelp:
            switch requestOfSubattributeData {
            case .title:
                return "Глюкоза после тепрапии:"
            case .frame:
                return [FrameOfSubAttribute(x: 154, y: 594, weight: 67, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .resuscitation:
            switch requestOfSubattributeData {
            case .title:
                return "Реанимация"
            case .frame:
                return [FrameOfSubAttribute(x: 134, y: 611, weight: 18, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .ivl_vvl:
            switch requestOfSubattributeData {
            case .title:
                return "ИВЛ/ВВЛ"
            case .frame:
                return [FrameOfSubAttribute(x: 134, y: 623, weight: 18, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .nebulizer:
            switch requestOfSubattributeData {
            case .title:
                return "Небулайзер"
            case .frame:
                return [FrameOfSubAttribute(x: 134, y: 636, weight: 18, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .intubationAndlaryngitis:
            switch requestOfSubattributeData {
            case .title:
                return "Интубация/ларинг"
            case .frame:
                return [FrameOfSubAttribute(x: 134, y: 648, weight: 18, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .conicotomy:
            switch requestOfSubattributeData {
            case .title:
                return "Коникотомия"
            case .frame:
                return [FrameOfSubAttribute(x: 134, y: 660, weight: 18, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .trachestomy:
            switch requestOfSubattributeData {
            case .title:
                return "Трахеотомия"
            case .frame:
                return [FrameOfSubAttribute(x: 134, y: 672, weight: 18, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .eit:
            switch requestOfSubattributeData {
            case .title:
                return "ЭИТ"
            case .frame:
                return [FrameOfSubAttribute(x: 134, y: 684, weight: 18, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .thrombolysis:
            switch requestOfSubattributeData {
            case .title:
                return "Тромболизис"
            case .frame:
                return [FrameOfSubAttribute(x: 134, y: 696, weight: 18, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .catheterMoch:
            switch requestOfSubattributeData {
            case .title:
                return "Катетер. мочев."
            case .frame:
                return [FrameOfSubAttribute(x: 134, y: 708, weight: 18, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .pills:
            switch requestOfSubattributeData {
            case .title:
                return "Таблетки"
            case .frame:
                return [FrameOfSubAttribute(x: 134, y: 721, weight: 18, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .rinsingStomach:
            switch requestOfSubattributeData {
            case .title:
                return "Промыв. желудка"
            case .frame:
                return [FrameOfSubAttribute(x: 134, y: 733, weight: 18, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .pulseoximetry:
            switch requestOfSubattributeData {
            case .title:
                return "Пульсоксиметрия"
            case .frame:
                return [FrameOfSubAttribute(x: 134, y: 746, weight: 18, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .infusion:
            switch requestOfSubattributeData {
            case .title:
                return "Инфузия"
            case .frame:
                return [FrameOfSubAttribute(x: 236, y: 611, weight: 20, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .catheterVV:
            switch requestOfSubattributeData {
            case .title:
                return "Катетер в/в"
            case .frame:
                return [FrameOfSubAttribute(x: 236, y: 623, weight: 20, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .ostBlodRan:
            switch requestOfSubattributeData {
            case .title:
                return "Ост. кров/обр. ран"
            case .frame:
                return [FrameOfSubAttribute(x: 236, y: 636, weight: 20, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .bandage:
            switch requestOfSubattributeData {
            case .title:
                return "Повязка/п/ожог"
            case .frame:
                return [FrameOfSubAttribute(x: 236, y: 648, weight: 20, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .immobilization:
            switch requestOfSubattributeData {
            case .title:
                return "Иммобилизация"
            case .frame:
                return [FrameOfSubAttribute(x: 236, y: 660, weight: 20, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .defibrillation:
            switch requestOfSubattributeData {
            case .title:
                return "Дефибрилляция"
            case .frame:
                return [FrameOfSubAttribute(x: 236, y: 672, weight: 20, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .nasalTamponade:
            switch requestOfSubattributeData {
            case .title:
                return "Тампонада носа"
            case .frame:
                return [FrameOfSubAttribute(x: 236, y: 684, weight: 20, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .ecgMonitor:
            switch requestOfSubattributeData {
            case .title:
                return "ЭКГ, монитор"
            case .frame:
                return [FrameOfSubAttribute(x: 236, y: 696, weight: 20, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .injections:
            switch requestOfSubattributeData {
            case .title:
                return "Инъекции"
            case .frame:
                return [FrameOfSubAttribute(x: 236, y: 708, weight: 20, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .inhalation:
            switch requestOfSubattributeData {
            case .title:
                return "Ингаляция О"
            case .frame:
                return [FrameOfSubAttribute(x: 236, y: 721, weight: 20, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .troponin:
            switch requestOfSubattributeData {
            case .title:
                return "БСЖК, тропонин"
            case .frame:
                return [FrameOfSubAttribute(x: 236, y: 733, weight: 20, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .glucoseMonitoring:
            switch requestOfSubattributeData {
            case .title:
                return "Глюкометрия"
            case .frame:
                return [FrameOfSubAttribute(x: 236, y: 746, weight: 20, height: 13, paragraphLenght: 0, lineSpacing: 3, isMain: true)]
            }
        case .expenditure:
            switch requestOfSubattributeData {
            case .title:
                return ""
            case .frame:
                return [FrameOfSubAttribute(x: 48, y: 759.5, weight: 497, height: 28, paragraphLenght: 10, lineSpacing: 3, isMain: true)]
            }
            
            
            //============================================================================================
            
            
        case .masks:
            switch requestOfSubattributeData {
            case .title:
                return "Маски"
            case .frame:
                return nil
            }
        case .gloves:
            switch requestOfSubattributeData {
            case .title:
                return "Перчатки"
            case .frame:
                return nil
            }
        case .napkins:
            switch requestOfSubattributeData {
            case .title:
                return "Салфетки"
            case .frame:
                return nil
            }
        case .siz:
            switch requestOfSubattributeData {
            case .title:
                return "СИЗ"
            case .frame:
                return nil
            }
        case .catheterPerefirichesky:
            switch requestOfSubattributeData {
            case .title:
                return "Катетер периферический"
            case .frame:
                return nil
            }
        case .catheterUrinary:
            switch requestOfSubattributeData {
            case .title:
                return "Бинты"
            case .frame:
                return nil
            }
        case .bandages:
            switch requestOfSubattributeData {
            case .title:
                return "Глюкометрия"
            case .frame:
                return nil
            }
        case .infusionSystem:
            switch requestOfSubattributeData {
            case .title:
                return "Инфузионная система"
            case .frame:
                return nil
            }
        case .consumptionText:
            switch requestOfSubattributeData {
            case .title:
                return nil
            case .frame:
                return nil
            }
            
            
        default:
            return nil
        }
        
    }
    
}
