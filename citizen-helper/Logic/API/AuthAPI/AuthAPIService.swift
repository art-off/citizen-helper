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
        baseAPIService.load(
            TokenResponse.self,
            request: AuthAPI.registration(for: user, withPassword: password),
            completion: { result in
                switch result {
                case .success(let tokenResponse):
                    completion(.success(tokenResponse.token))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        )
    }
    
    // Result будет содержать в себе токен или ошибку
    func auth(user: User, with password: String, completion: @escaping (Result<String, AppError>) -> Void) {
        baseAPIService.load(
            TokenResponse.self,
            request: AuthAPI.auth(user: user, withPassword: password),
            completion: { result in
                switch result {
                case .success(let tokenResponse):
                    completion(.success(tokenResponse.token))
                case .failure(let error):
                    completion(.failure(error))
                }
            }, errorCodes: [
                401: .unauthorized
            ]
        )
    }
    
    // Result будет содержать в себе токен или ошибку
    func changePassword(fromOld oldPassword: String, toNew newPassword: String, completion: @escaping (Result<String, AppError>) -> Void) {
        // Если нет токена - возвращаем ошибку
        guard let token = User.token else {
            completion(.failure(.invalidToken))
            return
        }
        
        baseAPIService.load(
            TokenResponse.self,
            request: AuthAPI.changePassword(fromOld: oldPassword, toNew: newPassword, token: token),
            completion: { result in
                switch result {
                case .success(let tokenResponse):
                    completion(.success(tokenResponse.token))
                case .failure(let error):
                    completion(.failure(error))
                }
            }, errorCodes: [
                401: .unauthorized
            ]
        )
    }
    
}
