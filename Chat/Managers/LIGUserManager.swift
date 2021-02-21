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
