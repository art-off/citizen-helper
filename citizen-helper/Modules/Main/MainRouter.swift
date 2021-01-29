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
    
    private let navController1: UINavigationController // поменять название
    private let navController2: UINavigationController // поменять название
    private let profileNavController: UINavigationController
    
    // MARK: Сделать тут так:
    // - в этом роутере оставить только навбары (и дочерние роутеры)
    // - в дочерних роутерах уже и работать с нав барами и ставить туда VC
    
    
    init(window: UIWindow) {
        self.window = window
        tabBarController = UITabBarController()
        
        let vc1 = UIViewController()
        vc1.view.backgroundColor = .yellow
        let vc2 = UIViewController()
        vc2.view.backgroundColor = .green
        let vc3 = UIViewController()
        vc3.view.backgroundColor = .gray
        
        navController1 = UINavigationController(rootViewController: vc1)
        navController2 = UINavigationController(rootViewController: vc2)
        profileNavController = UINavigationController(rootViewController: vc3)
        
        navController1.tabBarItem = UITabBarItem(
            title: "Создать",
            image: UIImage(systemName: "plus"),
            tag: 0
        )
        navController2.tabBarItem = UITabBarItem(
            title: "Мои заявки",
            image: UIImage(systemName: "folder.fill"),
            tag: 1
        )
        profileNavController.tabBarItem = UITabBarItem(
            title: "Профиль",
            image: UIImage(systemName: "person.fill"),
            tag: 2
        )
        
        tabBarController.viewControllers = [
            navController1,
            navController2,
            profileNavController,
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
    
}
