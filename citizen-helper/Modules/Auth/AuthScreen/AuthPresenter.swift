//
//  AuthPresenter.swift
//  citizen-helper
//
//  Created by art-off on 22.01.2021.
//

import Foundation

protocol AuthPresenterDelegate: AnyObject {
    func showRegistrationScreen()
}

protocol AuthPresenterProtocol {
    func signIn(email: String, password: String)
    func onSelectRegister()
}

class AuthPresenter {
    
    private weak var controller: AuthViewControllerProtocol?
    private weak var delegate: AuthPresenterDelegate?
    
    private let authService = AuthService()
    
    init(controller: AuthViewControllerProtocol, delegate: AuthPresenterDelegate) {
        self.controller = controller
        self.delegate = delegate
    }
    
}

extension AuthPresenter: AuthPresenterProtocol {
    
    func signIn(email: String, password: String) {
        controller?.startLoagingAnimation()
        authService.auth(user: User(fio: "", email: email, address: nil), with: password) { result in
            switch result {
            case .success(()):
                DispatchQueue.main.async {
                    self.controller?.stopLoagingAnimation()
                    self.controller?.showAlert(with: User.token ?? "Token")
                }
                // TODO: Тут открывать основной модуль приложения
            case .failure(let error):
                DispatchQueue.main.async {
                    self.controller?.showAlert(with: error.description)
                    self.controller?.stopLoagingAnimation()
                }
            }
        }
    }
    
    func onSelectRegister() {
        delegate?.showRegistrationScreen()
    }
    
}
