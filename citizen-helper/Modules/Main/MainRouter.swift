//
//  MainRouter.swift
//  citizen-helper
//
//  Created by art-off on 23.01.2021.
//

import UIKit

class MainRouter {
    
    weak var appRouter: AppRouter?
    private let window: UIWindow
    private let tabBarController: UITabBarController
    
    init(window: UIWindow) {
        self.window = window
        
        tabBarController = MainTabBarController()
    }
    
    func showMainTabBarController() {
        window.rootViewController = tabBarController
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
