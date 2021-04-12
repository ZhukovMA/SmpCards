//
//  Attribute.swift
//  SMPCards
//
//  Created by Максим Жуков on 14.11.2020.
//  Copyright © 2020 Максим Жуков. All rights reserved.
//

import Foundation


struct BlockOfAttributes {
    var attributes = [Attribute]()
}


class Card {
    
    var blocksOfAttributes = [BlockOfAttributes]()
    
    
    init(completeData: CompleteData) {
        
        var completeDate = ""
        if let date = completeData.completeTextData[.date] {
            let date = Date(timeIntervalSince1970: TimeInterval(Double(date) ?? Date().timeIntervalSince1970))
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd MMMM, yyyy | HH:mm"
            dateFormatter.locale = Locale(identifier: "RU")
            completeDate = dateFormatter.string(from: date as Date)
        }
        
        func getSelectableRows(_ attribute: SelectableAttributeEnum) -> (SelectRowsOfSubattribute, TextRowOfSubattribute?) {
            return DataManager.shared.getSelectableRows(selectableAttribute: attribute, completeData: completeData)
        }
        
        
        func addBlock(_ attributes: [Attribute]) {
            var blockOfAttributes = BlockOfAttributes()
            attributes.forEach {
                if let selectableAttribute = $0 as? SelectableAttribute {
                    let rows = getSelectableRows(selectableAttribute.attribute)
                    selectableAttribute.selectableRows = rows.0
                    selectableAttribute.textRow = rows.1
                }
                if let tableAttribute = $0 as? TableAttribute {
                    DataManager.shared.makeTable(tableAttribute: tableAttribute, completeData: completeData)
                }
                blockOfAttributes.attributes.append($0)
            }
            blocksOfAttributes.append(blockOfAttributes)
        }
        
        addBlock([
            TextAttribute(title: "Номер карты", subattribut: .numberOfCard , attributData: completeData.completeTextData[.numberOfCard], limit: nil),
            TextAttribute(title: "Диагноз", subattribut: .diagnose , attributData: completeData.completeTextData[.diagnose], limit: nil),
            TextAttribute(title: "ФИО", subattribut: .name , attributData: completeData.completeTextData[.name], limit: nil),
            TextAttribute(title: "Дата", subattribut: .date , attributData: completeDate, limit: nil)
        ])
        
        addBlock([
            TextAttribute(title: "Жалобы", subattribut: .Complaints , attributData: completeData.completeTextData[.Complaints], limit: 450),
            SelectableAttribute(title: "Заболел", attribute: .gotSick),
            TextAttribute(title: "Анамнез болезни и жизни", subattribut: .anamnesis , attributData: completeData.completeTextData[.anamnesis], limit: 680),
            TextAttribute(title: "Алергологический анамнез", subattribut: .allergologicalAnamnesis , attributData: completeData.completeTextData[.allergologicalAnamnesis], limit: 380)
        ])
        addBlock([
            SelectableAttribute(title: "Общее состояние", attribute: .condition),
            SelectableAttribute(title: "Сознание", attribute: .consciousness),
            TextAttribute(title: "ШКГ", subattribut: .shkg , attributData: completeData.completeTextData[.shkg], limit: 500),
            SelectableAttribute(title: "Положение",  attribute: .position),
            SelectableAttribute(title: "Кожные покровы", attribute: .skin),
            TextAttribute(title: "Лимфоузлы", subattribut: .lymphonoduses , attributData: completeData.completeTextData[.lymphonoduses], limit: 27),
            SelectableAttribute(title: "Сыпь",  attribute: .rash),
            TextAttribute(title: "Видимые слизистые", subattribut: .visibleMucous , attributData: completeData.completeTextData[.visibleMucous], limit: 30),
            SelectableAttribute(title: "Отеки", attribute: .edema),
            TextAttribute(title: "Тургор тканей", subattribut: .turgorOfTissue , attributData: completeData.completeTextData[.turgorOfTissue], limit: 28)
        ])
        
        addBlock([
            SelectableAttribute(title: "Поведение", attribute: .behavior),
            TextAttribute(title: "Речь", subattribut: .speech , attributData: completeData.completeTextData[.speech], limit: 13),
            SelectableAttribute(title: "Зрачки", attribute: .pupils),
            SelectableAttribute(title: "Реакция на свет", attribute: .reactionToLight),
            SelectableAttribute(title: "Нистагм", attribute: .nystagm),
            SelectableAttribute(title: "Минингеальные симптомы", attribute: .meningealSymptom),
            SelectableAttribute(title: "Очаговые симптомы", attribute: .focalSymptoms)
        ])
        
        addBlock([
            SelectableAttribute(title: "Носовое дыхание", attribute: .breath),
            SelectableAttribute(title: "Отделяемое из носовых ходов", attribute: .separatedFromNasalPassages),
            TextAttribute(title: "Зев", subattribut: .pharynx , attributData: completeData.completeTextData[.pharynx], limit: 46),
            TextAttribute(title: "Миндалины", subattribut: .tonsils , attributData: completeData.completeTextData[.tonsils], limit: 16),
            TextAttribute(title: "ЧДД", subattribut: .chdd , attributData: completeData.completeTextData[.chdd], limit: 3),
            SelectableAttribute(title: "Одышка", attribute: .dyspnea),
            SelectableAttribute(title: "Перкуторный звук", attribute: .percussionSound),
            SelectableAttribute(title: "Аускультативно дыхание", attribute: .auscultationBreath),
            SelectableAttribute(title: "Хрипы", attribute: .rale),
            SelectableAttribute(title: "Шум трения плевры", attribute: .pleuralFrictionNoise),
            TextAttribute(title: "Кашель, мокрота", subattribut: .cough , attributData: completeData.completeTextData[.cough], limit: 30)
        ])
        
        addBlock([
            TextAttribute(title: "Сердечные сокращения", subattribut: .heartContractions , attributData: completeData.completeTextData[.heartContractions], limit: 62),
            SelectableAttribute(title: "Тоны сердца", attribute: .heartTones),
            SelectableAttribute(title: "Шум", attribute: .noise),
            TextAttribute(title: "Пульс", subattribut: .pulse , attributData: completeData.completeTextData[.pulse], limit: 13),
            TextAttribute(title: "Дефицит пульса", subattribut: .deficit , attributData: completeData.completeTextData[.deficit], limit: 32),
            SelectableAttribute(title: "Шум трения перикарда", attribute: .noiseOfFrictionPericard),
            TextAttribute(title: "Привычное АД", subattribut: .normalAD , attributData: completeData.completeTextData[.normalAD], limit: 36),
            TextAttribute(title: "Макс. АД", subattribut: .maxAD , attributData: completeData.completeTextData[.maxAD], limit: 39),
        ])
        
        addBlock([
            SelectableAttribute(title: "Язык", attribute: .tongue),
            SelectableAttribute(title: "Живот", attribute: .stomach),
            TextAttribute(title: "Форма живота", subattribut: .stomachShape , attributData: completeData.completeTextData[.stomachShape], limit: 21),
            SelectableAttribute(title: "Положительные симптомы", attribute: .positiveSymptom),
            TextAttribute(title: "Печень", subattribut: .liver , attributData: completeData.completeTextData[.liver], limit: 37),
            TextAttribute(title: "Печеночная тупость", subattribut: .hepaticDullness , attributData: completeData.completeTextData[.hepaticDullness], limit: 25),
            TextAttribute(title: "Селезенка", subattribut: .spleen , attributData: completeData.completeTextData[.spleen], limit: 34),
            SelectableAttribute(title: "Диспепсия", attribute: .dyspepsia),
            SelectableAttribute(title: "Стул", attribute: .chair),
            TextAttribute(title: "Стул раз/сутки", subattribut: .chairPeriodicity , attributData: completeData.completeTextData[.chairPeriodicity], limit: 5),
        ])
        
        addBlock([
            TextAttribute(title: "Почки", subattribut: .kidneys , attributData: completeData.completeTextData[.kidneys], limit: 44),
            TextAttribute(title: "С-м покалачивания", subattribut: .smPounding , attributData: completeData.completeTextData[.smPounding], limit: 46),
            SelectableAttribute(title: "Диурез", attribute: .diuresis),
            TextAttribute(title: "Menses", subattribut: .menses , attributData: completeData.completeTextData[.menses], limit: 19),
            TextAttribute(title: "Задержка", subattribut: .delay , attributData: completeData.completeTextData[.delay], limit: 10),
        ])
        
        addBlock([
            TextAttribute(title: "Доп. данные,локальный статус", subattribut: .additionalData , attributData: completeData.completeTextData[.additionalData], limit: 630),
            TextAttribute(title: "Экг до помощи", subattribut: .ecgBeforeMedicalCare , attributData: completeData.completeTextData[.ecgBeforeMedicalCare], limit: 500),
            TextAttribute(title: "Экг после помощи", subattribut: .ecgAfterMedicalCare , attributData: completeData.completeTextData[.ecgAfterMedicalCare], limit: 500),
            TextAttribute(title: "Оказанная помощь", subattribut: .assistanceProvided , attributData: completeData.completeTextData[.assistanceProvided], limit: 500),
            TableAttribute(title: "Показатели до и после", attribute: .perfomance, type: .staticTable),
            TableAttribute(title: "Транспортировка", attribute: .indicator, type: .dynamicTable),


        ])
        
        addBlock([
            TableAttribute(title: "Расход", attribute: .consumption, type: .staticTable),
            SelectableAttribute(title: "Дополнительно применено", attribute: .additionalAction),
        ])
    }
}
