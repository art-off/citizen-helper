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
    
    private var addRequestRouter: AddRequestRouter!
    private var myRequestsRouter: MyRequestsRouter!
    private var profileRouter: ProfileRouter!
    
    
    init(window: UIWindow) {
        self.window = window
        tabBarController = UITabBarController()
        
        tabBarController.viewControllers = [
            startAddRequestsRouter(),
            startMyRequestsRouter(),
            startProfileRouter(),
        ]
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
    
    // MARK: - Start Routers
    private func startAddRequestsRouter() -> UINavigationController {
        let navController = UINavigationController()
        navController.tabBarItem = UITabBarItem(
            title: "Создать",
            image: UIImage(systemName: "plus"),
            tag: 0
        )
        
        addRequestRouter = AddRequestRouter(navController: navController)
        addRequestRouter.start()
        
        return addRequestRouter.navController
    }
    
    private func startMyRequestsRouter() -> UINavigationController {
        let navController = UINavigationController()
        navController.tabBarItem = UITabBarItem(
            title: "Мои заявки",
            image: UIImage(systemName: "folder.fill"),
            tag: 1
        )
        
        myRequestsRouter = MyRequestsRouter(navController: navController)
        myRequestsRouter.start()
        
        return myRequestsRouter.navController
    }
    
    private func startProfileRouter() -> UINavigationController {
        let navController = UINavigationController()
        navController.tabBarItem = UITabBarItem(
            title: "Профиль",
            image: UIImage(systemName: "person.fill"),
            tag: 2
        )
        
        profileRouter = ProfileRouter(navController: navController, delegate: self)
        profileRouter.start()
        
        return profileRouter.navController
    }
    
}

extension MainRouter: ProfileRouterDelegate {
    
    func showAuthScreen() {
        appRouter?.showAuthScreen()
    }
    
}
