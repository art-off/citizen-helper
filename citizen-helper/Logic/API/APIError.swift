//
//  APIError.swift
//  citizen-helper
//
//  Created by art-off on 21.01.2021.
//

import Foundation

enum APIError: Error {
    
    // MARK: - Auth Errors
    case emailAlreadyUse
    case passwordTooShort
    case passwordEntirelyNumeric
    case invalidEmail
    case invalidFullName
    
    case unauthorized
    
    
    init?(raw: String) {
        switch raw {
        case "email_already_use": self = .emailAlreadyUse
        case "password_too_short": self = .passwordTooShort
        case "password_entirely_numeric": self = .passwordEntirelyNumeric
        case "invalid_email": self = .invalidEmail
        case "invalid_full_name": self = .invalidFullName
        case "unauthorized": self = .unauthorized
        default: return nil
        }
    }
    
}
