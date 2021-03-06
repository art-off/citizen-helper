//
//  AuthRouter.swift
//  citizen-helper
//
//  Created by art-off on 22.01.2021.
//

import UIKit

class AuthRouter {
    
    weak var appRouter: AppRouter?
    private let window: UIWindow
    
    private var authController: UIViewController?
    private var registrationController: UIViewController?
    
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
        
        UIView.transition(
            with: window,
            duration: 0.5,
            options: [.transitionFlipFromRight],
            animations: nil,
            completion: nil
        )
    }
    
    func showMainScreen() {
        appRouter?.showMainScreen()
    }
    
}

extension AuthRouter: AuthPresenterDelegate {
    
    func showRegistrationScreen() {
        let registrationController = RegistrationViewController()
        let presenter = RegistrationPresenter(controller: registrationController, delegate: self)
        registrationController.presenter = presenter
        
        registrationController.modalPresentationStyle = .fullScreen
        authController?.present(registrationController, animated: true, completion: nil)
        
        self.registrationController = registrationController
    }
    
}

extension AuthRouter: RegistrationPresenterDelegate {
    
    func dismisRegistrationScreen() {
        registrationController?.dismiss(animated: true, completion: nil)
    }
    
}
