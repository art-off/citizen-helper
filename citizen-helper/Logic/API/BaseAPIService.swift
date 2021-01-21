//
//  BaseAPIService.swift
//  citizen-helper
//
//  Created by art-off on 21.01.2021.
//

import Foundation

class BaseAPIService {
    
    let session = URLSession(configuration: URLSessionConfiguration.default)
    
    
    
    /// Запускает сетевой запрос
    ///
    /// - parameters:
    ///     - type: Тип объекта, который загружается в json
    ///     - request: URLRequets по которому производиться запрос
    ///     - completion: блок кода, который выполнится в конце загрузки
    ///     - errorCodes: коды ответа от страницы и ошибки, которые соотвествуют им
    ///
    func load<T: Decodable>(_ type: T.Type,
                            request: URLRequest,
                            completion: @escaping (Result<T, AppError>) -> Void,
                            errorCodes: [Int: APIError]? = nil) {

        session.dataTask(with: request) { data, response, error in
            let handleResult = self.handleResponse(T.self, data, response, error, errorCodes: errorCodes)
            completion(handleResult)
        }.resume()
    }
    
    
    private func handleResponse<T: Decodable>(_ type: T.Type,
                                              _ data: Data?,
                                              _ response: URLResponse?,
                                              _ error: Error?,
                                              errorCodes: [Int: APIError]? = nil) -> Result<T, AppError> {
        guard
            error == nil,
            let responseStatusCode = (response as? HTTPURLResponse)?.statusCode
        else {
            return .failure(.connectionError)
        }
        
        guard let data = data else {
            return .failure(.unowned)
        }
        
        // Пытаемся достать основной объект
        if let object = try? JSONDecoder().decode(T.self, from: data) {
            return .success(object)
        }
        
        // Если не получилось распарсить прошлое, то пытаемся испать ошибку
        if let errorsObject = try? JSONDecoder().decode(ErrorCodesResponse.self, from: data) {
            var errors: [APIError] = []
            let codes = errorsObject.codes
            
            for code in codes {
                if let apiError = APIError(raw: code) {
                    errors.append(apiError)
                }
            }
            
            // Если ошибки есть - возвращаем их
            // Иначе продолжаем
            if !errors.isEmpty {
                return .failure(.authErrors(errors))
            }
        }
        
        // Если и ошибки нет - пытаемся достать ошибку из statusCode
        if let errorCodes = errorCodes {
            for (code, apiError) in errorCodes {
                if responseStatusCode == code {
                    return .failure(.authErrors([apiError]))
                }
            }
        }
        
        // Если ничего не получилось достать - то отправляем unowned
        return .failure(.unowned)
    }
    
}
