//
//  BaseAPI.swift
//  citizen-helper
//
//  Created by art-off on 21.01.2021.
//

import Foundation

struct BaseAPI {
    
    static let address = "https://msu.w0rng.ru"
    
    // MARK: - Helper Methods (Request)
    static func request(_ method: HTTPMethod, with url: URL, andJsonData jsonData: Data? = nil) -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.httpBody = jsonData
        
        return request
    }
    
    static func requestWithBacisAuth(_ method: HTTPMethod,
                                     email: String,
                                     password: String,
                                     with url: URL,
                                     andJsonData jsonData: Data? = nil) -> URLRequest {
        
        var request = Self.request(method, with: url, andJsonData: jsonData)
        
        let authString = String(format: "%@:%@", email, password)
        let authData = authString.data(using: .utf8)!
        let base64AuthString = authData.base64EncodedString()
        request.setValue("Basic \(base64AuthString)", forHTTPHeaderField: "Authorization")
        
        return request
    }
    
    static func requestWithBearerToken(_ method: HTTPMethod,
                                       token: String,
                                       with url: URL,
                                       andJsonData jsonData: Data? = nil) -> URLRequest {
        
        var request = Self.request(method, with: url, andJsonData: jsonData)
        
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        return request
    }
    
    enum HTTPMethod: String {
        case get = "GET"
        case post = "POST"
        case put = "PUT"
    }
    
}
