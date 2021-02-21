//
//  LIGAuthenticationViewModel.swift
//  Chat
//
//  Created by William S. Rena on 2/21/21.
//  Copyright © 2021 LIG Inc. All rights reserved.
//

import Foundation

class LIGAuthenticationViewModel: LIGViewModel {
  func isSignupValid(username: String, password: String
    ) -> Bool {
    guard username.isEmpty || password.isEmpty else {
      return false
    }
    return true
  }
  
  func isLoginValid(username: String, password: String) -> Bool {
    guard username.isEmpty || password.isEmpty else {
      return false
    }
    return true
  }
  
  func login(
    username: String,
    password: String,
    onSuccess: @escaping (_ success: Bool) -> Void,
    onFailure: @escaping (_ error: String) -> Void) {
      onFailure("invalid login credentials")
  }
  
  func signup(
    username: String,
    password: String,
    onSuccess: @escaping (_ success: Bool) -> Void,
    onFailure: @escaping (_ error: String) -> Void) {
      onFailure("invalid signup credentials")
  }

}
