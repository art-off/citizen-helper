//
//  AppRouter.swift
//  citizen-helper
//
//  Created by art-off on 22.01.2021.
//

import UIKit

class AppRouter {
    
    // В главном роутере лучше юзать window
    // потому что тут есть экраны авторизации и основной экран
    // (в первом нет ни та таб бара, ни нав бара, во втором есть все)
    private let window: UIWindow
    
    private let authRouter: AuthRouter
//    private let mainRouter: MainRouter
    
    
    init(window: UIWindow) {
        self.window = window
        
        authRouter = AuthRouter(window: window)
        authRouter.appRouter = self
    }
    
    func showAuthScreen() {
        authRouter.showAuthScreen()
    }
    
    func showMainScreen() {
        let vc = UIViewController()
        vc.view.backgroundColor = .red
        window.rootViewController = vc
        window.makeKeyAndVisible()
        
        UIView.transition(
            with: window,
            duration: 0.5,
            options: [.transitionFlipFromRight],
            animations: nil,
            completion: nil
        )
    }
    
}
