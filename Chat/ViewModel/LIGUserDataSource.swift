//
//  LIGUserDataSource.swift
//  Chat
//
//  Created by William S. Rena on 2/21/21.
//  Copyright © 2021 LIG Inc. All rights reserved.
//

import Foundation
import RealmSwift

class LIGUserDataSource: LIGDataSourceProtocol {
 
  typealias T = LIGUserSchema
  private let realm = try! Realm()
  
  func getAllUsers() -> [LIGUserSchema] {
    return realm.objects(LIGUserModel.self).map { $0.entity }
  }
  
  func getAll(completion:@escaping(LIGResponse<[LIGUserSchema]>)->()) {
    completion(LIGResponse.succeed(getAllUsers()))
  }
  
  func getById(id: Int32, completion:@escaping(LIGResponse<T?>)->()) {
    completion(LIGResponse.succeed(getById(id: id)))
  }
  
  func getById(id: Int32) -> T? {
    return realm.object(ofType: LIGUserModel.self, forPrimaryKey: id).map { $0.entity } ?? nil
  }
  
  func getByUsername(username: String) -> T? {
    return realm.object(ofType: LIGUserModel.self, forPrimaryKey: username).map { $0.entity } ?? nil
  }
  
  func insert(item: T, completion:@escaping(LIGResponse<String>)->()) {
    try! realm.write {
      realm.add(LIGUserModel(user: item))
      completion(LIGResponse.succeed("user-insert-success"))
    }
  }
  
  func update(item: LIGUserSchema, completion: @escaping (LIGResponse<String>) -> ()) {
    let t = LIGUserModel(user: item)
    
    try! realm.write {
      guard let q = self.realm.object(ofType: LIGUserModel.self, forPrimaryKey: item.username) else {
          completion(LIGResponse.succeed("user-update-not-found"))
          return
      }
      
      q.password = t.password
      q.isActive = t.isActive
      q.isLogin = t.isLogin
      
      completion(LIGResponse.succeed("user-update-success"))
    }
  }
  
  func clean(completion: @escaping (LIGResponse<String>) -> ()) {
    
  }
  
  func deleteById(id: Int32, completion: @escaping (LIGResponse<String>) -> ()) {
    
  }
  
  func nextDataId() -> Int32 {
    return (self.realm.objects(LIGUserModel.self).max(ofProperty: "id") as Int32? ?? 0) + 1
  }
}
