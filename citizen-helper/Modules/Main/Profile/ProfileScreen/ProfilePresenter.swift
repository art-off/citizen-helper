//
//  ProfilePresenter.swift
//  citizen-helper
//
//  Created by art-off on 30.01.2021.
//

import Foundation


protocol ProfilePresenterDelegate: AnyObject {
    func showAuthScreen()
    func showChangePasswordScreen()
}

protocol ProfilePresenterProtocol {
    func logOutCurrUser()
    func changePassword()
}


class ProfilePresenter {
    
    private weak var controller: ProfileViewControllerProtocol?
    private weak var delegate: ProfilePresenterDelegate?
    
    private let authService = AuthService()
    
    
    init(controller: ProfileViewControllerProtocol, delegate: ProfilePresenterDelegate) {
        self.controller = controller
        self.delegate = delegate
    }
    
}

extension ProfilePresenter: ProfilePresenterProtocol {
    
    func logOutCurrUser() {
        authService.logOutCurrUser()
        delegate?.showAuthScreen()
    }
    
    func changePassword() {
        delegate?.showChangePasswordScreen()
    }
    
}
