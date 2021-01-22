//
//  AuthRouter.swift
//  citizen-helper
//
//  Created by art-off on 22.01.2021.
//

import UIKit

class AuthRouter {
    
    private let window: UIWindow
    private var authController: UIViewController?
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func showAuthScreen() {
        let controller = AuthViewController()
        let presenter = AuthPresenter(controller: controller, delegate: self)
        controller.presenter = presenter
        
        window.rootViewController = controller
        window.makeKeyAndVisible()
        
        authController = controller
    }
    
}

extension AuthRouter: AuthPresenterDelegate {
    
    func showRegistrationScreen() {
        let registrationController = RegistrationViewController()
        let presenter = RegistrationPresenter(controller: registrationController)
        registrationController.presenter = presenter
        
        registrationController.modalPresentationStyle = .fullScreen
        authController?.present(registrationController, animated: true, completion: nil)
    }
    
}
