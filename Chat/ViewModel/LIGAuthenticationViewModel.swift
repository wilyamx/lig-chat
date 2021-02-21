//
//  LIGAuthenticationViewModel.swift
//  Chat
//
//  Created by William S. Rena on 2/21/21.
//  Copyright © 2021 LIG Inc. All rights reserved.
//

import Foundation

class LIGAuthenticationViewModel: LIGViewModel {
  
  func login(
    username: String,
    password: String,
    onSuccess: @escaping (_ success: Bool) -> Void,
    onFailure: @escaping (_ username: Bool, _ password: Bool) -> Void) {
    
    if var userAccount = LIGUserManager.shared.getUserByUsername(username: username) {
      if userAccount.password == password {
        userAccount.isLogin = true
        LIGUserManager.shared.updateUserProfile(
          userProfile: userAccount,
          completion: {
            onSuccess(true)
          })
      }
      else {
        onFailure(false, true)
      }
    }
    else {
      onFailure(true, true)
    }
  }
  
  func signup(
    username: String,
    password: String,
    onSuccess: @escaping (_ success: Bool) -> Void,
    onFailure: @escaping (_ error: String) -> Void) {
      
    if let loginUser = LIGUserManager.shared.getLoginUser(),
       let loginUsername = loginUser.username {
      // with the same username exist
      if loginUsername == username {
        onFailure("Username '\(username)' already exist!")
      }
      else {
        // no the same username exist
        let userSchema = LIGUserSchema(id: LIGUserManager.shared.database.nextDataId(),
                                       username: username, password: password,
                                       isLogin: true, isActive: false)
        LIGUserManager.shared.createUser(
          user: userSchema,
          completion: {
            onSuccess(true)
        })
      }
    }
    
    else {
      // no login username exist
      let userSchema = LIGUserSchema(id: LIGUserManager.shared.database.nextDataId(),
                                     username: username, password: password,
                                     isLogin: true, isActive: false)
      LIGUserManager.shared.createUser(
        user: userSchema,
        completion: {
          onSuccess(true)
      })
      
    }
    
  }

}
