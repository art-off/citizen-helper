//
//  User.swift
//  citizen-helper
//
//  Created by art-off on 21.01.2021.
//

import Foundation

struct User {
    
    let fio: String
    let email: String
    let address: String?
    
    @UserDefaultsWrapper(key: "user.token", defaultValue: String?(nil))
    static var token: String?
    
}

extension User {
    
    func toRealm() -> RUser {
        let rUser = RUser()
        rUser.fio = fio
        rUser.email = email
        rUser.address = address
        return rUser
    }
    
}
