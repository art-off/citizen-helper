//
//  Repository.swift
//  citizen-helper
//
//  Created by art-off on 21.01.2021.
//

import Foundation
import RealmSwift

class Repository<REntity: Object> {
    
    private let realm: Realm
    
    init(realm: Realm) {
        self.realm = realm
    }
    
    func getAll(where predicate: NSPredicate? = nil) -> [REntity] {
        var objects = realm.objects(REntity.self)
        
        if let predicate = predicate {
            objects = objects.filter(predicate)
        }
        
        return Array(objects)
    }
    
    func insert(item: REntity) throws {
        try realm.write {
            realm.add(item, update: .all)
        }
    }
    
    func insert(items: [REntity]) throws {
        try realm.write {
            realm.add(items, update: .all)
        }
    }
    
    func delete(item: REntity) throws {
        try realm.write {
            realm.delete(item, cascading: true)
        }
    }
    
    func delete(items: [REntity]) throws {
        try realm.write {
            realm.delete(items, cascading: true)
        }
    }
    
    func update(item: REntity) throws {
        try delete(item: item)
        try insert(item: item)
    }
    
}
