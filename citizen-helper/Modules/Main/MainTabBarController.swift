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
        
//        let
        let vc1 = UIViewController()
        vc1.view.backgroundColor = .yellow
        vc1.tabBarItem = UITabBarItem(tabBarSystemItem: .featured, tag: 0)
        
        let vc2 = UIViewController()
        vc2.view.backgroundColor = .green
        vc2.tabBarItem = UITabBarItem(tabBarSystemItem: .history, tag: 1)
        
        let vc3 = UIViewController()
        vc3.view.backgroundColor = .gray
        vc3.tabBarItem = UITabBarItem(title: "Профиль", image: UIImage(systemName: "person.fill"), tag: 2)
        
        viewControllers = [vc1, vc2, vc3]
    }

}
