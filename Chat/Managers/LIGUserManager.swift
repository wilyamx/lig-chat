//
//  LIGUserManager.swift
//  Chat
//
//  Created by William S. Rena on 2/21/21.
//  Copyright © 2021 LIG Inc. All rights reserved.
//

import Foundation

class LIGUserManager {
  static let shared = LIGUserManager()
  
  var database = LIGUserDataSource()
  
  public func getLoginUser() -> LIGUserSchema? {
    let users = self.database.getAllUsers()
    return users.filter{ $0.isLogin == true }.first
  }
  
  public func getActiveUsers() -> [LIGUserSchema] {
    let users = self.database.getAllUsers()
    return users.filter{ $0.isActive == true }
  }
  
  public func getUserById(id: Int32) -> LIGUserSchema? {
    return self.database.getById(id: id)
  }
  
  public func getUserByUsername(username: String) -> LIGUserSchema? {
    return self.database.getByUsername(username: username)
  }
  
  public func createUser(user: LIGUserSchema,
                         completion: @escaping ()->()) {
    let newUser = LIGUserModel(user: user)
    newUser.isLogin = true
    
    self.database.insert(item: newUser.entity) { (message) in
        completion()
    }
  }
  
  public func logoutUser() {
    if var loginUser = getLoginUser() {
      loginUser.isLogin = false
      
      self.updateUserProfile(
        userProfile: loginUser,
        completion: {
          LIGReference.appDelegate.log.info("\(DebugInfoKey.realmDb.rawValue) logged-out-user '\(loginUser.username ?? "?")' (\(loginUser.id ?? 0))")
      })
    }
  }
  
  public func switchLoginUser(user: LIGUserSchema) {
    
  }
  
  public func deleteLoginUser() {
      if let loginUser = getLoginUser() {
        self.database.deleteById(id: loginUser.id!, completion: {_ in })
      }
  }
  
  public func updateUserProfile(
    userProfile: LIGUserSchema,
    completion: @escaping () -> ()) {
    self.database.update(item: userProfile) { (response) in
          completion()
      }
  }
}
