//
//  PreviewViewModelType.swift
//  SMPCards
//
//  Created by Максим Жуков on 12.11.2020.
//  Copyright © 2020 Максим Жуков. All rights reserved.
//

import Foundation

protocol PreviewViewModelType {
    func getNextDate() -> NextData?
    func getEmptyPDFUrl() -> URL 
    func handleDesapear()
    func getTempFileURL() -> URL
}
