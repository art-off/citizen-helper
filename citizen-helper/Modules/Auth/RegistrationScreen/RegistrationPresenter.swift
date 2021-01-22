//
//  RegistrationPresenter.swift
//  citizen-helper
//
//  Created by art-off on 23.01.2021.
//

import Foundation

protocol RegistrationPresenterProtocol {
    
}

class RegistrationPresenter {
    
    private weak var controller: RegistrationViewControllerProtocol?
    
    private let authService = AuthService()
    
    init(controller: RegistrationViewControllerProtocol) {
        self.controller = controller
    }
    
}

extension RegistrationPresenter: RegistrationPresenterProtocol {
    
}
