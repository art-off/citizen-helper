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
    
    
    case unowned
    
}
