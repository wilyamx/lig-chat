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
  
  func insert(item: T, completion:@escaping(LIGResponse<String>)->()) {
    try! realm.write {
      realm.add(LIGUserModel(user: item))
      completion(LIGResponse.succeed("SUCCESS"))
    }
  }
  
  func update(item: LIGUserSchema, completion: @escaping (LIGResponse<String>) -> ()) {
    
  }
  
  func clean(completion: @escaping (LIGResponse<String>) -> ()) {
    
  }
  
  func deleteById(id: Int32, completion: @escaping (LIGResponse<String>) -> ()) {
    
  }
}
