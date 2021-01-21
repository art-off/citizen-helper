//
//  BaseAPI.swift
//  citizen-helper
//
//  Created by art-off on 21.01.2021.
//

import Foundation

struct BaseAPI {
    
    static let address = "http://msu.w0rng.ru"
    
    // MARK: - Helper Methods
    static func postRequest(with url: URL, andJsonData jsonData: Data) -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = jsonData
        
        return request
    }
    
}
