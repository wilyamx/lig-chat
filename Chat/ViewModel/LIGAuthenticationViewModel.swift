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
    
    // check for existing username
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
    onFailure: @escaping (_ username: Bool, _ password: Bool) -> Void) {
      
    // check for existing username
    if let _ = LIGUserManager.shared.getUserByUsername(username: username) {
      onFailure(true, false)
    }
    else {
      // no existing username
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
