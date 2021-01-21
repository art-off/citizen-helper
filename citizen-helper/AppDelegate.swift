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
        
//        AuthAPIService().auth(user: User(fio: "FF II OO", email: "eemm@eemm.com", address: nil), with: "qwerasdf") { a in
//            print(a)
//            User.token = try? a.get()
//        }
        
        AuthAPIService().changePassword(fromOld: "qwerasdf", toNew: "qwerasdf") { a in
            print(a)
        }
        
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

