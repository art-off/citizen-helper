//
//  AddRequestRouter.swift
//  citizen-helper
//
//  Created by art-off on 30.01.2021.
//

import UIKit

class AddRequestRouter: ChidlMainRouter {
    
    let navController: UINavigationController
    
    
    init(navController: UINavigationController) {
        self.navController = navController
    }
    
    
    func start() {
        let vc = UIViewController()
        vc.view.backgroundColor = .blue
        
        navController.viewControllers = [vc]
    }
    
}
