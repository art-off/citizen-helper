//
//  AuthRouter.swift
//  citizen-helper
//
//  Created by art-off on 22.01.2021.
//

import UIKit

class AuthRouter {
    
    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func showAuthScreen() {
        let controller = AuthViewController()
        let presenter = AuthPresenter(controller: controller)
        controller.presenter = presenter
        
        window.rootViewController = controller
        window.makeKeyAndVisible()
    }
    
}
