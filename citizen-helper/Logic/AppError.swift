//
//  AppError.swift
//  citizen-helper
//
//  Created by art-off on 21.01.2021.
//

import Foundation

enum AppError: Error {
    
    // MARK: - Network Error
    case connectionError
    case authErrors([APIError])
    
    case invalidToken
    
    case unowned
    
    var description: String {
        switch self {
        case .connectionError: return "Ошибка соединения"
        case .authErrors(let apiErrors): return apiErrors.first?.description ?? "Ошика входа"
        case .invalidToken: return "Неправильный токен"
        case .unowned: return "Неизвестная ошибка"
        }
    }
    
}
