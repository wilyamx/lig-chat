//
//  LIGDataSourceProtocol.swift
//  Chat
//
//  Created by William S. Rena on 2/21/21.
//  Copyright © 2021 LIG Inc. All rights reserved.
//

import Foundation

protocol LIGDataSourceProtocol {
  associatedtype T
  
  func getAll(completion: @escaping (LIGResponse<[T]>)->())
  func getById(id: Int32, completion: @escaping (LIGResponse<T?>)->())
  func insert(item: T, completion: @escaping (LIGResponse<String>)->())
  func update(item: T, completion: @escaping (LIGResponse<String>)->())
  func clean(completion: @escaping (LIGResponse<String>)->())
  func deleteById(id: Int32, completion: @escaping (LIGResponse<String>)->())
}
