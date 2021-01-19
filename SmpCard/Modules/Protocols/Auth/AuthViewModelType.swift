//
//  AuthViewModelType.swift
//  SmpCard
//
//  Created by Максим Жуков on 01.01.2021.
//  Copyright © 2021 SMP. All rights reserved.
//

import Foundation

protocol AuthViewModelType {
    func signIn(email: String, password: String, completion: @escaping (Result<String, Error>) -> Void) 
}
