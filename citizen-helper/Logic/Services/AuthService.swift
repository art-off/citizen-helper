//
//  AuthService.swift
//  citizen-helper
//
//  Created by art-off on 22.01.2021.
//

import Foundation

class AuthService {
    
    private let authApiService = AuthAPIService()
    
    
    // MARK: - User
    func getCurrUser() -> User? {
        DataManager.shared.getCurrentUser()
    }
    
    func logOutCurrUser() {
        DataManager.shared.deleteCurrUser()
        User.token = nil
    }
    
    // MARK: - Methods from AuthAPIService
    func registration(user: User, with password: String, completion: @escaping (Result<Void, AppError>) -> Void) {
        authApiService.registration(user: user, with: password) { result in
            switch result {
            case .success(let userResponse):
                DispatchQueue.main.async {
                    User.token = userResponse.token
                    DataManager.shared.replaceCurrUser(to: userResponse.toDomain())
                    completion(.success(()))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func auth(user: User, with password: String, completion: @escaping (Result<Void, AppError>) -> Void) {
        authApiService.auth(user: user, with: password) { result in
            switch result {
            case .success(let userResponse):
                DispatchQueue.main.async {
                    User.token = userResponse.token
                    DataManager.shared.replaceCurrUser(to: userResponse.toDomain())
                    completion(.success(()))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func changePassword(fromOld oldPassword: String, toNew newPassword: String, completion: @escaping (Result<Void, AppError>) -> Void) {
        authApiService.changePassword(fromOld: oldPassword, toNew: newPassword) { result in
            switch result {
            case .success(let token):
                DispatchQueue.main.async {
                    User.token = token
                    completion(.success(()))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
}
