//
//  DB.swift
//  BasePack_ios
//
//  Created by Kathiresan Murugan on 09/11/20.
//  Copyright © 2020 KtrKathir. All rights reserved.
//

import Foundation
import RealmSwift

class DB: NSObject {
    
    static let storage = DB()
    
    // MARK:- Insert
    
    /// Insert Realm Object to database
    /// - Parameter obj: Realm Object
    func insert(obj: Object) {
        do {
            let realm = try Realm()
            try realm.write {
                realm.add(obj, update: .all)
            }
        } catch let error {
            print("Error on save \(error.localizedDescription)")
        }
    }
    
    func insert(objs: [Object]) {
        do {
            let realm = try Realm()
            try realm.write {
                realm.add(objs, update: .all)
            }
        } catch let error {
            print("Error on save \(error.localizedDescription)")
        }
    }
    
//    func insert(list: List<AnsweredQuestions>) {
//        do {
//            let realm = try Realm()
//            try realm.write {
//                realm.add(list, update: .all)
//            }
//        } catch let error {
//            print("Error on save \(error.localizedDescription)")
//        }
//    }
    
    func delete(obj: Object) {
        do {
            let realm = try Realm()
            try realm.write {
                realm.delete(obj)
            }
        } catch let error {
            print("Error on save \(error.localizedDescription)")
        }
    }
    
    
    // MARK:- Delete
    
    /// Delete all
    func deleteAllRecords() {
        do {
            let realm = try! Realm()
            try realm.write {
                realm.deleteAll()
            }
        } catch let error {
            print("Error on delete \(error.localizedDescription)")
        }
    }
    
    func getAll<Element: Object>(_ type: Element.Type) -> Results<Element> {
        let realm = try! Realm()
        let objects = realm.objects(type)
        
        return objects
    }
    
    func getFirst<Element: Object>(_ type: Element.Type) -> Element? {
        let realm = try! Realm()
        let firstItem = realm.objects(type).first
        
        return firstItem
    }
    
    func deleteAll<Element: Object>(_ type: Element.Type) {
        do {
            let realm = try Realm()
            let objects = realm.objects(type)
            if objects.count > 0 {
                try realm.write {
                    realm.delete(objects)
                }
            }
            
        } catch let error {
            print("Error on delete \(error.localizedDescription)")
        }
    }
    
    func update(completion: () -> ()) {
        
        let realm = try! Realm()
        try! realm.write {
            completion()
        }
    }
}

extension Results {
    func toArray<T>(ofType: T.Type) -> [T] {
        return compactMap { $0 as? T }
    }
}
