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
    
    self.initializeData()
  }
  
  public func dbPath() -> String {
    if let temp = self.db.configuration.fileURL {
      LIGReference.appDelegate.log.info("\(DebugInfoKey.realmDb.rawValue) Database Path: \(temp.path)")
      return temp.path
    }
    return ""
  }
  
  // MARK: - Private Methods
  
  private func initializeData() {
    // Initial users
    if self.db.objects(LIGUserModel.self).count == 0 {
      let users: [LIGUserSchema] = [
        LIGUserSchema(id: 1, username: "May", password: "11111111", isLogin: false, isActive: false),
        LIGUserSchema(id: 2, username: "Mark", password: "22222222", isLogin: false, isActive: false),
        LIGUserSchema(id: 3, username: "April", password: "33333333", isLogin: false, isActive: false),
        LIGUserSchema(id: 4, username: "Evaluator", password: "88888888", isLogin: false, isActive: false)
      ]
          
      try! self.db.write {
        for user in users {
          self.db.add(LIGUserModel(user: user))
        }
        LIGReference.appDelegate.log.info("\(DebugInfoKey.realmDb.rawValue) Created Initial (\(users.count)) Users!")
      }
    }
    
  }
}
