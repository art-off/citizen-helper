//
//  ProfileRouter.swift
//  citizen-helper
//
//  Created by art-off on 30.01.2021.
//

import UIKit


protocol ProfileRouterDelegate {
    func showAuthScreen()
}


class ProfileRouter: ChidlMainRouter {
    
    private let delegate: ProfileRouterDelegate
    
    let navController: UINavigationController
    
    
    init(navController: UINavigationController, delegate: ProfileRouterDelegate) {
        self.navController = navController
        self.delegate = delegate
    }
    
    func start() {
        let controller = ProfileViewController()
        let presenter = ProfilePresenter(controller: controller, delegate: self)
        controller.presenter = presenter
        
        navController.viewControllers = [controller]
    }
    
    private func _showChangePasswrodScreen() {
        let controller = ChangePasswordViewController()
        let presenter = ChangePasswordPresenter(controller: controller, delegate: self)
        controller.presenter = presenter
        
        navController.pushViewController(controller, animated: true)
    }
    
}

extension ProfileRouter: ProfilePresenterDelegate {
    
    func showAuthScreen() {
        delegate.showAuthScreen()
    }
    
    func showChangePasswordScreen() {
        _showChangePasswrodScreen()
    }
    
}

extension ProfileRouter: ChangePasswordPresenterDelegate {
    
    func backToProfile() {
        navController.popViewController(animated: true)
    }
}
