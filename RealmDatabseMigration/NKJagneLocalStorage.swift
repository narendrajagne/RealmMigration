//
//  NKJagneLocalStorage.swift
//  RealmDatabseMigration
//
//  Created by NK Jagne on 24/08/19.
//  Copyright © 2019 xyz. All rights reserved.
//

import UIKit
import Realm
import RealmSwift

// All changes to an object (addition, modification and deletion) must be done within a write transaction.
final class NKJagneLocalStorage {

    // MARK: - Properties
    static let currentSchemaVersion: UInt64 = 3
    // MARK: - Static Methods
    static func tripStore() throws {
        
        let fristTrip = NKJagne()
        fristTrip.pickUpArea = "Thane"
        fristTrip.dropingArea = "Belapur, Navi Mumbai"
        fristTrip.cab_No = 9089

        
        let secondTrip = NKJagne()
        secondTrip.pickUpArea = "Dadar"
        secondTrip.dropingArea = "Goregaon"
        secondTrip.cab_No = 7845

        
        let thirdTrip = NKJagne()
        thirdTrip.pickUpArea = "Bandra"
        thirdTrip.dropingArea = "Churchget"
        thirdTrip.cab_No = 6756

        
        let fourthTrip = NKJagne()
        fourthTrip.pickUpArea = "Chembur"
        fourthTrip.dropingArea = "Andheri"
        fourthTrip.cab_No = 3450

        
        let realm = try Realm()
        try realm.write {
            realm.add([fristTrip, secondTrip, thirdTrip, fourthTrip])
        }
    }
    static func configureMigration() {
        let config = Realm.Configuration(schemaVersion: currentSchemaVersion, migrationBlock: { (migration, oldSchemaVersion) in
            if oldSchemaVersion < 1 {
                migrateFrom0To1(with: migration)
            }
        })
        Realm.Configuration.defaultConfiguration = config
    }
    // MARK: - Migrations
    static func migrateFrom0To1(with migration: Migration) {
        // Add an tripType property
        migration.enumerateObjects(ofType: NKJagne.className()) { (_, newNKJagne) in
            newNKJagne?["tripType"] = ""
        }
    }
}
