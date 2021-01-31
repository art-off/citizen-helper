//
//  ChangePasswordPresenter.swift
//  citizen-helper
//
//  Created by art-off on 01.02.2021.
//

import Foundation


protocol ChangePasswordPresenterDelegate: AnyObject {
    func backToProfile()
}

protocol ChangePasswordPresenterProtocol {
    func changePassword(oldPassword: String, newPassword: String)
}


class ChangePasswordPresenter {
    
    private weak var controller: ChangePasswordViewControllerProtocol?
    private weak var delegate: ChangePasswordPresenterDelegate?
    
    private let authService = AuthService()
    
    // Properties here
    
    init(controller: ChangePasswordViewControllerProtocol, delegate: ChangePasswordPresenterDelegate) {
        self.controller = controller
        self.delegate = delegate
    }
    
    // Methods here
    
}

extension ChangePasswordPresenter: ChangePasswordPresenterProtocol {
    
    func changePassword(oldPassword: String, newPassword: String) {
        guard
            oldPassword != "",
            newPassword != ""
        else {
            controller?.showAlert(with: "Заполните все поля")
            return
        }
        
        controller?.startLoagingAnimation()
        authService.changePassword(
            fromOld: oldPassword,
            toNew: newPassword,
            completion: { result in
                switch result {
                case .success():
                    DispatchQueue.main.async {
                        self.controller?.stopLoagingAnimation()
                        self.delegate?.backToProfile()
                    }
                case .failure(let error):
                    DispatchQueue.main.async {
                        self.controller?.stopLoagingAnimation()
                        self.controller?.showAlert(with: error.description)
                    }
                }
            }
        )
    }
    
}
