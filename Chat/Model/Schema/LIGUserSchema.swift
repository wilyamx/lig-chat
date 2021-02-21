//
//  LIGUserSchema.swift
//  Chat
//
//  Created by William S. Rena on 2/21/21.
//  Copyright © 2021 LIG Inc. All rights reserved.
//

import Foundation

struct LIGUserSchema: Codable {
  var id: Int32?
  var username: String?
  var password: String?
  
  var isLogin: Bool?
  var isActive: Bool?
  
  init(id: Int32? = 0,
       username: String = "",
       password: String = "",
       isLogin: Bool = false,
       isActive: Bool = false) {
    self.id = id
    self.username = username
    self.password = password
    self.isLogin = isLogin
    self.isActive = isActive
  }
}
