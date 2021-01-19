//
//  AuthService.swift
//  SmpCard
//
//  Created by Максим Жуков on 30.12.2020.
//  Copyright © 2020 SMP. All rights reserved.
//

import Foundation
import Firebase

enum AuthResponse {
    case signed
    case signedOut
}

class AuthService {
    static let shared = AuthService()
    private let auth = Auth.auth()
    
    func checkAuthentication() -> AuthResponse {
        if let _ = auth.currentUser {
            return .signed
        } else {
            return .signedOut
        }
    }
    
    func signUp(email: String, password: String, completion: @escaping (_ response: Result<String, Error>) -> Void) {
       auth.createUser(withEmail: email, password: password) { result, error in
            if let _result = result  {
                completion(.success(_result.description))
            } else if let _error = error {
                completion(.failure(_error))
            }
        }
    }
    
    func signIn(email: String, password: String, completion: @escaping (_ response: Result<String, Error>) -> Void) {
        auth.signIn(withEmail: email, password: password) { result, error in
            if let _result = result  {
                completion(.success(_result.description))
            } else if let _error = error {
                completion(.failure(_error))
            }
        }
    }
    
    func signOut( completion: @escaping (_ response: Result<String, Error>) -> Void) {
        do {
            try auth.signOut()
            completion(.success(String()))
        } catch {
            completion(.failure(error))
        }
    }
}
