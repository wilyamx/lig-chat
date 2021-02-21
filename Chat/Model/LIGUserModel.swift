
//
//  UserModel.swift
//  Chat
//
//  Created by William S. Rena on 2/21/21.
//  Copyright © 2021 LIG Inc. All rights reserved.
//

import ObjectMapper
import RealmSwift
//import ObjectMapper_Realm

class LIGUserModel: Object, Mappable {
  @objc dynamic var id: Int32 = 0
  @objc dynamic var username: String? = ""
  @objc dynamic var password: String? = ""
  
  @objc dynamic var isActive: Bool = false
  @objc dynamic var isLogin: Bool = false
  
  var entity: LIGUserSchema {
    return LIGUserSchema(id: self.id,
                         username: self.username ?? "",
                         password: self.password ?? "",
                         isLogin: self.isLogin,
                         isActive: self.isActive)
  }
  
  convenience init(user: LIGUserSchema) {
    self.init()
    self.id = user.id ?? 0
    self.username = user.username ?? ""
    self.password = user.password ?? ""
    self.isActive = user.isActive ?? false
    self.isLogin = user.isLogin ?? false
  }
  
  override static func primaryKey() -> String? {
      return "username"
  }
  
  required convenience init?(map: Map) {
      self.init()
  }
  
  func mapping(map: Map) {
    self.id <- map["id"]
    self.username <- map["username"]
    self.password <- map["password"]
    self.isActive <- map["isActive"]
    self.isLogin <- map["isLogin"]
  }
}
