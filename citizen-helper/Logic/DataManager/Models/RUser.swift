//
//  RUser.swift
//  citizen-helper
//
//  Created by art-off on 21.01.2021.
//

import Foundation
import RealmSwift

class RUser: Object {
    
    @objc dynamic var fio = ""
    @objc dynamic var email = ""
    @objc dynamic var address: String? = nil
    
    
    override class func primaryKey() -> String? {
        return "email"
    }
    
}

extension RUser {
    
    func toDomain() -> User {
        return User(
            fio: fio,
            email: email,
            address: address
        )
    }
    
}
