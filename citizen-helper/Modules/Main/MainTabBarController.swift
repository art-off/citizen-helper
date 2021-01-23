//
//  MainTabBarController.swift
//  citizen-helper
//
//  Created by art-off on 24.01.2021.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let vc1 = UIViewController()
        vc1.view.backgroundColor = .yellow
        vc1.tabBarItem = UITabBarItem(tabBarSystemItem: .featured, tag: 0)
        
        let vc2 = UIViewController()
        vc2.view.backgroundColor = .green
        vc2.tabBarItem = UITabBarItem(tabBarSystemItem: .history, tag: 1)
        
        viewControllers = [vc1, vc2]
    }

}
