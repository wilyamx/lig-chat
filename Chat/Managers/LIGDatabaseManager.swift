//
//  LIGDatabaseManager.swift
//  Chat
//
//  Created by William S. Rena on 2/21/21.
//  Copyright © 2021 LIG Inc. All rights reserved.
//

import Foundation
import Realm
import RealmSwift

class LIGDatabaseManager {
  static let DB_VERSION = 1
  static let shared = LIGDatabaseManager()
  
  var db: Realm
  
  init() {
//    let config = Realm.Configuration(
//      // Set the new schema version. This must be greater than the previously used version
//      // (if you've never set a schema version before, the version is 0).
//      schemaVersion: UInt64(LIGDatabaseManager.DB_VERSION),
//
//      // Set the block which will be called automatically when opening a Realm with
//      // a schema version lower than the one set above
//      migrationBlock: { migration, oldSchemaVersion in
//      //DebugInfo.log(info: "\(DebugInfoKey.realmDb.rawValue) Database Schema Version (Old): \(oldSchemaVersion)")
//
//      // We haven’t migrated anything yet, so oldSchemaVersion == 0
//      if (oldSchemaVersion < LIGDatabaseManager.DB_VERSION) {
//        migration.enumerateObjects(ofType: String(describing: Theme.self)) {
//          (_, newObject) in
//        }
//      }
//    })
    
    // Tell Realm to use this new configuration object for the default Realm
    let config = Realm.Configuration()
    Realm.Configuration.defaultConfiguration = config
    
    // Current Schema Version
    LIGReference.appDelegate.log.info("\(DebugInfoKey.realmDb.rawValue) Database Schema Version (Current): \(config.schemaVersion)")
    
    // Now that we've told Realm how to handle the schema change, opening the file
    // will automatically perform the migration
    self.db = try! Realm()
  }
  
  public func dbPath() -> String {
    if let temp = self.db.configuration.fileURL {
      LIGReference.appDelegate.log.info("\(DebugInfoKey.realmDb.rawValue) Database Path: \(temp.path)")
      return temp.path
    }
    return ""
  }
}
