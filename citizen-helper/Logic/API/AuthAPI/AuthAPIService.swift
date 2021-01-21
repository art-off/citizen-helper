//
//  AuthAPIService.swift
//  citizen-helper
//
//  Created by art-off on 21.01.2021.
//

import Foundation

class AuthAPIService {
    
    private let baseAPIService = BaseAPIService()
    
    // Result будет содержать в себе токен или ошибку
    func registration(user: User, with password: String, completion: @escaping (Result<String, AppError>) -> Void) {
        baseAPIService.load(TokenResponse.self,
             request: AuthAPI.registration(for: user, withPassword: password),
             completion: { result in
                switch result {
                case .success(let tokenResponse):
                    completion(.success(tokenResponse.token))
                case .failure(let error):
                    completion(.failure(error))
                }
             })
    }
    
}
