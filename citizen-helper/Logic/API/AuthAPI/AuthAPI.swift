//
//  AuthAPI.swift
//  citizen-helper
//
//  Created by art-off on 21.01.2021.
//

import Foundation

struct AuthAPI {
    
    private static let baseApi = BaseAPI.self
    
    static func registration(for user: User, withPassword password: String) -> URLRequest {
        let url = URL(string: "\(baseApi.address)/api/v1/user/")!
        
        var json: [String: String?] = [
            "full_name": user.fio,
            "email": user.email,
            "password": password
        ]
        // Поле адрес - опционально
        if let address = user.address {
            json["address"] = address
        }
        
        let jsonData = try! JSONSerialization.data(withJSONObject: json)
        
        let request = baseApi.request(.post, with: url, andJsonData: jsonData)
        return request
    }
    
    static func auth(user: User, withPassword password: String) -> URLRequest {
        let url = URL(string: "\(baseApi.address)/api/v1/user/")!
        
        let request = baseApi.requestWithBacisAuth(.get, email: user.email, password: password, with: url)
        return request
    }
    
}
