//
//  UserResponse.swift
//  citizen-helper
//
//  Created by art-off on 01.02.2021.
//

import Foundation

class UserResponse: Decodable {
    
    let fio: String
    let email: String
    let address: String?
    let token: String
    
    enum CodingKeys: String, CodingKey {
        case fio = "full_name"
        case email
        case address
        case token
    }
    
}

extension UserResponse {
    
    func toDomain() -> User {
        return User(fio: fio, email: email, address: address)
    }
    
}
