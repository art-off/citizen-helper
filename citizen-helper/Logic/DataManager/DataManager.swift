//
//  DataManager.swift
//  citizen-helper
//
//  Created by art-off on 21.01.2021.
//

import Foundation
import RealmSwift

class DataManager {
    
    static let shared = DataManager()
    
    
    private let realm: Realm
    
    private let userRepository: Repository<RUser>
    
    private init() {
        let fileManager = FileManager.default
        
        // создаем дирректорию для приложения в Documents
        let msuUrl = try! fileManager
            .url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent("my-sibsu")
        
        if !fileManager.fileExists(atPath: msuUrl.path) {
            do {
                try fileManager.createDirectory(at: msuUrl, withIntermediateDirectories: true, attributes: nil)
            } catch {
                NSLog("Не выходит создать папку в Document директории")
            }
        }
        
        let realmUrl = msuUrl.appendingPathComponent("msu.realm")
        
        var realmConfig = Realm.Configuration(fileURL: realmUrl)
        realmConfig.deleteRealmIfMigrationNeeded = true
        
        print(realmUrl)
        
        realm = try! Realm(configuration: realmConfig)
        
        userRepository = Repository<RUser>(realm: realm)
    }
    
}

// MARK: - RUser
// Экземпляр этого класса только один
// и вся логика из этого соотвествующая:
// - когда записываем нового юзера - удаляем остальных
// - для получения есть только один метод, который возвращает одного юзаре
extension DataManager {
    
    func getCurrentUser() -> User? {
        return userRepository.getAll().first?.toDomain()
    }
    
    func replaceCurrUser(to user: User) {
        try? userRepository.delete(items: userRepository.getAll())
        try? userRepository.insert(item: user.toRealm())
    }
    
}
