//
//  AuthPresenter.swift
//  citizen-helper
//
//  Created by art-off on 22.01.2021.
//

import Foundation

//protocol AuthPresenterDelegate: AnyObject {
//
//}

protocol AuthPresenterProtocol {
    func signIn(email: String, password: String)
    func onSelectRegister()
}

class AuthPresenter {
    
    private weak var controller: AuthViewControllerProtocol?
    
    init(controller: AuthViewControllerProtocol) {
        self.controller = controller
    }
    
}

extension AuthPresenter: AuthPresenterProtocol {
    
    func signIn(email: String, password: String) {
        
    }
    
    func onSelectRegister() {
        
    }
    
}
