//
//  AppDelegate.swift
//  citizen-helper
//
//  Created by art-off on 20.01.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        // Инициализируем БД
        _ = DataManager.shared
        
        print(DataManager.shared.getCurrentUser())
//        DataManager.shared.replaceCurrUser(to: User(fio: "2222", email: "em 2", address: nil))
        print(DataManager.shared.getCurrentUser())
        
        
//        let user = User(fio: "f i o 1", email: "em 1", address: "ad 1")
//        DataManager.shared.replaceCurrUser(to: user)
        
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

