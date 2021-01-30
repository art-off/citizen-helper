//
//  ProfileRouter.swift
//  citizen-helper
//
//  Created by art-off on 30.01.2021.
//

import UIKit

class ProfileRouter: ChidlMainRouter {
    
    let navController: UINavigationController
    
    
    init(navController: UINavigationController) {
        self.navController = navController
    }
    
    func start() {
//        let controller = ProfileViewController()
//        let presenter = ProfilePresenter(controller: controller)
//        controller.presenter = presenter
        let vc = UIViewController()
        vc.view.backgroundColor = .brown
        
        navController.viewControllers = [vc]
    }
    
}
